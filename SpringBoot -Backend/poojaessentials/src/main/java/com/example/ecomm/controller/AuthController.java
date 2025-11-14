

// 27-10-2025 working before any modifications
/*
package com.example.ecomm.controller;

import com.example.ecomm.dto.*;
import com.example.ecomm.model.Role;
import com.example.ecomm.model.User;
import com.example.ecomm.repository.UserRepository;
import com.example.ecomm.security.JwtUtil;
import com.example.ecomm.security.CustomUserDetails;
import com.example.ecomm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {
    @Autowired private AuthenticationManager authenticationManager;
    @Autowired private JwtUtil jwtUtil;
    @Autowired private UserService userService;
    @Autowired private UserRepository userRepository;

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody AuthRequest req) {
        User u = userService.registerUser(req.getUsername(), null, req.getPassword(), Role.ROLE_USER);
        return ResponseEntity.ok("Registered: " + u.getUsername());
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest req) {
        Authentication auth = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(req.getUsername(), req.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(auth);
        String token = jwtUtil.generateToken(req.getUsername());
        return ResponseEntity.ok(new AuthResponse(token));
    }
}
*/



//27-10-2025
/*
package com.example.ecomm.controller;

import com.example.ecomm.dto.*;
import com.example.ecomm.model.Role;
import com.example.ecomm.model.User;
import com.example.ecomm.repository.UserRepository;
import com.example.ecomm.security.JwtUtil;
import com.example.ecomm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {

    @Autowired private AuthenticationManager authenticationManager;
    @Autowired private JwtUtil jwtUtil;
    @Autowired private UserService userService;
    @Autowired private UserRepository userRepository;

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody AuthRequest req) {
        User u = userService.registerUser(req.getUsername(), null, req.getPassword(), Role.ROLE_USER);
        return ResponseEntity.ok("Registered: " + u.getUsername());
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest req) {
        // ✅ Authenticate user
        Authentication auth = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(req.getUsername(), req.getPassword())
        );
        SecurityContextHolder.getContext().setAuthentication(auth);

        // ✅ Generate JWT
        String token = jwtUtil.generateToken(req.getUsername());

        // ✅ Fetch the user's role from the database
        User user = userRepository.findByUsername(req.getUsername())
                .orElseThrow(() -> new RuntimeException("User not found"));

        // ✅ Prepare response with token + role + username
        Map<String, Object> response = new HashMap<>();
        response.put("token", token);
        response.put("role", user.getRole().name()); // e.g. ROLE_ADMIN or ROLE_USER
        response.put("username", user.getUsername());

        return ResponseEntity.ok(response);
    }
}
*/

