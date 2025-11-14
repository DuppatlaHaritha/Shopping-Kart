/*package com.example.ecomm.service;

import com.example.ecomm.model.*;
import com.example.ecomm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {
    @Autowired private ProductRepository productRepository;
    @Autowired private CategoryRepository categoryRepository;

    public List<Product> listAll() { return productRepository.findAll(); }

    public Product create(Product p, Long categoryId) {
        if (categoryId != null) {
            Category c = categoryRepository.findById(categoryId).orElseThrow(() -> new RuntimeException("Category not found"));
            p.setCategory(c);
        }
        return productRepository.save(p);
    }

    public Product update(Long id, Product updated) {
        Product p = productRepository.findById(id).orElseThrow(() -> new RuntimeException("Product not found"));
        p.setName(updated.getName());
        p.setDescription(updated.getDescription());
        p.setPrice(updated.getPrice());
        p.setImageUrl(updated.getImageUrl());
        if (updated.getCategory() != null) p.setCategory(updated.getCategory());
        return productRepository.save(p);
    }

    public void delete(Long id) { productRepository.deleteById(id); }

    public Optional<Product> getById(Long id) { return productRepository.findById(id); }
}*/

/*package com.example.ecomm.service;

import com.example.ecomm.model.*;
import com.example.ecomm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {
    @Autowired private ProductRepository productRepository;
    @Autowired private CategoryRepository categoryRepository;

    public List<Product> listAll() { 
        return productRepository.findAll(); 
    }

    // ✅ Get products by category ID
    public List<Product> getByCategoryId(Long categoryId) {
        return productRepository.findByCategoryId(categoryId);
    }

    public Product create(Product p, Long categoryId) {
        if (categoryId != null) {
            Category c = categoryRepository.findById(categoryId)
                    .orElseThrow(() -> new RuntimeException("Category not found"));
            p.setCategory(c);
        }
        return productRepository.save(p);
    }

    public Product update(Long id, Product updated) {
        Product p = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));
        p.setName(updated.getName());
        p.setDescription(updated.getDescription());
        p.setPrice(updated.getPrice());
        p.setImageUrl(updated.getImageUrl());
        if (updated.getCategory() != null) p.setCategory(updated.getCategory());
        return productRepository.save(p);
    }

    public void delete(Long id) { 
        productRepository.deleteById(id); 
    }

    public Optional<Product> getById(Long id) { 
        return productRepository.findById(id); 
    }
}
*/


//23-10-2025
/*package com.example.ecomm.service;

import com.example.ecomm.model.*;
import com.example.ecomm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

@Service
public class ProductService {
    @Autowired private ProductRepository productRepository;
    @Autowired private CategoryRepository categoryRepository;

    private final String uploadDir = "uploads/"; // Directory to save uploaded images

    public List<Product> listAll() { 
        return productRepository.findAll(); 
    }

    public List<Product> getByCategoryId(Long categoryId) {
        return productRepository.findByCategoryId(categoryId);
    }

    public Product create(Product p, Long categoryId) {
        if (categoryId != null) {
            Category c = categoryRepository.findById(categoryId)
                    .orElseThrow(() -> new RuntimeException("Category not found"));
            p.setCategory(c);
        }
        return productRepository.save(p);
    }

    public Product update(Long id, Product updated) {
        Product p = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));
        p.setName(updated.getName());
        p.setDescription(updated.getDescription());
        p.setPrice(updated.getPrice());
        p.setImageUrl(updated.getImageUrl());
        if (updated.getCategory() != null) p.setCategory(updated.getCategory());
        return productRepository.save(p);
    }

    public void delete(Long id) { 
        productRepository.deleteById(id); 
    }

    public Optional<Product> getById(Long id) { 
        return productRepository.findById(id); 
    }

    // ================= Helper: Save uploaded file =================
    public String saveUploadedFile(MultipartFile file) throws IOException {
        if (file == null || file.isEmpty()) return null;

        File dir = new File(uploadDir);
        if (!dir.exists()) dir.mkdirs();

        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        File dest = new File(uploadDir + fileName);
        file.transferTo(dest);

        // Return relative path for frontend
        return "/uploads/" + fileName;
    }
}*/
//05-11-2024
/*
package com.example.ecomm.service;

import com.example.ecomm.model.Product;
import com.example.ecomm.model.Category;
import com.example.ecomm.repository.ProductRepository;
import com.example.ecomm.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    @Autowired 
    private ProductRepository productRepository;

    @Autowired 
    private CategoryRepository categoryRepository;

    private final String uploadDir = "uploads"; // Directory to save uploaded images

    // ==================== Product CRUD ====================
    public List<Product> listAll() { 
        return productRepository.findAll(); 
    }

    public Optional<Product> getById(Long id) { 
        return productRepository.findById(id); 
    }

    public List<Product> getByCategoryId(Long categoryId) {
        return productRepository.findByCategoryId(categoryId);
    }

    public Product save(Product product) {
        return productRepository.save(product);
    }

    public void delete(Long id) { 
        productRepository.deleteById(id); 
    }

    // ==================== File Upload ====================
    public String saveUploadedFile(MultipartFile file) throws IOException {
        if (file == null || file.isEmpty()) return null;

        // Create upload folder if not exists
        File dir = new File(uploadDir);
        if (!dir.exists()) dir.mkdirs();

        // Generate unique file name
        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        File serverFile = new File(dir.getAbsolutePath() + File.separator + fileName);

        // Save file to server
        file.transferTo(serverFile);

        // Return relative path for frontend
        return "/uploads/" + fileName;
    }

    // ==================== Create Product (with optional category & image) ====================
    public Product createProductWithImage(Product product, Long categoryId, MultipartFile imageFile) throws IOException {
        // Set category if provided
        if (categoryId != null) {
            Category c = categoryRepository.findById(categoryId)
                    .orElseThrow(() -> new RuntimeException("Category not found"));
            product.setCategory(c);
        }

        // Save uploaded image if provided
        if (imageFile != null && !imageFile.isEmpty()) {
            String savedPath = saveUploadedFile(imageFile);
            product.setImagePath(savedPath);
        }

        // Save product to DB
        return productRepository.save(product);
    }

    // ==================== Update Product ====================
    public Product updateProduct(Long id, Product updatedProduct, MultipartFile imageFile, Long categoryId) throws IOException {
        Product existing = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        existing.setName(updatedProduct.getName());
        existing.setDescription(updatedProduct.getDescription());
        existing.setPrice(updatedProduct.getPrice());

        // Update category if provided
        if (categoryId != null) {
            Category category = categoryRepository.findById(categoryId)
                    .orElseThrow(() -> new RuntimeException("Category not found"));
            existing.setCategory(category);
        }

        // Update image if uploaded
        if (imageFile != null && !imageFile.isEmpty()) {
            String imagePath = saveUploadedFile(imageFile);
            existing.setImagePath(imagePath);
        }

        return productRepository.save(existing);
    }
}
*/

