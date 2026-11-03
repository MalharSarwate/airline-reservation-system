package com.aeroluxe.repository;

import com.aeroluxe.model.Flight;
import com.aeroluxe.model.Seat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SeatRepository extends JpaRepository<Seat, Long> {

    List<Seat> findByFlightAndStatus(Flight flight, String status);

    Optional<Seat> findByFlightAndSeatCode(Flight flight, String seatCode);

    List<Seat> findByFlight(Flight flight);
}
