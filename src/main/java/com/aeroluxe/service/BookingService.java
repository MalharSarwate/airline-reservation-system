package com.aeroluxe.service;

import com.aeroluxe.dto.BookingRequest;
import com.aeroluxe.model.Booking;
import com.aeroluxe.model.Flight;
import com.aeroluxe.model.Seat;
import com.aeroluxe.model.User;
import com.aeroluxe.repository.BookingRepository;
import com.aeroluxe.repository.SeatRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;

@Service
public class BookingService {

    private final BookingRepository bookingRepository;
    private final FlightService flightService;
    private final SeatRepository seatRepository;

    public BookingService(BookingRepository bookingRepository, FlightService flightService,
                          SeatRepository seatRepository) {
        this.bookingRepository = bookingRepository;
        this.flightService = flightService;
        this.seatRepository = seatRepository;
    }

    @Transactional
    public Booking createBooking(BookingRequest req, User user) {
        Flight flight = flightService.getFlightById(req.getFlightId());

        Seat seat = flightService.getSeatByCode(req.getFlightId(), req.getSeatCode());

        if (!"AVAILABLE".equals(seat.getStatus())) {
            throw new RuntimeException("Seat " + req.getSeatCode() + " is not available");
        }

        // Generate PNR: "AL-" + 6 random digits
        String pnr = "AL-" + String.format("%06d", new Random().nextInt(1_000_000));

        // Calculate total price
        double totalPrice = flight.getBasePrice() + seat.getFee() + 42.50;

        // Apply currency conversion if needed
        String currency = req.getCurrency() != null ? req.getCurrency() : "USD";
        switch (currency.toUpperCase()) {
            case "EUR":
                totalPrice *= 0.92;
                break;
            case "INR":
                totalPrice *= 86.5;
                break;
            default:
                // USD — no conversion
                break;
        }

        // Mark seat as occupied
        seat.setStatus("OCCUPIED");
        seat.setOccupiedByUser(user);
        seatRepository.save(seat);

        // Create and save booking
        Booking booking = new Booking();
        booking.setPnr(pnr);
        booking.setUser(user);
        booking.setFlight(flight);
        booking.setSeat(seat);
        booking.setPassengerName(req.getPassengerName());
        booking.setPassengerEmail(req.getPassengerEmail());
        booking.setPassportNumber(req.getPassportNumber());
        booking.setMealChoice(req.getMealChoice());
        booking.setCheckedBag(req.getCheckedBag());
        booking.setBaggageWeight(req.getBaggageWeight());
        booking.setTotalPrice(totalPrice);
        booking.setCurrency(currency);
        booking.setStatus("CONFIRMED");
        booking.setCreatedAt(LocalDateTime.now());

        return bookingRepository.save(booking);
    }

    public List<Booking> getUserBookings(User user) {
        return bookingRepository.findByUserOrderByCreatedAtDesc(user);
    }

    public Booking getBookingByPnr(String pnr) {
        return bookingRepository.findByPnr(pnr)
                .orElseThrow(() -> new RuntimeException("Booking not found with PNR: " + pnr));
    }

    @Transactional
    public Booking cancelBooking(Long bookingId, User user) {
        Booking booking = bookingRepository.findById(bookingId)
                .orElseThrow(() -> new RuntimeException("Booking not found with id: " + bookingId));

        if (!booking.getUser().getId().equals(user.getId())) {
            throw new RuntimeException("You are not authorized to cancel this booking");
        }

        booking.setStatus("CANCELLED");

        // Free the seat
        Seat seat = booking.getSeat();
        seat.setStatus("AVAILABLE");
        seat.setOccupiedByUser(null);
        seatRepository.save(seat);

        return bookingRepository.save(booking);
    }
}
