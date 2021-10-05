<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/5/2021
  Time: 9:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Simple Dictionary</title>
    <link rel="stylesheet" type="text/css" href="index.css">
  </head>
  <body>
  <h2>Vietnamese Dictionary</h2>
  <form method="post" action="/translate">
    <input  id="input_word" type="text" name="text_search" placeholder="Enter your word: "><br>
    <input type="submit" id="submit" value="Search">
  </form>
  </body>
</html>
