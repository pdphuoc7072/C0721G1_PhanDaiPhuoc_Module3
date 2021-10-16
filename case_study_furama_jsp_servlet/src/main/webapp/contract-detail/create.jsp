<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/10/2021
  Time: 8:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
            <a href="/contract-detail" class="btn btn-dark">Back to list all contracts detail</a>
            <div class="row">
                <h4>
                    <c:if test='${requestScope["message1"] != null}'>
                        <span class="message">${requestScope["message"]}</span>
                    </c:if>
                </h4>
            </div>
            <form method="post">
                <legend>Contract detail information</legend>
                <div class="row mt-2">
                    <div class="col-5">
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Contract id</label>
                            </div>
                            <div class="col-8">
                                <select class="form-select" aria-label="Default select example" name="contract_id">
                                    <option selected>Chọn id hợp đồng</option>
                                    <c:forEach items="${requestScope['contractList']}" var="contract">
                                        <option value="${contract.id}"><c:out value="Contract No. ${contract.id}"></c:out></option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Attach service</label>
                            </div>
                            <div class="col-8">
                                <select class="form-select" aria-label="Default select example" name="attach_service_id">
                                    <option selected>Chọn id dịch vụ đính kèm</option>
                                    <c:forEach items="${requestScope['attachServiceList']}" var="attachService">
                                        <option value="${attachService.id}">${attachService.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Quantity</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="quantity" required>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                            </div>
                            <div class="col-6">
                                <input type="submit" class="form-control" value="Create new contract detail">
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

</body>
</html>
