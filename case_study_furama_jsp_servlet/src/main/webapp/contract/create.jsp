<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/9/2021
  Time: 8:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Contract Management</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="../static/bootstrap-4.3.1-dist/css/bootstrap.min.css">

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
            <a href="/contract" class="btn btn-dark">Back to list all contracts</a>
            <div class="row">
                <h4>
                    <c:if test='${requestScope["message1"] != null}'>
                        <span class="message">${requestScope["message1"]}</span>
                    </c:if>
                </h4>
                <h4>
                    <c:if test='${requestScope["message2"] != null}'>
                        <span class="message text-danger">${requestScope["message2"]}</span>
                    </c:if>
                </h4>
            </div>
            <form method="post">
                <legend>Contract information</legend>
                <div class="row mt-2">
                    <div class="col-5">
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Start date</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control datepicker" name="start_date" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">End date</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control datepicker" name="end_date" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Deposit</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="deposit" autocomplete="off" required>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Total money</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="total_money" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Employee</label>
                            </div>
                            <div class="col-8">
                                <select class="form-select" aria-label="Default select example" name="employee_id">
                                    <option selected>Chọn nhân viên</option>
                                    <c:forEach items="${requestScope['employeeList']}" var="employee">
                                        <option value="${employee.id}">${employee.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Customer</label>
                            </div>
                            <div class="col-8">
                                <select class="form-select" aria-label="Default select example" name="customer_id">
                                    <option selected>Chọn khách hàng</option>
                                    <c:forEach items="${requestScope['customerList']}" var="customer">
                                        <option value="${customer.id}">${customer.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Service</label>
                            </div>
                            <div class="col-8">
                                <select class="form-select" aria-label="Default select example" name="service_id">
                                    <option selected>Chọn dịch vụ</option>
                                    <c:forEach items="${requestScope['serviceList']}" var="service">
                                        <option value="${service.id}">${service.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                            </div>
                            <div class="col-6">
                                <input type="submit" class="form-control" value="Create new contract">
                            </div>
                            <div class="col-2">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
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
    $( function() {
        $( ".datepicker" ).datepicker({
            dateFormat: 'dd-mm-yy',
            changeMonth: true,
            changeYear: true,
            yearRange:'-120:+80'
        });
    } );
</script>
</body>
</html>