/*package com.example.ecomm.controller;

import com.example.ecomm.dto.*;
import com.example.ecomm.model.Role;
import com.example.ecomm.model.User;
import com.example.ecomm.repository.UserRepository;
import com.example.ecomm.security.JwtUtil;
import com.example.ecomm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.authentication.*;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {

    @Autowired private AuthenticationManager authenticationManager;
    @Autowired private JwtUtil jwtUtil;
    @Autowired private UserService userService;
    @Autowired private UserRepository userRepository;

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody AuthRequest req) {
        User u = userService.registerUser(req.getUsername(), null, req.getPassword(), Role.ROLE_USER);
        return ResponseEntity.ok("Registered: " + u.getUsername());
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest req) {
        String username = req.getUsername();

        Optional<User> maybeUser = userService.findByUsername(username);
        if (maybeUser.isEmpty()) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("message", "Invalid credentials."));
        }

        User user = maybeUser.get();

        // If account locked, try auto-unlock if lock duration expired
        if (user.isAccountLocked()) {
            boolean unlocked = userService.unlockIfTimeExpired(user);
            if (unlocked) {
                // reload user after unlock
                user = userRepository.findByUsername(username).orElse(user);
            } else {
                return ResponseEntity.status(HttpStatus.FORBIDDEN)
                        .body(Map.of("message", "Account locked. Please reset your password to unlock."));
            }
        }

        try {
            // Authenticate credentials
            Authentication auth = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(username, req.getPassword())
            );
            SecurityContextHolder.getContext().setAuthentication(auth);

            // Reset failed attempts after successful login
            userService.resetFailedAttempts(user);

            // Generate JWT
            String token = jwtUtil.generateToken(username);

            // Prepare response
            Map<String, Object> response = new HashMap<>();
            response.put("token", token);
            response.put("role", user.getRole().name());
            response.put("username", user.getUsername());

            return ResponseEntity.ok(response);

        } catch (BadCredentialsException e) {
            // increase failed attempts and possibly lock
            userService.increaseFailedAttempts(user);

            // reload user to get updated failedAttempts
            User updated = userRepository.findByUsername(username).orElse(user);
            int attempts = updated.getFailedAttempts();

            if (attempts >= 3) {
                // account was locked inside increaseFailedAttempts -> inform client
                return ResponseEntity.status(HttpStatus.FORBIDDEN)
                        .body(Map.of("message", "Account locked due to 3 failed login attempts. Please reset your password."));
            }

            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("message", "Invalid credentials. Attempt " + attempts + " of 3."));
        } catch (LockedException e) {
            // In case authentication infrastructure throws LockedException
            return ResponseEntity.status(HttpStatus.FORBIDDEN)
                    .body(Map.of("message", "Account locked. Please reset your password to unlock."));
        } catch (AuthenticationException e) {
            // Generic auth error
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("message", "Authentication failed."));
        }
    }

    // Reset Password Endpoint
    @PostMapping("/reset-password")
    public ResponseEntity<?> resetPassword(@RequestBody Map<String, String> req) {
        String username = req.get("username");
        String newPassword = req.get("newPassword");

        if (username == null || username.trim().isEmpty() || newPassword == null || newPassword.trim().isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of("message", "username and newPassword are required"));
        }

        Optional<User> maybeUser = userService.findByUsername(username);
        if (maybeUser.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("message", "User not found"));
        }

        User user = maybeUser.get();

        // Unlock and reset attempts, then update password using service (which encodes & saves)
        userService.unlockAccount(user);
        userService.updatePassword(user, newPassword);

        return ResponseEntity.ok(Map.of("message", "Password reset successful. You can now login."));
    }
}
*/

/*package com.example.ecomm.controller;

import com.example.ecomm.dto.*;
import com.example.ecomm.model.Role;
import com.example.ecomm.model.User;
import com.example.ecomm.repository.UserRepository;
import com.example.ecomm.security.JwtUtil;
import com.example.ecomm.security.CustomUserDetails;
import com.example.ecomm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {

    @Autowired private AuthenticationManager authenticationManager;
    @Autowired private JwtUtil jwtUtil;
    @Autowired private UserService userService;
    @Autowired private UserRepository userRepository;

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody AuthRequest req) {
        User u = userService.registerUser(req.getUsername(), null, req.getPassword(), Role.ROLE_USER);
        return ResponseEntity.ok("Registered: " + u.getUsername());
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest req) {
        // ✅ Authenticate user
        Authentication auth = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(req.getUsername(), req.getPassword())
        );
        SecurityContextHolder.getContext().setAuthentication(auth);

        // ✅ Generate JWT
        String token = jwtUtil.generateToken(req.getUsername());

        // ✅ Fetch the user's role from the database
        User user = userRepository.findByUsername(req.getUsername())
                .orElseThrow(() -> new RuntimeException("User not found"));

        // ✅ Prepare response with token + role
        Map<String, Object> response = new HashMap<>();
        response.put("token", token);
        response.put("role", user.getRole().name()); // returns "ROLE_ADMIN" or "ROLE_USER"

        return ResponseEntity.ok(response);
    }
}
*/
/*
package com.example.ecomm.controller;

import com.example.ecomm.dto.*;
import com.example.ecomm.model.Role;
import com.example.ecomm.model.User;
import com.example.ecomm.repository.UserRepository;
import com.example.ecomm.security.JwtUtil;
import com.example.ecomm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {

    @Autowired private AuthenticationManager authenticationManager;
    @Autowired private JwtUtil jwtUtil;
    @Autowired private UserService userService;
    @Autowired private UserRepository userRepository;

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody AuthRequest req) {
        User u = userService.registerUser(req.getUsername(), null, req.getPassword(), Role.ROLE_USER);
        return ResponseEntity.ok("Registered: " + u.getUsername());
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest req) {
        // ✅ Authenticate user
        Authentication auth = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(req.getUsername(), req.getPassword())
        );
        SecurityContextHolder.getContext().setAuthentication(auth);

        // ✅ Generate JWT
        String token = jwtUtil.generateToken(req.getUsername());

        // ✅ Fetch the user's role from the database
        User user = userRepository.findByUsername(req.getUsername())
                .orElseThrow(() -> new RuntimeException("User not found"));

        // ✅ Prepare response with token + role + username
        Map<String, Object> response = new HashMap<>();
        response.put("token", token);
        response.put("role", user.getRole().name()); // e.g. ROLE_ADMIN or ROLE_USER
        response.put("username", user.getUsername());

        return ResponseEntity.ok(response);
    }
}
*/

