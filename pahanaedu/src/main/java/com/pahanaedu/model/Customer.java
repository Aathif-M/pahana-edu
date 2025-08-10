package com.pahanaedu.model;

public class Customer {
    private int accountNo;
    private String name;
    private String address;
    private String email;
    private String phone;
    
    // Constructor without accountNo (for insert)
    public Customer(String name, String address, String email, String phone) {
        this.name = name;
        this.name = address;
        this.email = email;
        this.phone = phone;
    }
    
    // Constructor with accountNo (for select/update)
    public Customer(int accountNo, String name, String address, String email, String phone) {
        this.accountNo = accountNo;
        this.name = name;
        this.name = address;
        this.email = email;
        this.phone = phone;
    }
    
    // Getters and Setters
    
    public int getAccountNo() {
        return accountNo;
    }
    
    public void setAccountNo(int accountNo) {
        this.accountNo = accountNo;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPhone() {
        return phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
}
