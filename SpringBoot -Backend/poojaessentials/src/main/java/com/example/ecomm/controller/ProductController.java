

/*import com.example.ecomm.dto.ProductDto;
import com.example.ecomm.model.Product;
import com.example.ecomm.model.Category;
import com.example.ecomm.repository.CategoryRepository;
import com.example.ecomm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class ProductController {
    @Autowired private ProductService productService;
    @Autowired private CategoryRepository categoryRepository;

    @GetMapping("/products")
    public List<Product> listAll() { return productService.listAll(); }

    @PostMapping("/admin/products")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> create(@RequestBody ProductDto dto) {
        Product p = new Product();
        p.setName(dto.getName());
        p.setDescription(dto.getDescription());
        p.setPrice(dto.getPrice());
        p.setImageUrl(dto.getImageUrl());
        Category c = null;
        if (dto.getCategoryId() != null) c = categoryRepository.findById(dto.getCategoryId()).orElse(null);
        if (c != null) p.setCategory(c);
        Product saved = productService.create(p, dto.getCategoryId());
        return ResponseEntity.status(HttpStatus.CREATED).body(saved);
    }

    @PutMapping("/admin/products/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> update(@PathVariable Long id, @RequestBody ProductDto dto) {
        Product p = productService.getById(id).orElseThrow(() -> new RuntimeException("Not found"));
        p.setName(dto.getName());
        p.setDescription(dto.getDescription());
        p.setPrice(dto.getPrice());
        p.setImageUrl(dto.getImageUrl());
        productService.update(id, p);
        return ResponseEntity.ok(p);
    }

    @DeleteMapping("/admin/products/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        productService.delete(id);
        return ResponseEntity.ok("Deleted");
    }
}*/






/*package com.example.ecomm.controller;

import com.example.ecomm.dto.ProductDto;
import com.example.ecomm.dto.CategoryDto;
import com.example.ecomm.dto.CouponDto;
import com.example.ecomm.model.Product;
import com.example.ecomm.model.Category;
import com.example.ecomm.model.Coupon;
import com.example.ecomm.repository.CategoryRepository;
import com.example.ecomm.repository.CouponRepository;
import com.example.ecomm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;*/
/*import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class ProductController {

    @Autowired private ProductService productService;
    @Autowired private CategoryRepository categoryRepository;
    @Autowired private CouponRepository couponRepository;

    // ================= Product Endpoints =================
    @GetMapping("/products")
    public List<Product> listAll() {
        return productService.listAll();
    }

    @PostMapping("/admin/products")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> createProduct(@RequestBody ProductDto dto) {
        Product p = new Product();
        p.setName(dto.getName());
        p.setDescription(dto.getDescription());
        p.setPrice(dto.getPrice());
        p.setImageUrl(dto.getImageUrl());

        Category c = null;
        if (dto.getCategoryId() != null) {
            c = categoryRepository.findById(dto.getCategoryId()).orElse(null);
        }
        if (c != null) p.setCategory(c);

        Product saved = productService.create(p, dto.getCategoryId());
        return ResponseEntity.status(HttpStatus.CREATED).body(saved);
    }

    @PutMapping("/admin/products/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> updateProduct(@PathVariable Long id, @RequestBody ProductDto dto) {
        Product p = productService.getById(id).orElseThrow(() -> new RuntimeException("Product not found"));
        p.setName(dto.getName());
        p.setDescription(dto.getDescription());
        p.setPrice(dto.getPrice());
        p.setImageUrl(dto.getImageUrl());
        productService.update(id, p);
        return ResponseEntity.ok(p);
    }

    @DeleteMapping("/admin/products/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> deleteProduct(@PathVariable Long id) {
        productService.delete(id);
        return ResponseEntity.ok("Deleted");
    }

    // ================= Category Endpoints =================
    @PostMapping("/admin/categories")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> createCategory(@RequestBody CategoryDto dto) {
        Category c = new Category();
        c.setName(dto.getName());
        c.setDescription(dto.getDescription());
        categoryRepository.save(c);
        return ResponseEntity.status(HttpStatus.CREATED).body(c);
    }

    @GetMapping("/categories")
    public List<Category> listCategories() {
        return categoryRepository.findAll();
    }

    // ================= Coupon Endpoints =================
    @PostMapping("/admin/coupons")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> createCoupon(@RequestBody CouponDto dto) {
        Coupon c = new Coupon();
        c.setCode(dto.getCode());
        c.setDiscountPercent(dto.getDiscountPercent());
        couponRepository.save(c);
        return ResponseEntity.status(HttpStatus.CREATED).body(c);
    }

    @GetMapping("/coupons")
    public List<Coupon> listCoupons() {
        return couponRepository.findAll();
    }
}
*/