//28-10-2025
/*
package com.example.ecomm.controller;

import com.example.ecomm.dto.*;
import com.example.ecomm.model.Role;
import com.example.ecomm.model.User;
import com.example.ecomm.repository.UserRepository;
import com.example.ecomm.security.JwtUtil;
import com.example.ecomm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {

    @Autowired private AuthenticationManager authenticationManager;
    @Autowired private JwtUtil jwtUtil;
    @Autowired private UserService userService;
    @Autowired private UserRepository userRepository;

    // ============== REGISTER ==============
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody AuthRequest req) {
        User u = userService.registerUser(req.getUsername(), null, req.getPassword(), Role.ROLE_USER);
        return ResponseEntity.ok("Registered: " + u.getUsername());
    }

    // ============== LOGIN ==============
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest req) {
        // ✅ Authenticate user
        Authentication auth = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(req.getUsername(), req.getPassword())
        );
        SecurityContextHolder.getContext().setAuthentication(auth);

        // ✅ Generate JWT
        String token = jwtUtil.generateToken(req.getUsername());

        // ✅ Fetch the user's role from the database
        User user = userRepository.findByUsername(req.getUsername())
                .orElseThrow(() -> new RuntimeException("User not found"));

        // ✅ Prepare response with token + role + username
        Map<String, Object> response = new HashMap<>();
        response.put("token", token);
        response.put("role", user.getRole().name()); // e.g. ROLE_ADMIN or ROLE_USER
        response.put("username", user.getUsername());

        return ResponseEntity.ok(response);
    }

    // ✅ ============== CHANGE PASSWORD ==============
    @PutMapping("/change-password")
    public ResponseEntity<?> changePassword(@RequestParam String username,
                                            @RequestParam String oldPassword,
                                            @RequestParam String newPassword) {

        boolean success = userService.changePassword(username, oldPassword, newPassword);

        if (success) {
            return ResponseEntity.ok("Password updated successfully");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Invalid username or old password");
        }
    }
}
*/
/*
package com.example.ecomm.controller;

import com.example.ecomm.dto.*;
import com.example.ecomm.model.Role;
import com.example.ecomm.model.User;
import com.example.ecomm.repository.UserRepository;
import com.example.ecomm.security.JwtUtil;
import com.example.ecomm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {

    @Autowired private AuthenticationManager authenticationManager;
    @Autowired private JwtUtil jwtUtil;
    @Autowired private UserService userService;
    @Autowired private UserRepository userRepository;

    // ============== REGISTER ==============
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody AuthRequest req) {
        User u = userService.registerUser(req.getUsername(), null, req.getPassword(), Role.ROLE_USER);
        return ResponseEntity.ok("Registered: " + u.getUsername());
    }

    // ============== LOGIN ==============
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest req) {
        // ✅ Authenticate user
        Authentication auth = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(req.getUsername(), req.getPassword())
        );
        SecurityContextHolder.getContext().setAuthentication(auth);

        // ✅ Generate JWT
        String token = jwtUtil.generateToken(req.getUsername());

        // ✅ Fetch the user's role from the database
        User user = userRepository.findByUsername(req.getUsername())
                .orElseThrow(() -> new RuntimeException("User not found"));

        // ✅ Prepare response with token + role + username
        Map<String, Object> response = new HashMap<>();
        response.put("token", token);
        response.put("role", user.getRole().name()); // e.g. ROLE_ADMIN or ROLE_USER
        response.put("username", user.getUsername());

        return ResponseEntity.ok(response);
    }

    // ✅ ============== CHANGE PASSWORD ==============
    @PostMapping("/change-password")
    public ResponseEntity<?> changePassword(@RequestBody PasswordChangeRequest req) {
        boolean success = userService.changePassword(req.getUsername(), req.getPassword(), req.getNewPassword());
     // boolean success = userService.changePassword(req.getUsername(), req.getNewPassword());


        if (success) {
            return ResponseEntity.ok("Password updated successfully");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Invalid username or old password");
        }
    }
}
*/