package com.example.ecomm.service;

import com.example.ecomm.model.Product;
import com.example.ecomm.model.Category;
import com.example.ecomm.repository.ProductRepository;
import com.example.ecomm.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    @Autowired 
    private ProductRepository productRepository;

    @Autowired 
    private CategoryRepository categoryRepository;

    private final String uploadDir = "uploads"; // Directory to save uploaded images

    // ==================== Product CRUD ====================
    public List<Product> listAll() { 
        return productRepository.findAll(); 
    }

    public Optional<Product> getById(Long id) { 
        return productRepository.findById(id); 
    }

    public List<Product> getByCategoryId(Long categoryId) {
        return productRepository.findByCategoryId(categoryId);
    }

    public Product save(Product product) {
        // Ensure newPrice consistency before saving
        if (product.getNewPrice() == null) {
            product.setNewPrice(product.getPrice());
        }
        return productRepository.save(product);
    }

    public void delete(Long id) { 
        productRepository.deleteById(id); 
    }

    // ==================== File Upload ====================
    public String saveUploadedFile(MultipartFile file) throws IOException {
        if (file == null || file.isEmpty()) return null;

        // Create upload folder if not exists
        File dir = new File(uploadDir);
        if (!dir.exists()) dir.mkdirs();

        // Generate unique file name
        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        File serverFile = new File(dir.getAbsolutePath() + File.separator + fileName);

        // Save file to server
        file.transferTo(serverFile);

        // Return relative path for frontend
        return "/uploads/" + fileName;
    }

    // ==================== Create Product (with optional category & image) ====================
    public Product createProductWithImage(Product product, Long categoryId, MultipartFile imageFile) throws IOException {
        // Set category if provided
        if (categoryId != null) {
            Category c = categoryRepository.findById(categoryId)
                    .orElseThrow(() -> new RuntimeException("Category not found"));
            product.setCategory(c);
        }

        // Save uploaded image if provided
        if (imageFile != null && !imageFile.isEmpty()) {
            String savedPath = saveUploadedFile(imageFile);
            product.setImagePath(savedPath);
        }

        // Ensure newPrice is valid
        if (product.getNewPrice() == null) {
            product.setNewPrice(product.getPrice());
        }

        // Save product to DB
        return productRepository.save(product);
    }

    // ==================== Update Product ====================
    public Product updateProduct(Long id, Product updatedProduct, MultipartFile imageFile, Long categoryId) throws IOException {
        Product existing = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        existing.setName(updatedProduct.getName());
        existing.setDescription(updatedProduct.getDescription());
        existing.setPrice(updatedProduct.getPrice());
        existing.setNewPrice(
                updatedProduct.getNewPrice() != null 
                        ? updatedProduct.getNewPrice() 
                        : existing.getNewPrice()
        );

        // Update category if provided
        if (categoryId != null) {
            Category category = categoryRepository.findById(categoryId)
                    .orElseThrow(() -> new RuntimeException("Category not found"));
            existing.setCategory(category);
        }

        // Update image if uploaded
        if (imageFile != null && !imageFile.isEmpty()) {
            String imagePath = saveUploadedFile(imageFile);
            existing.setImagePath(imagePath);
        }

        return productRepository.save(existing);
    }
}
