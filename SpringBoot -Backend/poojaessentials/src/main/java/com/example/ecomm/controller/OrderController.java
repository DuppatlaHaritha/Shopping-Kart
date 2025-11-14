/*
package com.example.ecomm.controller;

import com.example.ecomm.dto.OrderRequest;
import org.springframework.security.access.prepost.PreAuthorize;

import com.example.ecomm.model.*;
import com.example.ecomm.service.OrderService;
import com.example.ecomm.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class OrderController {
    @Autowired private OrderService orderService;
    @Autowired private ProductRepository productRepository;

    @PostMapping("/orders")
    public ResponseEntity<?> placeOrder(@RequestBody OrderRequest req) {
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        if (a == null || a.getName() == null) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");
        String username = a.getName();

        List<OrderItem> items = new ArrayList<>();
        for (OrderRequest.Item it : req.getItems()) {
            OrderItem oi = new OrderItem();
            Product p = productRepository.findById(it.productId).orElseThrow(() -> new RuntimeException("Product not found"));
            oi.setProduct(p);
            oi.setQuantity(it.quantity);
            items.add(oi);
        }

        OrderTbl order = orderService.createOrder(username, items, req.getCouponCode());
        return ResponseEntity.status(HttpStatus.CREATED).body(order);
    }

    @GetMapping("/orders/my")
    public ResponseEntity<?> myOrders() {
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        if (a == null || a.getName() == null) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");
        String username = a.getName();
        return ResponseEntity.ok(orderService.findByUser(username));
    }

    @GetMapping("/admin/orders")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> allOrders() {
        return ResponseEntity.ok(orderService.findAllOrders());
    }
}
*/

/*
package com.example.ecomm.controller;

import com.example.ecomm.dto.OrderDto;
import com.example.ecomm.dto.OrderRequest;
import com.example.ecomm.model.*;
import com.example.ecomm.repository.OrderRepository;
import com.example.ecomm.repository.ProductRepository;
import com.example.ecomm.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class OrderController {

    @Autowired private OrderService orderService;
    @Autowired private ProductRepository productRepository;

    // ✅ Inject OrderRepository
    @Autowired private OrderRepository orderRepository;

    

    @PostMapping("/orders")
    public ResponseEntity<?> placeOrder(@RequestBody OrderRequest req) {
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        if (a == null || a.getName() == null)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");

        String username = a.getName();

        List<OrderItem> items = new ArrayList<>();
        for (OrderRequest.Item it : req.getItems()) {
            OrderItem oi = new OrderItem();
            Product p = productRepository.findById(it.productId)
                    .orElseThrow(() -> new RuntimeException("Product not found"));
            oi.setProduct(p);
            oi.setQuantity(it.quantity);
            items.add(oi);
        }

        OrderTbl order = orderService.createOrder(username, items, req.getCouponCode());
        return ResponseEntity.status(HttpStatus.CREATED).body(order);
    }

    
    @GetMapping("/orders/my")
    public ResponseEntity<?> myOrders() {
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        if (a == null || a.getName() == null)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");

        String username = a.getName();
        return ResponseEntity.ok(orderService.findByUser(username));
    }

    

    @GetMapping("/admin/orders")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> allOrders() {
        return ResponseEntity.ok(orderService.findAllOrders());
    }

    

    @GetMapping("/orders/placed")
    @PreAuthorize("hasRole('SALES')")
    public ResponseEntity<List<OrderTbl>> getPlacedOrdersForSales() {
        // Use the exact status string you found from DB, e.g. "placed" or "Placed"
        List<OrderTbl> orders = orderService.findByStatus("PAYMENT DONE");
        return ResponseEntity.ok(orders);
    }

    

    @GetMapping("/orders/user/{userId}")
    public ResponseEntity<List<OrderDto>> getOrdersForUser(@PathVariable Long userId) {
        List<OrderDto> orders = orderService.getOrdersForUser(userId);
        return ResponseEntity.ok(orders);
    }
}
*/


