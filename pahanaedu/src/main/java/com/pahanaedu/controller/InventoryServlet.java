package com.pahanaedu.controller;

import java.io.IOException;
import java.util.List;

import com.pahanaedu.dao.InventoryDAO;
import com.pahanaedu.model.Inventory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/inventory")
public class InventoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private InventoryDAO inventoryDAO;
    
    @Override
    public void init() {
        inventoryDAO = new InventoryDAO(); // make sure this DAO class exists and manages DB
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
                insertInventory(request, response);
                break;
            case "delete":
                deleteInventory(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "update":
                updateInventory(request, response);
                break;
            default:
                listInventory(request, response);
                break;
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        doGet(request, response);
    }
    
    private void listInventory(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        List<Inventory> listInventory = inventoryDAO.getAllInventory();
        request.setAttribute("listInventory", listInventory);
        request.getRequestDispatcher("inventory-list.jsp").forward(request, response);
    }
    
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        request.getRequestDispatcher("inventory-form.jsp").forward(request, response);
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Inventory existingInventory = inventoryDAO.getInventory(id);
        request.setAttribute("inventory", existingInventory);
        request.getRequestDispatcher("inventory-form.jsp").forward(request, response);
    }
    
    private void insertInventory(HttpServletRequest request, HttpServletResponse response) 
        throws IOException {
        String itemName = request.getParameter("item_name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        
        Inventory newInventory = new Inventory(itemName, quantity, price);
        inventoryDAO.insertInventory(newInventory);
        response.sendRedirect("inventory");
    }
    
    private void updateInventory(HttpServletRequest request, HttpServletResponse response) 
        throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String itemName = request.getParameter("item_name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        
        Inventory inventory = new Inventory(id, itemName, quantity, price);
        inventoryDAO.updateInventory(inventory);
        response.sendRedirect("inventory");
    }
    
    private void deleteInventory(HttpServletRequest request, HttpServletResponse response) 
        throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        inventoryDAO.deleteInventory(id);
        response.sendRedirect("inventory");
    }
}
