<!DOCTYPE html>
<html>

<head>
    <title>Pahana Edu - Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="…"
        crossorigin="anonymous">
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

        .mt-3 {
            margin-top: 50px !important;
        }
    </style>
</head>

<body>

    <header class="bg-dark">
        <h1 class="text-light">Help Center
        </h1>
    </header>

    <a href="login.jsp" class="logout btn btn-primary">Login</a>

    <div class="container p-5">
        <p>Here you will find help if you are a new user</p>

        <h3 class="mt-3">Login and Register</h3>
        <p>Don't have an account? <a href="register.jsp">Register here</a></p>
        <p>After creating your account, you can log in through <a href="login.jsp">here</a> and access all features.
        </p>

        <h3 class="mt-3">Dashboard</h3>
        <p>On the dashboard, You will find find 3 main sections: <strong>Manage Customers, Manage Books, and Calculate
                Bills.</strong></br>
            And on the top right corner, you will find a logout button to log out of your account.</p>

        <h3 class="mt-3">Manage Customers</h3>
        <p>To add, edit or delete customers, you can navigate to the "Manage Customers" section on the dashboard.</br>
            Here, you can add new customers by filling out the form with their details, edit existing customer
            information, or delete customers as needed from the list of available customers</p>
        </p>

        <h3 class="mt-3">Manage Books</h3>
        <p>To manage books, go to the "Manage Books" section where you can add, edit, or remove books from the
            inventory.</br>
            Here, you can add new books by filling out the form with their details, edit existing book information, or
            delete books as needed from the list of available books.</p>

        <h3 class="mt-3">Calculate Bills</h3>
        <p>Finally, the "Calculate Bills" section allows you to create a new customer if need be or generate and view
            bills for existing customers customers.
            During which you will be able to select a customer, add books to the bill, and calculate the total amount
            due.</p>


    </div>

</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/app.js"></script>

</html>