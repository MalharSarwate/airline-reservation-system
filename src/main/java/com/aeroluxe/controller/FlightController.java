package com.aeroluxe.controller;

import com.aeroluxe.dto.ApiResponse;
import com.aeroluxe.service.FlightService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/flights")
public class FlightController {

    private final FlightService flightService;

    public FlightController(FlightService flightService) {
        this.flightService = flightService;
    }

    @GetMapping
    public ResponseEntity<ApiResponse> getAllFlights() {
        try {
            return ResponseEntity.ok(ApiResponse.ok("Flights retrieved successfully", flightService.getAllFlights()));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(ApiResponse.error(e.getMessage()));
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse> getFlightById(@PathVariable Long id) {
        try {
            return ResponseEntity.ok(ApiResponse.ok("Flight retrieved successfully", flightService.getFlightById(id)));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(ApiResponse.error(e.getMessage()));
        }
    }

    @GetMapping("/{id}/seats")
    public ResponseEntity<ApiResponse> getSeatsForFlight(@PathVariable Long id) {
        try {
            return ResponseEntity.ok(ApiResponse.ok("Seats retrieved successfully", flightService.getSeatsForFlight(id)));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(ApiResponse.error(e.getMessage()));
        }
    }

    @GetMapping("/search")
    public ResponseEntity<ApiResponse> searchFlights(@RequestParam String origin, @RequestParam String dest) {
        try {
            return ResponseEntity.ok(ApiResponse.ok("Search results", flightService.searchFlights(origin, dest)));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(ApiResponse.error(e.getMessage()));
        }
    }
}
