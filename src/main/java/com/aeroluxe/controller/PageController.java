package com.aeroluxe.controller;

import com.aeroluxe.model.User;
import com.aeroluxe.service.BookingService;
import com.aeroluxe.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
public class PageController {

    private final UserService userService;
    private final BookingService bookingService;

    public PageController(UserService userService, BookingService bookingService) {
        this.userService = userService;
        this.bookingService = bookingService;
    }

    @GetMapping("/")
    public String home(Authentication authentication) {
        if (authentication != null && authentication.isAuthenticated()) {
            return "redirect:/booking";
        }
        return "redirect:/login";
    }

    @GetMapping("/booking")
    public String bookingPage(Principal principal, Model model) {
        User user = userService.findByEmail(principal.getName())
                .orElseThrow(() -> new RuntimeException("User not found"));
        model.addAttribute("user", user);
        return "index";
    }

    @GetMapping("/my-bookings")
    public String myBookingsPage(Principal principal, Model model) {
        User user = userService.findByEmail(principal.getName())
                .orElseThrow(() -> new RuntimeException("User not found"));
        model.addAttribute("user", user);
        model.addAttribute("bookings", bookingService.getUserBookings(user));
        return "my-bookings";
    }
}
