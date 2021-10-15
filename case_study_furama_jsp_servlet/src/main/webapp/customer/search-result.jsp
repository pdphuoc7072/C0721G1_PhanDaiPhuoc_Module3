<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/10/2021
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Customer Management</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="../static/bootstrap-4.3.1-dist/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
    <jsp:include page="../common/header-navbar.jsp"></jsp:include>
    <div class="row">
        <div class="col-2 bg-light">
            <jsp:include page="../common/left-sidebar.jsp"></jsp:include>
        </div>
        <div class="col-10">
            <a href="/customer" class="btn btn-dark">Back to list all customers</a>
            <div class="row">
                <c:if test="${empty customerList}">
                    <h3 style="color: red">No results were found</h3>
                </c:if>
                <c:if test="${not empty customerList}">
                    <h3>
                        <c:if test='${requestScope["message"] != null}'>
                            <span class="message">${requestScope["message"]}</span>
                        </c:if>
                    </h3>
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Customer code</th>
                            <th>Name</th>
                            <th>Birthday</th>
                            <th>Gender</th>
                            <th>Id card</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Customer type</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope['customerList']}" var="customer">
                            <tr>
                                <td>${customer.id}</td>
                                <td>${customer.customerCode}</td>
                                <td>${customer.name}</td>
                                <td>${customer.birthday}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${customer.gender == 1}">Nam</c:when>
                                        <c:when test="${customer.gender == 2}">Nữ</c:when>
                                        <c:otherwise>LGBT</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${customer.idCard}</td>
                                <td>${customer.phone}</td>
                                <td>${customer.email}</td>
                                <td>${customer.address}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${customer.customerTypeId == 1}">Diamond</c:when>
                                        <c:when test="${customer.customerTypeId == 2}">Platinium</c:when>
                                        <c:when test="${customer.customerTypeId == 3}">Gold</c:when>
                                        <c:when test="${customer.customerTypeId == 4}">Silver</c:when>
                                        <c:when test="${customer.customerTypeId == 5}">Member</c:when>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
    </div>
</div>

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