/*
package com.example.ecomm.controller;

import com.example.ecomm.dto.OrderDto;
import com.example.ecomm.dto.OrderRequest;
import com.example.ecomm.model.*;
import com.example.ecomm.repository.OrderRepository;
import com.example.ecomm.repository.ProductRepository;
import com.example.ecomm.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class OrderController {

    @Autowired private OrderService orderService;
    @Autowired private ProductRepository productRepository;

    // ✅ Inject OrderRepository
    @Autowired private OrderRepository orderRepository;

    
    @PostMapping("/orders")
    public ResponseEntity<?> placeOrder(@RequestBody OrderRequest req) {
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        if (a == null || a.getName() == null)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");

        String username = a.getName();

        List<OrderItem> items = new ArrayList<>();
        for (OrderRequest.Item it : req.getItems()) {
            OrderItem oi = new OrderItem();
            Product p = productRepository.findById(it.productId)
                    .orElseThrow(() -> new RuntimeException("Product not found"));
            oi.setProduct(p);
            oi.setQuantity(it.quantity);
            items.add(oi);
        }

        OrderTbl order = orderService.createOrder(username, items, req.getCouponCode());
        return ResponseEntity.status(HttpStatus.CREATED).body(order);
    }

    
    @GetMapping("/orders/my")
    public ResponseEntity<?> myOrders() {
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        if (a == null || a.getName() == null)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");

        String username = a.getName();
        return ResponseEntity.ok(orderService.findByUser(username));
    }

    
    @GetMapping("/orders/placed")
    @PreAuthorize("hasRole('SALES')")
    public ResponseEntity<List<OrderTbl>> getPlacedOrdersForSales() {
        List<OrderTbl> orders = orderService.findByStatus("placed");
        return ResponseEntity.ok(orders);
    }

    
    @GetMapping("/orders/all")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> allOrdersForAdmin() {
        List<OrderTbl> orders = orderService.findAllOrders();
        return ResponseEntity.ok(orders);
    }

    
    @GetMapping("/orders/user/{userId}")
    public ResponseEntity<List<OrderDto>> getOrdersForUser(@PathVariable Long userId) {
        List<OrderDto> orders = orderService.getOrdersForUser(userId);
        return ResponseEntity.ok(orders);
    }

    
    @PutMapping("/orders/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> updateOrderStatus(@PathVariable Long id, @RequestBody Map<String, Object> body) {
        Optional<OrderTbl> optOrder = orderRepository.findById(id);
        if (optOrder.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Order not found");
        }

        OrderTbl order = optOrder.get();

        // Extract fields from request
        String status = (String) body.get("status");
        String trackingNumber = (String) body.get("trackingNumber");

        if (status != null && !status.isEmpty()) {
            order.setStatus(status);
        }

        // Only set tracking number if provided or status is shipped
        if (trackingNumber != null && !trackingNumber.isEmpty()) {
            order.setTrackingNumber(trackingNumber);
        }

        orderRepository.save(order);
        return ResponseEntity.ok(order);
    }
}
*/

/*
package com.example.ecomm.controller;

import com.example.ecomm.dto.OrderDto;
import com.example.ecomm.dto.OrderRequest;
import com.example.ecomm.model.*;
import com.example.ecomm.repository.OrderRepository;
import com.example.ecomm.repository.ProductRepository;
import com.example.ecomm.repository.ShippingAddressRepository;
import com.example.ecomm.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class OrderController {

    @Autowired private OrderService orderService;
    @Autowired private ProductRepository productRepository;
    @Autowired private OrderRepository orderRepository;

    // ✅ NEW: Inject ShippingAddressRepository
    @Autowired private ShippingAddressRepository shippingAddressRepository;

    /**
     * ✅ Place a new order for authenticated user
     */
/*
    @PostMapping("/orders")
    public ResponseEntity<?> placeOrder(@RequestBody OrderRequest req) {
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        if (a == null || a.getName() == null)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");

        String username = a.getName();

        List<OrderItem> items = new ArrayList<>();
        for (OrderRequest.Item it : req.getItems()) {
            OrderItem oi = new OrderItem();
            Product p = productRepository.findById(it.getProductId())
                    .orElseThrow(() -> new RuntimeException("Product not found"));
            oi.setProduct(p);
            oi.setQuantity(it.getQuantity());
            items.add(oi);
        }

        // ✅ Create order
        OrderTbl order = orderService.createOrder(username, items, req.getCouponCode());

        // ✅ --- Handle shipping address ---
        if (req.getShipping() != null) {
            OrderRequest.ShippingDto s = req.getShipping();
            ShippingAddress addr = new ShippingAddress();
            addr.setFullName(s.getFullName());
            addr.setPhone(s.getPhone());
            addr.setAddressLine1(s.getAddressLine1());
            addr.setAddressLine2(s.getAddressLine2());
            addr.setCity(s.getCity());
            addr.setState(s.getState());
            addr.setPincode(s.getPincode());
            addr.setLandmark(s.getLandmark());
            addr.setCountry(s.getCountry());

            // link to order (owning side)
            addr.setOrder(order);

            // save address
            shippingAddressRepository.save(addr);

            // optionally set on order and save (so response includes it)
            order.setShippingAddress(addr);
            orderRepository.save(order);
        }

        return ResponseEntity.status(HttpStatus.CREATED).body(order);
    }

    /**
     * ✅ Fetch orders for currently authenticated user
     */
