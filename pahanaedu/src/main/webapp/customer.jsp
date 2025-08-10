<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pahanaedu.model.Customer" %>

<html>
<head>
    <title>Manage Customers</title>
</head>
<body>
<h2>Customer Management</h2>

<a href="dashboard">Back to Dashboard</a> | <a href="logout">Logout</a>

<!-- Form to add new customer -->
<h3>Add New Customer</h3>
<form action="customer" method="post">
    Account No: <input type="text" name="account_no" required><br>
    Name: <input type="text" name="name" required><br>
    Email: <input type="email" name="email" required><br>
    Phone: <input type="text" name="phone" required><br>
    Units Consumed: <input type="number" name="units_consumed" required><br>
    <input type="submit" value="Add Customer">
</form>

<hr>

<h3>Customer List</h3>
<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Account No</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Units Consumed</th>
        <th>Actions</th>
    </tr>
    <%
        List<Customer> customers = (List<Customer>) request.getAttribute("customerList");
        if (customers != null) {
            for (Customer c : customers) {
    %>
    <tr>
        <td><%= c.getAccountNo() %></td>
        <td><%= c.getName() %></td>
        <td><%= c.getEmail() %></td>
        <td><%= c.getPhone() %></td>
        <td><%= c.getUnitsConsumed() %></td>
        <td>
            <a href="customer?action=edit&account_no=<%= c.getAccountNo() %>">Edit</a> |
            <a href="customer?action=delete&account_no=<%= c.getAccountNo() %>" onclick="return confirm('Delete this customer?')">Delete</a>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>

</body>
</html>
