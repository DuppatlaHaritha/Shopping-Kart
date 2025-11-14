/*
package com.example.ecomm.service;

import com.example.ecomm.model.*;
import com.example.ecomm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class OrderService {
    @Autowired private OrderRepository orderRepository;
    @Autowired private OrderItemRepository itemRepository;
    @Autowired private ProductRepository productRepository;
    @Autowired private CouponService couponService;
    @Autowired private UserRepository userRepository;

    @Transactional
    public OrderTbl createOrder(String username, List<OrderItem> items, String couponCode) {
        User u = userRepository.findByUsername(username).orElseThrow(() -> new RuntimeException("User not found"));
        double total = 0.0;
        for (OrderItem it : items) {
            Product p = productRepository.findById(it.getProduct().getId()).orElseThrow(() -> new RuntimeException("Product not found"));
            it.setPrice(p.getPrice());
            it.setProduct(p);
            total += p.getPrice() * it.getQuantity();
        }

        Coupon coupon = null;
        double discount = 0.0;
        if (couponCode != null && !couponCode.isBlank()) {
            Optional<Coupon> copt = couponService.findByCode(couponCode);
            if (copt.isPresent()) {
                coupon = copt.get();
                discount = couponService.applyCouponIfValid(coupon, total);
            }
        }

        OrderTbl order = new OrderTbl();
        order.setUser(u);
        order.setTotalAmount(total);
        order.setDiscountAmount(discount);
        order.setFinalAmount(total - discount);
        order.setCouponCode(coupon != null ? coupon.getCode() : null);
        order.setStatus("PLACED");

        order = orderRepository.save(order);
        for (OrderItem it : items) {
            it.setOrder(order);
            itemRepository.save(it);
        }
        order.setItems(items);
        return order;
    }

    public List<OrderTbl> findByUser(String username) {
        User u = userRepository.findByUsername(username).orElseThrow(() -> new RuntimeException("User not found"));
        return orderRepository.findByUserId(u.getId());
    }

    public List<OrderTbl> findAllOrders() { return orderRepository.findAll(); }
}
*/
/*
package com.example.ecomm.service;

import com.example.ecomm.model.*;
import com.example.ecomm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class OrderService {
    @Autowired private OrderRepository orderRepository;
    @Autowired private OrderItemRepository itemRepository;
    @Autowired private ProductRepository productRepository;
    @Autowired private CouponService couponService;
    @Autowired private UserRepository userRepository;

    @Transactional
    public OrderTbl createOrder(String username, List<OrderItem> items, String couponCode) {
        User u = userRepository.findByUsername(username).orElseThrow(() -> new RuntimeException("User not found"));
        double total = 0.0;
        for (OrderItem it : items) {
            Product p = productRepository.findById(it.getProduct().getId()).orElseThrow(() -> new RuntimeException("Product not found"));
            it.setPrice(p.getPrice());
            it.setProduct(p);
            total += p.getPrice() * it.getQuantity();
        }

        Coupon coupon = null;
        double discount = 0.0;
        if (couponCode != null && !couponCode.isBlank()) {
            Optional<Coupon> copt = couponService.findByCode(couponCode);
            if (copt.isPresent()) {
                coupon = copt.get();
                discount = couponService.applyCouponIfValid(coupon, total);
            }
        }

        OrderTbl order = new OrderTbl();
        order.setUser(u);
        order.setTotalAmount(total);
        order.setDiscountAmount(discount);
        order.setFinalAmount(total - discount);
        order.setCouponCode(coupon != null ? coupon.getCode() : null);
        order.setStatus("PLACED");

        order = orderRepository.save(order);
        for (OrderItem it : items) {
            it.setOrder(order);
            itemRepository.save(it);
        }
        order.setItems(items);
        return order;
    }

    public List<OrderTbl> findByUser(String username) {
        List<OrderTbl> orders = orderRepository.findByUser_Username(username);
        orders.forEach(order -> order.getItems().forEach(item -> {
            item.getProduct().getName(); // Force load product name if lazy
        }));
        return orders;
    }

    public List<OrderTbl> findAllOrders() { 
        return orderRepository.findAll(); 
    }
}
*/
/*
package com.example.ecomm.service;

import com.example.ecomm.dto.OrderDto;
import com.example.ecomm.dto.OrderItemDto;
import com.example.ecomm.model.*;
import com.example.ecomm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class OrderService {

    @Autowired private OrderRepository orderRepository;
    @Autowired private OrderItemRepository itemRepository;
    @Autowired private ProductRepository productRepository;
    @Autowired private CouponService couponService;
    @Autowired private UserRepository userRepository;

    @Transactional
    public OrderTbl createOrder(String username, List<OrderItem> items, String couponCode) {
        User u = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found"));

        double total = 0.0;
        for (OrderItem it : items) {
            Product p = productRepository.findById(it.getProduct().getId())
                    .orElseThrow(() -> new RuntimeException("Product not found"));
            it.setPrice(p.getPrice());
            it.setProduct(p);
            total += p.getPrice() * it.getQuantity();
        }

        Coupon coupon = null;
        double discount = 0.0;
        if (couponCode != null && !couponCode.isBlank()) {
            Optional<Coupon> copt = couponService.findByCode(couponCode);
            if (copt.isPresent()) {
                coupon = copt.get();
                discount = couponService.applyCouponIfValid(coupon, total);
            }
        }

        OrderTbl order = new OrderTbl();
        order.setUser(u);
        order.setTotalAmount(total);
        order.setDiscountAmount(discount);
        order.setFinalAmount(total - discount);
        order.setCouponCode(coupon != null ? coupon.getCode() : null);
        order.setStatus("PAYMENT DONE");

        order = orderRepository.save(order);
        for (OrderItem it : items) {
            it.setOrder(order);
            itemRepository.save(it);
        }
        order.setItems(items);
        return order;
    }

    
    @Transactional(readOnly = true)
    public List<OrderTbl> findByUser(String username) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found"));
        List<OrderTbl> orders = orderRepository.findByUserIdWithItemsAndProducts(user.getId());
        return orders;
    }

    
    @Transactional(readOnly = true)
    public List<OrderDto> getOrdersForUser(Long userId) {
        List<OrderTbl> orders = orderRepository.findByUserIdWithItemsAndProducts(userId);
        return orders.stream().map(this::toDto).collect(Collectors.toList());
    }

    private OrderDto toDto(OrderTbl o) {
        OrderDto dto = new OrderDto();
        dto.setId(o.getId());
        dto.setCreatedAt(o.getCreatedAt());
        dto.setTotalAmount(o.getTotalAmount());
        dto.setFinalAmount(o.getFinalAmount());
        dto.setStatus(o.getStatus());

        List<OrderItemDto> items = o.getItems().stream().map(this::itemToDto).collect(Collectors.toList());
        dto.setItems(items);
        return dto;
    }

    private OrderItemDto itemToDto(OrderItem item) {
        String name = item.getProductName();
        if ((name == null || name.isBlank()) && item.getProduct() != null) {
            name = item.getProduct().getName();
        }
        return new OrderItemDto(
            item.getId(),
            item.getProduct() != null ? item.getProduct().getId() : null,
            name,
            item.getQuantity(),
            item.getPrice()
        );
    }

    public List<OrderTbl> findAllOrders() {
        return orderRepository.findAll();
    }

    
    public List<OrderTbl> findByStatus(String status) {
        return orderRepository.findByStatus(status);
    }
}
*/





