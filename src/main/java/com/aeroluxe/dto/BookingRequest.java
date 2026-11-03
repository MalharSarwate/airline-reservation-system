package com.aeroluxe.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BookingRequest {

    private Long flightId;
    private String seatCode;
    private String passengerName;
    private String passengerEmail;
    private String passportNumber;
    private String mealChoice;
    private boolean checkedBag;
    private double baggageWeight;
    private String currency;
}
