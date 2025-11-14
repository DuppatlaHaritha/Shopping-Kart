/*
package com.example.ecomm.dto;

import java.time.LocalDateTime;
import java.util.List;

public class OrderDto {

    private Long id;
    private LocalDateTime createdAt;
    private Double totalAmount;
    private Double finalAmount;
    private String status;
    private List<OrderItemDto> items;

    // ✅ No-arg constructor (required for new OrderDto() and for frameworks)
    public OrderDto() {}

    // ✅ Parameterized constructor (optional convenience)
    public OrderDto(Long id, LocalDateTime createdAt, Double totalAmount, Double finalAmount, String status, List<OrderItemDto> items) {
        this.id = id;
        this.createdAt = createdAt;
        this.totalAmount = totalAmount;
        this.finalAmount = finalAmount;
        this.status = status;
        this.items = items;
    }

    // Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Double getFinalAmount() {
        return finalAmount;
    }

    public void setFinalAmount(Double finalAmount) {
        this.finalAmount = finalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<OrderItemDto> getItems() {
        return items;
    }

    public void setItems(List<OrderItemDto> items) {
        this.items = items;
    }
}
*/

package com.example.ecomm.dto;

import com.example.ecomm.model.OrderTbl;
import com.example.ecomm.model.OrderItem;
import com.example.ecomm.model.ShippingAddress;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

public class OrderDto {

    private Long id;
    private LocalDateTime createdAt;
    private Double totalAmount;
    private Double finalAmount;
    private String status;
    private List<OrderItemDto> items;

    // ✅ New: Include shipping details
    private ShippingDto shipping;

    // ✅ No-arg constructor (required for frameworks)
    public OrderDto() {}

    // ✅ Parameterized constructor (kept from your original)
    public OrderDto(Long id, LocalDateTime createdAt, Double totalAmount, Double finalAmount, String status, List<OrderItemDto> items) {
        this.id = id;
        this.createdAt = createdAt;
        this.totalAmount = totalAmount;
        this.finalAmount = finalAmount;
        this.status = status;
        this.items = items;
    }

    // ✅ NEW: Constructor that maps directly from OrderTbl entity
    public OrderDto(OrderTbl order) {
        this.id = order.getId();
        this.createdAt = order.getCreatedAt();
        this.totalAmount = order.getTotalAmount();
        this.finalAmount = order.getFinalAmount();
        this.status = order.getStatus();

        if (order.getItems() != null) {
            this.items = order.getItems().stream()
                    .map(OrderItemDto::new)
                    .collect(Collectors.toList());
        }

        if (order.getShippingAddress() != null) {
            this.shipping = new ShippingDto(order.getShippingAddress());
        }
    }

    // ✅ Inner DTO class for items
    public static class OrderItemDto {
        private Long productId;
        private String productName;
        private Integer quantity;
        private Double price;

        public OrderItemDto() {}

        // ✅ Converts OrderItem entity to DTO
        public OrderItemDto(OrderItem item) {
            this.productId = item.getProduct().getId();
            this.productName = item.getProduct().getName();
            this.quantity = item.getQuantity();
            this.price = item.getProduct().getPrice();
        }

        // Getters and setters
        public Long getProductId() { return productId; }
        public void setProductId(Long productId) { this.productId = productId; }

        public String getProductName() { return productName; }
        public void setProductName(String productName) { this.productName = productName; }

        public Integer getQuantity() { return quantity; }
        public void setQuantity(Integer quantity) { this.quantity = quantity; }

        public Double getPrice() { return price; }
        public void setPrice(Double price) { this.price = price; }
    }

    // ✅ Inner DTO class for shipping address
    public static class ShippingDto {
        private String fullName;
        private String phone;
        private String addressLine1;
        private String addressLine2;
        private String city;
        private String state;
        private String pincode;
        private String landmark;
        private String country;

        public ShippingDto() {}

        // ✅ Converts ShippingAddress entity to DTO
        public ShippingDto(ShippingAddress addr) {
            this.fullName = addr.getFullName();
            this.phone = addr.getPhone();
            this.addressLine1 = addr.getAddressLine1();
            this.addressLine2 = addr.getAddressLine2();
            this.city = addr.getCity();
            this.state = addr.getState();
            this.pincode = addr.getPincode();
            this.landmark = addr.getLandmark();
            this.country = addr.getCountry();
        }

        // Getters and setters
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

        public String getCountry() { return country; }
        public void setCountry(String country) { this.country = country; }
    }

    // ✅ Getters & Setters for OrderDto fields
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public Double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(Double totalAmount) { this.totalAmount = totalAmount; }

    public Double getFinalAmount() { return finalAmount; }
    public void setFinalAmount(Double finalAmount) { this.finalAmount = finalAmount; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public List<OrderItemDto> getItems() { return items; }
    public void setItems(List<OrderItemDto> items) { this.items = items; }

    public ShippingDto getShipping() { return shipping; }
    public void setShipping(ShippingDto shipping) { this.shipping = shipping; }
}
