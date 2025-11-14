/*
package com.example.ecomm.dto;

import java.util.List;

public class OrderRequest {
    public static class Item {
        public Long productId;
        public int quantity;
    }
    private List<Item> items;
    private String couponCode;
    // getters/setters
    public List<Item> getItems(){return items;}
    public void setItems(List<Item> items){this.items=items;}
    public String getCouponCode(){return couponCode;}
    public void setCouponCode(String couponCode){this.couponCode=couponCode;}
}
*/

package com.example.ecomm.dto;

import java.util.List;

public class OrderRequest {

    private List<Item> items;
    private String couponCode;
    private ShippingDto shipping; // ✅ NEW FIELD

    // ✅ Getters & Setters
    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public String getCouponCode() {
        return couponCode;
    }

    public void setCouponCode(String couponCode) {
        this.couponCode = couponCode;
    }

    public ShippingDto getShipping() {
        return shipping;
    }

    public void setShipping(ShippingDto shipping) {
        this.shipping = shipping;
    }

    // ✅ Inner static class for Order Items
    public static class Item {
        private Long productId;
        private Integer quantity;
        private Double price;

        public Long getProductId() {
            return productId;
        }

        public void setProductId(Long productId) {
            this.productId = productId;
        }

        public Integer getQuantity() {
            return quantity;
        }

        public void setQuantity(Integer quantity) {
            this.quantity = quantity;
        }

        public Double getPrice() {
            return price;
        }

        public void setPrice(Double price) {
            this.price = price;
        }
    }

    // ✅ Inner static class for Shipping Address
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

        public String getFullName() {
            return fullName;
        }

        public void setFullName(String fullName) {
            this.fullName = fullName;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String getAddressLine1() {
            return addressLine1;
        }

        public void setAddressLine1(String addressLine1) {
            this.addressLine1 = addressLine1;
        }

        public String getAddressLine2() {
            return addressLine2;
        }

        public void setAddressLine2(String addressLine2) {
            this.addressLine2 = addressLine2;
        }

        public String getCity() {
            return city;
        }

        public void setCity(String city) {
            this.city = city;
        }

        public String getState() {
            return state;
        }

        public void setState(String state) {
            this.state = state;
        }

        public String getPincode() {
            return pincode;
        }

        public void setPincode(String pincode) {
            this.pincode = pincode;
        }

        public String getLandmark() {
            return landmark;
        }

        public void setLandmark(String landmark) {
            this.landmark = landmark;
        }

        public String getCountry() {
            return country;
        }

        public void setCountry(String country) {
            this.country = country;
        }
    }
}
