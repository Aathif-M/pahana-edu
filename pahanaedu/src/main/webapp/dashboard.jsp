<%@ page session="true" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
    }
%>
<h2>Welcome, <%= ((com.pahanaedu.model.Admin)session.getAttribute("admin")).getUsername() %>!</h2>
<a href="LogoutServlet">Logout</a>
