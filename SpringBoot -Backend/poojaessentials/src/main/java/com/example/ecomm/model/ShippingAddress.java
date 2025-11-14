package com.example.ecomm.model;

import jakarta.persistence.*;

@Entity
@Table(name = "shipping_address_tbl")
public class ShippingAddress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String fullName;
    private String phone;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;
    private String pincode;
    private String landmark;
    private String country; // ✅ Added new field

    // Owning side of one-to-one relationship to OrderTbl
    @OneToOne
    @JoinColumn(name = "order_id", unique = true)
    private OrderTbl order;

    public ShippingAddress() {}

    // Getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddressLine1() { return addressLine1; }
    public void setAddressLine1(String addressLine1) { this.addressLine1 = addressLine1; }

    public String getAddressLine2() { return addressLine2; }
    public void setAddressLine2(String addressLine2) { this.addressLine2 = addressLine2; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getState() { return state; }
    public void setState(String state) { this.state = state; }

    public String getPincode() { return pincode; }
    public void setPincode(String pincode) { this.pincode = pincode; }

    public String getLandmark() { return landmark; }
    public void setLandmark(String landmark) { this.landmark = landmark; }

    public String getCountry() { return country; }  // ✅ Getter
    public void setCountry(String country) { this.country = country; }  // ✅ Setter

    public OrderTbl getOrder() { return order; }
    public void setOrder(OrderTbl order) { this.order = order; }
}
