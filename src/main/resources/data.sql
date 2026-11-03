-- =============================================
-- AeroLuxe Airline Reservation System - Seed Data
-- Idempotent: uses INSERT IGNORE INTO
-- =============================================

-- ----- Admin User -----
INSERT IGNORE INTO users (id, full_name, email, password, passport_number, phone, role, created_at)
VALUES (1, 'AeroLuxe Admin', 'admin@aeroluxe.com',
        '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
        'ADMIN000', '+1-800-AEROLUX', 'ADMIN', NOW());

-- ----- Flights -----
INSERT IGNORE INTO flights (id, flight_code, airline, aircraft_model, origin_code, origin_city, origin_terminal,
                            dest_code, dest_city, dest_terminal, departure_time, arrival_time, duration,
                            base_price, status, wifi, seat_config, total_rows)
VALUES (1, 'AL-1097', 'AeroLuxe Skyfleet', 'Boeing 787-9 Dreamliner',
        'JFK', 'New York', 'Terminal 4',
        'LHR', 'London', 'Terminal 5',
        '08:30 AM', '20:45 PM', '7h 15m',
        480.00, 'ON_TIME', 'Starlink High-Speed', '3-3', 30);

INSERT IGNORE INTO flights (id, flight_code, airline, aircraft_model, origin_code, origin_city, origin_terminal,
                            dest_code, dest_city, dest_terminal, departure_time, arrival_time, duration,
                            base_price, status, wifi, seat_config, total_rows)
VALUES (2, 'AL-618', 'AeroLuxe Skyfleet', 'Airbus A350-900',
        'JFK', 'New York', 'Terminal 1',
        'LHR', 'London', 'Terminal 2',
        '14:00 PM', '02:15 AM', '7h 15m',
        520.00, 'ON_TIME', 'Starlink High-Speed', '3-3', 30);

INSERT IGNORE INTO flights (id, flight_code, airline, aircraft_model, origin_code, origin_city, origin_terminal,
                            dest_code, dest_city, dest_terminal, departure_time, arrival_time, duration,
                            base_price, status, wifi, seat_config, total_rows)
VALUES (3, 'AL-305', 'AeroLuxe Skyfleet', 'Boeing 777-300ER',
        'SFO', 'San Francisco', 'International Terminal',
        'HND', 'Tokyo', 'Terminal 3',
        '11:15 AM', '14:30 PM', '11h 15m',
        890.00, 'ON_TIME', 'Starlink High-Speed', '3-3', 30);

-- ----- Seats for Flight AL-1097 (flight_id = 1) -----

-- Row 1: First Class (only A, C, D, F) — WINDOW: A,F  AISLE: C,D
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '1A', 1, 'A', 'FIRST_CLASS', 'WINDOW', 150.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '1C', 1, 'C', 'FIRST_CLASS', 'AISLE', 120.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '1D', 1, 'D', 'FIRST_CLASS', 'AISLE', 120.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '1F', 1, 'F', 'FIRST_CLASS', 'WINDOW', 150.00, 'AVAILABLE', NULL);

-- Row 10: Exit Row (A-F) — WINDOW: A,F  MIDDLE: B,E  AISLE: C,D
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '10A', 10, 'A', 'EXIT_ROW', 'WINDOW', 60.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '10B', 10, 'B', 'EXIT_ROW', 'MIDDLE', 40.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '10C', 10, 'C', 'EXIT_ROW', 'AISLE', 50.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '10D', 10, 'D', 'EXIT_ROW', 'AISLE', 50.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '10E', 10, 'E', 'EXIT_ROW', 'MIDDLE', 40.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '10F', 10, 'F', 'EXIT_ROW', 'WINDOW', 60.00, 'AVAILABLE', NULL);

-- Rows 14-20: Economy (A-F)
-- Row 14
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '14A', 14, 'A', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '14B', 14, 'B', 'ECONOMY', 'MIDDLE', 0.00, 'OCCUPIED', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '14C', 14, 'C', 'ECONOMY', 'AISLE', 10.00, 'OCCUPIED', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '14D', 14, 'D', 'ECONOMY', 'AISLE', 10.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '14E', 14, 'E', 'ECONOMY', 'MIDDLE', 0.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '14F', 14, 'F', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);

