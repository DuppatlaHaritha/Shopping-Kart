package com.example.ecomm.repository;

import com.example.ecomm.model.ShippingAddress;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ShippingAddressRepository extends JpaRepository<ShippingAddress, Long> {
    ShippingAddress findByOrder_Id(Long orderId);
}