/*
package com.example.ecomm.service;

import com.example.ecomm.dto.OrderDto;
import com.example.ecomm.dto.OrderRequest;
import com.example.ecomm.model.*;
import com.example.ecomm.repository.OrderRepository;
import com.example.ecomm.repository.ProductRepository;
import com.example.ecomm.repository.ShippingAddressRepository;
import com.example.ecomm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;

@Service
public class OrderService {

    @Autowired private OrderRepository orderRepository;
    @Autowired private UserRepository userRepository;
    @Autowired private ProductRepository productRepository;
    @Autowired private ShippingAddressRepository shippingAddressRepository;

    // ✅ Create new order (calculates total, discount, final)
    @Transactional
    public OrderTbl createOrder(String username, List<OrderItem> items, String couponCode) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // 🧮 Calculate total amount
        double totalAmount = items.stream()
                .mapToDouble(i -> i.getQuantity() * i.getProduct().getPrice())
                .sum();

        // 💸 Apply discount if coupon code exists (example 10%)
        double discountAmount = 0.0;
        if (couponCode != null && !couponCode.trim().isEmpty()) {
            discountAmount = totalAmount * 0.1; // 10% off for valid code
        }

        // 🧾 Calculate final amount
        double finalAmount = totalAmount - discountAmount;

        // 🏷️ Create and populate order
        OrderTbl order = new OrderTbl();
        order.setUser(user);
        order.setItems(items);
        order.setStatus("PAYMENT DONE");
        order.setCreatedAt(LocalDateTime.now()); // if you use LocalDateTime in entity
        order.setCouponCode(couponCode);
        order.setTotalAmount(totalAmount);
        order.setDiscountAmount(discountAmount);
        order.setFinalAmount(finalAmount);

        // Link each item to the order
        items.forEach(i -> i.setOrder(order));

        // Save and return
        return orderRepository.save(order);
    }

    // ✅ Create order with shipping details
    @Transactional
    public OrderTbl createOrderWithShipping(String username, List<OrderItem> items, String couponCode, OrderRequest.ShippingDto shippingDto) {
        // First create main order
        OrderTbl order = createOrder(username, items, couponCode);

        // Save shipping info if provided
        if (shippingDto != null) {
            ShippingAddress addr = new ShippingAddress();
            addr.setFullName(shippingDto.getFullName());
            addr.setPhone(shippingDto.getPhone());
            addr.setAddressLine1(shippingDto.getAddressLine1());
            addr.setAddressLine2(shippingDto.getAddressLine2());
            addr.setCity(shippingDto.getCity());
            addr.setState(shippingDto.getState());
            addr.setPincode(shippingDto.getPincode());
            addr.setLandmark(shippingDto.getLandmark());
            addr.setCountry(shippingDto.getCountry());
            addr.setOrder(order);

            // Save shipping address
            shippingAddressRepository.save(addr);

            // Link address back to order
            order.setShippingAddress(addr);
            orderRepository.save(order);
        }

        return order;
    }

    // ✅ Find orders by username (loads product names)
    public List<OrderTbl> findByUser(String username) {
        List<OrderTbl> orders = orderRepository.findByUser_Username(username);
        orders.forEach(order -> order.getItems().forEach(item -> {
            item.getProduct().getName(); // force load product name
        }));
        return orders;
    }

    // ✅ Get all orders
    public List<OrderTbl> findAllOrders() {
        return orderRepository.findAll();
    }

    // ✅ Get orders by status
    public List<OrderTbl> findByStatus(String status) {
        return orderRepository.findByStatus(status);
    }

    // ✅ Get orders for specific user ID as DTO
    public List<OrderDto> getOrdersForUser(Long userId) {
        List<OrderTbl> orders = orderRepository.findByUser_Id(userId);
        List<OrderDto> dtos = new ArrayList<>();
        for (OrderTbl order : orders) {
            OrderDto dto = new OrderDto(order);
            dtos.add(dto);
        }
        return dtos;
    }
}
*/




/*
package com.example.ecomm.service;

import com.example.ecomm.model.*;
import com.example.ecomm.dto.OrderRequest;
import com.example.ecomm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;

@Service
public class OrderService {

    @Autowired private OrderRepository orderRepository;
    @Autowired private UserRepository userRepository;
    @Autowired private ProductRepository productRepository;
    @Autowired private ShippingAddressRepository shippingAddressRepository;

    /** ✅ Create new order */