-- Row 15
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '15A', 15, 'A', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '15B', 15, 'B', 'ECONOMY', 'MIDDLE', 0.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '15C', 15, 'C', 'ECONOMY', 'AISLE', 10.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '15D', 15, 'D', 'ECONOMY', 'AISLE', 10.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '15E', 15, 'E', 'ECONOMY', 'MIDDLE', 0.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '15F', 15, 'F', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);

-- Row 16
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '16A', 16, 'A', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '16B', 16, 'B', 'ECONOMY', 'MIDDLE', 0.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '16C', 16, 'C', 'ECONOMY', 'AISLE', 10.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '16D', 16, 'D', 'ECONOMY', 'AISLE', 10.00, 'OCCUPIED', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '16E', 16, 'E', 'ECONOMY', 'MIDDLE', 0.00, 'OCCUPIED', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '16F', 16, 'F', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);

-- Row 17
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '17A', 17, 'A', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '17B', 17, 'B', 'ECONOMY', 'MIDDLE', 0.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '17C', 17, 'C', 'ECONOMY', 'AISLE', 10.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '17D', 17, 'D', 'ECONOMY', 'AISLE', 10.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '17E', 17, 'E', 'ECONOMY', 'MIDDLE', 0.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '17F', 17, 'F', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);

-- Row 18
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '18A', 18, 'A', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '18B', 18, 'B', 'ECONOMY', 'MIDDLE', 0.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '18C', 18, 'C', 'ECONOMY', 'AISLE', 10.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '18D', 18, 'D', 'ECONOMY', 'AISLE', 10.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '18E', 18, 'E', 'ECONOMY', 'MIDDLE', 0.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '18F', 18, 'F', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);

-- Row 19
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '19A', 19, 'A', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '19B', 19, 'B', 'ECONOMY', 'MIDDLE', 0.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '19C', 19, 'C', 'ECONOMY', 'AISLE', 10.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '19D', 19, 'D', 'ECONOMY', 'AISLE', 10.00, 'OCCUPIED', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '19E', 19, 'E', 'ECONOMY', 'MIDDLE', 0.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '19F', 19, 'F', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);

-- Row 20
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '20A', 20, 'A', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '20B', 20, 'B', 'ECONOMY', 'MIDDLE', 0.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '20C', 20, 'C', 'ECONOMY', 'AISLE', 10.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '20D', 20, 'D', 'ECONOMY', 'AISLE', 10.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '20E', 20, 'E', 'ECONOMY', 'MIDDLE', 0.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '20F', 20, 'F', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);

-- Row 21 (extra economy rows with some occupied — spec mentions 21B, 21C)
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '21A', 21, 'A', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '21B', 21, 'B', 'ECONOMY', 'MIDDLE', 0.00, 'OCCUPIED', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '21C', 21, 'C', 'ECONOMY', 'AISLE', 10.00, 'OCCUPIED', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '21D', 21, 'D', 'ECONOMY', 'AISLE', 10.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '21E', 21, 'E', 'ECONOMY', 'MIDDLE', 0.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '21F', 21, 'F', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);

-- Row 22 (extra economy row — spec mentions 22C)
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '22A', 22, 'A', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '22B', 22, 'B', 'ECONOMY', 'MIDDLE', 0.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '22C', 22, 'C', 'ECONOMY', 'AISLE', 10.00, 'OCCUPIED', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '22D', 22, 'D', 'ECONOMY', 'AISLE', 10.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '22E', 22, 'E', 'ECONOMY', 'MIDDLE', 0.00, 'AVAILABLE', NULL);
INSERT IGNORE INTO seats (flight_id, seat_code, `row`, col, tier, position, fee, status, occupied_by_user_id)
VALUES (1, '22F', 22, 'F', 'ECONOMY', 'WINDOW', 15.00, 'AVAILABLE', NULL);
