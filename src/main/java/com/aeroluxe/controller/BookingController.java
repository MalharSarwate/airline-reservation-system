package com.aeroluxe.controller;

import com.aeroluxe.dto.ApiResponse;
import com.aeroluxe.dto.BookingRequest;
import com.aeroluxe.model.Booking;
import com.aeroluxe.model.User;
import com.aeroluxe.service.BookingService;
import com.aeroluxe.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@RequestMapping("/api/bookings")
public class BookingController {

    private final BookingService bookingService;
    private final UserService userService;

    public BookingController(BookingService bookingService, UserService userService) {
        this.bookingService = bookingService;
        this.userService = userService;
    }

    @PostMapping
    public ResponseEntity<ApiResponse> createBooking(@RequestBody BookingRequest request, Principal principal) {
        try {
            User user = userService.findByEmail(principal.getName())
                    .orElseThrow(() -> new RuntimeException("User not found"));
            Booking booking = bookingService.createBooking(request, user);
            return ResponseEntity.ok(ApiResponse.ok("Booking created successfully", booking));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(ApiResponse.error(e.getMessage()));
        }
    }

    @GetMapping
    public ResponseEntity<ApiResponse> getUserBookings(Principal principal) {
        try {
            User user = userService.findByEmail(principal.getName())
                    .orElseThrow(() -> new RuntimeException("User not found"));
            List<Booking> bookings = bookingService.getUserBookings(user);
            return ResponseEntity.ok(ApiResponse.ok("Bookings retrieved successfully", bookings));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(ApiResponse.error(e.getMessage()));
        }
    }

    @GetMapping("/{pnr}")
    public ResponseEntity<ApiResponse> getBookingByPnr(@PathVariable String pnr) {
        try {
            Booking booking = bookingService.getBookingByPnr(pnr);
            return ResponseEntity.ok(ApiResponse.ok("Booking retrieved successfully", booking));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(ApiResponse.error(e.getMessage()));
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ApiResponse> cancelBooking(@PathVariable Long id, Principal principal) {
        try {
            User user = userService.findByEmail(principal.getName())
                    .orElseThrow(() -> new RuntimeException("User not found"));
            Booking booking = bookingService.cancelBooking(id, user);
            return ResponseEntity.ok(ApiResponse.ok("Booking cancelled successfully", booking));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(ApiResponse.error(e.getMessage()));
        }
    }
}
