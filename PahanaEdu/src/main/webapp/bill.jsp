<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.pahanaedu.model.Customer" %>
        <%@ page import="com.pahanaedu.model.Inventory" %>
            <%@ page import="java.util.List" %>

                <% if (session.getAttribute("admin")==null) { response.sendRedirect("login.jsp"); return; } Customer
                    customer=(Customer) request.getAttribute("customer"); Double totalBill=(Double)
                    request.getAttribute("totalBill"); List<Inventory> books = (List<Inventory>)
                        request.getAttribute("books");
                        %>

                        <!DOCTYPE html>
                        <html>

                        <head>
                            <title>Calculate Bill - Pahana Edu</title>
                            <link rel="stylesheet" type="text/css"
                                href="${pageContext.request.contextPath}/css/custom.css">
                            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
                                rel="stylesheet" integrity="…" crossorigin="anonymous">
                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                                integrity="…" crossorigin="anonymous"></script>

                            <style>
                                body {
                                    font-family: Arial, sans-serif;
                                    background: #f9f9f9;
                                }

                                h2 {
                                    margin-bottom: 20px;
                                    margin-top: 40px;
                                }

                                input[type="text"],
                                input[type="number"] {
                                    width: 100%;
                                    padding: 8px;
                                    margin: 6px 0 15px 0;
                                    border: 1px solid #ccc;
                                    border-radius: 4px;
                                }

                                input[type="submit"] {
                                    background-color: #007bff;
                                    color: white;
                                    padding: 10px 16px;
                                    border: none;
                                    border-radius: 4px;
                                    cursor: pointer;
                                }

                                input[type="submit"]:hover {
                                    background-color: #0056b3;
                                }

                                a.button {
                                    background-color: #dc3545;
                                    color: white;
                                    padding: 6px 12px;
                                    text-decoration: none;
                                    border-radius: 4px;
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
                                <h2>Calculate Customer Bill</h2>

                                <div class="row">
                                    <div class="form-div col-6 p-4">
                                        <form method="post" action="bill">

                                            <label>Account Number:</label>
                                            <input class="custom-input" type="number" name="accountNumber"
                                                value="<%= (customer != null) ? customer.getAccountNumber() : "" %>"
                                                required autofocus />

                                            <label>Name:</label>
                                            <input class="custom-input" type="text" name="name"
                                                value="<%= (customer != null) ? customer.getName() : "" %>" />

                                            <label>Address:</label>
                                            <input class="custom-input" type="text" name="address"
                                                value="<%= (customer != null) ? customer.getAddress() : "" %>" />

                                            <label>Telephone:</label>
                                            <input class="custom-input" type="number" name="telephone"
                                                value="<%= (customer != null) ? customer.getTelephone() : "" %>" />

                                            <h3>Select Books & Quantity</h3>
                                            <% if (books !=null && !books.isEmpty()) { for (Inventory book : books) { %>
                                                <label>
                                                    <%= book.getBookName() %> (Rs. <%= book.getPrice() %>) - Stock: <%=
                                                                book.getStock() %>
                                                </label>
                                                <input class="custom-input" type="number"
                                                    name="quantity_<%= book.getId() %>" min="0"
                                                    max="<%= book.getStock() %>" value="0" />
                                                <% } } %>

                                                    <input class="custom-input" type="submit" value="Calculate Bill" />
                                        </form>
                                    </div>

                                    <% if (customer !=null && totalBill !=null && books !=null && !books.isEmpty()) { %>
                                        <div class="col-5">
                                            <div class="bill-result">
                                                <h3>Billing Details</h3>
                                                <p><strong>Account Number:</strong>
                                                    <%= customer.getAccountNumber() %>
                                                </p>
                                                <p><strong>Name:</strong>
                                                    <%= customer.getName() %>
                                                </p>

                                                <h4>Books Purchased</h4>
                                                <table>
                                                    <tr>
                                                        <th>Book Name</th>
                                                        <th>Price</th>
                                                        <th>Quantity</th>
                                                        <th>Subtotal</th>
                                                    </tr>
                                                    <% for (Inventory book : books) { double subtotal=book.getPrice() *
                                                        book.getQuantity(); if (book.getQuantity()> 0) {
                                                        %>
                                                        <tr>
                                                            <td>
                                                                <%= book.getBookName() %>
                                                            </td>
                                                            <td>Rs. <%= String.format("%.2f", book.getPrice()) %>
                                                            </td>
                                                            <td>
                                                                <%= book.getQuantity() %>
                                                            </td>
                                                            <td>Rs. <%= String.format("%.2f", subtotal) %>
                                                            </td>
                                                        </tr>
                                                        <% } } %>
                                                </table>

                                                <h4 class="mt-3"><strong>Total Bill:</strong> Rs. <%=
                                                        String.format("%.2f", totalBill) %>
                                                </h4>
                                            </div>
                                        </div>
                                        <% } %>
                                </div>
                            </div>
                        </body>

                        <script type="text/javascript" src="${pageContext.request.contextPath}/js/app.js"></script>

                        </html>