/*
   

    @GetMapping("/orders/my")
    public ResponseEntity<?> myOrders() {
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        if (a == null || a.getName() == null)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");

        String username = a.getName();
        return ResponseEntity.ok(orderService.findByUser(username));
    }

    /**
     * ✅ Fetch all orders (Admin only)
     */
/*
    @GetMapping("/admin/orders")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> allOrders() {
        return ResponseEntity.ok(orderService.findAllOrders());
    }

    /**
     * ✅ Fetch all 'Placed' orders for Sales role
     */
/*
    @GetMapping("/orders/placed")
    //@PreAuthorize("hasRole('SALES')")
    @PreAuthorize("hasAuthority('ROLE_SALES')")

    public ResponseEntity<List<OrderTbl>> getPlacedOrdersForSales() {
        List<OrderTbl> orders = orderService.findByStatus("PAYMENT DONE");
        return ResponseEntity.ok(orders);
    }

    /**
     * ✅ Get orders for a specific user (for Admin use)
     */
/*
    @GetMapping("/orders/user/{userId}")
    public ResponseEntity<List<OrderDto>> getOrdersForUser(@PathVariable Long userId) {
        List<OrderDto> orders = orderService.getOrdersForUser(userId);
        return ResponseEntity.ok(orders);
    }
}
*/




/*
package com.example.ecomm.controller;

import com.example.ecomm.dto.OrderDto;
import com.example.ecomm.dto.OrderRequest;
import com.example.ecomm.model.*;
import com.example.ecomm.repository.OrderRepository;
import com.example.ecomm.repository.ProductRepository;
import com.example.ecomm.repository.ShippingAddressRepository;
import com.example.ecomm.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class OrderController {

    @Autowired private OrderService orderService;
    @Autowired private ProductRepository productRepository;
    @Autowired private OrderRepository orderRepository;
    @Autowired private ShippingAddressRepository shippingAddressRepository;

    /** ✅ Place a new order for authenticated user */
/*
    @PostMapping("/orders")
    public ResponseEntity<?> placeOrder(@RequestBody OrderRequest req) {
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        if (a == null || a.getName() == null)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");

        String username = a.getName();

        List<OrderItem> items = new ArrayList<>();
        for (OrderRequest.Item it : req.getItems()) {
            OrderItem oi = new OrderItem();
            Product p = productRepository.findById(it.getProductId())
                    .orElseThrow(() -> new RuntimeException("Product not found"));
            oi.setProduct(p);
            oi.setQuantity(it.getQuantity());
            items.add(oi);
        }

        // ✅ Create order
        OrderTbl order = orderService.createOrder(username, items, req.getCouponCode());

        // ✅ Handle shipping address
        if (req.getShipping() != null) {
            OrderRequest.ShippingDto s = req.getShipping();
            ShippingAddress addr = new ShippingAddress();
            addr.setFullName(s.getFullName());
            addr.setPhone(s.getPhone());
            addr.setAddressLine1(s.getAddressLine1());
            addr.setAddressLine2(s.getAddressLine2());
            addr.setCity(s.getCity());
            addr.setState(s.getState());
            addr.setPincode(s.getPincode());
            addr.setLandmark(s.getLandmark());
            addr.setCountry(s.getCountry());
            addr.setOrder(order);

            shippingAddressRepository.save(addr);
            order.setShippingAddress(addr);
            orderRepository.save(order);
        }

        return ResponseEntity.status(HttpStatus.CREATED).body(order);
    }

    /** ✅ Unified fetch endpoint for all roles */
