package com.example.ecomm.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "coupons")
public class Coupon {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String code;

    private Integer discountPercent; // e.g., 10 for 10%

    private Double maxDiscountAmount;

    private Boolean active = true;

    private LocalDateTime expiresAt;

    // getters/setters
    public Coupon() {}
    public Long getId(){return id;}
    public void setId(Long id){this.id=id;}
    public String getCode(){return code;}
    public void setCode(String code){this.code=code;}
    public Integer getDiscountPercent(){return discountPercent;}
    public void setDiscountPercent(Integer discountPercent){this.discountPercent=discountPercent;}
    public Double getMaxDiscountAmount(){return maxDiscountAmount;}
    public void setMaxDiscountAmount(Double maxDiscountAmount){this.maxDiscountAmount=maxDiscountAmount;}
    public Boolean getActive(){return active;}
    public void setActive(Boolean active){this.active=active;}
    public LocalDateTime getExpiresAt(){return expiresAt;}
    public void setExpiresAt(LocalDateTime expiresAt){this.expiresAt=expiresAt;}
}