/*
package com.example.ecomm.controller;

import com.example.ecomm.dto.*;
import com.example.ecomm.model.Role;
import com.example.ecomm.model.User;
import com.example.ecomm.repository.UserRepository;
import com.example.ecomm.security.JwtUtil;
import com.example.ecomm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {

    @Autowired private AuthenticationManager authenticationManager;
    @Autowired private JwtUtil jwtUtil;
    @Autowired private UserService userService;
    @Autowired private UserRepository userRepository;

    // ============== REGISTER ==============
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody AuthRequest req) {
        User u = userService.registerUser(req.getUsername(), null, req.getPassword(), Role.ROLE_USER);
        return ResponseEntity.ok("Registered: " + u.getUsername());
    }

    // ============== LOGIN ==============
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest req) {
        // ✅ Authenticate user
        Authentication auth = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(req.getUsername(), req.getPassword())
        );
        SecurityContextHolder.getContext().setAuthentication(auth);

        // ✅ Generate JWT
        String token = jwtUtil.generateToken(req.getUsername());

        // ✅ Fetch the user's role from the database
        User user = userRepository.findByUsername(req.getUsername())
                .orElseThrow(() -> new RuntimeException("User not found"));

        // ✅ Prepare response with token + role + username
        Map<String, Object> response = new HashMap<>();
        response.put("token", token);
        response.put("role", user.getRole().name()); // e.g. ROLE_ADMIN or ROLE_USER
        response.put("username", user.getUsername());

        return ResponseEntity.ok(response);
    }

    // ✅ ============== CHANGE PASSWORD (Old Password Required) ==============
    @PostMapping("/change-password")
    public ResponseEntity<?> changePassword(@RequestBody PasswordResetRequest req) {
        boolean success = userService.changePassword(req.getUsername(), req.getPassword(), req.getNewPassword());

        if (success) {
            return ResponseEntity.ok("Password updated successfully");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Invalid username or old password");
        }
    }

    // ✅ ============== RESET PASSWORD (No Old Password Required) ==============
    @PostMapping("/reset-password")
    public ResponseEntity<?> resetPassword(@RequestBody PasswordResetRequest req) {
        boolean success = userService.resetPassword(req.getUsername(), req.getNewPassword());

        if (success) {
            return ResponseEntity.ok("Password reset successfully");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("User not found");
        }
    }
}
*/
/*

package com.example.ecomm.controller;

import com.example.ecomm.dto.*;
import com.example.ecomm.model.Role;
import com.example.ecomm.model.User;
import com.example.ecomm.repository.UserRepository;
import com.example.ecomm.security.JwtUtil;
import com.example.ecomm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {

    @Autowired private AuthenticationManager authenticationManager;
    @Autowired private JwtUtil jwtUtil;
    @Autowired private UserService userService;
    @Autowired private UserRepository userRepository;

    // ✅ ============== REGISTER ==============
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody AuthRequest req) {
        User u = userService.registerUser(req.getUsername(), null, req.getPassword(), Role.ROLE_USER);
        return ResponseEntity.ok("Registered: " + u.getUsername());
    }

    // ✅ ============== LOGIN ==============
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest req) {
        try {
            Authentication auth = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(req.getUsername(), req.getPassword())
            );
            SecurityContextHolder.getContext().setAuthentication(auth);

            String token = jwtUtil.generateToken(req.getUsername());

            User user = userRepository.findByUsername(req.getUsername())
                    .orElseThrow(() -> new RuntimeException("User not found"));

            Map<String, Object> response = new HashMap<>();
            response.put("token", token);
            response.put("role", user.getRole().name());
            response.put("username", user.getUsername());

            return ResponseEntity.ok(response);

        } catch (BadCredentialsException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("message", "Invalid username or password"));
        }
    }

    // ✅ ============== CHANGE PASSWORD (Old Password Required) ==============
    @PostMapping("/change-password")
    public ResponseEntity<?> changePassword(@RequestBody PasswordResetRequest req) {
        boolean success = userService.changePassword(req.getUsername(), req.getPassword(), req.getNewPassword());

        if (success) {
            return ResponseEntity.ok(Map.of("message", "Password updated successfully"));
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("message", "Invalid username or old password"));
        }
    }

    // ✅ ============== RESET PASSWORD (No Old Password Required) ==============
    @PostMapping("/reset-password")
    public ResponseEntity<?> resetPassword(@RequestBody PasswordResetRequest req) {
        boolean success = userService.resetPassword(req.getUsername(), req.getNewPassword());

        if (success) {
            return ResponseEntity.ok(Map.of("message", "Password reset successful"));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("message", "User not found"));
        }
    }
}
*/