/*
    @Transactional
    public OrderTbl createOrder(String username, List<OrderItem> items, String couponCode) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("⚠️ User not found for username: " + username));

        double totalAmount = items.stream()
                .mapToDouble(i -> i.getQuantity() * i.getProduct().getPrice())
                .sum();

        double discountAmount = (couponCode != null && !couponCode.trim().isEmpty())
                ? totalAmount * 0.1
                : 0.0;

        double finalAmount = totalAmount - discountAmount;

        OrderTbl order = new OrderTbl();
        order.setUser(user);
        order.setItems(items);
        order.setStatus("PAYMENT DONE");
        order.setCreatedAt(LocalDateTime.now());
        order.setCouponCode(couponCode);
        order.setTotalAmount(totalAmount);
        order.setDiscountAmount(discountAmount);
        order.setFinalAmount(finalAmount);

        items.forEach(i -> i.setOrder(order));

        return orderRepository.save(order);
    }

    /** ✅ Create order with shipping info */
/*
    @Transactional
    public OrderTbl createOrderWithShipping(String username, List<OrderItem> items, String couponCode, OrderRequest.ShippingDto shippingDto) {
        OrderTbl order = createOrder(username, items, couponCode);

        if (shippingDto != null) {
            ShippingAddress addr = new ShippingAddress();
            addr.setFullName(shippingDto.getFullName());
            addr.setPhone(shippingDto.getPhone());
            addr.setAddressLine1(shippingDto.getAddressLine1());
            addr.setAddressLine2(shippingDto.getAddressLine2());
            addr.setCity(shippingDto.getCity());
            addr.setState(shippingDto.getState());
            addr.setPincode(shippingDto.getPincode());
            addr.setLandmark(shippingDto.getLandmark());
            addr.setCountry(shippingDto.getCountry());
            addr.setOrder(order);

            shippingAddressRepository.save(addr);
            order.setShippingAddress(addr);
            orderRepository.save(order);
        }

        return order;
    }

    /** ✅ Get all orders (Admin / Sales) */
/*
    public List<OrderTbl> getAllOrders() {
        List<OrderTbl> orders = orderRepository.findAll();
        orders.forEach(order -> order.getItems().forEach(item -> item.getProduct().getName())); // lazy-load products
        return orders;
    }

    /** ✅ Get user-specific orders by username */
/*
    public List<OrderTbl> getOrdersByUsername(String username) {
        List<OrderTbl> orders = orderRepository.findByUser_Username(username);
        if (orders == null || orders.isEmpty()) {
            System.out.println("⚠️ No orders found for username: " + username);
            return List.of();
        }
        orders.forEach(order -> order.getItems().forEach(item -> item.getProduct().getName()));
        return orders;
    }

    /** ✅ Get orders by status */
/*
    public List<OrderTbl> findByStatus(String status) {
        return orderRepository.findByStatus(status);
    }

    /** ✅ Fetch orders for a specific userId (Admin) */
/*
    public List<com.example.ecomm.dto.OrderDto> getOrdersForUser(Long userId) {
        List<OrderTbl> orders = orderRepository.findByUser_Id(userId);
        List<com.example.ecomm.dto.OrderDto> dtos = new ArrayList<>();
        for (OrderTbl order : orders) {
            dtos.add(new com.example.ecomm.dto.OrderDto(order));
        }
        return dtos;
    }
}
*/




/*
package com.example.ecomm.service;

import com.example.ecomm.model.*;
import com.example.ecomm.dto.OrderRequest;
import com.example.ecomm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;

@Service
public class OrderService {

    @Autowired private OrderRepository orderRepository;
    @Autowired private UserRepository userRepository;
    @Autowired private ProductRepository productRepository;
    @Autowired private ShippingAddressRepository shippingAddressRepository;

    /** ✅ Create new order */
/*
    @Transactional
    public OrderTbl createOrder(String username, List<OrderItem> items, String couponCode) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("⚠️ User not found for username: " + username));

        double totalAmount = items.stream()
                .mapToDouble(i -> i.getQuantity() * i.getProduct().getPrice())
                .sum();

        double discountAmount = (couponCode != null && !couponCode.trim().isEmpty())
                ? totalAmount * 0.1
                : 0.0;

        double finalAmount = totalAmount - discountAmount;

        OrderTbl order = new OrderTbl();
        order.setUser(user);
        order.setItems(items);
        order.setStatus("PAYMENT DONE");
        order.setCreatedAt(LocalDateTime.now());
        order.setCouponCode(couponCode);
        order.setTotalAmount(totalAmount);
        order.setDiscountAmount(discountAmount);
        order.setFinalAmount(finalAmount);

        items.forEach(i -> i.setOrder(order));

        return orderRepository.save(order);
    }

    /** ✅ Create order with shipping info */
/*
    @Transactional
    public OrderTbl createOrderWithShipping(String username, List<OrderItem> items, String couponCode, OrderRequest.ShippingDto shippingDto) {
        OrderTbl order = createOrder(username, items, couponCode);

        if (shippingDto != null) {
            ShippingAddress addr = new ShippingAddress();
            addr.setFullName(shippingDto.getFullName());
            addr.setPhone(shippingDto.getPhone());
            addr.setAddressLine1(shippingDto.getAddressLine1());
            addr.setAddressLine2(shippingDto.getAddressLine2());
            addr.setCity(shippingDto.getCity());
            addr.setState(shippingDto.getState());
            addr.setPincode(shippingDto.getPincode());
            addr.setLandmark(shippingDto.getLandmark());
            addr.setCountry(shippingDto.getCountry());
            addr.setOrder(order);

            shippingAddressRepository.save(addr);
            order.setShippingAddress(addr);
            orderRepository.save(order);
        }

        return order;
    }

    /** ✅ Get all orders (Admin / Sales) */
/*
    public List<OrderTbl> getAllOrders() {
        List<OrderTbl> orders = orderRepository.findAll();

        // 🟢 Force lazy-loaded relationships to initialize
        orders.forEach(order -> {
            if (order.getItems() != null) {
                order.getItems().forEach(item -> {
                    if (item.getProduct() != null) {
                        item.getProduct().getName(); // triggers lazy loading
                    }
                });
            }
        });

        return orders;
    }

    /** ✅ Get user-specific orders by username */
/*
    public List<OrderTbl> getOrdersByUsername(String username) {
        List<OrderTbl> orders = orderRepository.findByUser_Username(username);
        if (orders == null || orders.isEmpty()) {
            System.out.println("⚠️ No orders found for username: " + username);
            return List.of();
        }

        // 🟢 Ensure all products are loaded properly
        orders.forEach(order -> order.getItems().forEach(item -> {
            if (item.getProduct() != null) item.getProduct().getName();
        }));

        return orders;
    }

    /** ✅ Get orders by status */
