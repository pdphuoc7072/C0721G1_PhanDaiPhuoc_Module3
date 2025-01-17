<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/10/2021
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Employee Management</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" type="text/css" href="/static/bootstrap-4.3.1-dist/css/bootstrap.min.css">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="../common/header-navbar.jsp"></jsp:include>
    <div class="row">
        <div class="col-2 bg-light">
            <jsp:include page="../common/left-sidebar.jsp"></jsp:include>
        </div>
        <div class="col-10">
            <a href="/employee" class="btn btn-dark">Back to list all employees</a>
            <div class="row">
                <c:if test="${empty employeeList}">
                    <h3 style="color: red">No results were found</h3>
                </c:if>
                <c:if test="${not empty employeeList}">
                    <h3>
                        <c:if test='${requestScope["message"] != null}'>
                            <span class="message">${requestScope["message"]}</span>
                        </c:if>
                    </h3>
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Birthday</th>
                            <th>Id Card</th>
                            <th>Salary</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Position</th>
                            <th>Education Degree</th>
                            <th>Division</th>
                            <th>Username</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope['employeeList']}" var="employee">
                            <tr>
                                <td>${employee.id}</td>
                                <td>${employee.name}</td>
                                <td>${employee.birthday}</td>
                                <td>${employee.idCard}</td>
                                <td>${employee.salary}</td>
                                <td>${employee.phone}</td>
                                <td>${employee.email}</td>
                                <td>${employee.address}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${employee.positionId == 1}">Lễ tân</c:when>
                                        <c:when test="${employee.positionId == 2}">Phục vụ</c:when>
                                        <c:when test="${employee.positionId == 3}">Chuyên viên</c:when>
                                        <c:when test="${employee.positionId == 4}">Giám sát</c:when>
                                        <c:when test="${employee.positionId == 5}">Quản lý</c:when>
                                        <c:when test="${employee.positionId == 6}">Giám đốc</c:when>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${employee.educationDegreeId == 1}">Trung cấp</c:when>
                                        <c:when test="${employee.educationDegreeId == 2}">Cao đẳng</c:when>
                                        <c:when test="${employee.educationDegreeId == 3}">Đại học</c:when>
                                        <c:when test="${employee.educationDegreeId == 4}">Sau đại học</c:when>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${employee.divisionId == 1}">Sale - Marketing</c:when>
                                        <c:when test="${employee.divisionId == 2}">Hành chính</c:when>
                                        <c:when test="${employee.divisionId == 3}">Phục vụ</c:when>
                                        <c:when test="${employee.divisionId == 4}">Quản lý</c:when>
                                    </c:choose>
                                </td>
                                <td>${employee.username}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
    </div>
</div>

<script src="/static/jquery/jquery-3.5.1.min.js"></script>
<script src="/static/js/popper.min.js"></script>
<script src="/static/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>

<script src="/static/datatables/js/jquery.dataTables.min.js"></script>
<script src="/static/datatables/js/dataTables.bootstrap4.min.js"></script>

<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

</body>
</html>
