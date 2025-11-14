//27-10-2025
/*
package com.example.ecomm.service;

import com.example.ecomm.model.User;
import com.example.ecomm.model.Role;
import com.example.ecomm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired private UserRepository userRepository;
    @Autowired private PasswordEncoder passwordEncoder;

    public User registerUser(String username, String email, String rawPassword, Role role) {
        if (userRepository.existsByUsername(username)) {
            throw new RuntimeException("Username exists");
        }
        User u = new User(username, email, passwordEncoder.encode(rawPassword), role);
        return userRepository.save(u);
    }
}
*/
/*
package com.example.ecomm.service;

import com.example.ecomm.model.User;
import com.example.ecomm.model.Role;
import com.example.ecomm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.Optional;

@Service
public class UserService {
    @Autowired private UserRepository userRepository;
    @Autowired private PasswordEncoder passwordEncoder;

    // ============== REGISTER USER ==============
    public User registerUser(String username, String email, String rawPassword, Role role) {
        if (userRepository.existsByUsername(username)) {
            throw new RuntimeException("Username exists");
        }
        User u = new User(username, email, passwordEncoder.encode(rawPassword), role);
        return userRepository.save(u);
    }

    // ============== FIND USER ==============
    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    // ============== UPDATE PASSWORD (FIXED) ==============
    public void updatePassword(User user, String newRawPassword) {
        user.setPassword(passwordEncoder.encode(newRawPassword));  // ✅ encode before saving
        user.setFailedAttempts(0);  // ✅ reset failed attempts
        user.setAccountLocked(false); // ✅ ensure account unlocked
        userRepository.save(user);
    }

    // ============== FAILED ATTEMPTS HELPERS ==============
    public void increaseFailedAttempts(User user) {
        int newAttempts = user.getFailedAttempts() + 1;
        user.setFailedAttempts(newAttempts);
        if (newAttempts >= 3) {
            user.setAccountLocked(true);
            user.setLockTime(System.currentTimeMillis());
        }
        userRepository.save(user);
    }

    public void resetFailedAttempts(User user) {
        user.setFailedAttempts(0);
        userRepository.save(user);
    }

    public void unlockAccount(User user) {
        user.setAccountLocked(false);
        user.setFailedAttempts(0);
        user.setLockTime(null);
        userRepository.save(user);
    }

    public boolean unlockIfTimeExpired(User user) {
        if (user.getLockTime() == null) return false;
        long lockTime = user.getLockTime();
        long now = System.currentTimeMillis();
        if (now - lockTime >= 5 * 60 * 1000) { // 5 minutes
            unlockAccount(user);
            return true;
        }
        return false;
    }
}
*/