/*
    public List<OrderTbl> findByStatus(String status) {
        return orderRepository.findByStatus(status);
    }

    /** ✅ Fetch orders for a specific userId (Admin) */
/*
    public List<com.example.ecomm.dto.OrderDto> getOrdersForUser(Long userId) {
        List<OrderTbl> orders = orderRepository.findByUser_Id(userId);
        List<com.example.ecomm.dto.OrderDto> dtos = new ArrayList<>();
        for (OrderTbl order : orders) {
            dtos.add(new com.example.ecomm.dto.OrderDto(order));
        }
        return dtos;
    }

    /** ✅ New unified method: Fetch orders based on logged-in role */
/*
    public List<OrderTbl> getOrdersBasedOnRole(String username, String role) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found: " + username));

        System.out.println("🔍 Fetching orders for: " + username + " | Role: " + role);

        if (role.equals("ROLE_USER")) {
            // ✅ Regular user → only their own orders
            return getOrdersByUsername(username);

        } else if (role.equals("ROLE_ADMIN")) {
            // ✅ Admin → only their own orders
            List<OrderTbl> adminOrders = orderRepository.findByUser(user);
            adminOrders.forEach(order -> order.getItems().forEach(item -> {
                if (item.getProduct() != null) item.getProduct().getName();
            }));
            return adminOrders;

        } else if (role.equals("ROLE_SALES")) {
            // ✅ Sales → ALL orders (Admin + User + Sales)
            List<OrderTbl> allOrders = orderRepository.findAll();

            // 🟢 Force-load relationships to make sure all data is included
            allOrders.forEach(order -> {
                if (order.getItems() != null) {
                    order.getItems().forEach(item -> {
                        if (item.getProduct() != null) item.getProduct().getName();
                    });
                }
            });

            System.out.println("✅ ROLE_SALES fetched total orders: " + allOrders.size());
            return allOrders;

        } else {
            return List.of(); // empty list if no valid role
        }
    }
}
*/



/*
package com.example.ecomm.service;

import com.example.ecomm.model.*;
import com.example.ecomm.dto.OrderRequest;
import com.example.ecomm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;

@Service
public class OrderService {

    @Autowired private OrderRepository orderRepository;
    @Autowired private UserRepository userRepository;
    @Autowired private ProductRepository productRepository;
    @Autowired private ShippingAddressRepository shippingAddressRepository;

    /** ✅ Create new order */
/*
    @Transactional
    public OrderTbl createOrder(String username, List<OrderItem> items, String couponCode) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("⚠️ User not found for username: " + username));

        double totalAmount = items.stream()
                .mapToDouble(i -> i.getQuantity() * i.getProduct().getPrice())
                .sum();

        double discountAmount = (couponCode != null && !couponCode.trim().isEmpty())
                ? totalAmount * 0.1
                : 0.0;

        double finalAmount = totalAmount - discountAmount;

        OrderTbl order = new OrderTbl();
        order.setUser(user);
        order.setItems(items);
        order.setStatus("PAYMENT DONE");
        order.setCreatedAt(LocalDateTime.now());
        order.setCouponCode(couponCode);
        order.setTotalAmount(totalAmount);
        order.setDiscountAmount(discountAmount);
        order.setFinalAmount(finalAmount);

        items.forEach(i -> i.setOrder(order));

        return orderRepository.save(order);
    }

    /** ✅ Create order with shipping info */
/*
    @Transactional
    public OrderTbl createOrderWithShipping(String username, List<OrderItem> items, String couponCode, OrderRequest.ShippingDto shippingDto) {
        OrderTbl order = createOrder(username, items, couponCode);

        if (shippingDto != null) {
            ShippingAddress addr = new ShippingAddress();
            addr.setFullName(shippingDto.getFullName());
            addr.setPhone(shippingDto.getPhone());
            addr.setAddressLine1(shippingDto.getAddressLine1());
            addr.setAddressLine2(shippingDto.getAddressLine2());
            addr.setCity(shippingDto.getCity());
            addr.setState(shippingDto.getState());
            addr.setPincode(shippingDto.getPincode());
            addr.setLandmark(shippingDto.getLandmark());
            addr.setCountry(shippingDto.getCountry());
            addr.setOrder(order);

            shippingAddressRepository.save(addr);
            order.setShippingAddress(addr);
            orderRepository.save(order);
        }

        return order;
    }

    /** ✅ Get all orders (Admin / Sales) */
/*
    public List<OrderTbl> getAllOrders() {
        // Explicit fetch query to ensure full results
        List<OrderTbl> orders = orderRepository.findAll();

        orders.forEach(order -> {
            if (order.getItems() != null) {
                order.getItems().forEach(item -> {
                    if (item.getProduct() != null) {
                        item.getProduct().getName(); // triggers lazy load
                    }
                });
            }
        });
        return orders;
    }

    /** ✅ Get user-specific orders by username */
/*
    public List<OrderTbl> getOrdersByUsername(String username) {
        List<OrderTbl> orders = orderRepository.findByUser_Username(username);
        if (orders == null || orders.isEmpty()) {
            System.out.println("⚠️ No orders found for username: " + username);
            return List.of();
        }
        orders.forEach(order -> order.getItems().forEach(item -> {
            if (item.getProduct() != null) item.getProduct().getName();
        }));
        return orders;
    }

    /** ✅ Get orders by status */
/*
    public List<OrderTbl> findByStatus(String status) {
        return orderRepository.findByStatus(status);
    }

    /** ✅ Fetch orders for a specific userId (Admin) */
/*
    public List<com.example.ecomm.dto.OrderDto> getOrdersForUser(Long userId) {
        List<OrderTbl> orders = orderRepository.findByUser_Id(userId);
        List<com.example.ecomm.dto.OrderDto> dtos = new ArrayList<>();
        for (OrderTbl order : orders) {
            dtos.add(new com.example.ecomm.dto.OrderDto(order));
        }
        return dtos;
    }

    /** ✅ Unified: Fetch orders based on role */