/*package com.example.ecomm.controller;

import com.example.ecomm.dto.ProductDto;
import com.example.ecomm.model.Product;
import com.example.ecomm.model.Category;
import com.example.ecomm.repository.CategoryRepository;
import com.example.ecomm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
//@CrossOrigin(origins = "*")
public class ProductController {

    @Autowired 
    private ProductService productService;

    @Autowired 
    private CategoryRepository categoryRepository;

    // Get all products
    @GetMapping("/products")
    public List<Product> listAll() { 
        return productService.listAll(); 
    }

    // Create a product
    @PostMapping("/admin/products")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> create(@RequestBody ProductDto dto) {
        Product p = new Product();
        p.setName(dto.getName());
        p.setDescription(dto.getDescription());
        p.setPrice(dto.getPrice());
        p.setImageUrl(dto.getImageUrl());

        Category c = null;
        if (dto.getCategoryId() != null) {
            c = categoryRepository.findById(dto.getCategoryId()).orElse(null);
        }
        if (c != null) p.setCategory(c);

        Product saved = productService.create(p, dto.getCategoryId());
        return ResponseEntity.status(HttpStatus.CREATED).body(saved);
    }

    // Update a product
    @PutMapping("/admin/products/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> update(@PathVariable Long id, @RequestBody ProductDto dto) {
        Product p = productService.getById(id).orElseThrow(() -> new RuntimeException("Product not found"));
        p.setName(dto.getName());
        p.setDescription(dto.getDescription());
        p.setPrice(dto.getPrice());
        p.setImageUrl(dto.getImageUrl());

        productService.update(id, p);
        return ResponseEntity.ok(p);
    }

    // Delete a product
    @DeleteMapping("/admin/products/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        productService.delete(id);
        return ResponseEntity.ok("Deleted");
    }
}*/


/*package com.example.ecomm.controller;

import com.example.ecomm.dto.ProductDto;
import com.example.ecomm.model.Product;
import com.example.ecomm.model.Category;
import com.example.ecomm.repository.CategoryRepository;
import com.example.ecomm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*") // ✅ Allow access from Flutter frontend
public class ProductController {

    @Autowired 
    private ProductService productService;

    @Autowired 
    private CategoryRepository categoryRepository;

    // ✅ Get all products
    @GetMapping("/products")
    public List<Product> listAll() { 
        return productService.listAll(); 
    }

    // ✅ Get a single product by ID
    @GetMapping("/products/{id}")
    public ResponseEntity<?> getProductById(@PathVariable Long id) {
        return productService.getById(id)
                .<ResponseEntity<?>>map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).body("Product not found"));
    }


    // ✅ Get products by Category ID
    @GetMapping("/products/category/{categoryId}")
    public List<Product> getByCategory(@PathVariable Long categoryId) {
        return productService.getByCategoryId(categoryId);
    }

    // ✅ Create a product
    @PostMapping("/admin/products")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> create(@RequestBody ProductDto dto) {
        Product p = new Product();
        p.setName(dto.getName());
        p.setDescription(dto.getDescription());
        p.setPrice(dto.getPrice());
        p.setImageUrl(dto.getImageUrl());

        Category c = null;
        if (dto.getCategoryId() != null) {
            c = categoryRepository.findById(dto.getCategoryId()).orElse(null);
        }
        if (c != null) p.setCategory(c);

        Product saved = productService.create(p, dto.getCategoryId());
        return ResponseEntity.status(HttpStatus.CREATED).body(saved);
    }

    // ✅ Update a product
    @PutMapping("/admin/products/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> update(@PathVariable Long id, @RequestBody ProductDto dto) {
        Product p = productService.getById(id).orElseThrow(() -> new RuntimeException("Product not found"));
        p.setName(dto.getName());
        p.setDescription(dto.getDescription());
        p.setPrice(dto.getPrice());
        p.setImageUrl(dto.getImageUrl());

        productService.update(id, p);
        return ResponseEntity.ok(p);
    }

    // ✅ Delete a product
    @DeleteMapping("/admin/products/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        productService.delete(id);
        return ResponseEntity.ok("Deleted");
    }
}
*/


