<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/10/2021
  Time: 8:34 AM
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
                    <h4>List All Contracts detail</h4>
                </div>
            </div>
            <table class="table table-striped" id="tableContractDetail">
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
    $(document).ready(function () {
        $("#tableContractDetail").DataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 8
        })
    })
</script>
</body>
</html>