/*
    public List<OrderTbl> getOrdersBasedOnRole(String username, String role) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found: " + username));

        System.out.println("🔍 Fetching orders for: " + username + " | Role: " + role);

        if (role.equals("ROLE_USER")) {
            // ✅ Regular user → only their own orders
            return getOrdersByUsername(username);

        } else if (role.equals("ROLE_ADMIN")) {
            // ✅ Admin → only their own orders
            List<OrderTbl> adminOrders = orderRepository.findByUser(user);
            adminOrders.forEach(order -> order.getItems().forEach(item -> {
                if (item.getProduct() != null) item.getProduct().getName();
            }));
            return adminOrders;

        } else if (role.equals("ROLE_SALES")) {
            // ✅ Sales → ALL orders (irrespective of who placed them)
            List<OrderTbl> allOrders = orderRepository.findAllOrdersWithItemsAndProducts();

            allOrders.forEach(order -> {
                if (order.getItems() != null) {
                    order.getItems().forEach(item -> {
                        if (item.getProduct() != null) item.getProduct().getName();
                    });
                }
            });

            System.out.println("✅ ROLE_SALES fetched total orders: " + allOrders.size());
            return allOrders;

        } else {
            return List.of();
        }
    }
}
*/



/*
package com.example.ecomm.service;

import com.example.ecomm.model.*;
import com.example.ecomm.dto.OrderRequest;
import com.example.ecomm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;

@Service
public class OrderService {

    @Autowired private OrderRepository orderRepository;
    @Autowired private UserRepository userRepository;
    @Autowired private ProductRepository productRepository;
    @Autowired private ShippingAddressRepository shippingAddressRepository;

    
    @Transactional
    public OrderTbl createOrder(String username, List<OrderItem> items, String couponCode) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("⚠️ User not found for username: " + username));

        double totalAmount = items.stream()
                .mapToDouble(i -> i.getQuantity() * i.getProduct().getPrice())
                .sum();

        double discountAmount = (couponCode != null && !couponCode.trim().isEmpty())
                ? totalAmount * 0.1
                : 0.0;

        double finalAmount = totalAmount - discountAmount;

        OrderTbl order = new OrderTbl();
        order.setUser(user);
        order.setItems(items);
        order.setStatus("PAYMENT DONE");
        order.setCreatedAt(LocalDateTime.now());
        order.setCouponCode(couponCode);
        order.setTotalAmount(totalAmount);
        order.setDiscountAmount(discountAmount);
        order.setFinalAmount(finalAmount);

        items.forEach(i -> i.setOrder(order));

        return orderRepository.save(order);
    }

    
    @Transactional
    public OrderTbl createOrderWithShipping(String username, List<OrderItem> items, String couponCode, OrderRequest.ShippingDto shippingDto) {
        OrderTbl order = createOrder(username, items, couponCode);

        if (shippingDto != null) {
            ShippingAddress addr = new ShippingAddress();
            addr.setFullName(shippingDto.getFullName());
            addr.setPhone(shippingDto.getPhone());
            addr.setAddressLine1(shippingDto.getAddressLine1());
            addr.setAddressLine2(shippingDto.getAddressLine2());
            addr.setCity(shippingDto.getCity());
            addr.setState(shippingDto.getState());
            addr.setPincode(shippingDto.getPincode());
            addr.setLandmark(shippingDto.getLandmark());
            addr.setCountry(shippingDto.getCountry());
            addr.setOrder(order);

            shippingAddressRepository.save(addr);
            order.setShippingAddress(addr);
            orderRepository.save(order);
        }

        return order;
    }

    
    public List<OrderTbl> getAllOrders() {
        // Use the repository query that fetches orders sorted by createdAt DESC
        List<OrderTbl> orders = orderRepository.findAllOrdersWithItemsAndProducts();

        if (orders != null) {
            orders.forEach(order -> {
                if (order.getItems() != null) {
                    order.getItems().forEach(item -> {
                        if (item.getProduct() != null) {
                            item.getProduct().getName(); // trigger lazy load
                        }
                    });
                }
            });
        }

        System.out.println("✅ getAllOrders() returned: " + orders.size() + " orders");
        return orders;
    }

    
    public List<OrderTbl> getOrdersByUsername(String username) {
        List<OrderTbl> orders = orderRepository.findByUser_Username(username);
        if (orders == null || orders.isEmpty()) {
            System.out.println("⚠️ No orders found for username: " + username);
            return List.of();
        }
        orders.forEach(order -> order.getItems().forEach(item -> {
            if (item.getProduct() != null) item.getProduct().getName();
        }));
        return orders;
    }

    
    public List<OrderTbl> findByStatus(String status) {
        return orderRepository.findByStatus(status);
    }

   
    public List<com.example.ecomm.dto.OrderDto> getOrdersForUser(Long userId) {
        List<OrderTbl> orders = orderRepository.findByUser_Id(userId);
        List<com.example.ecomm.dto.OrderDto> dtos = new ArrayList<>();
        for (OrderTbl order : orders) {
            dtos.add(new com.example.ecomm.dto.OrderDto(order));
        }
        return dtos;
    }

    
    public List<OrderTbl> getOrdersBasedOnRole(String username, String role) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found: " + username));

        System.out.println("🔍 Fetching orders for: " + username + " | Role: " + role);

        if (role.equals("ROLE_USER")) {
            // ✅ Regular user → only their own orders
            return getOrdersByUsername(username);

        } else if (role.equals("ROLE_ADMIN")) {
            // ✅ Admin → only their own orders
            List<OrderTbl> adminOrders = orderRepository.findByUser(user);
            adminOrders.forEach(order -> order.getItems().forEach(item -> {
                if (item.getProduct() != null) item.getProduct().getName();
            }));
            return adminOrders;

        } else if (role.equals("ROLE_SALES")) {
            // ✅ Sales → ALL orders (irrespective of who placed them) sorted by latest first
            List<OrderTbl> allOrders = getAllOrders();

            System.out.println("✅ ROLE_SALES fetched total orders: " + allOrders.size());
            return allOrders;

        } else {
            return List.of();
        }
    }
}
*/




