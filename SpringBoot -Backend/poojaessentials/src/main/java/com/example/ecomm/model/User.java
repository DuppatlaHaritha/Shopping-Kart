
//27-10-2025 working
/*
package com.example.ecomm.model;

import java.time.LocalDateTime;
import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class User {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String username;

    private String email;

    @Column(nullable = false)
    private String password;

    @Enumerated(EnumType.STRING)
    private Role role = Role.ROLE_USER;

    private LocalDateTime createdAt = LocalDateTime.now();

    public User() {}

    public User(String username, String email, String password, Role role) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    // getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public Role getRole() { return role; }
    public void setRole(Role role) { this.role = role; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}
*/

/*package com.example.ecomm.model;

import java.time.LocalDateTime;
import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class User {

    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String username;

    private String email;

    @Column(nullable = false)
    private String password;

    @Enumerated(EnumType.STRING)
    private Role role = Role.ROLE_USER;

    private LocalDateTime createdAt = LocalDateTime.now();

    // ✅ Login attempt tracking
    @Column(nullable = false)
    private int failedAttempts = 0;

    @Column(nullable = false)
    private boolean accountLocked = false;

    private LocalDateTime lockTime;

    public User() {}

    public User(String username, String email, String password, Role role) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    // ===== Getters & Setters =====
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public Role getRole() { return role; }
    public void setRole(Role role) { this.role = role; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public int getFailedAttempts() { return failedAttempts; }
    public void setFailedAttempts(int failedAttempts) { this.failedAttempts = failedAttempts; }

    public boolean isAccountLocked() { return accountLocked; }
    public void setAccountLocked(boolean accountLocked) { this.accountLocked = accountLocked; }

    public LocalDateTime getLockTime() { return lockTime; }
    public void setLockTime(LocalDateTime lockTime) { this.lockTime = lockTime; }

    // ✅ Optional helper (for services)
    public boolean isLockExpired() {
        if (this.lockTime == null) return false;
        return this.lockTime.plusMinutes(15).isBefore(LocalDateTime.now());
    }
}
*/

//28-10-2025
package com.example.ecomm.model;

import java.time.LocalDateTime;
import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class User {

    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String username;

    private String email;

    @Column(nullable = false)
    private String password;

    @Enumerated(EnumType.STRING)
    private Role role = Role.ROLE_USER;

    private LocalDateTime createdAt = LocalDateTime.now();

    // ✅ Login attempt tracking
    @Column(nullable = false)
    private int failedAttempts = 0;

    @Column(nullable = false)
    private boolean accountLocked = false;

    private LocalDateTime lockTime;

    public User() {}

    public User(String username, String email, String password, Role role) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    // ===== Getters & Setters =====
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public Role getRole() { return role; }
    public void setRole(Role role) { this.role = role; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public int getFailedAttempts() { return failedAttempts; }
    public void setFailedAttempts(int failedAttempts) { this.failedAttempts = failedAttempts; }

    public boolean isAccountLocked() { return accountLocked; }
    public void setAccountLocked(boolean accountLocked) { this.accountLocked = accountLocked; }

    public LocalDateTime getLockTime() { return lockTime; }
    public void setLockTime(LocalDateTime lockTime) { this.lockTime = lockTime; }

    // ✅ Optional helper (for services)
    public boolean isLockExpired() {
        if (this.lockTime == null) return false;
        return this.lockTime.plusMinutes(15).isBefore(LocalDateTime.now());
    }

    // ✅ New helper method for password update
    // This allows controlled password change in the service layer.
    public void updatePassword(String newEncodedPassword) {
        this.password = newEncodedPassword;
    }

    // ✅ Optional: reset failed attempts after password change
    public void resetFailedAttempts() {
        this.failedAttempts = 0;
        this.accountLocked = false;
        this.lockTime = null;
    }
}
