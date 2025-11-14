package com.example.ecomm.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/payment")
@CrossOrigin(origins = "*")
public class PaymentController {

    @Value("${app.razorpay.key:}")
    private String razorKey;

    @Value("${app.razorpay.secret:}")
    private String razorSecret;

    // Stub endpoint - integrate Razorpay or your payment gateway
    @PostMapping("/create-order")
    public ResponseEntity<?> createPaymentOrder(@RequestBody Map<String, Object> payload) {
        // payload: amount, currency, receipt, notes...
        if (razorKey == null || razorKey.isBlank()) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Payment gateway not configured. Set keys in application.properties");
        }
        // For demo, just echo back
        return ResponseEntity.ok(Map.of("status", "created", "payload", payload));
    }
}
