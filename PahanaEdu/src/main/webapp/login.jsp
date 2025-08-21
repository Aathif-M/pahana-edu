<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Pahana Edu - Admin Login</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="…" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="…"
            crossorigin="anonymous"></script>

        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                height: 100vh;
                background-color: #ccc;
            }

            h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #fff;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }

            input[type="submit"] {
                width: 100%;
                background: #007bff;
                border: none;
                padding: 10px;
                color: white;
                font-size: 16px;
                cursor: pointer;
                border-radius: 4px;
            }

            input[type="submit"]:hover {
                background: #0056b3;
            }

            .error {
                color: red;
                margin-bottom: 15px;
                text-align: center;
            }
        </style>
    </head>

    <body>
    
    <a href="${pageContext.request.contextPath}/help-center.jsp" class="help btn btn-info back">Need Help?</a>

        <div class="login-register-container">
            <h2>Pahana Edu Login</h2>

            <form action="login" method="post">
                <input type="text" name="username" placeholder="Username" class="custom-input" required autofocus />
                <input type="password" name="password" placeholder="Password" class="custom-input" required />
                <input type="submit" value="Login" class="custom-input" />
            </form>

            <div class="error">
                <% String errorMessage=(String) request.getAttribute("errorMessage"); if (errorMessage !=null) {
                    out.print(errorMessage); } %>
            </div>

            <div class="register-login-link">
                <a href="register.jsp">Don't have an account? Register here</a>
            </div>
        </div>

    </body>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/app.js"></script>

    </html>