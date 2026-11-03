package com.aeroluxe.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "flights")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Flight {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String flightCode;

    @Column(nullable = false)
    @Builder.Default
    private String airline = "AeroLuxe Skyfleet";

    @Column
    @Builder.Default
    private String aircraftModel = "Boeing 787-9 Dreamliner";

    @Column(nullable = false)
    private String originCode;

    @Column(nullable = false)
    private String originCity;

    @Column
    private String originTerminal;

    @Column(nullable = false)
    private String destCode;

    @Column(nullable = false)
    private String destCity;

    @Column
    private String destTerminal;

    @Column(nullable = false)
    private String departureTime;

    @Column(nullable = false)
    private String arrivalTime;

    @Column
    private String duration;

    @Column(nullable = false)
    @Builder.Default
    private Double basePrice = 480.0;

    @Column(nullable = false)
    @Builder.Default
    private String status = "ON_TIME";

    @Column
    @Builder.Default
    private String wifi = "Starlink High-Speed";

    @Column
    @Builder.Default
    private String seatConfig = "3-3";

    @Column
    @Builder.Default
    private Integer totalRows = 30;
}
