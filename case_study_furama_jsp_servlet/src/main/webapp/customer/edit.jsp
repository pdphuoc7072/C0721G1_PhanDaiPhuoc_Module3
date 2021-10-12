<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/9/2021
  Time: 1:41 AM
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

    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
</head>
<body>
<h1>Customer Management</h1>
<h4>
    <a href="/customer">Back to list all customers</a>
</h4>
<h4>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</h4>
<form method="post">
    <legend>Customer information</legend>
    <div class="row mt-2">
        <div class="col-6">
            <c:if test="${customer != null}">
                <div class="row mt-2">
                    <div class="col-4">
                        <label class="col-form-label">Id</label>
                    </div>
                    <div class="col-8">
                        <input type="text" disabled class="form-control" name="id" value="${requestScope["customer"].id}">
                    </div>
                </div>
            </c:if>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Name</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="name" value="${requestScope["customer"].name}" autocomplete="off">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Birthday</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="birthday" id="datepicker" value="${requestScope["customer"].birthday}" autocomplete="off">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Gender</label>
                </div>
                <div class="col-8">
                    <c:choose>
                        <c:when test="${customer.gender == 1}">
                            <input type="text" class="form-control" name="gender" value="Nam">
                        </c:when>
                        <c:when test="${customer.gender == 2}">
                            <input type="text" class="form-control" name="gender" value="Nữ">
                        </c:when>
                        <c:when test="${customer.gender == 3}">
                            <input type="text" class="form-control" name="gender" value="LGBT">
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Id card</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="id_card" value="${requestScope["customer"].idCard}" autocomplete="off">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Phone</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="phone" value="${requestScope["customer"].phone}" autocomplete="off">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Email</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="email" value="${requestScope["customer"].email}" autocomplete="off">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Address</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="address" value="${requestScope["customer"].address}" autocomplete="off">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Customer type</label>
                </div>
                <div class="col-8">
                    <c:choose>
                        <c:when test="${customer.customerTypeId == 1}">
                            <input type="text" class="form-control" name="customer_type_id" value="Diamond">
                        </c:when>
                        <c:when test="${customer.customerTypeId == 2}">
                            <input type="text" class="form-control" name="customer_type_id" value="Platinium">
                        </c:when>
                        <c:when test="${customer.customerTypeId == 3}">
                            <input type="text" class="form-control" name="customer_type_id" value="Gold">
                        </c:when>
                        <c:when test="${customer.customerTypeId == 4}">
                            <input type="text" class="form-control" name="customer_type_id" value="Silver">
                        </c:when>
                        <c:when test="${customer.customerTypeId == 5}">
                            <input type="text" class="form-control" name="customer_type_id" value="Member">
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                </div>
                <div class="col-8">
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                        Update customer
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Confirm update</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Are you sure to update this customer?
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Yes</button>
                                    <button type="submit" class="btn btn-secondary" data-dismiss="modal">No</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="/static/jquery/jquery-3.5.1.min.js"></script>
<script src="/static/js/popper.min.js"></script>
<script src="/static/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>

<script src="/static/datatables/js/jquery.dataTables.min.js"></script>
<script src="/static/datatables/js/dataTables.bootstrap4.min.js"></script>

<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<script>
    $( function() {
        $( "#datepicker" ).datepicker({
            dateFormat: 'dd-mm-yy',
            changeMonth: true,
            changeYear: true,
            yearRange:'-120:+80'
        });
    } );
</script>
</body>
</html>
