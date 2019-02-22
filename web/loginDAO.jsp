<%@ page import="ru.UserDAO" %>
<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 22.02.2019
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = request.getParameter("namelog");
    String email = request.getParameter("emaillog");
    String result = UserDAO.loginUser(name, email);

    if (result.equals("true")){
        Random random = new Random();
        int i = random.nextInt(3)+1;
        session.setAttribute("email", email);
        session.setAttribute("set", ""+i);
        response.sendRedirect("home.jsp");
    }

    if (result.equals("false")){
        response.sendRedirect("index.jsp?status=false");
    }
%>