/*
    @GetMapping("/orders")
    public ResponseEntity<?> getOrdersByRole(Authentication authentication) {
        if (authentication == null)
            return ResponseEntity.status(401).body("Unauthorized");

        String role = authentication.getAuthorities().iterator().next().getAuthority();
        String username = authentication.getName();
        List<OrderTbl> orders;

        System.out.println("Fetching orders for role: " + role + ", username: " + username);

        if (role.equals("ROLE_ADMIN") || role.equals("ROLE_SALES")) {
            orders = orderService.getAllOrders();
        } else if (role.equals("ROLE_USER")) {
            orders = orderService.getOrdersByUsername(username);
        } else {
            return ResponseEntity.status(403).body("Access denied");
        }

        // ✅ Always return JSON array, not string
        if (orders == null || orders.isEmpty()) {
            return ResponseEntity.ok(Collections.emptyList());
        }

        return ResponseEntity.ok(orders);
    }

    /** ✅ Fetch orders for authenticated user */
/*
    @GetMapping("/orders/my")
    public ResponseEntity<?> myOrders() {
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        if (a == null || a.getName() == null)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");

        String username = a.getName();
        return ResponseEntity.ok(orderService.getOrdersByUsername(username));
    }

    /** ✅ Fetch all orders (Admin + Sales allowed) */
/*
    @GetMapping("/admin/orders")
    @PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_SALES')")
    public ResponseEntity<?> allOrders() {
        return ResponseEntity.ok(orderService.getAllOrders());
    }

    /** ✅ Fetch all 'Placed' orders for Sales only (optional filter) */
/*
    @GetMapping("/orders/placed")
    @PreAuthorize("hasAuthority('ROLE_SALES')")
    public ResponseEntity<List<OrderTbl>> getPlacedOrdersForSales() {
        List<OrderTbl> orders = orderService.findByStatus("PAYMENT DONE");
        return ResponseEntity.ok(orders);
    }

    /** ✅ Get orders for a specific user (Admin/Sales use) */
/*
    @GetMapping("/orders/user/{userId}")
    @PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_SALES')")
    public ResponseEntity<List<OrderDto>> getOrdersForUser(@PathVariable Long userId) {
        List<OrderDto> orders = orderService.getOrdersForUser(userId);
        return ResponseEntity.ok(orders);
    }
}
*/



//working
/*
package com.example.ecomm.controller;

import com.example.ecomm.dto.OrderDto;
import com.example.ecomm.dto.OrderRequest;
import com.example.ecomm.model.*;
import com.example.ecomm.repository.OrderRepository;
import com.example.ecomm.repository.ProductRepository;
import com.example.ecomm.repository.ShippingAddressRepository;
import com.example.ecomm.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class OrderController {

    @Autowired private OrderService orderService;
    @Autowired private ProductRepository productRepository;
    @Autowired private OrderRepository orderRepository;
    @Autowired private ShippingAddressRepository shippingAddressRepository;

    /** ✅ Place a new order for authenticated user */
/*
    @PostMapping("/orders")
    public ResponseEntity<?> placeOrder(@RequestBody OrderRequest req) {
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        if (a == null || a.getName() == null)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");

        String username = a.getName();

        List<OrderItem> items = new ArrayList<>();
        for (OrderRequest.Item it : req.getItems()) {
            OrderItem oi = new OrderItem();
            Product p = productRepository.findById(it.getProductId())
                    .orElseThrow(() -> new RuntimeException("Product not found"));
            oi.setProduct(p);
            oi.setQuantity(it.getQuantity());
            items.add(oi);
        }

        // ✅ Create order
        OrderTbl order = orderService.createOrder(username, items, req.getCouponCode());

        // ✅ Handle shipping address
        if (req.getShipping() != null) {
            OrderRequest.ShippingDto s = req.getShipping();
            ShippingAddress addr = new ShippingAddress();
            addr.setFullName(s.getFullName());
            addr.setPhone(s.getPhone());
            addr.setAddressLine1(s.getAddressLine1());
            addr.setAddressLine2(s.getAddressLine2());
            addr.setCity(s.getCity());
            addr.setState(s.getState());
            addr.setPincode(s.getPincode());
            addr.setLandmark(s.getLandmark());
            addr.setCountry(s.getCountry());
            addr.setOrder(order);

            shippingAddressRepository.save(addr);
            order.setShippingAddress(addr);
            orderRepository.save(order);
        }

        return ResponseEntity.status(HttpStatus.CREATED).body(order);
    }

    /** ✅ Unified fetch endpoint for all roles */
