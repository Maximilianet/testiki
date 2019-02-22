<%@ page import="ru.DBConnect" %><%--
  Created by IntelliJ IDEA.
  User: usern
  Date: 19.02.2019
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Куда я попал...</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>

  <body>

  <script type="text/javascript">
    function check() {
      if (document.register.name.value.length < 5){
        alert("Минимальное кол-во символов должно быть больше 5");
        return false;
      }
    }
  </script>

  <jsp:include page="header.jsp"></jsp:include>
  <div class="container">

    <br/><br/>
    <div class="item">
      <form action="loginDAO.jsp" name="register" onsubmit="return check()">
        <table cellpadding="10">
          <tr>
            <th colspan="2">Вход студентов</th>
          </tr>


          <tr>
            <td><b>Имя:</b></td>
            <td><input type="text" name="namelog" required></td>
          </tr>

          <tr>
            <td><b>Почта:</b></td>
            <td><input type="text" name="emaillog" required></td>
          </tr>

          <tr>
            <td colspan="2" align="center"><input type="submit" value="Войти"></td>
          </tr>
        </table>
      </form>

    </div>
    <div class="item">
      <form action="registerDAO.jsp" name="register" onsubmit="return check()">
        <table cellpadding="10">
          <tr>
            <th colspan="2">Регистрация студентов</th>
          </tr>

          <tr>
            <td><b>Имя:</b></td>
            <td><input type="text" name="name" required></td>
          </tr>

          <tr>
            <td><b>Почта:</b></td>
            <td><input type="email" name="email" required></td>
          </tr>

          <tr>
            <td colspan="2" align="center"><input type="submit" value="Зарегистрироваться"></td>
          </tr>
        </table>
      </form>

      <%
        String status = request.getParameter("status");

        if (status!=null){
          if (status.equals("false")){ %>
            <p style="color: red">Some error occurred!</p>
        <%}
          else if (status.equals("registered")){%>
            <p style="color: red">Email already registered!</p>
          <%}
          }
      %>
      <br/>
      <%
        if (DBConnect.getConnection() !=null){
          %><p style="color: green">Есть соединение с БД</p><%
        }else {
          %><p style = "color: red" >Соединения с БД нет</p ><%
        }
      %>

    </div>
  </div>

  </body>

</html>
