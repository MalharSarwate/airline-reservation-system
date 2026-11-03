package com.aeroluxe.service;

import com.aeroluxe.model.Flight;
import com.aeroluxe.model.Seat;
import com.aeroluxe.repository.FlightRepository;
import com.aeroluxe.repository.SeatRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FlightService {

    private final FlightRepository flightRepository;
    private final SeatRepository seatRepository;

    public FlightService(FlightRepository flightRepository, SeatRepository seatRepository) {
        this.flightRepository = flightRepository;
        this.seatRepository = seatRepository;
    }

    public List<Flight> getAllFlights() {
        return flightRepository.findAll();
    }

    public Flight getFlightById(Long id) {
        return flightRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Flight not found with id: " + id));
    }

    public Flight getFlightByCode(String code) {
        return flightRepository.findByFlightCode(code)
                .orElseThrow(() -> new RuntimeException("Flight not found with code: " + code));
    }

    public List<Flight> searchFlights(String origin, String dest) {
        return flightRepository.findByOriginCodeAndDestCode(origin, dest);
    }

    public List<Seat> getSeatsForFlight(Long flightId) {
        Flight flight = getFlightById(flightId);
        return seatRepository.findByFlight(flight);
    }

    public Seat getSeatByCode(Long flightId, String seatCode) {
        Flight flight = getFlightById(flightId);
        return seatRepository.findByFlightAndSeatCode(flight, seatCode)
                .orElseThrow(() -> new RuntimeException("Seat not found: " + seatCode));
    }
}
