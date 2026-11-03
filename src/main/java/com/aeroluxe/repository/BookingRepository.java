package com.aeroluxe.repository;

import com.aeroluxe.model.Booking;
import com.aeroluxe.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {

    Optional<Booking> findByPnr(String pnr);

    List<Booking> findByUser(User user);

    List<Booking> findByUserOrderByCreatedAtDesc(User user);
}