/*
package com.example.ecomm.service;

import com.example.ecomm.model.*;
import com.example.ecomm.dto.OrderRequest;
import com.example.ecomm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;

@Service
public class OrderService {

    @Autowired private OrderRepository orderRepository;
    @Autowired private UserRepository userRepository;
    @Autowired private ProductRepository productRepository;
    @Autowired private ShippingAddressRepository shippingAddressRepository;

    /** ✅ Create new order */
/*
    @Transactional
    public OrderTbl createOrder(String username, List<OrderItem> items, String couponCode) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("⚠️ User not found for username: " + username));

        double totalAmount = items.stream()
                .mapToDouble(i -> i.getQuantity() * i.getProduct().getPrice())
                .sum();

        double discountAmount = (couponCode != null && !couponCode.trim().isEmpty())
                ? totalAmount * 0.1
                : 0.0;

        double finalAmount = totalAmount - discountAmount;

        OrderTbl order = new OrderTbl();
        order.setUser(user);
        order.setItems(items);
        order.setStatus("PAYMENT DONE");
        order.setCreatedAt(LocalDateTime.now());
        order.setCouponCode(couponCode);
        order.setTotalAmount(totalAmount);
        order.setDiscountAmount(discountAmount);
        order.setFinalAmount(finalAmount);

        items.forEach(i -> i.setOrder(order));

        return orderRepository.save(order);
    }

    /** ✅ Create order with shipping info */
/*
    @Transactional
    public OrderTbl createOrderWithShipping(String username, List<OrderItem> items, String couponCode, OrderRequest.ShippingDto shippingDto) {
        OrderTbl order = createOrder(username, items, couponCode);

        if (shippingDto != null) {
            ShippingAddress addr = new ShippingAddress();
            addr.setFullName(shippingDto.getFullName());
            addr.setPhone(shippingDto.getPhone());
            addr.setAddressLine1(shippingDto.getAddressLine1());
            addr.setAddressLine2(shippingDto.getAddressLine2());
            addr.setCity(shippingDto.getCity());
            addr.setState(shippingDto.getState());
            addr.setPincode(shippingDto.getPincode());
            addr.setLandmark(shippingDto.getLandmark());
            addr.setCountry(shippingDto.getCountry());
            addr.setOrder(order);

            shippingAddressRepository.save(addr);
            order.setShippingAddress(addr);
            orderRepository.save(order);
        }

        return order;
    }

    /** ✅ Get all orders (Admin / Sales) - always latest first */
/*
    public List<OrderTbl> getAllOrders() {
        // Fetch all orders joined with items & products
        List<OrderTbl> orders = orderRepository.findAllOrdersWithItemsAndProducts();

        if (orders != null && !orders.isEmpty()) {
            // ✅ Ensure orders are sorted by latest createdAt first
            Collections.sort(orders, (a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()));

            // ✅ Force load of lazy relationships
            orders.forEach(order -> {
                if (order.getItems() != null) {
                    order.getItems().forEach(item -> {
                        if (item.getProduct() != null) {
                            item.getProduct().getName(); // trigger lazy load
                        }
                    });
                }
            });
        }

        System.out.println("✅ getAllOrders() returned: " + orders.size() + " orders");
        // Debugging: print first few timestamps
        orders.stream().limit(3).forEach(o ->
                System.out.println("🕒 Order ID: " + o.getId() + " | CreatedAt: " + o.getCreatedAt()));

        return orders;
    }

    /** ✅ Get user-specific orders by username */
/*
    public List<OrderTbl> getOrdersByUsername(String username) {
        List<OrderTbl> orders = orderRepository.findByUser_Username(username);
        if (orders == null || orders.isEmpty()) {
            System.out.println("⚠️ No orders found for username: " + username);
            return List.of();
        }

        // Sort user’s orders latest first as well
        Collections.sort(orders, (a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()));

        orders.forEach(order -> order.getItems().forEach(item -> {
            if (item.getProduct() != null) item.getProduct().getName();
        }));
        return orders;
    }

    /** ✅ Get orders by status */
/*
    public List<OrderTbl> findByStatus(String status) {
        return orderRepository.findByStatus(status);
    }

    /** ✅ Fetch orders for a specific userId (Admin) */
/*
    public List<com.example.ecomm.dto.OrderDto> getOrdersForUser(Long userId) {
        List<OrderTbl> orders = orderRepository.findByUser_Id(userId);

        // Sort newest first
        Collections.sort(orders, (a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()));

        List<com.example.ecomm.dto.OrderDto> dtos = new ArrayList<>();
        for (OrderTbl order : orders) {
            dtos.add(new com.example.ecomm.dto.OrderDto(order));
        }
        return dtos;
    }

    /** ✅ Unified: Fetch orders based on role */
/*
    public List<OrderTbl> getOrdersBasedOnRole(String username, String role) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found: " + username));

        System.out.println("🔍 Fetching orders for: " + username + " | Role: " + role);

        if (role.equals("ROLE_USER")) {
            // ✅ Regular user → only their own orders
            return getOrdersByUsername(username);

        } else if (role.equals("ROLE_ADMIN")) {
            // ✅ Admin → only their own orders
            List<OrderTbl> adminOrders = orderRepository.findByUser(user);

            // Sort latest first
            Collections.sort(adminOrders, (a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()));

            adminOrders.forEach(order -> order.getItems().forEach(item -> {
                if (item.getProduct() != null) item.getProduct().getName();
            }));
            return adminOrders;

        } else if (role.equals("ROLE_SALES")) {
            // ✅ Sales → ALL orders (latest first)
            List<OrderTbl> allOrders = getAllOrders();

            System.out.println("✅ ROLE_SALES fetched total orders: " + allOrders.size());
            return allOrders;

        } else {
            return List.of();
        }
    }
}
*/



//06-11-2025 working
/*
package com.example.ecomm.service;

import com.example.ecomm.model.*;
import com.example.ecomm.dto.OrderRequest;
import com.example.ecomm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;

@Service
public class OrderService {

    @Autowired private OrderRepository orderRepository;
    @Autowired private UserRepository userRepository;
    @Autowired private ProductRepository productRepository;
    @Autowired private ShippingAddressRepository shippingAddressRepository;

    /** ✅ Create new order */
