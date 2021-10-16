<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/9/2021
  Time: 7:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Contract Management</title>
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
            <a href="/home" class="btn btn-dark">Back home</a>
            <div class="row">
                <div class="col-4">
                    <h4>List All Contracts</h4>
                </div>
            </div>
            <table class="table table-striped" id="tableContract">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Start date</th>
                    <th>End date</th>
                    <th>Deposit</th>
                    <th>Total money</th>
                    <th>Employee</th>
                    <th>Customer</th>
                    <th>Service</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope['contractList']}" var="contract">
                    <tr>
                        <td>${contract.id}</td>
                        <td>${contract.startDate}</td>
                        <td>${contract.endDate}</td>
                        <td>${contract.deposit}</td>
                        <td>${contract.totalMoney}</td>
                        <td>
                            <c:forEach items="${requestScope['employeeList']}" var="employee">
                                <c:if test="${contract.employeeId == employee.id}">
                                    ${employee.name}
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${requestScope['customerList']}" var="customer">
                                <c:if test="${contract.customerId == customer.id}">
                                    ${customer.name}
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${requestScope['serviceList']}" var="service">
                                <c:if test="${contract.serviceId == service.id}">
                                    ${service.name}
                                </c:if>
                            </c:forEach>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="/static/jquery/jquery-3.5.1.min.js"></script>
<script src="/static/js/popper.min.js"></script>
<script src="/static/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>

<script src="/static/datatables/js/jquery.dataTables.min.js"></script>
<script src="/static/datatables/js/dataTables.bootstrap4.min.js"></script>

<script>
    $(document).ready(function () {
        $("#tableContract").DataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 8
        })
    })
</script>
</body>
</html>
