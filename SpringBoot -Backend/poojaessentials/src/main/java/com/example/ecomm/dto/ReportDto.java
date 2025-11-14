package com.example.ecomm.dto;

public class ReportDto {
    private Long id;
    private String name;
    private Long totalQuantity;

    public ReportDto(Long id, String name, Long totalQuantity) {
        this.id = id;
        this.name = name;
        this.totalQuantity = totalQuantity;
    }

    public Long getId() { return id; }
    public String getName() { return name; }
    public Long getTotalQuantity() { return totalQuantity; }

    public void setId(Long id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setTotalQuantity(Long totalQuantity) { this.totalQuantity = totalQuantity; }
}