/*
    @Transactional
    public OrderTbl createOrder(String username, List<OrderItem> items, String couponCode) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("⚠️ User not found for username: " + username));

        double totalAmount = items.stream()
                .mapToDouble(i -> i.getQuantity() * i.getProduct().getPrice())
                .sum();

        double discountAmount = (couponCode != null && !couponCode.trim().isEmpty())
                ? totalAmount * 0.1
                : 0.0;

        double finalAmount = totalAmount - discountAmount;

        OrderTbl order = new OrderTbl();
        order.setUser(user);
        order.setItems(items);
        order.setStatus("PAYMENT DONE");
        order.setCreatedAt(LocalDateTime.now());
        order.setCouponCode(couponCode);
        order.setTotalAmount(totalAmount);
        order.setDiscountAmount(discountAmount);
        order.setFinalAmount(finalAmount);

        items.forEach(i -> i.setOrder(order));

        return orderRepository.save(order);
    }

    /** ✅ Create order with shipping info */
/*
    @Transactional
    public OrderTbl createOrderWithShipping(String username, List<OrderItem> items, String couponCode, OrderRequest.ShippingDto shippingDto) {
        OrderTbl order = createOrder(username, items, couponCode);

        if (shippingDto != null) {
            ShippingAddress addr = new ShippingAddress();
            addr.setFullName(shippingDto.getFullName());
            addr.setPhone(shippingDto.getPhone());
            addr.setAddressLine1(shippingDto.getAddressLine1());
            addr.setAddressLine2(shippingDto.getAddressLine2());
            addr.setCity(shippingDto.getCity());
            addr.setState(shippingDto.getState());
            addr.setPincode(shippingDto.getPincode());
            addr.setLandmark(shippingDto.getLandmark());
            addr.setCountry(shippingDto.getCountry());
            addr.setOrder(order);

            shippingAddressRepository.save(addr);
            order.setShippingAddress(addr);
            orderRepository.save(order);
        }

        return order;
    }

    /** ✅ Get all orders (Admin / Sales) - always latest first */
/*
    public List<OrderTbl> getAllOrders() {
        // Fetch all orders joined with items & products
        List<OrderTbl> orders = orderRepository.findAllOrdersWithItemsAndProducts();

        if (orders != null && !orders.isEmpty()) {
            // ✅ Ensure orders are sorted by latest createdAt first
            Collections.sort(orders, (a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()));

            // ✅ Force load of lazy relationships
            orders.forEach(order -> {
                if (order.getItems() != null) {
                    order.getItems().forEach(item -> {
                        if (item.getProduct() != null) {
                            item.getProduct().getName(); // trigger lazy load
                        }
                    });
                }
            });
        }

        System.out.println("✅ getAllOrders() returned: " + orders.size() + " orders");
        orders.stream().limit(3).forEach(o ->
                System.out.println("🕒 Order ID: " + o.getId() + " | CreatedAt: " + o.getCreatedAt()));

        return orders;
    }

    /** ✅ Get user-specific orders by username */
/*
    public List<OrderTbl> getOrdersByUsername(String username) {
        List<OrderTbl> orders = orderRepository.findByUser_Username(username);
        if (orders == null || orders.isEmpty()) {
            System.out.println("⚠️ No orders found for username: " + username);
            return List.of();
        }

        // Sort user’s orders latest first
        Collections.sort(orders, (a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()));

        orders.forEach(order -> order.getItems().forEach(item -> {
            if (item.getProduct() != null) item.getProduct().getName();
        }));
        return orders;
    }

    /** ✅ Get orders by status */
/*
    public List<OrderTbl> findByStatus(String status) {
        return orderRepository.findByStatus(status);
    }

    /** ✅ Fetch orders for a specific userId (Admin) */
/*
    public List<com.example.ecomm.dto.OrderDto> getOrdersForUser(Long userId) {
        List<OrderTbl> orders = orderRepository.findByUser_Id(userId);

        // Sort newest first
        Collections.sort(orders, (a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()));

        List<com.example.ecomm.dto.OrderDto> dtos = new ArrayList<>();
        for (OrderTbl order : orders) {
            dtos.add(new com.example.ecomm.dto.OrderDto(order));
        }
        return dtos;
    }

    /** ✅ Unified: Fetch orders based on role */
/*
    public List<OrderTbl> getOrdersBasedOnRole(String username, String role) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found: " + username));

        System.out.println("🔍 Fetching orders for: " + username + " | Role: " + role);

        if (role.equals("ROLE_USER")) {
            // ✅ Regular user → only their own orders
            return getOrdersByUsername(username);

        } else if (role.equals("ROLE_ADMIN")) {
            // ✅ Admin → only their own orders
            List<OrderTbl> adminOrders = orderRepository.findByUser(user);

            // Sort latest first
            Collections.sort(adminOrders, (a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()));

            adminOrders.forEach(order -> order.getItems().forEach(item -> {
                if (item.getProduct() != null) item.getProduct().getName();
            }));
            return adminOrders;

        } else if (role.equals("ROLE_SALES")) {
            // ✅ Sales → ALL orders (latest first)
            List<OrderTbl> allOrders = getAllOrders();

            System.out.println("✅ ROLE_SALES fetched total orders: " + allOrders.size());
            return allOrders;

        } else {
            return List.of();
        }
    }

    /** ✅ Update order status (ROLE_SALES only) */
/*
    @Transactional
    public boolean updateOrderStatus(Long orderId, String newStatus) {
        Optional<OrderTbl> optionalOrder = orderRepository.findById(orderId);

        if (optionalOrder.isEmpty()) {
            System.out.println("❌ Order not found for ID: " + orderId);
            return false;
        }

        OrderTbl order = optionalOrder.get();
        order.setStatus(newStatus);
        orderRepository.save(order);

        System.out.println("🟢 Order ID " + orderId + " updated to status: " + newStatus);
        return true;
    }
}
*/



package com.example.ecomm.service;

