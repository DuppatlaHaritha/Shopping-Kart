package com.example.ecomm.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "products")
public class Product {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Column(columnDefinition = "TEXT")
    private String description;

    private double price;
    
    private String imagePath;
    private Double newPrice; // nullable, optional offer price



   // private String imageUrl;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    private LocalDateTime createdAt = LocalDateTime.now();

    public Product() {}

    // getters/setters
    public Long getId(){return id;}
    public void setId(Long id){this.id=id;}
    public String getName(){return name;}
    public void setName(String name){this.name=name;}
    public String getDescription(){return description;}
    public void setDescription(String description){this.description=description;}
    public double getPrice(){return price;}
    public void setPrice(double price){this.price=price;}
    //public String getImageUrl(){return imageUrl;}
    //public void setImageUrl(String imageUrl){this.imageUrl=imageUrl;}
    
    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }
    

    public Double getNewPrice() {
		return newPrice;
	}

	public void setNewPrice(Double newPrice) {
		this.newPrice = newPrice;
	}

	public Category getCategory(){return category;}
    public void setCategory(Category category){this.category=category;}
    public LocalDateTime getCreatedAt(){return createdAt;}
    public void setCreatedAt(LocalDateTime createdAt){this.createdAt=createdAt;}
}