//28-10-2025
/*
package com.example.ecomm.service;

import com.example.ecomm.model.User;
import com.example.ecomm.model.Role;
import com.example.ecomm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.Optional;

@Service
public class UserService {
    @Autowired private UserRepository userRepository;
    @Autowired private PasswordEncoder passwordEncoder;

    // ============== REGISTER USER ==============
    public User registerUser(String username, String email, String rawPassword, Role role) {
        if (userRepository.existsByUsername(username)) {
            throw new RuntimeException("Username exists");
        }
        User u = new User(username, email, passwordEncoder.encode(rawPassword), role);
        return userRepository.save(u);
    }

    // ============== FIND USER ==============
    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    // ============== UPDATE PASSWORD (FIXED) ==============
    public void updatePassword(User user, String newRawPassword) {
        user.setPassword(passwordEncoder.encode(newRawPassword));  // ✅ encode before saving
        user.setFailedAttempts(0);  // ✅ reset failed attempts
        user.setAccountLocked(false); // ✅ ensure account unlocked
        user.setLockTime(null);
        userRepository.save(user);
    }

    // ✅ NEW: CHANGE PASSWORD WITH OLD PASSWORD VALIDATION
    public boolean changePassword(String username, String oldPassword, String newPassword) {
        Optional<User> optionalUser = userRepository.findByUsername(username);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();

            // ✅ Check if old password is correct
            if (passwordEncoder.matches(oldPassword, user.getPassword())) {
                user.setPassword(passwordEncoder.encode(newPassword));
                user.setFailedAttempts(0);
                user.setAccountLocked(false);
                user.setLockTime(null);
                userRepository.save(user);
                return true;
            }
        }
        return false; // invalid old password or user not found
    }

    // ============== FAILED ATTEMPTS HELPERS ==============
    public void increaseFailedAttempts(User user) {
        int newAttempts = user.getFailedAttempts() + 1;
        user.setFailedAttempts(newAttempts);
        if (newAttempts >= 3) {
            user.setAccountLocked(true);
            user.setLockTime(System.currentTimeMillis());
        }
        userRepository.save(user);
    }

    public void resetFailedAttempts(User user) {
        user.setFailedAttempts(0);
        userRepository.save(user);
    }

    public void unlockAccount(User user) {
        user.setAccountLocked(false);
        user.setFailedAttempts(0);
        user.setLockTime(null);
        userRepository.save(user);
    }

    public boolean unlockIfTimeExpired(User user) {
        if (user.getLockTime() == null) return false;
        long lockTime = user.getLockTime();
        long now = System.currentTimeMillis();
        if (now - lockTime >= 5 * 60 * 1000) { // 5 minutes
            unlockAccount(user);
            return true;
        }
        return false;
    }
}
*/
/*
package com.example.ecomm.service;

import com.example.ecomm.model.User;
import com.example.ecomm.model.Role;
import com.example.ecomm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class UserService {
    @Autowired private UserRepository userRepository;
    @Autowired private PasswordEncoder passwordEncoder;

    // ============== REGISTER USER ==============
    public User registerUser(String username, String email, String rawPassword, Role role) {
        if (userRepository.existsByUsername(username)) {
            throw new RuntimeException("Username exists");
        }
        User u = new User(username, email, passwordEncoder.encode(rawPassword), role);
        return userRepository.save(u);
    }

    // ============== FIND USER ==============
    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    // ============== UPDATE PASSWORD (FIXED) ==============
    public void updatePassword(User user, String newRawPassword) {
        user.setPassword(passwordEncoder.encode(newRawPassword));  // ✅ encode before saving
        user.setFailedAttempts(0);  // ✅ reset failed attempts
        user.setAccountLocked(false); // ✅ ensure account unlocked
        user.setLockTime(null);
        userRepository.save(user);
    }

    // ✅ NEW: CHANGE PASSWORD WITH OLD PASSWORD VALIDATION
    public boolean changePassword(String username, String password, String newPassword) {
   // 	public boolean changePassword(String username, String newPassword) {
        Optional<User> optionalUser = userRepository.findByUsername(username);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();

            // ✅ Check if old password is correct
            if (passwordEncoder.matches(password, user.getPassword())) {
            //	if (passwordEncoder.matches(password, user.getPassword())) {
                user.setPassword(passwordEncoder.encode(newPassword));
                user.setFailedAttempts(0);
                user.setAccountLocked(false);
                user.setLockTime(null);
                userRepository.save(user);
                return true;
            }
        }
        return false; // invalid old password or user not found
    }

    // ============== FAILED ATTEMPTS HELPERS ==============
    public void increaseFailedAttempts(User user) {
        int newAttempts = user.getFailedAttempts() + 1;
        user.setFailedAttempts(newAttempts);
        if (newAttempts >= 3) {
            user.setAccountLocked(true);
            user.setLockTime(LocalDateTime.now()); // ✅ FIXED: use LocalDateTime
        }
        userRepository.save(user);
    }

    public void resetFailedAttempts(User user) {
        user.setFailedAttempts(0);
        userRepository.save(user);
    }

    public void unlockAccount(User user) {
        user.setAccountLocked(false);
        user.setFailedAttempts(0);
        user.setLockTime(null);
        userRepository.save(user);
    }

    public boolean unlockIfTimeExpired(User user) {
        if (user.getLockTime() == null) return false;

        LocalDateTime lockTime = user.getLockTime(); // ✅ FIXED type
        LocalDateTime now = LocalDateTime.now();

        // ✅ unlock if more than 5 minutes passed
        if (lockTime.plusMinutes(5).isBefore(now)) {
            unlockAccount(user);
            return true;
        }
        return false;
    }
}
*/
/*
package com.example.ecomm.service;

import com.example.ecomm.model.User;
import com.example.ecomm.model.Role;
import com.example.ecomm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class UserService {
    @Autowired private UserRepository userRepository;
    @Autowired private PasswordEncoder passwordEncoder;

    // ============== REGISTER USER ==============
    public User registerUser(String username, String email, String rawPassword, Role role) {
        if (userRepository.existsByUsername(username)) {
            throw new RuntimeException("Username exists");
        }
        User u = new User(username, email, passwordEncoder.encode(rawPassword), role);
        return userRepository.save(u);
    }

    // ============== FIND USER ==============
    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    // ============== UPDATE PASSWORD (FIXED) ==============
    public void updatePassword(User user, String newRawPassword) {
        user.setPassword(passwordEncoder.encode(newRawPassword));  // ✅ encode before saving
        user.setFailedAttempts(0);  // ✅ reset failed attempts
        user.setAccountLocked(false); // ✅ ensure account unlocked
        user.setLockTime(null);
        userRepository.save(user);
    }

    // ✅ CHANGE PASSWORD WITH OLD PASSWORD VALIDATION
    public boolean changePassword(String username, String password, String newPassword) {
        Optional<User> optionalUser = userRepository.findByUsername(username);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();

            // ✅ Check if old password is correct
            if (passwordEncoder.matches(password, user.getPassword())) {
                user.setPassword(passwordEncoder.encode(newPassword));
                user.setFailedAttempts(0);
                user.setAccountLocked(false);
                user.setLockTime(null);
                userRepository.save(user);
                return true;
            }
        }
        return false; // invalid old password or user not found
    }

    // ✅ RESET PASSWORD (no old password required)
    public boolean resetPassword(String username, String newPassword) {
        Optional<User> optionalUser = userRepository.findByUsername(username);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            user.setPassword(passwordEncoder.encode(newPassword));  // ✅ encode new password
            user.setFailedAttempts(0);
            user.setAccountLocked(false);
            user.setLockTime(null);
            userRepository.save(user);

            // Optional debug log
            System.out.println("✅ Password reset successful for user: " + username);
            return true;
        }
        return false; // user not found
    }

    // ============== FAILED ATTEMPTS HELPERS ==============
    public void increaseFailedAttempts(User user) {
        int newAttempts = user.getFailedAttempts() + 1;
        user.setFailedAttempts(newAttempts);
        if (newAttempts >= 3) {
            user.setAccountLocked(true);
            user.setLockTime(LocalDateTime.now()); // ✅ FIXED: use LocalDateTime
        }
        userRepository.save(user);
    }

    public void resetFailedAttempts(User user) {
        user.setFailedAttempts(0);
        userRepository.save(user);
    }

    public void unlockAccount(User user) {
        user.setAccountLocked(false);
        user.setFailedAttempts(0);
        user.setLockTime(null);
        userRepository.save(user);
    }

    public boolean unlockIfTimeExpired(User user) {
        if (user.getLockTime() == null) return false;

        LocalDateTime lockTime = user.getLockTime(); // ✅ FIXED type
        LocalDateTime now = LocalDateTime.now();

        // ✅ unlock if more than 5 minutes passed
        if (lockTime.plusMinutes(5).isBefore(now)) {
            unlockAccount(user);
            return true;
        }
        return false;
    }
}
*/
/*
package com.example.ecomm.service;

import com.example.ecomm.model.User;
import com.example.ecomm.model.Role;
import com.example.ecomm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional; // ✅ Added for DB commit
import java.time.LocalDateTime;
import java.util.Optional;

@Service
@Transactional // ✅ ensures all DB updates are properly committed
public class UserService {

    @Autowired 
    private UserRepository userRepository;

    @Autowired 
    private PasswordEncoder passwordEncoder;

    // ============== REGISTER USER ==============
    public User registerUser(String username, String email, String rawPassword, Role role) {
        if (userRepository.existsByUsername(username)) {
            throw new RuntimeException("Username exists");
        }
        User u = new User(username, email, passwordEncoder.encode(rawPassword), role);
        return userRepository.save(u);
    }

    // ============== FIND USER ==============
    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    // ============== UPDATE PASSWORD (WITH SAVE) ==============
    public void updatePassword(User user, String newRawPassword) {
        user.setPassword(passwordEncoder.encode(newRawPassword));  // ✅ encode before saving
        user.setFailedAttempts(0);
        user.setAccountLocked(false);
        user.setLockTime(null);
        userRepository.save(user);
    }

    // ✅ CHANGE PASSWORD (requires old password)
    public boolean changePassword(String username, String password, String newPassword) {
        Optional<User> optionalUser = userRepository.findByUsername(username);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            if (passwordEncoder.matches(password, user.getPassword())) {
                user.setPassword(passwordEncoder.encode(newPassword));
                user.setFailedAttempts(0);
                user.setAccountLocked(false);
                user.setLockTime(null);
                userRepository.save(user);
                System.out.println("✅ Password changed for: " + username);
                return true;
            } else {
                System.out.println("❌ Old password incorrect for: " + username);
            }
        } else {
            System.out.println("❌ User not found: " + username);
        }
        return false;
    }

    // ✅ RESET PASSWORD (no old password required)
    public boolean resetPassword(String username, String newPassword) {
        Optional<User> optionalUser = userRepository.findByUsername(username);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            user.setPassword(passwordEncoder.encode(newPassword)); // ✅ encode password
            user.setFailedAttempts(0);
            user.setAccountLocked(false);
            user.setLockTime(null);
            userRepository.save(user);
            System.out.println("✅ Password reset and saved successfully for: " + username);
            return true;
        } else {
            System.out.println("❌ User not found while resetting password: " + username);
            return false;
        }
    }

    // ============== FAILED ATTEMPTS HELPERS ==============
    public void increaseFailedAttempts(User user) {
        int newAttempts = user.getFailedAttempts() + 1;
        user.setFailedAttempts(newAttempts);
        if (newAttempts >= 3) {
            user.setAccountLocked(true);
            user.setLockTime(LocalDateTime.now());
        }
        userRepository.save(user);
    }

    public void resetFailedAttempts(User user) {
        user.setFailedAttempts(0);
        userRepository.save(user);
    }

    public void unlockAccount(User user) {
        user.setAccountLocked(false);
        user.setFailedAttempts(0);
        user.setLockTime(null);
        userRepository.save(user);
    }

    public boolean unlockIfTimeExpired(User user) {
        if (user.getLockTime() == null) return false;
        LocalDateTime lockTime = user.getLockTime();
        LocalDateTime now = LocalDateTime.now();
        if (lockTime.plusMinutes(5).isBefore(now)) {
            unlockAccount(user);
            return true;
        }
        return false;
    }
}
*/

