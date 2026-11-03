package com.aeroluxe.repository;

import com.aeroluxe.model.Flight;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FlightRepository extends JpaRepository<Flight, Long> {

    Optional<Flight> findByFlightCode(String code);

    List<Flight> findByOriginCodeAndDestCode(String origin, String dest);
}
