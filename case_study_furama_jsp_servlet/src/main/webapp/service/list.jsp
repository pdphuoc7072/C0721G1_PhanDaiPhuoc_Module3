<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/9/2021
  Time: 9:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Service Management</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="../static/bootstrap-4.3.1-dist/css/bootstrap.min.css">
</head>
<body>
<div class="row">
    <div class="col-8">
        <h1>Service Management</h1>
    </div>
    <div class="col-4">
        <div>
            <p class="navbar-text" style="float:right">Welcome ${sessionScope.user.employeeName}</p>
        </div>
    </div>
</div>
<h4>
    <a href="/home">Back home</a>
</h4>

<table class="table table-striped">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Area</th>
        <th>Cost</th>
        <th>Max people</th>
        <th>Rent type</th>
        <th>Service type</th>
        <th>Standard room</th>
        <th>Description other convenience</th>
        <th>Pool area</th>
        <th>Number of floors</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope['serviceList']}" var="service">
        <tr>
            <td>${service.id}</td>
            <td>${service.name}</td>
            <td>${service.area}</td>
            <td>${service.cost}</td>
            <td>${service.maxPeople}</td>
            <td>
                <c:choose>
                    <c:when test="${service.rentTypeId == 1}">Năm</c:when>
                    <c:when test="${service.rentTypeId == 2}">Tháng</c:when>
                    <c:when test="${service.rentTypeId == 3}">Ngày</c:when>
                    <c:when test="${service.rentTypeId == 4}">Giờ</c:when>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${service.serviceTypeId == 1}">Villa</c:when>
                    <c:when test="${service.serviceTypeId == 2}">House</c:when>
                    <c:when test="${service.serviceTypeId == 3}">Room</c:when>
                </c:choose>
            </td>
            <td>${service.standardRoom}</td>
            <td>${service.descriptionOtherConvenience}</td>
            <td>${service.poolArea}</td>
            <td>${service.numberOfFloors}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="../static/bootstrap-4.3.1-dist/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>
