<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/10/2021
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Contract detail Management</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="../static/bootstrap-4.3.1-dist/css/bootstrap.min.css">
</head>
<body>
<h1>Contract detail Management</h1>
<h4>
    <a href="/service-detail">Back service detail</a>
</h4>

<table class="table table-striped">
    <thead>
    <tr>
        <th>Id</th>
        <th>Contract Id</th>
        <th>Attach service</th>
        <th>Quantity</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope['contractDetailList']}" var="contract_detail">
        <tr>
            <td>${contract_detail.id}</td>
            <td>${contract_detail.contractId}</td>
            <td>
                <c:forEach items="${requestScope['attachServiceList']}" var="attach_service">
                    <c:if test="${contract_detail.attachServiceId == attach_service.id}">
                        ${attach_service.name}
                    </c:if>
                </c:forEach>
            </td>
            <td>${contract_detail.quantity}</td>
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
