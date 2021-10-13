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
    <link rel="stylesheet" type="text/css" href="/static/bootstrap-4.3.1-dist/css/bootstrap.min.css">

</head>
<body>
<div class="row">
    <div class="col-8">
        <h1>Employee Management</h1>
    </div>
    <div class="col-4">
        <div>
            <p class="navbar-text" style="float:right">Welcome ${sessionScope.user.employeeName}</p>
        </div>
    </div>
</div>

<h4>
    <a href="#">Search employee</a>
    <ul>
        <li>
            <a href="/employee?action=search&search=name">Search by name</a>
        </li>
        <li>
            <a href="/employee?action=search&search=phone">Search by phone</a>
        </li>
    </ul>
</h4>
<h4>
    <a href="/home">Back home</a>
</h4>
<table class="table table-striped" id="tableEmployee">
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
        <th>Edit</th>
        <th>Delete</th>
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
                <c:if test="${sessionScope.user.roleId == 1}">
                    <a href="/employee?action=edit&id=${employee.id}">Edit</a>
                </c:if>
            </td>
            <td>
                <c:if test="${sessionScope.user.roleId == 1}">
                    <button onclick="onDelete(${employee.getId()})" type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
                        Delete
                    </button>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
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
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="/static/jquery/jquery-3.5.1.min.js"></script>
<script src="/static/js/popper.min.js"></script>
<script src="/static/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>

<script src="/static/datatables/js/jquery.dataTables.min.js"></script>
<script src="/static/datatables/js/dataTables.bootstrap4.min.js"></script>

<script>
    function onDelete(idContract) {
        document.getElementById("idContractDel").value = idContract;
    }

    $(document).ready(function () {
        $("#tableEmployee").DataTable ({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 8
        })
    })
</script>
</body>
</html>