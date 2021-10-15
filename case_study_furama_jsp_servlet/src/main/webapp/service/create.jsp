<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/9/2021
  Time: 9:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
            <a href="/service" class="btn btn-dark">Back to list all services</a>
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
                <legend>Service information</legend>
                <div class="row mt-2">
                    <div class="col-5">
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Service code</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="service_code">
                            </div>
                            <div class="col-4">
                                <label class="col-form-label">Name</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="name">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Area</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="area">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Cost</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="cost" required>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Max people</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="max_people">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Rent type</label>
                            </div>
                            <div class="col-8">
                                <select class="form-select" aria-label="Default select example" name="rent_type">
                                    <option selected>Chọn kiểu thuê</option>
                                    <option value="1">Năm</option>
                                    <option value="2">Tháng</option>
                                    <option value="3">Ngày</option>
                                    <option value="4">Giờ</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Service type</label>
                            </div>
                            <div class="col-8">
                                <select class="form-select" aria-label="Default select example" name="service_type">
                                    <option selected>Chọn loại dịch vụ</option>
                                    <option value="1">Villa</option>
                                    <option value="2">House</option>
                                    <option value="3">Room</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Standard room</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="standard_room">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Description other convenience</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="description_other_convenience">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Pool area</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="pool_area">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Number of floors</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="number_of_floors" required>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                            </div>
                            <div class="col-6">
                                <input type="submit" class="form-control" value="Create new service">
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
