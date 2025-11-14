package com.example.ecomm.controller;

import com.example.ecomm.model.Category;
import com.example.ecomm.model.Coupon;
import com.example.ecomm.repository.CategoryRepository;
import com.example.ecomm.service.CouponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/admin")
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
@CrossOrigin(origins = "*")
public class AdminController {
    @Autowired private CategoryRepository categoryRepository;
    @Autowired private CouponService couponService;

    @PostMapping("/categories")
    public ResponseEntity<?> createCategory(@RequestBody Category c) {
        Category saved = categoryRepository.save(c);
        return ResponseEntity.status(HttpStatus.CREATED).body(saved);
    }

    @GetMapping("/categories")
    public List<Category> listCategories() {
        return categoryRepository.findAll();
    }

    @PostMapping("/coupons")
    public ResponseEntity<?> createCoupon(@RequestBody Coupon c) {
        Coupon saved = couponService.create(c);
        return ResponseEntity.status(HttpStatus.CREATED).body(saved);
    }
}
