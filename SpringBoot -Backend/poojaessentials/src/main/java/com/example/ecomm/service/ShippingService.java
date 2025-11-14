package com.example.ecomm.service;

import com.example.ecomm.model.ShippingAddress;
import com.example.ecomm.repository.ShippingAddressRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ShippingService {

    private final ShippingAddressRepository shippingRepo;

    public ShippingService(ShippingAddressRepository shippingRepo) {
        this.shippingRepo = shippingRepo;
    }

    public ShippingAddress save(ShippingAddress address) {
        return shippingRepo.save(address);
    }

    public ShippingAddress findByOrderId(Long orderId) {
        return shippingRepo.findByOrder_Id(orderId);
    }

    @Transactional
    public void deleteById(Long id) {
        shippingRepo.deleteById(id);
    }
}