//23-10-2025
/*package com.example.ecomm.controller;

import com.example.ecomm.model.Product;
import com.example.ecomm.model.Category;
import com.example.ecomm.repository.CategoryRepository;
import com.example.ecomm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*") // Allow frontend access
public class ProductController {

    @Autowired 
    private ProductService productService;

    @Autowired 
    private CategoryRepository categoryRepository;

    // ==================== Get all products ====================
    @GetMapping("/products")
    public List<Product> listAll() { 
        return productService.listAll(); 
    }

    // ==================== Get product by ID ====================
    @GetMapping("/products/{id}")
    public ResponseEntity<?> getProductById(@PathVariable Long id) {
        return productService.getById(id)
                .<ResponseEntity<?>>map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).body("Product not found"));
    }

    // ==================== Get products by Category ID ====================
    @GetMapping("/products/category/{categoryId}")
    public List<Product> getByCategory(@PathVariable Long categoryId) {
        return productService.getByCategoryId(categoryId);
    }

    // ==================== Create Product (with optional image) ====================
    @PostMapping(value = "/admin/products", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> create(
            @RequestParam("name") String name,
            @RequestParam("description") String description,
            @RequestParam("price") double price,
            @RequestParam(value = "categoryId", required = false) Long categoryId,
            @RequestParam(value = "image", required = false) MultipartFile imageFile,
            @RequestParam(value = "newPrice", required = false) Double newPrice

    ) {
        try {
            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setNewPrice(newPrice);


            // Set category if provided
            if (categoryId != null) {
                Category category = categoryRepository.findById(categoryId).orElse(null);
                if (category != null) {
                    product.setCategory(category);
                }
            }

            // Save image if provided
            if (imageFile != null && !imageFile.isEmpty()) {
                String imagePath = productService.saveUploadedFile(imageFile);
                product.setImagePath(imagePath);
            }

            // Save product
            Product saved = productService.save(product); // <-- make sure save(Product) exists in ProductService

            return ResponseEntity.status(HttpStatus.CREATED).body(saved);

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Product creation failed: " + e.getMessage());
        }
    }

    // ==================== Upload Image Only (Optional) ====================
    @PostMapping(value = "/admin/products/upload", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> uploadImage(@RequestParam("image") MultipartFile imageFile) {
        try {
            String savedPath = productService.saveUploadedFile(imageFile);
            return ResponseEntity.ok(Map.of("url", savedPath)); // frontend can use this path
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Image upload failed: " + e.getMessage());
        }
    }

    // ==================== Update Product ====================
    @PutMapping("/admin/products/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> update(@PathVariable Long id, 
                                    @RequestParam("name") String name,
                                    @RequestParam("description") String description,
                                    @RequestParam("price") double price,
                                    @RequestParam(value = "categoryId", required = false) Long categoryId,
                                    @RequestParam(value = "image", required = false) MultipartFile imageFile) {
        try {
            Product existing = productService.getById(id)
                    .orElseThrow(() -> new RuntimeException("Product not found"));

            existing.setName(name);
            existing.setDescription(description);
            existing.setPrice(price);

            if (categoryId != null) {
                Category c = categoryRepository.findById(categoryId).orElse(null);
                if (c != null) existing.setCategory(c);
            }

            // Save new image if uploaded
            if (imageFile != null && !imageFile.isEmpty()) {
                String newImagePath = productService.saveUploadedFile(imageFile);
                existing.setImagePath(newImagePath);
            }

            Product updated = productService.save(existing); // <-- save(Product) must exist
            return ResponseEntity.ok(updated);

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Product update failed: " + e.getMessage());
        }
    }

    // ==================== Delete Product ====================
    @DeleteMapping("/admin/products/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        try {
            productService.delete(id);
            return ResponseEntity.ok("Deleted");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Delete failed: " + e.getMessage());
        }
    }
}
*/