/*
    @GetMapping("/orders")
    public ResponseEntity<?> getOrdersByRole(Authentication authentication) {
        if (authentication == null)
            return ResponseEntity.status(401).body("Unauthorized");

        String role = authentication.getAuthorities().iterator().next().getAuthority();
        String username = authentication.getName();

        System.out.println("Fetching orders for role: " + role + ", username: " + username);

        List<OrderTbl> orders = orderService.getOrdersBasedOnRole(username, role);

        // ✅ Always return JSON array, not string
        if (orders == null || orders.isEmpty()) {
            return ResponseEntity.ok(Collections.emptyList());
        }

        return ResponseEntity.ok(orders);
    }

    /** ✅ Fetch orders for authenticated user */
/*
    @GetMapping("/orders/my")
    public ResponseEntity<?> myOrders() {
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        if (a == null || a.getName() == null)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");

        String username = a.getName();
        return ResponseEntity.ok(orderService.getOrdersByUsername(username));
    }

    /** ✅ Fetch all orders (Admin + Sales allowed) */
/*
    @GetMapping("/admin/orders")
    @PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_SALES')")
    public ResponseEntity<?> allOrders(Authentication authentication) {
        if (authentication == null)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");

        String username = authentication.getName();
        String role = authentication.getAuthorities().iterator().next().getAuthority();

        List<OrderTbl> orders = orderService.getOrdersBasedOnRole(username, role);
        return ResponseEntity.ok(orders);
    }

    /** ✅ Fetch all 'Placed' orders for Sales only (optional filter) */
/*
    @GetMapping("/orders/placed")
    @PreAuthorize("hasAuthority('ROLE_SALES')")
    public ResponseEntity<List<OrderTbl>> getPlacedOrdersForSales() {
        List<OrderTbl> orders = orderService.findByStatus("PAYMENT DONE");
        return ResponseEntity.ok(orders);
    }

    /** ✅ Get orders for a specific user (Admin/Sales use) */
/*
    @GetMapping("/orders/user/{userId}")
    @PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_SALES')")
    public ResponseEntity<List<OrderDto>> getOrdersForUser(@PathVariable Long userId) {
        List<OrderDto> orders = orderService.getOrdersForUser(userId);
        return ResponseEntity.ok(orders);
    }
}
*/



//working 06-11-2025
/*
package com.example.ecomm.controller;

import com.example.ecomm.dto.OrderDto;
import com.example.ecomm.dto.OrderRequest;
import com.example.ecomm.model.*;
import com.example.ecomm.repository.OrderRepository;
import com.example.ecomm.repository.ProductRepository;
import com.example.ecomm.repository.ShippingAddressRepository;
import com.example.ecomm.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class OrderController {

    @Autowired private OrderService orderService;
    @Autowired private ProductRepository productRepository;
    @Autowired private OrderRepository orderRepository;
    @Autowired private ShippingAddressRepository shippingAddressRepository;

    /** ✅ Place a new order for authenticated user */
/*
    @PostMapping("/orders")
    public ResponseEntity<?> placeOrder(@RequestBody OrderRequest req) {
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        if (a == null || a.getName() == null)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");

        String username = a.getName();

        List<OrderItem> items = new ArrayList<>();
        for (OrderRequest.Item it : req.getItems()) {
            OrderItem oi = new OrderItem();
            Product p = productRepository.findById(it.getProductId())
                    .orElseThrow(() -> new RuntimeException("Product not found"));
            oi.setProduct(p);
            oi.setQuantity(it.getQuantity());
            items.add(oi);
        }

        // ✅ Create order
        OrderTbl order = orderService.createOrder(username, items, req.getCouponCode());

        // ✅ Handle shipping address
        if (req.getShipping() != null) {
            OrderRequest.ShippingDto s = req.getShipping();
            ShippingAddress addr = new ShippingAddress();
            addr.setFullName(s.getFullName());
            addr.setPhone(s.getPhone());
            addr.setAddressLine1(s.getAddressLine1());
            addr.setAddressLine2(s.getAddressLine2());
            addr.setCity(s.getCity());
            addr.setState(s.getState());
            addr.setPincode(s.getPincode());
            addr.setLandmark(s.getLandmark());
            addr.setCountry(s.getCountry());
            addr.setOrder(order);

            shippingAddressRepository.save(addr);
            order.setShippingAddress(addr);
            orderRepository.save(order);
        }

        return ResponseEntity.status(HttpStatus.CREATED).body(order);
    }

    /** ✅ Unified fetch endpoint for all roles */
