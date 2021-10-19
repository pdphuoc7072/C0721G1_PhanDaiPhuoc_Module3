<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/18/2021
  Time: 7:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Create product</title>
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
            <div class="row mt-2 mb-2">
                <div class="col-3">
                    <a href="/product" class="btn btn-dark">Back to list all product</a>
                </div>
            </div>
            <div class="row mt-2 mb-2">
                <div class="col-4">
                    <h4>
                        <c:if test='${requestScope["message"] != null}'>
                            <span class="message">${requestScope["message"]}</span>
                        </c:if>
                    </h4>
                </div>
            </div>
            <form method="post" action="/product?action=create">
                <legend>Product information</legend>
                <div class="row mt-2">
                    <div class="col-5">
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Name</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="name" value="${name}" aria-describedby="nameError">
                                <c:if test="${mapMessage.get('name') != null}">
                                    <small id="nameError" class="form-text text-danger">${mapMessage.get('name')}</small>
                                </c:if>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Price</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="price" value="${price}" aria-describedby="priceError">
                                <c:if test="${mapMessage.get('price') != null}">
                                    <small id="priceError" class="form-text text-danger">${mapMessage.get('price')}</small>
                                </c:if>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Quantity</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="quantity" value="${quantity}" aria-describedby="quantityError">
                                <c:if test="${mapMessage.get('quantity') != null}">
                                    <small id="quantityError" class="form-text text-danger">${mapMessage.get('quantity')}</small>
                                </c:if>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Color</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="color" value="${color}" aria-describedby="colorError">
                                <c:if test="${mapMessage.get('color') != null}">
                                    <small id="colorError" class="form-text text-danger">${mapMessage.get('color')}</small>
                                </c:if>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Description</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="description" value="${description}" aria-describedby="descriptionError">
                                <c:if test="${mapMessage.get('description') != null}">
                                    <small id="descriptionError" class="form-text text-danger">${mapMessage.get('description')}</small>
                                </c:if>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Category name</label>
                            </div>
                            <div class="col-8">
                                <select class="form-select" aria-label="Default select example" name="categoryId" required>
                                    <option value="">Select category</option>
                                    <c:forEach items="${categoryList}" var="category">
                                        <c:choose>
                                            <c:when test="${category.idCategory == categoryId}">
                                                <option value="${category.idCategory}" selected>${category.nameCategory}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${category.idCategory}">${category.nameCategory}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                            </div>
                            <div class="col-6">
                                <input type="submit" class="form-control btn btn-primary" value="Create">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="/static/jquery/jquery-3.5.1.min.js"></script>
<script src="/static/js/popper.min.js"></script>
<script src="/static/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>

<script src="/static/datatables/js/jquery.dataTables.min.js"></script>
<script src="/static/datatables/js/dataTables.bootstrap4.min.js"></script>

<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

</body>
</html>