/*package com.example.ecomm.controller;

import com.example.ecomm.model.Product;
import com.example.ecomm.model.Category;
import com.example.ecomm.repository.CategoryRepository;
import com.example.ecomm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*") // Allow frontend access
public class ProductController {

    @Autowired 
    private ProductService productService;

    @Autowired 
    private CategoryRepository categoryRepository;

    // ==================== Get all products ====================
    @GetMapping("/products")
    public List<Product> listAll() { 
        return productService.listAll(); 
    }

    // ==================== Get product by ID ====================
    @GetMapping("/products/{id}")
    public ResponseEntity<?> getProductById(@PathVariable Long id) {
        return productService.getById(id)
                .<ResponseEntity<?>>map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).body("Product not found"));
    }

    // ==================== Get products by Category ID ====================
    @GetMapping("/products/category/{categoryId}")
    public List<Product> getByCategory(@PathVariable Long categoryId) {
        return productService.getByCategoryId(categoryId);
    }

    // ==================== Create Product (with optional image) ====================
    @PostMapping(value = "/admin/products", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> create(
            @RequestParam("name") String name,
            @RequestParam("description") String description,
            @RequestParam("price") double price,
            @RequestParam(value = "categoryId", required = false) Long categoryId,
            @RequestParam(value = "image", required = false) MultipartFile imageFile,
            @RequestParam(value = "newPrice", required = false) Double newPrice
    ) {
        try {
            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setNewPrice(newPrice); // ✅ Added

            // Set category if provided
            if (categoryId != null) {
                Category category = categoryRepository.findById(categoryId).orElse(null);
                if (category != null) {
                    product.setCategory(category);
                }
            }

            // Save image if provided
            if (imageFile != null && !imageFile.isEmpty()) {
                String imagePath = productService.saveUploadedFile(imageFile);
                product.setImagePath(imagePath);
            }

            Product saved = productService.save(product);
            return ResponseEntity.status(HttpStatus.CREATED).body(saved);

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Product creation failed: " + e.getMessage());
        }
    }

    // ==================== Upload Image Only (Optional) ====================
    @PostMapping(value = "/admin/products/upload", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> uploadImage(@RequestParam("image") MultipartFile imageFile) {
        try {
            String savedPath = productService.saveUploadedFile(imageFile);
            return ResponseEntity.ok(Map.of("url", savedPath));
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Image upload failed: " + e.getMessage());
        }
    }

    // ==================== Update Product ====================
    @PutMapping("/admin/products/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> update(@PathVariable Long id, 
                                    @RequestParam("name") String name,
                                    @RequestParam("description") String description,
                                    @RequestParam("price") double price,
                                    @RequestParam(value = "newPrice", required = false) Double newPrice, // ✅ Added
                                    @RequestParam(value = "categoryId", required = false) Long categoryId,
                                    @RequestParam(value = "image", required = false) MultipartFile imageFile) {
        try {
            Product existing = productService.getById(id)
                    .orElseThrow(() -> new RuntimeException("Product not found"));

            existing.setName(name);
            existing.setDescription(description);
            existing.setPrice(price);
            existing.setNewPrice(newPrice); // ✅ Added

            if (categoryId != null) {
                Category c = categoryRepository.findById(categoryId).orElse(null);
                if (c != null) existing.setCategory(c);
            }

            if (imageFile != null && !imageFile.isEmpty()) {
                String newImagePath = productService.saveUploadedFile(imageFile);
                existing.setImagePath(newImagePath);
            }

            Product updated = productService.save(existing);
            return ResponseEntity.ok(updated);

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Product update failed: " + e.getMessage());
        }
    }

    // ==================== Delete Product ====================
    @DeleteMapping("/admin/products/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        try {
            productService.delete(id);
            return ResponseEntity.ok("Deleted");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Delete failed: " + e.getMessage());
        }
    }
}
*/

