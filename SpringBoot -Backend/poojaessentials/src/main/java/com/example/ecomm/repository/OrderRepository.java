/*
package com.example.ecomm.repository;

import com.example.ecomm.model.OrderTbl;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface OrderRepository extends JpaRepository<OrderTbl, Long> {
    List<OrderTbl> findByUserId(Long userId);
}
*/

/*
package com.example.ecomm.repository;

import com.example.ecomm.model.OrderTbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderRepository extends JpaRepository<OrderTbl, Long> {

    // ✅ Fetch orders + items + products in one go for a specific user id
    @Query("SELECT DISTINCT o FROM OrderTbl o " +
           "LEFT JOIN FETCH o.items i " +
           "LEFT JOIN FETCH i.product p " +
           "WHERE o.user.id = :userId " +
           "ORDER BY o.createdAt DESC")
    List<OrderTbl> findByUserIdWithItemsAndProducts(@Param("userId") Long userId);
   // List<OrderTbl> findByUserIdWithItemsAndProducts(@Param("userId") Long userId);
    List<OrderTbl> findByStatus(String status);


}
*/



/*
package com.example.ecomm.repository;

import com.example.ecomm.model.OrderTbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderRepository extends JpaRepository<OrderTbl, Long> {

    // ✅ Fetch orders + items + products for a specific user id
    @Query("SELECT DISTINCT o FROM OrderTbl o " +
           "LEFT JOIN FETCH o.items i " +
           "LEFT JOIN FETCH i.product p " +
           "WHERE o.user.id = :userId " +
           "ORDER BY o.createdAt DESC")
    List<OrderTbl> findByUserIdWithItemsAndProducts(@Param("userId") Long userId);

    // ✅ Fetch orders by user's username
    List<OrderTbl> findByUser_Username(String username);

    // ✅ Fetch orders by user's ID (fix for your new error)
    List<OrderTbl> findByUser_Id(Long userId);

    // ✅ Fetch orders by status
    List<OrderTbl> findByStatus(String status);
}
*/



/*
package com.example.ecomm.repository;

import com.example.ecomm.model.OrderTbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderRepository extends JpaRepository<OrderTbl, Long> {

    /** ✅ Fetch orders + items + products for a specific userId */
/*
    @Query("SELECT DISTINCT o FROM OrderTbl o " +
           "LEFT JOIN FETCH o.items i " +
           "LEFT JOIN FETCH i.product p " +
           "WHERE o.user.id = :userId ORDER BY o.createdAt DESC")
    List<OrderTbl> findByUserIdWithItemsAndProducts(@Param("userId") Long userId);

    /** ✅ Fetch orders by user's username */
/*
    List<OrderTbl> findByUser_Username(String username);

    /** ✅ Fetch orders by user's ID */
/*
    List<OrderTbl> findByUser_Id(Long userId);

    /** ✅ Fetch orders by status */
/*
    List<OrderTbl> findByStatus(String status);
}
*/



/*
package com.example.ecomm.repository;

import com.example.ecomm.model.OrderTbl;
import com.example.ecomm.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderRepository extends JpaRepository<OrderTbl, Long> {

    /** ✅ Fetch orders + items + products for a specific userId */
/*
    @Query("SELECT DISTINCT o FROM OrderTbl o " +
           "LEFT JOIN FETCH o.items i " +
           "LEFT JOIN FETCH i.product p " +
           "WHERE o.user.id = :userId ORDER BY o.createdAt DESC")
    List<OrderTbl> findByUserIdWithItemsAndProducts(@Param("userId") Long userId);

    /** ✅ Fetch orders by user's username */
/*
    List<OrderTbl> findByUser_Username(String username);

    /** ✅ Fetch orders by user's ID */
/*
    List<OrderTbl> findByUser_Id(Long userId);

    /** ✅ Fetch orders by status */
/*
    List<OrderTbl> findByStatus(String status);

    /** ✅ Fetch orders by User entity (for ROLE_ADMIN use) */
/*
    @Query("SELECT o FROM OrderTbl o WHERE o.user = :user ORDER BY o.createdAt DESC")
    List<OrderTbl> findByUser(@Param("user") User user);
}
*/






/*
package com.example.ecomm.repository;

import com.example.ecomm.model.OrderTbl;
import com.example.ecomm.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderRepository extends JpaRepository<OrderTbl, Long> {

    /** ✅ Fetch orders + items + products for a specific userId */
/*
    @Query("SELECT DISTINCT o FROM OrderTbl o " +
           "LEFT JOIN FETCH o.items i " +
           "LEFT JOIN FETCH i.product p " +
           "WHERE o.user.id = :userId ORDER BY o.createdAt DESC")
    List<OrderTbl> findByUserIdWithItemsAndProducts(@Param("userId") Long userId);

    /** ✅ Fetch orders by user's username */
/*
    List<OrderTbl> findByUser_Username(String username);

    /** ✅ Fetch orders by user's ID */
/*
    List<OrderTbl> findByUser_Id(Long userId);

    /** ✅ Fetch orders by status */
/*
    List<OrderTbl> findByStatus(String status);

    /** ✅ Fetch orders by User entity (for ROLE_ADMIN use) */
/*
    @Query("SELECT o FROM OrderTbl o WHERE o.user = :user ORDER BY o.createdAt DESC")
    List<OrderTbl> findByUser(@Param("user") User user);

    /** ✅ Fetch all orders with items and products (used for ROLE_SALES) */
/*
    @Query("SELECT DISTINCT o FROM OrderTbl o " +
           "LEFT JOIN FETCH o.items i " +
           "LEFT JOIN FETCH i.product p " +
           "ORDER BY o.createdAt DESC")
    List<OrderTbl> findAllOrdersWithItemsAndProducts();
}
*/






package com.example.ecomm.repository;

import com.example.ecomm.model.OrderTbl;
import com.example.ecomm.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderRepository extends JpaRepository<OrderTbl, Long> {

    /** ✅ Fetch orders + items + products for a specific userId */
    @Query("SELECT DISTINCT o FROM OrderTbl o " +
           "LEFT JOIN FETCH o.items i " +
           "LEFT JOIN FETCH i.product p " +
           "WHERE o.user.id = :userId ORDER BY o.createdAt DESC")
    List<OrderTbl> findByUserIdWithItemsAndProducts(@Param("userId") Long userId);

    /** ✅ Fetch orders by user's username */
    List<OrderTbl> findByUser_Username(String username);

    /** ✅ Fetch orders by user's ID */
    List<OrderTbl> findByUser_Id(Long userId);

    /** ✅ Fetch orders by status */
    List<OrderTbl> findByStatus(String status);

    /** ✅ Fetch orders by User entity (for ROLE_ADMIN use) */
    @Query("SELECT o FROM OrderTbl o WHERE o.user = :user ORDER BY o.createdAt DESC")
    List<OrderTbl> findByUser(@Param("user") User user);

    /** ✅ Fetch all orders with items and products (used for ROLE_SALES) - latest first */
    @Query("SELECT DISTINCT o FROM OrderTbl o " +
           "LEFT JOIN FETCH o.items i " +
           "LEFT JOIN FETCH i.product p " +
           "ORDER BY o.createdAt DESC")
    List<OrderTbl> findAllOrdersWithItemsAndProducts();
}
