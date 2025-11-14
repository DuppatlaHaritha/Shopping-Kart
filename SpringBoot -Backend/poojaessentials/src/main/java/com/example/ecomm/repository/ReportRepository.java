/*package com.example.ecomm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.example.ecomm.model.OrderTbl;  // existing order entity
import java.util.List;

@Repository
public interface ReportRepository extends JpaRepository<OrderTbl, Long> {

    @Query(value = """
        SELECT p.id, p.name, SUM(oi.quantity) AS total_quantity
        FROM products p
        JOIN order_items oi ON p.id = oi.product_id
        JOIN orders_tbl o ON o.id = oi.order_id
        WHERE UPPER(o.status) = 'PAYMENT DONE'
          AND DATE(o.created_at) = CURDATE()
        GROUP BY p.id, p.name
        ORDER BY total_quantity DESC
        """, nativeQuery = true)
    List<Object[]> findDailyReport();

    @Query(value = """
        SELECT p.id, p.name, SUM(oi.quantity) AS total_quantity
        FROM products p
        JOIN order_items oi ON p.id = oi.product_id
        JOIN orders_tbl o ON o.id = oi.order_id
        WHERE UPPER(o.status) = 'PAYMENT DONE'
          AND MONTH(o.created_at) = MONTH(CURDATE())
          AND YEAR(o.created_at) = YEAR(CURDATE())
        GROUP BY p.id, p.name
        ORDER BY total_quantity DESC
        """, nativeQuery = true)
    List<Object[]> findMonthlyReport();

    @Query(value = """
        SELECT p.id, p.name, SUM(oi.quantity) AS total_quantity
        FROM products p
        JOIN order_items oi ON p.id = oi.product_id
        JOIN orders_tbl o ON o.id = oi.order_id
        WHERE UPPER(o.status) = 'PAYMENT DONE'
          AND YEAR(o.created_at) = YEAR(CURDATE())
        GROUP BY p.id, p.name
        ORDER BY total_quantity DESC
        """, nativeQuery = true)
    List<Object[]> findYearlyReport();
}*/
/*package com.example.ecomm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.example.ecomm.model.OrderTbl;
import java.util.List;

@Repository
public interface ReportRepository extends JpaRepository<OrderTbl, Long> {

    // Daily report
    @Query(value = """
        SELECT p.id, p.name, SUM(COALESCE(oi.quantity,0)) AS total_quantity
        FROM products p
        JOIN order_items oi ON p.id = oi.product_id
        JOIN orders_tbl o ON o.id = oi.order_id
        WHERE UPPER(o.status) LIKE '%PAYMENT DONE%'
          AND DATE(COALESCE(o.created_at, CURRENT_DATE)) = CURDATE()
        GROUP BY p.id, p.name
        ORDER BY total_quantity DESC
        """, nativeQuery = true)
    List<Object[]> findDailyReport();

    // Monthly report
    @Query(value = """
        SELECT p.id, p.name, SUM(COALESCE(oi.quantity,0)) AS total_quantity
        FROM products p
        JOIN order_items oi ON p.id = oi.product_id
        JOIN orders_tbl o ON o.id = oi.order_id
        WHERE UPPER(o.status) LIKE '%PAYMENT DONE%'
          AND MONTH(COALESCE(o.created_at, CURRENT_DATE)) = MONTH(CURDATE())
          AND YEAR(COALESCE(o.created_at, CURRENT_DATE)) = YEAR(CURDATE())
        GROUP BY p.id, p.name
        ORDER BY total_quantity DESC
        """, nativeQuery = true)
    List<Object[]> findMonthlyReport();

    // Yearly report
    @Query(value = """
        SELECT p.id, p.name, SUM(COALESCE(oi.quantity,0)) AS total_quantity
        FROM products p
        JOIN order_items oi ON p.id = oi.product_id
        JOIN orders_tbl o ON o.id = oi.order_id
        WHERE UPPER(o.status) LIKE '%PAYMENT DONE%'
          AND YEAR(COALESCE(o.created_at, CURRENT_DATE)) = YEAR(CURDATE())
        GROUP BY p.id, p.name
        ORDER BY total_quantity DESC
        """, nativeQuery = true)
    List<Object[]> findYearlyReport();
}
*/
package com.example.ecomm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.example.ecomm.model.OrderTbl;
import java.util.List;

@Repository
public interface ReportRepository extends JpaRepository<OrderTbl, Long> {

    // Daily report
    @Query(value = """
        SELECT p.id, p.name, SUM(oi.quantity) AS total_quantity
        FROM products p
        INNER JOIN order_items oi ON p.id = oi.product_id
        INNER JOIN orders_tbl o ON o.id = oi.order_id
        WHERE UPPER(o.status) = 'PAYMENT DONE'
          AND DATE(o.created_at) = CURDATE()
        GROUP BY p.id, p.name
        ORDER BY total_quantity DESC
        """, nativeQuery = true)
    List<Object[]> findDailyReport();

    // Weekly report
    @Query(value = """
        SELECT p.id, p.name, SUM(oi.quantity) AS total_quantity
        FROM products p
        INNER JOIN order_items oi ON p.id = oi.product_id
        INNER JOIN orders_tbl o ON o.id = oi.order_id
        WHERE UPPER(o.status) = 'PAYMENT DONE'
          AND YEARWEEK(o.created_at, 1) = YEARWEEK(CURDATE(), 1)
        GROUP BY p.id, p.name
        ORDER BY total_quantity DESC
        """, nativeQuery = true)
    List<Object[]> findWeeklyReport();

    // Monthly report
    @Query(value = """
        SELECT p.id, p.name, SUM(oi.quantity) AS total_quantity
        FROM products p
        INNER JOIN order_items oi ON p.id = oi.product_id
        INNER JOIN orders_tbl o ON o.id = oi.order_id
        WHERE UPPER(o.status) = 'PAYMENT DONE'
          AND MONTH(o.created_at) = MONTH(CURDATE())
          AND YEAR(o.created_at) = YEAR(CURDATE())
        GROUP BY p.id, p.name
        ORDER BY total_quantity DESC
        """, nativeQuery = true)
    List<Object[]> findMonthlyReport();

    // Yearly report
    @Query(value = """
        SELECT p.id, p.name, SUM(oi.quantity) AS total_quantity
        FROM products p
        INNER JOIN order_items oi ON p.id = oi.product_id
        INNER JOIN orders_tbl o ON o.id = oi.order_id
        WHERE UPPER(o.status) = 'PAYMENT DONE'
          AND YEAR(o.created_at) = YEAR(CURDATE())
        GROUP BY p.id, p.name
        ORDER BY total_quantity DESC
        """, nativeQuery = true)
    List<Object[]> findYearlyReport();
}