//05-11-2025
/*
package com.example.ecomm.controller;

import com.example.ecomm.model.Product;
import com.example.ecomm.model.Category;
import com.example.ecomm.repository.CategoryRepository;
import com.example.ecomm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*") // Allow frontend access
public class ProductController {

    @Autowired 
    private ProductService productService;

    @Autowired 
    private CategoryRepository categoryRepository;

    // ==================== Get all products ====================
    @GetMapping("/products")
    public List<Product> listAll() { 
        return productService.listAll(); 
    }

    // ==================== Get product by ID ====================
    @GetMapping("/products/{id}")
    public ResponseEntity<?> getProductById(@PathVariable Long id) {
        return productService.getById(id)
                .<ResponseEntity<?>>map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).body("Product not found"));
    }

    // ==================== Get products by Category ID ====================
    @GetMapping("/products/category/{categoryId}")
    public List<Product> getByCategory(@PathVariable Long categoryId) {
        return productService.getByCategoryId(categoryId);
    }

    // ==================== Create Product (with optional image) ====================
    @PostMapping(value = "/admin/products", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> create(
            @RequestParam("name") String name,
            @RequestParam("description") String description,
            @RequestParam("price") double price,
            @RequestParam(value = "categoryId", required = false) Long categoryId,
            @RequestParam(value = "image", required = false) MultipartFile imageFile,
            @RequestParam(value = "newPrice", required = false) Double newPrice
    ) {
        try {
            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setNewPrice(newPrice); // ✅ Added

            // Set category if provided
            if (categoryId != null) {
                Category category = categoryRepository.findById(categoryId).orElse(null);
                if (category != null) {
                    product.setCategory(category);
                }
            }

            // Save image if provided
            if (imageFile != null && !imageFile.isEmpty()) {
                String imagePath = productService.saveUploadedFile(imageFile);
                product.setImagePath(imagePath);
            }

            Product saved = productService.save(product);
            return ResponseEntity.status(HttpStatus.CREATED).body(saved);

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Product creation failed: " + e.getMessage());
        }
    }

    // ==================== Upload Image Only (Optional) ====================
    @PostMapping(value = "/admin/products/upload", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> uploadImage(@RequestParam("image") MultipartFile imageFile) {
        try {
            String savedPath = productService.saveUploadedFile(imageFile);
            return ResponseEntity.ok(Map.of("url", savedPath));
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Image upload failed: " + e.getMessage());
        }
    }

    // ==================== Update Product ====================
    @PutMapping("/admin/products/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> update(@PathVariable Long id, 
                                    @RequestParam("name") String name,
                                    @RequestParam("description") String description,
                                    @RequestParam("price") double price,
                                    @RequestParam(value = "newPrice", required = false) Double newPrice, // ✅ Added
                                    @RequestParam(value = "categoryId", required = false) Long categoryId,
                                    @RequestParam(value = "image", required = false) MultipartFile imageFile) {
        try {
            Product existing = productService.getById(id)
                    .orElseThrow(() -> new RuntimeException("Product not found"));

            existing.setName(name);
            existing.setDescription(description);
            existing.setPrice(price);
            existing.setNewPrice(newPrice); // ✅ Added

            if (categoryId != null) {
                Category c = categoryRepository.findById(categoryId).orElse(null);
                if (c != null) existing.setCategory(c);
            }

            if (imageFile != null && !imageFile.isEmpty()) {
                String newImagePath = productService.saveUploadedFile(imageFile);
                existing.setImagePath(newImagePath);
            }

            Product updated = productService.save(existing);
            return ResponseEntity.ok(updated);

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Product update failed: " + e.getMessage());
        }
    }

    // ==================== Delete Product ====================
    @DeleteMapping("/admin/products/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        try {
            productService.delete(id);
            return ResponseEntity.ok("Deleted");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Delete failed: " + e.getMessage());
        }
    }
}
*/

