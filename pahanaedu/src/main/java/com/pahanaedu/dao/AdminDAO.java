package com.pahanaedu.dao;

import com.pahanaedu.model.Admin;
import java.sql.*;

public class AdminDAO {

    public boolean registerAdmin(Admin admin) {
        String sql = "INSERT INTO admin (username, password) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, admin.getUsername());
            stmt.setString(2, admin.getPassword()); // Later: hash password
            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Admin loginAdmin(String username, String password) {
        String sql = "SELECT * FROM admin WHERE username=? AND password=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Admin admin = new Admin();
                admin.setAdminId(rs.getInt("admin_id"));
                admin.setUsername(rs.getString("username"));
                return admin;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
