<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/9/2021
  Time: 2:44 PM
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

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="../static/bootstrap-4.3.1-dist/css/bootstrap.min.css">
</head>
<body>
<h1>Employee Management</h1>
<h4>
    <a href="/home">Back home</a>
</h4>

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
        <th colspan="2">Actions</th>
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
            <td>
                <a href="/employee?action=edit&id=${employee.id}">Edit</a>
            </td>
            <td>
                <button onclick="onDelete(${employee.getId()})" type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
                    Delete
                </button>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Confirm delete</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="/employee">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="" id="idEmployeeDel">
                                <div class="modal-body">
                                    Are you sure to delete this employee?
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Yes</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script>
    function onDelete(idEmployee) {
        document.getElementById("idEmployeeDel").value = idEmployee;
    }
</script>

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