/*
    @GetMapping("/orders")
    public ResponseEntity<?> getOrdersByRole(Authentication authentication) {
        if (authentication == null)
            return ResponseEntity.status(401).body("Unauthorized");

        String role = authentication.getAuthorities().iterator().next().getAuthority();
        String username = authentication.getName();

        System.out.println("Fetching orders for role: " + role + ", username: " + username);

        List<OrderTbl> orders = orderService.getOrdersBasedOnRole(username, role);

        // ✅ Always return JSON array, not string
        if (orders == null || orders.isEmpty()) {
            return ResponseEntity.ok(Collections.emptyList());
        }

        return ResponseEntity.ok(orders);
    }

    /** ✅ Fetch orders for authenticated user */
/*
    @GetMapping("/orders/my")
    public ResponseEntity<?> myOrders() {
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        if (a == null || a.getName() == null)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");

        String username = a.getName();
        return ResponseEntity.ok(orderService.getOrdersByUsername(username));
    }

    /** ✅ Fetch all orders (Admin + Sales allowed) */
/*
    @GetMapping("/admin/orders")
    @PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_SALES')")
    public ResponseEntity<?> allOrders(Authentication authentication) {
        if (authentication == null)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");

        String username = authentication.getName();
        String role = authentication.getAuthorities().iterator().next().getAuthority();

        List<OrderTbl> orders = orderService.getOrdersBasedOnRole(username, role);
        return ResponseEntity.ok(orders);
    }

    /** ✅ Fetch all 'Placed' orders for Sales only (optional filter) */
/*
    @GetMapping("/orders/placed")
    @PreAuthorize("hasAuthority('ROLE_SALES')")
    public ResponseEntity<List<OrderTbl>> getPlacedOrdersForSales() {
        List<OrderTbl> orders = orderService.findByStatus("PAYMENT DONE");
        return ResponseEntity.ok(orders);
    }

    /** ✅ Get orders for a specific user (Admin/Sales use) */
/*
    @GetMapping("/orders/user/{userId}")
    @PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_SALES')")
    public ResponseEntity<List<OrderDto>> getOrdersForUser(@PathVariable Long userId) {
        List<OrderDto> orders = orderService.getOrdersForUser(userId);
        return ResponseEntity.ok(orders);
    }

    // 🟢 NEW CODE ADDED BELOW
    /** ✅ Update order status (only for ROLE_SALES) */
/*
    @PutMapping("/orders/{orderId}/status")
    @PreAuthorize("hasAuthority('ROLE_SALES')")
    public ResponseEntity<?> updateOrderStatus(
            @PathVariable Long orderId,
            @RequestBody Map<String, String> payload) {

        String newStatus = payload.get("status");
        if (newStatus == null || newStatus.isBlank()) {
            return ResponseEntity.badRequest().body("Status is required");
        }

        boolean updated = orderService.updateOrderStatus(orderId, newStatus);
        if (!updated) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Order not found");
        }

        return ResponseEntity.ok("✅ Order status updated to: " + newStatus);
    }
}
*/






package com.example.ecomm.controller;

