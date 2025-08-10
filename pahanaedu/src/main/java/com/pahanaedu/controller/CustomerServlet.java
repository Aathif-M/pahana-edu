package com.pahanaedu.controller;

import java.io.IOException;
import java.util.List;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/customers")
public class CustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private CustomerDAO customerDAO;
    
    @Override
    public void init() {
        customerDAO = new CustomerDAO(); // make sure your DAO class exists and handles DB
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action == null) action = "list";
        
        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "insert":
                insertCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "update":
                updateCustomer(request, response);
                break;
            default:
                listCustomers(request, response);
                break;
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        doGet(request, response);
    }
    
    private void listCustomers(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        List<Customer> listCustomer = customerDAO.getAllCustomers();
        request.setAttribute("listCustomer", listCustomer);
        request.getRequestDispatcher("customer-list.jsp").forward(request, response);
    }
    
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        request.getRequestDispatcher("customer-form.jsp").forward(request, response);
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        int accountNo = Integer.parseInt(request.getParameter("account_no"));
        Customer existingCustomer = customerDAO.getCustomer(accountNo);
        request.setAttribute("customer", existingCustomer);
        request.getRequestDispatcher("customer-form.jsp").forward(request, response);
    }
    
    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) 
        throws IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        // Add other fields as per your DB
        
        Customer newCustomer = new Customer(name, address, email, phone);
        customerDAO.insertCustomer(newCustomer);
        response.sendRedirect("customers");
    }
    
    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) 
        throws IOException {
        int accountNo = Integer.parseInt(request.getParameter("account_no"));
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        
        Customer customer = new Customer(accountNo, name, address, email, phone);
        customerDAO.updateCustomer(customer);
        response.sendRedirect("customers");
    }
    
    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) 
        throws IOException {
        int accountNo = Integer.parseInt(request.getParameter("account_no"));
        customerDAO.deleteCustomer(accountNo);
        response.sendRedirect("customers");
    }
}
