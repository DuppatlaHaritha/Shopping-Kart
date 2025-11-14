package com.example.ecomm.dto;

public class CouponDto {
    private String code;
    private Integer discountPercent;

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public Integer getDiscountPercent() { return discountPercent; }
    public void setDiscountPercent(Integer discountPercent) { this.discountPercent = discountPercent; }
}
