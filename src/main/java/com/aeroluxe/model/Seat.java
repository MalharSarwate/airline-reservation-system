package com.aeroluxe.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "seats", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"flight_id", "seatCode"})
})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Seat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "flight_id", nullable = false)
    private Flight flight;

    @Column(nullable = false)
    private String seatCode;

    @Column(nullable = false)
    private Integer row;

    @Column(nullable = false, length = 1)
    private String col;

    @Column(nullable = false)
    private String tier;

    @Column(nullable = false)
    private String position;

    @Column(nullable = false)
    @Builder.Default
    private Double fee = 0.0;

    @Column(nullable = false)
    @Builder.Default
    private String status = "AVAILABLE";

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "occupied_by_user_id", nullable = true)
    private User occupiedByUser;
}
