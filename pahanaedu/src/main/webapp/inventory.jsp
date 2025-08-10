<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pahanaedu.model.Inventory" %>

<html>
<head>
    <title>Manage Inventory</title>
</head>
<body>
<h2>Inventory Management</h2>

<a href="dashboard">Back to Dashboard</a> | <a href="logout">Logout</a>

<!-- Form to add new inventory item -->
<h3>Add New Inventory Item</h3>
<form action="inventory" method="post">
    Item ID: <input type="text" name="item_id" required><br>
    Item Name: <input type="text" name="item_name" required><br>
    Quantity: <input type="number" name="quantity" required><br>
    Price: <input type="number" step="0.01" name="price" required><br>
    <input type="submit" value="Add Item">
</form>

<hr>

<h3>Inventory List</h3>
<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Item ID</th>
        <th>Item Name</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Actions</th>
    </tr>
    <%
        List<Inventory> items = (List<Inventory>) request.getAttribute("inventoryList");
        if (items != null) {
            for (Inventory item : items) {
    %>
    <tr>
        <td><%= item.getId() %></td>
        <td><%= item.getItemName() %></td>
        <td><%= item.getQuantity() %></td>
        <td><%= item.getPrice() %></td>
        <td>
            <a href="inventory?action=edit&item_id=<%= item.getId() %>">Edit</a> |
            <a href="inventory?action=delete&item_id=<%= item.getId() %>" onclick="return confirm('Delete this item?')">Delete</a>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>

</body>
</html>
