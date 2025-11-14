//27-10-2025
/*
package com.example.ecomm.repository;

import com.example.ecomm.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
    boolean existsByUsername(String username);
}
*/

package com.example.ecomm.repository;

import com.example.ecomm.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    // ✅ Find by username (used in login & password reset)
    Optional<User> findByUsername(String username);

    // ✅ Find by email (optional future use)
    Optional<User> findByEmail(String email);

    // ✅ Check if username exists
    boolean existsByUsername(String username);

    // ✅ Check if email exists (optional future use)
    boolean existsByEmail(String email);

    // ✅ Reset failed attempts after successful login
    @Transactional
    @Modifying
    @Query("UPDATE User u SET u.failedAttempts = 0 WHERE u.username = ?1")
    void resetFailedAttempts(String username);

    // ✅ Increase failed attempts count
    @Transactional
    @Modifying
    @Query("UPDATE User u SET u.failedAttempts = u.failedAttempts + 1 WHERE u.username = ?1")
    void increaseFailedAttempts(String username);

    // ✅ Lock user account
    @Transactional
    @Modifying
    @Query("UPDATE User u SET u.accountLocked = true, u.lockTime = CURRENT_TIMESTAMP WHERE u.username = ?1")
    void lockAccount(String username);

    // ✅ Unlock user account manually
    @Transactional
    @Modifying
    @Query("UPDATE User u SET u.accountLocked = false, u.failedAttempts = 0, u.lockTime = NULL WHERE u.username = ?1")
    void unlockAccount(String username);
}
