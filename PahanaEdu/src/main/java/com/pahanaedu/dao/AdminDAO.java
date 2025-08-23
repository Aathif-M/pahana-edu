package com.pahanaedu.dao;

import com.pahanaedu.model.Admin;
import com.pahanaedu.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {

    // Encrypt password using a simple hash (SHA-256)
    private String encryptPassword(String password) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes(java.nio.charset.StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1)
                    hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    // Register a new admin
    public boolean register(Admin admin) throws SQLException {
        String sql = "INSERT INTO admin (username, password) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, admin.getUsername());
            stmt.setString(2, encryptPassword(admin.getPassword()));
            int rows = stmt.executeUpdate();
            return rows > 0;
        }
    }

    // Authenticate admin login
    public Admin login(String username, String password) throws SQLException {
        String sql = "SELECT * FROM admin WHERE username = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String storedHash = rs.getString("password");
                    String inputHash = encryptPassword(password);
                    if (storedHash.equals(inputHash)) {
                        Admin admin = new Admin();
                        admin.setUsername(rs.getString("username"));
                        admin.setPassword(storedHash);
                        return admin;
                    }
                }
            }
        }
        return null;
    }
}
