package com.aeroluxe.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Random;

@Entity
@Table(name = "bookings")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String pnr;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "flight_id", nullable = false)
    private Flight flight;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "seat_id", nullable = false)
    private Seat seat;

    @Column(nullable = false)
    private String passengerName;

    @Column(nullable = false)
    private String passengerEmail;

    @Column
    private String passportNumber;

    @Column
    private String mealChoice;

    @Column(nullable = false)
    @Builder.Default
    private Boolean checkedBag = false;

    @Column(nullable = false)
    @Builder.Default
    private Double baggageWeight = 0.0;

    @Column(nullable = false)
    private Double totalPrice;

    @Column(nullable = false)
    @Builder.Default
    private String currency = "USD";

    @Column(nullable = false)
    @Builder.Default
    private String status = "CONFIRMED";

    @Column
    @Builder.Default
    private String gate = "B14";

    @Column
    @Builder.Default
    private String boardingTime = "07:50 AM";

    @Column(updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        this.createdAt = LocalDateTime.now();
        if (this.pnr == null) {
            this.pnr = generatePnr();
        }
    }

    private String generatePnr() {
        Random random = new Random();
        int digits = 100000 + random.nextInt(900000);
        return "AL-" + digits;
    }
}
