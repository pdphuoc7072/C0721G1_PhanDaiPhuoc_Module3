<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/9/2021
  Time: 9:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Service Management</title>
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
            <a href="/home" class="btn btn-dark">Back home</a>
            <div class="row">
                <div class="col-4">
                    <h4>List All Customers</h4>
                </div>
            </div>
            <table class="table table-striped" id="tableService">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Service code</th>
                    <th>Name</th>
                    <th>Area</th>
                    <th>Cost</th>
                    <th>Max people</th>
                    <th>Rent type</th>
                    <th>Service type</th>
                    <th>Standard room</th>
                    <th>Description other convenience</th>
                    <th>Pool area</th>
                    <th>Number of floors</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope['serviceList']}" var="service">
                    <tr>
                        <td>${service.id}</td>
                        <td>${service.serviceCode}</td>
                        <td>${service.name}</td>
                        <td>${service.area}</td>
                        <td>${service.cost}</td>
                        <td>${service.maxPeople}</td>
                        <td>
                            <c:choose>
                                <c:when test="${service.rentTypeId == 1}">Năm</c:when>
                                <c:when test="${service.rentTypeId == 2}">Tháng</c:when>
                                <c:when test="${service.rentTypeId == 3}">Ngày</c:when>
                                <c:when test="${service.rentTypeId == 4}">Giờ</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${service.serviceTypeId == 1}">Villa</c:when>
                                <c:when test="${service.serviceTypeId == 2}">House</c:when>
                                <c:when test="${service.serviceTypeId == 3}">Room</c:when>
                            </c:choose>
                        </td>
                        <td>${service.standardRoom}</td>
                        <td>${service.descriptionOtherConvenience}</td>
                        <td>${service.poolArea}</td>
                        <td>${service.numberOfFloors}</td>
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
        $("#tableService").DataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 8
        })
    })
</script>
</body>
</html>
