<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/10/2021
  Time: 9:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Service detail Management</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="../static/bootstrap-4.3.1-dist/css/bootstrap.min.css">
</head>
<body>
<h1>Service detail Management</h1>
<h4>
    <a href="/home">Back home</a>
</h4>

<table class="table table-striped">
    <thead>
    <tr>
        <th>Id service</th>
        <th>Name service</th>
        <th>Customer name</th>
        <th>Id contract</th>
        <th>Contract of start date</th>
        <th>Contract of end date</th>
        <th>Contract detail</th>
        <th colspan="2">Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope['serviceList']}" var="service">
        <c:forEach items="${requestScope['contractList']}" var="contract">
            <tr>
                <td>
                    <c:if test="${service.id == contract.serviceId}">
                        ${service.id}
                    </c:if>
                </td>
                <td>
                    <c:if test="${service.id == contract.serviceId}">
                        ${service.name}
                    </c:if>
                </td>
                <td>
                    <c:forEach items="${requestScope['customerList']}" var="customer">
                        <c:choose>
                            <c:when test="${contract.customerId == customer.id && service.id == contract.serviceId}">
                                ${customer.name}
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </td>
                <td>
                    <c:if test="${service.id == contract.serviceId}">
                        ${contract.id}
                    </c:if>
                </td>
                <td>
                    <c:if test="${service.id == contract.serviceId}">
                        ${contract.startDate}
                    </c:if>
                </td>
                <td>
                    <c:if test="${service.id == contract.serviceId}">
                        ${contract.endDate}
                    </c:if>
                </td>
                <td>
                    <c:forEach items="${requestScope['contractDetailList']}" var="contractDetail">
                        <c:if test="${contract.id == contractDetail.contractId && service.id == contract.serviceId}">
                            <a href = "<c:url value = "/service-contract-detail?action=show&id=${contract.id}"/>">Hợp đồng chi tiết</a>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:if test="${service.id == contract.serviceId}">
                        <a href = "<c:url value = "/service-detail?action=edit&id=${contract.id}"/>">Edit</a>
                    </c:if>
                </td>
                <td>
                    <c:if test="${service.id == contract.serviceId}">
                        <button onclick="onDelete(${contract.id})" type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
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
                                    <form action="/service-detail">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="" id="idContractDel">
                                        <div class="modal-body">
                                            Are you sure to delete this contract?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary">Yes</button>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </c:forEach>
    </tbody>
</table>

<script>
    function onDelete(idContract) {
        document.getElementById("idContractDel").value = idContract;
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