/*
package com.example.ecomm.service;

import com.example.ecomm.model.User;
import com.example.ecomm.model.Role;
import com.example.ecomm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.Optional;

@Service
@Transactional
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // ============== REGISTER USER ==============
    public User registerUser(String username, String email, String rawPassword, Role role) {
        if (userRepository.existsByUsername(username)) {
            throw new RuntimeException("Username already exists");
        }
        User u = new User(username, email, passwordEncoder.encode(rawPassword), role);
        return userRepository.save(u);
    }

    // ============== FIND USER ==============
    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    // ============== UPDATE PASSWORD (WITH SAVE) ==============
    public void updatePassword(User user, String newRawPassword) {
        user.setPassword(passwordEncoder.encode(newRawPassword)); // ✅ encode before saving
        user.setFailedAttempts(0);
        user.setAccountLocked(false);
        user.setLockTime(null);
        userRepository.save(user);
    }

    // ✅ CHANGE PASSWORD (requires old password)
    public boolean changePassword(String username, String password, String newPassword) {
        Optional<User> optionalUser = userRepository.findByUsername(username);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();

            if (passwordEncoder.matches(password, user.getPassword())) {
                user.setPassword(passwordEncoder.encode(newPassword));
                user.setFailedAttempts(0);
                user.setAccountLocked(false);
                user.setLockTime(null);
                userRepository.save(user);

                System.out.println("✅ Password changed successfully for: " + username);
                return true;
            } else {
                System.out.println("❌ Incorrect old password for: " + username);
            }
        } else {
            System.out.println("❌ User not found for change-password: " + username);
        }
        return false;
    }

    // ✅ RESET PASSWORD (no old password required)
    public boolean resetPassword(String username, String newPassword) {
        Optional<User> optionalUser = userRepository.findByUsername(username);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();

            // ✅ Encode password before saving
            user.setPassword(passwordEncoder.encode(newPassword));
            user.setFailedAttempts(0);
            user.setAccountLocked(false);
            user.setLockTime(null);
            userRepository.save(user);

            System.out.println("✅ Password reset successfully and saved for: " + username);
            return true;
        } else {
            System.out.println("❌ User not found while resetting password: " + username);
            return false;
        }
    }

    // ============== FAILED ATTEMPTS HELPERS ==============
    public void increaseFailedAttempts(User user) {
        int newAttempts = user.getFailedAttempts() + 1;
        user.setFailedAttempts(newAttempts);
        if (newAttempts >= 3) {
            user.setAccountLocked(true);
            user.setLockTime(LocalDateTime.now());
        }
        userRepository.save(user);
    }

    public void resetFailedAttempts(User user) {
        user.setFailedAttempts(0);
        userRepository.save(user);
    }

    public void unlockAccount(User user) {
        user.setAccountLocked(false);
        user.setFailedAttempts(0);
        user.setLockTime(null);
        userRepository.save(user);
    }

    public boolean unlockIfTimeExpired(User user) {
        if (user.getLockTime() == null) return false;
        LocalDateTime lockTime = user.getLockTime();
        LocalDateTime now = LocalDateTime.now();
        if (lockTime.plusMinutes(5).isBefore(now)) {
            unlockAccount(user);
            return true;
        }
        return false;
    }
}
*/


