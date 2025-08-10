package com.pahanaedu.controller;

import com.pahanaedu.dao.AdminDAO;
import com.pahanaedu.model.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Admin admin = new Admin(username, password);
        AdminDAO dao = new AdminDAO();

        if (dao.registerAdmin(admin)) {
            response.sendRedirect("admin_login.jsp");
        } else {
            response.sendRedirect("admin_register.jsp?error=1");
        }
    }
}
