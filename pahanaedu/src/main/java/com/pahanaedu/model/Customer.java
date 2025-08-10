package com.pahanaedu.model;

public class Customer {
    private int accountNo;
    private String name;
    private String address;
    private String email;
    private String phone;
    private int units_consumed;
    
    // Constructor without accountNo (for insert)
    public Customer(String name, String address, String email, String phone, int units_consumed) {
        this.name = name;
        this.name = address;
        this.email = email;
        this.phone = phone;
        this.units_consumed = units_consumed;
    }
    
    // Constructor with accountNo (for select/update)
    public Customer(int accountNo, String name, String address, String email, String phone, int units_consumed) {
        this.accountNo = accountNo;
        this.name = name;
        this.name = address;
        this.email = email;
        this.phone = phone;
        this.units_consumed = units_consumed;
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
    
    public int getUnitsConsumed() {
        return units_consumed;
    }
    
    public void setUnitsConsumed(int units_consumed) {
        this.units_consumed = units_consumed;
    }
}
