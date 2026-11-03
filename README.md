# AeroLuxe - Full-Stack Airline Reservation System

A production-ready full-stack Airline Reservation System built with **Spring Boot 3**, **Java 17**, **Spring Security 6**, **Spring Data JPA**, and **MySQL**, preserving the exact **Flightstickies** 2D cabin seating chart, tactile sensory audio, and boarding pass experience.

---

## ✈ Features & Architecture

### 1. Security & Authentication (Spring Security 6)
- **Password-Protected System**: BCrypt password hashing.
- **Login Page (`/login`)**: Custom themed dark aviation login interface with background cloud animations.
- **Registration Page (`/register`)**: Instant passenger profile creation with passport and contact details.
- **Session-Based Authentication**: Secure session cookies, automatic redirect to `/booking` on login and `/login` on logout.
- **Default Admin Account**:
  - **Email**: `admin@aeroluxe.com`
  - **Password**: `admin123`

### 2. Database Schema (MySQL + JPA)
- **`users`**: Encrypted credentials, full name, passport ID, phone, role (`USER`, `ADMIN`).
- **`flights`**: Flight code (`AL-1097`), aircraft model (`Boeing 787-9 Dreamliner`), origin, destination, timings, and base fare.
- **`seats`**: Exact 3-3 layout with tiers (`FIRST_CLASS`, `EXIT_ROW`, `ECONOMY`), position (`WINDOW`, `MIDDLE`, `AISLE`), fees, status (`AVAILABLE`, `OCCUPIED`), and unique constraints.
- **`bookings`**: PNR locator (`AL-948210`), assigned seat, passenger ID, meal choice, baggage weight, total price, gate (`B14`), boarding time, and ticket status (`CONFIRMED`, `CANCELLED`, `BOARDED`).

### 3. Preserved 2D Interactive UI/UX
- **Flightstickies Seat Map**: Detailed 2D contoured leather seats with headrest wings, red racing stripes, seatbelts, and armrests.
- **Personalized Sticky Tags**: Pinned traveler notes (`YOU`, `PETE`, `ANN`, `JEN`, `JOE`) and mood stickers (`🌴 Vacation`, `😴 Sleeping`, `🎧 Music`, `💼 Work`, `🍷 Wine`).
- **Tactile Audio FX**: Pure Web Audio API cabin chime (*ding-dong!*), mechanical seatbelt buckle click, and ticket tear sounds.
- **Window View Simulator**: Drifting clouds with live **☀️ Day**, **🌅 Golden Sunset**, and **🌙 Night Stars** lighting switch.
- **4K IFE Screen**: Seatback screen with live flight radar, movie previews, and lo-fi cloud radio.
- **Interactive Luggage Scale**: Real-time slider with digital LED scale gauge.
- **Celebratory Boarding Pass**: Confetti burst, rubber stamp approval animation, and tearable ticket stub.

---

## 📁 Directory Structure

```
airline-reservation-system/
├── pom.xml
├── README.md
└── src/
    ├── main/
    │   ├── java/com/aeroluxe/
    │   │   ├── AeroluxeApplication.java
    │   │   ├── config/
    │   │   │   └── SecurityConfig.java
    │   │   ├── controller/
    │   │   │   ├── AuthController.java
    │   │   │   ├── BookingController.java
    │   │   │   ├── FlightController.java
    │   │   │   └── PageController.java
    │   │   ├── dto/
    │   │   │   ├── ApiResponse.java
    │   │   │   ├── BookingRequest.java
    │   │   │   ├── LoginRequest.java
    │   │   │   └── RegisterRequest.java
    │   │   ├── model/
    │   │   │   ├── Booking.java
    │   │   │   ├── Flight.java
    │   │   │   ├── Seat.java
    │   │   │   └── User.java
    │   │   ├── repository/
    │   │   │   ├── BookingRepository.java
    │   │   │   ├── FlightRepository.java
    │   │   │   ├── SeatRepository.java
    │   │   │   └── UserRepository.java
    │   │   └── service/
    │   │       ├── BookingService.java
    │   │       ├── CustomUserDetailsService.java
    │   │       ├── FlightService.java
    │   │       └── UserService.java
    │   └── resources/
    │       ├── application.properties
    │       ├── data.sql
    │       ├── static/
    │       │   ├── css/style.css
    │       │   └── js/auth.js
    │       └── templates/
    │           ├── index.html       (Main Booking & Seat Map)
    │           ├── login.html       (Aviation Login Page)
    │           ├── my-bookings.html (User Booking Dashboard)
    │           └── register.html    (Passenger Registration)
```

---

## 🚀 How to Run the Application

### 1. Prerequisites
- **Java 17+** (JDK 17 or higher)
- **Maven 3.8+**
- **MySQL 8.0+**

### 2. Configure MySQL Database
Create the database or let Spring Boot automatically create it:
```sql
CREATE DATABASE IF NOT EXISTS aeroluxe_db;
```

Update your MySQL username/password in `src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/aeroluxe_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC
spring.datasource.username=root
spring.datasource.password=YOUR_MYSQL_PASSWORD
```

### 3. Build & Run
Run from the project root directory:
```bash
mvn clean spring-boot:run
```

### 4. Open in Browser
- Navigate to: **`http://localhost:8080`**
- You will be redirected to the **`/login`** page.
- Sign in with:
  - **Email**: `admin@aeroluxe.com`
  - **Password**: `admin123`
  - Or click **"Create an Account"** to register your personal passenger profile.

