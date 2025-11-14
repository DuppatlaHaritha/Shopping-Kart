package com.example.ecomm.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

@RestController
@RequestMapping("/api/whatsapp")
@CrossOrigin(origins = "*")
public class WhatsappController {

    @Value("${app.twilio.accountSid:}")
    private String twilioSid;

    @Value("${app.twilio.authToken:}")
    private String twilioToken;

    // This endpoint is a stub. Configure Twilio or WhatsApp Business API credentials and implement sending.
    @PostMapping("/send")
    public ResponseEntity<?> send(@RequestBody Map<String,String> payload) {
        String to = payload.get("to"); // e.g. whatsapp:+9199xxxx
        String message = payload.get("message");
        if (twilioSid == null || twilioSid.isBlank()) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("WhatsApp not configured. Set Twilio credentials in application.properties");
        }

        // Example: call Twilio API (you must add Twilio REST client or use RestTemplate)
        String url = "https://api.twilio.com/2010-04-01/Accounts/" + twilioSid + "/Messages.json";
        RestTemplate rt = new RestTemplate();
        // For brevity not implementing full Twilio call here.
        return ResponseEntity.ok("Pretend message sent to " + to + ": " + message);
    }
}
