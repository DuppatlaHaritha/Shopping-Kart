/*
package com.example.ecomm.model;

import jakarta.persistence.*;

@Entity
@Table(name = "order_items")
public class OrderItem {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private OrderTbl order;

    @ManyToOne
    private Product product;

    private Integer quantity;

    private Double price;

    public OrderItem() {}

    // getters/setters
    public Long getId(){return id;}
    public void setId(Long id){this.id=id;}
    public OrderTbl getOrder(){return order;}
    public void setOrder(OrderTbl order){this.order=order;}
    public Product getProduct(){return product;}
    public void setProduct(Product product){this.product=product;}
    public Integer getQuantity(){return quantity;}
    public void setQuantity(Integer quantity){this.quantity=quantity;}
    public Double getPrice(){return price;}
    public void setPrice(Double price){this.price=price;}
}
*/
/*
package com.example.ecomm.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;

@Entity
@Table(name = "order_items")
public class OrderItem {
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "order_id")
    private OrderTbl order;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    private Integer quantity;

    private Double price;

    public OrderItem() {}

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public OrderTbl getOrder() { return order; }
    public void setOrder(OrderTbl order) { this.order = order; }

    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; }

    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }

    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }
}
*/

/*
package com.example.ecomm.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;

@Entity
@Table(name = "order_items")
public class OrderItem {
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "order_id")
    private OrderTbl order;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    private Integer quantity;

    private Double price;

    // ✅ New column for storing product name (denormalized for easy access)
    private String productName;

    public OrderItem() {}

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public OrderTbl getOrder() { return order; }
    public void setOrder(OrderTbl order) { this.order = order; }

    public Product getProduct() { return product; }
    public void setProduct(Product product) {
        this.product = product;
        // Automatically set product name when product is assigned
        if (product != null) {
            this.productName = product.getName();
        }
    }

    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }

    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }
}
*/



/*
package com.example.ecomm.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;

@Entity
@Table(name = "order_items")
public class OrderItem {
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "order_id")
    private OrderTbl order;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    private Integer quantity;

    private Double price;

    // ✅ New column for storing product name (denormalized for easy access)
    private String productName;

    public OrderItem() {}

    // Getters and Setters
    public Long getId() { 
        return id; 
    }

    public void setId(Long id) { 
        this.id = id; 
    }

    public OrderTbl getOrder() { 
        return order; 
    }

    public void setOrder(OrderTbl order) { 
        this.order = order; 
    }

    public Product getProduct() { 
        return product; 
    }

    // ✅ Updated setter for product
    public void setProduct(Product product) {
        this.product = product;
        if (product != null) {
            this.productName = product.getName();
        }
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

    public String getProductName() { 
        return productName; 
    }

    public void setProductName(String productName) { 
        this.productName = productName; 
    }
}
*/



package com.example.ecomm.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;

@Entity
@Table(name = "order_items")
public class OrderItem {

    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @JsonBackReference // ✅ prevents recursion with OrderTbl
    @ManyToOne
    @JoinColumn(name = "order_id")
    private OrderTbl order;

    @ManyToOne
    @JoinColumn(name = "product_id")
    @JsonIgnoreProperties({"orderItems", "category", "description"}) // ✅ avoids deep product recursion
    private Product product;

    private Integer quantity;

    private Double price;

    // ✅ New column for storing product name (denormalized for easy access)
    private String productName;

    public OrderItem() {}

    // Getters and Setters
    public Long getId() { 
        return id; 
    }

    public void setId(Long id) { 
        this.id = id; 
    }

    public OrderTbl getOrder() { 
        return order; 
    }

    public void setOrder(OrderTbl order) { 
        this.order = order; 
    }

    public Product getProduct() { 
        return product; 
    }

    // ✅ Updated setter for product
    public void setProduct(Product product) {
        this.product = product;
        if (product != null) {
            this.productName = product.getName();
        }
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

    public String getProductName() { 
        return productName; 
    }

    public void setProductName(String productName) { 
        this.productName = productName; 
    }
}
