package com.pahanaedu.controller;

import com.pahanaedu.dao.AdminDAO;
import com.pahanaedu.model.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AdminDAO dao = new AdminDAO();
        Admin admin = dao.loginAdmin(username, password);

        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("admin_login.jsp?error=1");
        }
    }
}