/*
package com.example.ecomm.controller;

import com.example.ecomm.dto.*;
import com.example.ecomm.model.Role;
import com.example.ecomm.model.User;
import com.example.ecomm.repository.UserRepository;
import com.example.ecomm.security.JwtUtil;
import com.example.ecomm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {

    @Autowired private AuthenticationManager authenticationManager;
    @Autowired private JwtUtil jwtUtil;
    @Autowired private UserService userService;
    @Autowired private UserRepository userRepository;

    // ✅ REGISTER
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody AuthRequest req) {
        User u = userService.registerUser(req.getUsername(), null, req.getPassword(), Role.ROLE_USER);
        return ResponseEntity.ok(Map.of("message", "User registered successfully", "username", u.getUsername()));
    }

    // ✅ LOGIN
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest req) {
        try {
            Authentication auth = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(req.getUsername(), req.getPassword())
            );
            SecurityContextHolder.getContext().setAuthentication(auth);

            String token = jwtUtil.generateToken(req.getUsername());

            User user = userRepository.findByUsername(req.getUsername())
                    .orElseThrow(() -> new RuntimeException("User not found"));

            Map<String, Object> response = new HashMap<>();
            response.put("token", token);
            response.put("role", user.getRole().name());
            response.put("username", user.getUsername());

            System.out.println("✅ Login successful for: " + req.getUsername());
            return ResponseEntity.ok(response);

        } catch (BadCredentialsException e) {
            System.out.println("❌ Invalid login for: " + req.getUsername());
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("message", "Invalid username or password"));
        }
    }

    // ✅ CHANGE PASSWORD (old password required)
    @PostMapping("/change-password")
    public ResponseEntity<?> changePassword(@RequestBody PasswordResetRequest req) {
        boolean success = userService.changePassword(req.getUsername(), req.getPassword(), req.getNewPassword());

        if (success) {
            return ResponseEntity.ok(Map.of("message", "Password updated successfully"));
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("message", "Invalid username or old password"));
        }
    }

 // ✅ RESET PASSWORD (no old password required)
    @PostMapping("/reset-password")
    public ResponseEntity<?> resetPassword(@RequestBody PasswordResetRequest req) {

        // 👇 Add this line right here
        System.out.println("🔹 Received Reset Request → username=" + req.getUsername() + ", newPassword=" + req.getNewPassword());

        boolean success = userService.resetPassword(req.getUsername(), req.getNewPassword());

        if (success) {
            return ResponseEntity.ok(Map.of("message", "Password reset successful"));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("message", "User not found"));
        }
    }
}
*/


