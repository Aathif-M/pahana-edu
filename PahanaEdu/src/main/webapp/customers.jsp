<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pahanaedu.model.Customer" %>
<%
    // Check if admin logged in
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
    Customer editCustomer = (Customer) request.getAttribute("customer");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Customers - Pahana Edu</title>
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
<h2>Manage Customers</h2>

<table class="custom-table">
    <thead>
    <tr>
        <th>Account Number</th>
        <th>Name</th>
        <th>Address</th>
        <th>Telephone</th>
        <th>Units Consumed</th>
        <th>Purchased Books</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        if (customers != null && !customers.isEmpty()) {
            for (Customer c : customers) {
    %>
        <tr>
            <td><%= c.getAccountNumber() %></td>
<td><%= c.getName() %></td>
<td><%= c.getAddress() %></td>
<td><%= c.getTelephone() %></td>
<td><%= c.getUnitsConsumed() %></td>
<td><%= c.getPurchasedBooks() %></td>   <!-- ✅ show JSON string -->
<td>
    <a href="customers?action=edit&accountNumber=<%= c.getAccountNumber() %>" class="btn btn-info">Edit</a>
    <a href="customers?action=delete&accountNumber=<%= c.getAccountNumber() %>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this customer?');">Delete</a>
</td>

        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="7" style="text-align:center;">No customers found.</td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>


<h2><%= (editCustomer != null) ? "Edit Customer" : "Add New Customer" %></h3>

<div class="form-div">
<form method="post" action="customers">
    <label>Account Number:</label><br/>
    <input class="custom-input" type="number" name="accountNumber" value="<%= (editCustomer != null) ? editCustomer.getAccountNumber() : "" %>" <%= (editCustomer != null) ? "readonly" : "required" %> /><br/>

    <label>Name:</label><br/>
    <input class="custom-input" type="text" name="name" value="<%= (editCustomer != null) ? editCustomer.getName() : "" %>" required /><br/>

    <label>Address:</label><br/>
    <input class="custom-input" type="text" name="address" value="<%= (editCustomer != null) ? editCustomer.getAddress() : "" %>" required /><br/>

    <label>Telephone:</label><br/>
    <input class="custom-input" type="number" name="telephone" value="<%= (editCustomer != null) ? editCustomer.getTelephone() : "" %>" required /><br/>

    <label>Units Consumed:</label><br/>
    <input class="custom-input" type="number" name="unitsConsumed" min="0" value="<%= (editCustomer != null) ? editCustomer.getUnitsConsumed() : "0" %>" required disabled /><br/>

    <input class="custom-input" type="submit" value="<%= (editCustomer != null) ? "Update Customer" : "Add Customer" %>" />
</form>
</div>
</div>

</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/app.js"></script>
</html>