package com.example.ecomm.service;

import com.example.ecomm.model.User;
import com.example.ecomm.model.Role;
import com.example.ecomm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.Optional;

@Service
@Transactional
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // ============== REGISTER USER ==============
    public User registerUser(String username, String email, String rawPassword, Role role) {
        if (userRepository.existsByUsername(username)) {
            throw new RuntimeException("Username already exists");
        }
        User u = new User(username, email, passwordEncoder.encode(rawPassword), role);
        return userRepository.save(u);
    }

    // ============== FIND USER ==============
    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    // ============== UPDATE PASSWORD (WITH SAVE) ==============
    public void updatePassword(User user, String newRawPassword) {
        user.setPassword(passwordEncoder.encode(newRawPassword)); // ✅ Always encode before saving
        user.setFailedAttempts(0);
        user.setAccountLocked(false);
        user.setLockTime(null);
        userRepository.save(user);
        System.out.println("✅ Password updated in database for user: " + user.getUsername());
    }

    // ✅ CHANGE PASSWORD (requires old password)
    public boolean changePassword(String username, String oldPassword, String newPassword) {
        Optional<User> optionalUser = userRepository.findByUsername(username);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();

            if (passwordEncoder.matches(oldPassword, user.getPassword())) {
                user.setPassword(passwordEncoder.encode(newPassword));
                user.setFailedAttempts(0);
                user.setAccountLocked(false);
                user.setLockTime(null);
                userRepository.save(user);

                System.out.println("✅ Password changed successfully for: " + username);
                return true;
            } else {
                System.out.println("❌ Incorrect old password for: " + username);
            }
        } else {
            System.out.println("❌ User not found for change-password: " + username);
        }
        return false;
    }

    // ✅ RESET PASSWORD (no old password required)
    public boolean resetPassword(String username, String newPassword) {
        Optional<User> optionalUser = userRepository.findByUsername(username);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();

            // ✅ Encode new password before saving
            user.setPassword(passwordEncoder.encode(newPassword));
            user.setFailedAttempts(0);
            user.setAccountLocked(false);
            user.setLockTime(null);
            userRepository.save(user);

            System.out.println("✅ Password reset successfully for: " + username);
            return true;
        } else {
            System.out.println("❌ User not found while resetting password: " + username);
            return false;
        }
    }

    // ============== FAILED ATTEMPTS HELPERS ==============
    public void increaseFailedAttempts(User user) {
        int newAttempts = user.getFailedAttempts() + 1;
        user.setFailedAttempts(newAttempts);
        if (newAttempts >= 3) {
            user.setAccountLocked(true);
            user.setLockTime(LocalDateTime.now());
            System.out.println("⚠️ Account locked due to multiple failed attempts: " + user.getUsername());
        }
        userRepository.save(user);
    }

    public void resetFailedAttempts(User user) {
        user.setFailedAttempts(0);
        userRepository.save(user);
        System.out.println("✅ Failed attempts reset for user: " + user.getUsername());
    }

    public void unlockAccount(User user) {
        user.setAccountLocked(false);
        user.setFailedAttempts(0);
        user.setLockTime(null);
        userRepository.save(user);
        System.out.println("✅ Account unlocked manually for: " + user.getUsername());
    }

    public boolean unlockIfTimeExpired(User user) {
        if (user.getLockTime() == null) return false;

        LocalDateTime lockTime = user.getLockTime();
        LocalDateTime now = LocalDateTime.now();

        if (lockTime.plusMinutes(5).isBefore(now)) {
            unlockAccount(user);
            System.out.println("✅ Account automatically unlocked after timeout for: " + user.getUsername());
            return true;
        }
        return false;
    }
}
