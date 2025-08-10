package com.pahanaedu.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.pahanaedu.model.Customer;

public class CustomerDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/pahana_edu_db"; // Update your DB URL
    private String jdbcUsername = "root"; // Update your DB username
    private String jdbcPassword = "root1234"; // Update your DB password
    
    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customer (name, address, email, phone) VALUES (?, ?, ?)";
    private static final String SELECT_CUSTOMER_BY_ID = "SELECT account_no, name, address, email, phone FROM customer WHERE account_no = ?";
    private static final String SELECT_ALL_CUSTOMERS = "SELECT * FROM customer";
    private static final String DELETE_CUSTOMER_SQL = "DELETE FROM customer WHERE account_no = ?";
    private static final String UPDATE_CUSTOMER_SQL = "UPDATE customer SET name = ?, address = ?, email = ?, phone = ? WHERE account_no = ?";
    
    protected Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException(e);
        }
        return connection;
    }
    
    public void insertCustomer(Customer customer) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL)) {
            
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getAddress());
            preparedStatement.setString(3, customer.getEmail());
            preparedStatement.setString(4, customer.getPhone());
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
    
    public Customer getCustomer(int accountNo) {
        Customer customer = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID)) {
            
            preparedStatement.setInt(1, accountNo);
            ResultSet rs = preparedStatement.executeQuery();
            
            if (rs.next()) {
                String name 	= rs.getString("name");
                String address 	= rs.getString("address");
                String email 	= rs.getString("email");
                String phone 	= rs.getString("phone");
                customer = new Customer(accountNo, name, address, email, phone);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customer;
    }
    
    public List<Customer> getAllCustomers() {
        List<Customer> customers = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMERS)) {
            
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()) {
                int accountNo 	= rs.getInt("account_no");
                String name 	= rs.getString("name");
                String address 	= rs.getString("address");
                String email 	= rs.getString("email");
                String phone 	= rs.getString("phone");
                customers.add(new Customer(accountNo, name, address, email, phone));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customers;
    }
    
    public boolean deleteCustomer(int accountNo) {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER_SQL)) {
            
            preparedStatement.setInt(1, accountNo);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowDeleted;
    }
    
    public boolean updateCustomer(Customer customer) {
        boolean rowUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_SQL)) {
            
            preparedStatement.setString(1, 	customer.getName());
            preparedStatement.setString(2, 	customer.getAddress());
            preparedStatement.setString(3, 	customer.getEmail());
            preparedStatement.setString(4, 	customer.getPhone());
            preparedStatement.setInt(	5, 	customer.getAccountNo());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowUpdated;
    }
    
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