package com.example.ecomm.controller;

import com.example.ecomm.model.Product;
import com.example.ecomm.model.Category;
import com.example.ecomm.repository.CategoryRepository;
import com.example.ecomm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*") // Allow frontend access
public class ProductController {

    @Autowired 
    private ProductService productService;

    @Autowired 
    private CategoryRepository categoryRepository;

    // ==================== Get all products ====================
    @GetMapping("/products")
    public List<Product> listAll() { 
        return productService.listAll(); 
    }

    // ==================== Get product by ID ====================
    @GetMapping("/products/{id}")
    public ResponseEntity<?> getProductById(@PathVariable Long id) {
        return productService.getById(id)
                .<ResponseEntity<?>>map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).body("Product not found"));
    }

    // ==================== Get products by Category ID ====================
    @GetMapping("/products/category/{categoryId}")
    public List<Product> getByCategory(@PathVariable Long categoryId) {
        return productService.getByCategoryId(categoryId);
    }

    // ==================== Create Product (with optional image) ====================
    @PostMapping(value = "/admin/products", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> create(
            @RequestParam("name") String name,
            @RequestParam("description") String description,
            @RequestParam("price") double price,
            @RequestParam(value = "categoryId", required = false) Long categoryId,
            @RequestParam(value = "image", required = false) MultipartFile imageFile,
            @RequestParam(value = "newPrice", required = false) Double newPrice
    ) {
        try {
            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setNewPrice(newPrice != null ? newPrice : price); // ✅ Safe default

            // Set category if provided
            if (categoryId != null) {
                Category category = categoryRepository.findById(categoryId).orElse(null);
                if (category != null) {
                    product.setCategory(category);
                }
            }

            // Save image if provided
            if (imageFile != null && !imageFile.isEmpty()) {
                String imagePath = productService.saveUploadedFile(imageFile);
                product.setImagePath(imagePath);
            }

            Product saved = productService.save(product);
            return ResponseEntity.status(HttpStatus.CREATED).body(saved);

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Product creation failed: " + e.getMessage());
        }
    }

    // ==================== Upload Image Only (Optional) ====================
    @PostMapping(value = "/admin/products/upload", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> uploadImage(@RequestParam("image") MultipartFile imageFile) {
        try {
            String savedPath = productService.saveUploadedFile(imageFile);
            return ResponseEntity.ok(Map.of("url", savedPath));
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Image upload failed: " + e.getMessage());
        }
    }

    // ==================== Update Product (JSON body version) ====================
    @PutMapping("/admin/products/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> update(@PathVariable Long id, @RequestBody Product updatedProduct) {
        try {
            Product existing = productService.getById(id)
                    .orElseThrow(() -> new RuntimeException("Product not found"));

            // Update fields
            existing.setName(updatedProduct.getName());
            existing.setDescription(updatedProduct.getDescription());
            existing.setPrice(updatedProduct.getPrice());
            existing.setNewPrice(updatedProduct.getNewPrice() != null 
                                 ? updatedProduct.getNewPrice() 
                                 : existing.getNewPrice());

            // Update category if provided
            if (updatedProduct.getCategory() != null && updatedProduct.getCategory().getId() != null) {
                Category category = categoryRepository.findById(updatedProduct.getCategory().getId()).orElse(null);
                if (category != null) {
                    existing.setCategory(category);
                }
            }

            // Keep existing imagePath (no image upload here)
            existing.setImagePath(existing.getImagePath());

            Product updated = productService.save(existing);
            return ResponseEntity.ok(updated);

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Product update failed: " + e.getMessage());
        }
    }

    // ==================== Delete Product ====================
    @DeleteMapping("/admin/products/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        try {
            productService.delete(id);
            return ResponseEntity.ok("Deleted successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Delete failed: " + e.getMessage());
        }
    }
}
