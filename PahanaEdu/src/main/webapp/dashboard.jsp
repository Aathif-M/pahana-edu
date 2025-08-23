<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pahanaedu.model.Admin" %>
<% Admin admin=(Admin) session.getAttribute("admin"); 
	if (admin==null) { response.sendRedirect("login.jsp");  
	return; 
	} 
	%>
            <!DOCTYPE html>
            <html>

            <head>
                <title>Pahana Edu - Admin Dashboard</title>
                <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom.css">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="…" crossorigin="anonymous">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="…"
                    crossorigin="anonymous"></script>


                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background: #f9f9f9;
                    }

                    header {
                        background: #212121;
                        color: white;
                        padding: 15px;
                        text-align: center;
                    }

                    .logout {
                        position: absolute;
                        top: 20px;
                        right: 20px;
                        /* background: linear-gradient(0deg, #333333 0%, #595959 100%); */
                        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
                        color: white;
                        padding: 8px 12px;
                        text-decoration: none;
                        border-radius: 4px;
                    }

                    .logout:hover {
                        background: linear-gradient(0deg, #282828 40%, #595959 140%);
                        color: #fff;
                        text-decoration: none;
                    }

                    nav {
                        background: #343a40;
                        padding: 10px;
                        display: flex;
                        justify-content: center;
                        gap: 20px;
                    }

                    h2 {
                        border-radius: 20px 20px 0px 0px;
                    }

                    nav a {
                        color: white;
                        text-decoration: none;
                        padding: 8px 15px;
                        border-radius: 4px;
                    }


                    nav a:hover {
                        background: #495057;
                    }
                </style>
            </head>

            <body>

                <header class="bg-dark">
                    <h1 class="text-light">Welcome, <%= admin.getUsername() %>
                    </h1>
                </header>

                <a href="logout" class="logout btn btn-danger">Logout</a>

                <main>
                    <h2 class="text-light bg-dark p-4">
                        Admin Dashboard - Pahana Edu
                    </h2>
                    <div class="row p-3">
                        <div class="col-4 p-3">
                            <a href="customers" class="dashboard-link m-2 liquid-glass">Manage Customers</a>
                        </div>
                        <div class="col-4 p-3">
                            <a href="inventory" class="dashboard-link m-2 liquid-glass">Manage Books</a>
                        </div>
                        <div class="col-4 p-3">
                            <a href="bill" class="dashboard-link m-2 liquid-glass">Calculate Bills</a>
                        </div>
                    </div>
                </main>

            </body>

            <script type="text/javascript" src="${pageContext.request.contextPath}/js/app.js"></script>

            </html>