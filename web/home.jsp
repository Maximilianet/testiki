<%@ page import="ru.DBDetails" %><%--
  Created by IntelliJ IDEA.
  User: usern
  Date: 20.02.2019
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String email = (String) session.getAttribute("email");
    if (email == null){
        response.sendRedirect("index.jsp?status=false");
    }
%>

<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

    <jsp:include page="header.jsp"></jsp:include>

    <div id="section">
        <h2>Инструкция:</h2>
        <ul>
            <li>Всего вопросов: 15</li>
            <li>Время на выполнение: 20 минут</li>
            <li>Вопросы основаны на С и С++</li>
        </ul>

        <br/>
        <button id="start" style="width:80px;height:30px" onClick="parent.location='test.jsp'">Старт</button>
    </div>

</body>
</html>
