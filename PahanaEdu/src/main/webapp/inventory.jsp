<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pahanaedu.model.Inventory" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Inventory> items = (List<Inventory>) request.getAttribute("items");
    Inventory editItem = (Inventory) request.getAttribute("item");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Inventory - Pahana Edu</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="…" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="…" crossorigin="anonymous"></script>
    
    <style>
        body { font-family: Arial, sans-serif; background: #f9f9f9; }
        h2 { margin-bottom: 20px; margin-top:40px;}
        table { width: 100%; border-collapse: collapse; margin-bottom: 30px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #007bff; color: white; }
        
        input[type="text"], input[type="number"] {
            width: 100%; padding: 8px; margin: 6px 0 15px 0; border: 1px solid #ccc; border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #007bff; color: white; padding: 10px 16px; border: none; border-radius: 4px; cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        a.button {
            background-color: #dc3545; color: white; padding: 6px 12px; text-decoration: none; border-radius: 4px;
        }
        a.button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

<div class="top-row bg-dark">
<a href="dashboard.jsp" class="btn btn-primary back">&larr; Back to Dashboard</a>
</div>	

<div class="container">
<h2>Manage Books</h2>

<table class="custom-table">
    <thead>
    <tr>
        <th>ID</th>
        <th>Book Name</th>
        <th>Price</th>
        <th>Stock</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        if (items != null && !items.isEmpty()) {
            for (Inventory i : items) {
    %>
        <tr>
            <td><%= i.getId() %></td>
            <td><%= i.getBookName() %></td>
            <td>Rs. <%= String.format("%.2f", i.getPrice()) %></td>
            <td><%= i.getStock() %></td>
            <td>
                <a href="inventory?action=edit&id=<%= i.getId() %> " class="btn btn-info">Edit</a>
                <a href="inventory?action=delete&id=<%= i.getId() %>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
            </td>
        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="5" style="text-align:center;">No Books found.</td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>

<h3><%= (editItem != null) ? "Edit Book" : "Add New Book" %></h3>

<div class="form-div">
<form method="post" action="inventory">
    <% if (editItem != null) { %>
        <input type="hidden" name="id" value="<%= editItem.getId() %>"/>
    <% } %>

    <label>Book Name:</label><br/>
    <input class="custom-input" type="text" name="bookName" value="<%= (editItem != null) ? editItem.getBookName() : "" %>" required/><br/>

    <label>Price: (Rs)</label><br/>
    <input class="custom-input" type="number" name="price" step="0.01" min="0" value="<%= (editItem != null) ? editItem.getPrice() : "0.00" %>" required/><br/>

    <label>Stock:</label><br/>
    <input class="custom-input" type="number" name="stock" min="0" value="<%= (editItem != null) ? editItem.getStock() : "0" %>" required/><br/>

    <input class="custom-input" type="submit" value="<%= (editItem != null) ? "Update Item" : "Add Item" %>" />
</form>
</div>

</div>
</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/app.js"></script>
</html>
