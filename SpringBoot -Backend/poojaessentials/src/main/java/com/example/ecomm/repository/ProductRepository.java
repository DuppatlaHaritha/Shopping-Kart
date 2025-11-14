/*package com.example.ecomm.repository;

import com.example.ecomm.model.Product;
import com.example.ecomm.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByCategory(Category category);
}
*/

package com.example.ecomm.repository;

import com.example.ecomm.model.Product;
import com.example.ecomm.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    // Existing method: Find products by Category object
    List<Product> findByCategory(Category category);

    // ✅ New method: Find products by Category ID (simpler for API endpoint use)
    List<Product> findByCategoryId(Long categoryId);
}