import com.example.ecomm.model.*;
import com.example.ecomm.dto.OrderRequest;
import com.example.ecomm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;

@Service
public class OrderService {

    @Autowired private OrderRepository orderRepository;
    @Autowired private UserRepository userRepository;
    @Autowired private ProductRepository productRepository;
    @Autowired private ShippingAddressRepository shippingAddressRepository;

    /** ✅ Create new order */
    @Transactional
    public OrderTbl createOrder(String username, List<OrderItem> items, String couponCode) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("⚠️ User not found for username: " + username));

        double totalAmount = items.stream()
                .mapToDouble(i -> i.getQuantity() * i.getProduct().getPrice())
                .sum();

        double discountAmount = (couponCode != null && !couponCode.trim().isEmpty())
                ? totalAmount * 0.1
                : 0.0;

        double finalAmount = totalAmount - discountAmount;

        OrderTbl order = new OrderTbl();
        order.setUser(user);
        order.setItems(items);
        order.setStatus("PAYMENT DONE");
        order.setCreatedAt(LocalDateTime.now());
        order.setCouponCode(couponCode);
        order.setTotalAmount(totalAmount);
        order.setDiscountAmount(discountAmount);
        order.setFinalAmount(finalAmount);

        items.forEach(i -> i.setOrder(order));

        return orderRepository.save(order);
    }

    /** ✅ Create order with shipping info */
    @Transactional
    public OrderTbl createOrderWithShipping(String username, List<OrderItem> items, String couponCode, OrderRequest.ShippingDto shippingDto) {
        OrderTbl order = createOrder(username, items, couponCode);

        if (shippingDto != null) {
            ShippingAddress addr = new ShippingAddress();
            addr.setFullName(shippingDto.getFullName());
            addr.setPhone(shippingDto.getPhone());
            addr.setAddressLine1(shippingDto.getAddressLine1());
            addr.setAddressLine2(shippingDto.getAddressLine2());
            addr.setCity(shippingDto.getCity());
            addr.setState(shippingDto.getState());
            addr.setPincode(shippingDto.getPincode());
            addr.setLandmark(shippingDto.getLandmark());
            addr.setCountry(shippingDto.getCountry());
            addr.setOrder(order);

            shippingAddressRepository.save(addr);
            order.setShippingAddress(addr);
            orderRepository.save(order);
        }

        return order;
    }

    /** ✅ Get all orders (Admin / Sales) - always latest first */
    public List<OrderTbl> getAllOrders() {
        List<OrderTbl> orders = orderRepository.findAllOrdersWithItemsAndProducts();

        if (orders != null && !orders.isEmpty()) {
            Collections.sort(orders, (a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()));

            orders.forEach(order -> {
                if (order.getItems() != null) {
                    order.getItems().forEach(item -> {
                        if (item.getProduct() != null) {
                            item.getProduct().getName();
                        }
                    });
                }
            });
        }

        System.out.println("✅ getAllOrders() returned: " + orders.size() + " orders");
        orders.stream().limit(3).forEach(o ->
                System.out.println("🕒 Order ID: " + o.getId() + " | CreatedAt: " + o.getCreatedAt()));

        return orders;
    }

    /** ✅ Get user-specific orders by username */
    public List<OrderTbl> getOrdersByUsername(String username) {
        List<OrderTbl> orders = orderRepository.findByUser_Username(username);
        if (orders == null || orders.isEmpty()) {
            System.out.println("⚠️ No orders found for username: " + username);
            return List.of();
        }

        Collections.sort(orders, (a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()));

        orders.forEach(order -> order.getItems().forEach(item -> {
            if (item.getProduct() != null) item.getProduct().getName();
        }));
        return orders;
    }

    /** ✅ Get orders by status */
    public List<OrderTbl> findByStatus(String status) {
        return orderRepository.findByStatus(status);
    }

    /** ✅ Fetch orders for a specific userId (Admin) */
    public List<com.example.ecomm.dto.OrderDto> getOrdersForUser(Long userId) {
        List<OrderTbl> orders = orderRepository.findByUser_Id(userId);

        Collections.sort(orders, (a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()));

        List<com.example.ecomm.dto.OrderDto> dtos = new ArrayList<>();
        for (OrderTbl order : orders) {
            dtos.add(new com.example.ecomm.dto.OrderDto(order));
        }
        return dtos;
    }

    /** ✅ Unified: Fetch orders based on role */
    public List<OrderTbl> getOrdersBasedOnRole(String username, String role) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found: " + username));

        System.out.println("🔍 Fetching orders for: " + username + " | Role: " + role);

        if (role.equals("ROLE_USER")) {
            return getOrdersByUsername(username);
        } else if (role.equals("ROLE_ADMIN")) {
            List<OrderTbl> adminOrders = orderRepository.findByUser(user);
            Collections.sort(adminOrders, (a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()));
            adminOrders.forEach(order -> order.getItems().forEach(item -> {
                if (item.getProduct() != null) item.getProduct().getName();
            }));
            return adminOrders;
        } else if (role.equals("ROLE_SALES")) {
            List<OrderTbl> allOrders = getAllOrders();
            System.out.println("✅ ROLE_SALES fetched total orders: " + allOrders.size());
            return allOrders;
        } else {
            return List.of();
        }
    }

    /** ✅ Update order status and tracking number (ROLE_SALES only) */
    @Transactional
    public boolean updateOrderStatus(Long orderId, String newStatus, String trackingNumber) {
        Optional<OrderTbl> optionalOrder = orderRepository.findById(orderId);

        if (optionalOrder.isEmpty()) {
            System.out.println("❌ Order not found for ID: " + orderId);
            return false;
        }

        OrderTbl order = optionalOrder.get();
        order.setStatus(newStatus);

        // ✅ Save tracking number only if SHIPPED
        if ("SHIPPED".equalsIgnoreCase(newStatus) && trackingNumber != null && !trackingNumber.isBlank()) {
            order.setTrackingNumber(trackingNumber);
            System.out.println("📦 Tracking number saved: " + trackingNumber);
        }

        orderRepository.save(order);
        System.out.println("🟢 Order ID " + orderId + " updated to status: " + newStatus);
        return true;
    }
}

