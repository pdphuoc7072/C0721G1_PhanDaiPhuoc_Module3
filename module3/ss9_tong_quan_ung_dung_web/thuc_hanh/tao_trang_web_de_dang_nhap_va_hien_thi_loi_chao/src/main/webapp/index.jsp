<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/5/2021
  Time: 9:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <style type="text/css">
      .login {
        height: 200px;
        width: 250px;
        margin: 0;
        padding: 15px;
        border: 1px solid #CCC;
      }
      .login input {
        padding: 5px;
        margin: 5px;
      }
    </style>
  </head>
  <body>
  <form method="post" action="/login">
    <div class="login">
      <h2>Login</h2>
      <input type="text" name="username" size="30" placeholder="Please enter user name">
      <input type="password" name="password" size="30" placeholder="Please enter password">
      <input type="submit" value="Sign in">
    </div>
  </form>
  </body>
</html>