import com.example.ecomm.dto.OrderDto;
import com.example.ecomm.dto.OrderRequest;
import com.example.ecomm.model.*;
import com.example.ecomm.repository.OrderRepository;
import com.example.ecomm.repository.ProductRepository;
import com.example.ecomm.repository.ShippingAddressRepository;
import com.example.ecomm.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class OrderController {

    @Autowired private OrderService orderService;
    @Autowired private ProductRepository productRepository;
    @Autowired private OrderRepository orderRepository;
    @Autowired private ShippingAddressRepository shippingAddressRepository;

    /** ✅ Place a new order for authenticated user */
    @PostMapping("/orders")
    public ResponseEntity<?> placeOrder(@RequestBody OrderRequest req) {
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        if (a == null || a.getName() == null)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");

        String username = a.getName();

        List<OrderItem> items = new ArrayList<>();
        for (OrderRequest.Item it : req.getItems()) {
            OrderItem oi = new OrderItem();
            Product p = productRepository.findById(it.getProductId())
                    .orElseThrow(() -> new RuntimeException("Product not found"));
            oi.setProduct(p);
            oi.setQuantity(it.getQuantity());
            items.add(oi);
        }

        // ✅ Create order
        OrderTbl order = orderService.createOrder(username, items, req.getCouponCode());

        // ✅ Handle shipping address
        if (req.getShipping() != null) {
            OrderRequest.ShippingDto s = req.getShipping();
            ShippingAddress addr = new ShippingAddress();
            addr.setFullName(s.getFullName());
            addr.setPhone(s.getPhone());
            addr.setAddressLine1(s.getAddressLine1());
            addr.setAddressLine2(s.getAddressLine2());
            addr.setCity(s.getCity());
            addr.setState(s.getState());
            addr.setPincode(s.getPincode());
            addr.setLandmark(s.getLandmark());
            addr.setCountry(s.getCountry());
            addr.setOrder(order);

            shippingAddressRepository.save(addr);
            order.setShippingAddress(addr);
            orderRepository.save(order);
        }

        return ResponseEntity.status(HttpStatus.CREATED).body(order);
    }

    /** ✅ Unified fetch endpoint for all roles */
    @GetMapping("/orders")
    public ResponseEntity<?> getOrdersByRole(Authentication authentication) {
        if (authentication == null)
            return ResponseEntity.status(401).body("Unauthorized");

        String role = authentication.getAuthorities().iterator().next().getAuthority();
        String username = authentication.getName();

        System.out.println("Fetching orders for role: " + role + ", username: " + username);

        List<OrderTbl> orders = orderService.getOrdersBasedOnRole(username, role);

        if (orders == null || orders.isEmpty()) {
            return ResponseEntity.ok(Collections.emptyList());
        }

        return ResponseEntity.ok(orders);
    }

    /** ✅ Fetch orders for authenticated user */
    @GetMapping("/orders/my")
    public ResponseEntity<?> myOrders() {
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        if (a == null || a.getName() == null)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");

        String username = a.getName();
        return ResponseEntity.ok(orderService.getOrdersByUsername(username));
    }

    /** ✅ Fetch all orders (Admin + Sales allowed) */
    @GetMapping("/admin/orders")
    @PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_SALES')")
    public ResponseEntity<?> allOrders(Authentication authentication) {
        if (authentication == null)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");

        String username = authentication.getName();
        String role = authentication.getAuthorities().iterator().next().getAuthority();

        List<OrderTbl> orders = orderService.getOrdersBasedOnRole(username, role);
        return ResponseEntity.ok(orders);
    }

    /** ✅ Fetch all 'Placed' orders for Sales only (optional filter) */
    @GetMapping("/orders/placed")
    @PreAuthorize("hasAuthority('ROLE_SALES')")
    public ResponseEntity<List<OrderTbl>> getPlacedOrdersForSales() {
        List<OrderTbl> orders = orderService.findByStatus("PAYMENT DONE");
        return ResponseEntity.ok(orders);
    }

    /** ✅ Get orders for a specific user (Admin/Sales use) */
    @GetMapping("/orders/user/{userId}")
    @PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_SALES')")
    public ResponseEntity<List<OrderDto>> getOrdersForUser(@PathVariable Long userId) {
        List<OrderDto> orders = orderService.getOrdersForUser(userId);
        return ResponseEntity.ok(orders);
    }

    /** ✅ Update order status (ROLE_SALES only) */
    @PutMapping("/orders/{orderId}/status")
    @PreAuthorize("hasAuthority('ROLE_SALES')")
    public ResponseEntity<?> updateOrderStatus(
            @PathVariable Long orderId,
            @RequestBody Map<String, String> payload) {

        String newStatus = payload.get("status");
        String trackingNumber = payload.get("trackingNumber"); // ✅ capture from request

        if (newStatus == null || newStatus.isBlank()) {
            return ResponseEntity.badRequest().body("Status is required");
        }

        boolean updated = orderService.updateOrderStatus(orderId, newStatus, trackingNumber); // ✅ pass to service
        if (!updated) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Order not found");
        }

        return ResponseEntity.ok("✅ Order updated to " + newStatus +
                (trackingNumber != null && !trackingNumber.isBlank()
                        ? " with tracking number: " + trackingNumber
                        : ""));
    }
}
