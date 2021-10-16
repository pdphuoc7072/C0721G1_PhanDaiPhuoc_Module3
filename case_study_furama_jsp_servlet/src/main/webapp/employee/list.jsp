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
            <a href="/employee?action=search&search=name" class="btn btn-primary">Search employee by name</a>
            <a href="/employee?action=search&search=phone" class="btn btn-primary">Search employee by phone</a>
            <a href="/home" class="btn btn-dark">Back home</a>
            <div class="row">
                <div class="col-4">
                    <h4>List all employees</h4>
                </div>
            </div>
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
                                <a href="/employee?action=edit&id=${employee.id}" class="btn btn-warning">Edit</a>
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
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>

<script src="/static/jquery/jquery-3.5.1.min.js"></script>
<script src="/static/js/popper.min.js"></script>
<script src="/static/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>

<script src="/static/datatables/js/jquery.dataTables.min.js"></script>
<script src="/static/datatables/js/dataTables.bootstrap4.min.js"></script>

<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<script>
    function onDelete(idEmployee) {
        document.getElementById("idEmployeeDel").value = idEmployee;
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