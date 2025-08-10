package com.pahanaedu.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.pahanaedu.model.Inventory;

public class InventoryDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/pahana_edu_db"; // Update your DB URL
    private String jdbcUsername = "root"; // Update your DB username
    private String jdbcPassword = "root1234	"; // Update your DB password
    
    private static final String INSERT_INVENTORY_SQL = "INSERT INTO inventory (item_name, quantity, price) VALUES (?, ?, ?)";
    private static final String SELECT_INVENTORY_BY_ID = "SELECT id, item_name, quantity, price FROM inventory WHERE id = ?";
    private static final String SELECT_ALL_INVENTORY = "SELECT * FROM inventory";
    private static final String DELETE_INVENTORY_SQL = "DELETE FROM inventory WHERE id = ?";
    private static final String UPDATE_INVENTORY_SQL = "UPDATE inventory SET item_name = ?, quantity = ?, price = ? WHERE id = ?";
    
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
    
    public void insertInventory(Inventory inventory) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INVENTORY_SQL)) {
            
            preparedStatement.setString(1, inventory.getItemName());
            preparedStatement.setInt(2, inventory.getQuantity());
            preparedStatement.setDouble(3, inventory.getPrice());
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
    
    public Inventory getInventory(int id) {
        Inventory inventory = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_INVENTORY_BY_ID)) {
            
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            
            if (rs.next()) {
                String itemName = rs.getString("item_name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                inventory = new Inventory(id, itemName, quantity, price);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return inventory;
    }
    
    public List<Inventory> getAllInventory() {
        List<Inventory> inventoryList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_INVENTORY)) {
            
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()) {
                int id = rs.getInt("id");
                String itemName = rs.getString("item_name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                inventoryList.add(new Inventory(id, itemName, quantity, price));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return inventoryList;
    }
    
    public boolean deleteInventory(int id) {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_INVENTORY_SQL)) {
            
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowDeleted;
    }
    
    public boolean updateInventory(Inventory inventory) {
        boolean rowUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_INVENTORY_SQL)) {
            
            preparedStatement.setString(1, inventory.getItemName());
            preparedStatement.setInt(2, inventory.getQuantity());
            preparedStatement.setDouble(3, inventory.getPrice());
            preparedStatement.setInt(4, inventory.getId());
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
