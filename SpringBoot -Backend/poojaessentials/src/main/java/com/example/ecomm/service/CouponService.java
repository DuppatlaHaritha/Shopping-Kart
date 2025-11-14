package com.example.ecomm.service;

import com.example.ecomm.model.Coupon;
import com.example.ecomm.repository.CouponRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class CouponService {
    @Autowired private CouponRepository couponRepository;

    public Coupon create(Coupon coupon) {
        return couponRepository.save(coupon);
    }

    public Optional<Coupon> findByCode(String code) {
        return couponRepository.findByCode(code);
    }

    public double applyCouponIfValid(Coupon coupon, double amount) {
        if (coupon == null || !coupon.getActive()) return 0.0;
        if (coupon.getExpiresAt() != null && coupon.getExpiresAt().isBefore(LocalDateTime.now())) return 0.0;
        double discount = amount * (coupon.getDiscountPercent() / 100.0);
        if (coupon.getMaxDiscountAmount() != null && discount > coupon.getMaxDiscountAmount()) {
            discount = coupon.getMaxDiscountAmount();
        }
        return discount;
    }
}