package com.example.ecomm.controller;

import com.example.ecomm.dto.*;
import com.example.ecomm.model.Role;
import com.example.ecomm.model.User;
import com.example.ecomm.repository.UserRepository;
import com.example.ecomm.security.JwtUtil;
import com.example.ecomm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {

    @Autowired private AuthenticationManager authenticationManager;
    @Autowired private JwtUtil jwtUtil;
    @Autowired private UserService userService;
    @Autowired private UserRepository userRepository;

    // ✅ REGISTER
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody AuthRequest req) {
        User u = userService.registerUser(req.getUsername(), null, req.getPassword(), Role.ROLE_USER);
        return ResponseEntity.ok(Map.of("message", "User registered successfully", "username", u.getUsername()));
    }

    // ✅ LOGIN
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest req) {
        try {
            Authentication auth = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(req.getUsername(), req.getPassword())
            );
            SecurityContextHolder.getContext().setAuthentication(auth);

            String token = jwtUtil.generateToken(req.getUsername());

            User user = userRepository.findByUsername(req.getUsername())
                    .orElseThrow(() -> new RuntimeException("User not found"));

            Map<String, Object> response = new HashMap<>();
            response.put("token", token);
            response.put("role", user.getRole().name());
            response.put("username", user.getUsername());

            System.out.println("✅ Login successful for: " + req.getUsername());
            return ResponseEntity.ok(response);

        } catch (BadCredentialsException e) {
            System.out.println("❌ Invalid login for: " + req.getUsername());
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("message", "Invalid username or password"));
        }
    }

    // ✅ CHANGE PASSWORD (old password required)
    @PostMapping("/change-password")
    public ResponseEntity<?> changePassword(@RequestBody PasswordResetRequest req) {
        boolean success = userService.changePassword(req.getUsername(), req.getPassword(), req.getNewPassword());

        if (success) {
            return ResponseEntity.ok(Map.of("message", "Password updated successfully"));
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("message", "Invalid username or old password"));
        }
    }

    // ✅ RESET PASSWORD (no old password required)
    @PostMapping("/reset-password")
    public ResponseEntity<?> resetPassword(@RequestBody PasswordResetRequest req) {

        // 👇 Add this line right here
        System.out.println("🔹 Received Reset Request → username=" + req.getUsername() + ", newPassword=" + req.getNewPassword());

        boolean success = userService.resetPassword(req.getUsername(), req.getNewPassword());

        if (success) {
            return ResponseEntity.ok(Map.of("message", "Password reset successful"));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("message", "User not found"));
        }
    }
}

// ✅ SALES CONTROLLER (Protected for ROLE_SALES)
@RestController
@RequestMapping("/api/sales")
@PreAuthorize("hasRole('SALES')")
class SalesController {

    // You can add your sales-specific endpoints here
    @GetMapping("/dashboard")
    public ResponseEntity<?> getSalesDashboard() {
        Map<String, Object> data = new HashMap<>();
        data.put("message", "Welcome to Sales Dashboard!");
        data.put("status", "success");
        return ResponseEntity.ok(data);
    }
}

