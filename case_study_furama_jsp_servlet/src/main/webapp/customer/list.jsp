<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/8/2021
  Time: 11:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" type="text/css" href="/static/bootstrap-4.3.1-dist/css/bootstrap.min.css">
</head>
<body>
<div class="row">
    <div class="col-8">
        <h1>Customer Management</h1>
    </div>
    <div class="col-4">
        <div>
            <p class="navbar-text" style="float:right">Welcome ${sessionScope.user.employeeName}</p>
        </div>
    </div>
</div>
<h4>
    <a href="#">Search customer</a>
    <ul>
        <li>
            <a href="/customer?action=search&search=name">Search by name</a>
        </li>
        <li>
            <a href="/customer?action=search&search=phone">Search by phone</a>
        </li>
    </ul>
</h4>
<h4>
    <a href="/home">Back home</a>
</h4>

<table class="table table-striped" id="tableCustomer">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Birthday</th>
        <th>Gender</th>
        <th>Id card</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Customer type</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope['customerList']}" var="customer">
        <tr>
            <td>${customer.id}</td>
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
            <td>
                <a href="/customer?action=edit&id=${customer.id}">Edit</a>
            </td>
            <td>
                <button onclick="onDelete(${customer.getId()})" type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
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
                            <form action="/customer">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="" id="idCustomerDel">
                                <div class="modal-body">
                                    Are you sure to delete this customer?
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
        $("#tableCustomer").DataTable ({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 8
        })
    })
</script>
</body>
</html>
