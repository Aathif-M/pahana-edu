package com.pahanaedu.model;

public class Inventory {
    private int id;
    private String itemName;
    private int quantity;
    private double price;
    
    // Constructor without id (for insert)
    public Inventory(String itemName, int quantity, double price) {
        this.itemName = itemName;
        this.quantity = quantity;
        this.price = price;
    }
    
    // Constructor with id (for select/update)
    public Inventory(int id, String itemName, int quantity, double price) {
        this.id = id;
        this.itemName = itemName;
        this.quantity = quantity;
        this.price = price;
    }
    
    // Getters and Setters
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getItemName() {
        return itemName;
    }
    
    public void setItemName(String itemName) {
        this.itemName = itemName;
    }
    
    public int getQuantity() {
        return quantity;
    }
    
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public double getPrice() {
        return price;
    }
    
    public void setPrice(double price) {
        this.price = price;
    }
}
