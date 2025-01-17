<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/8/2021
  Time: 11:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Customer Management</title>
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
            <a href="/customer" class="btn btn-dark">Back to list all customers</a>
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
                <legend>Customer information</legend>
                <div class="row mt-2">
                    <div class="col-5">
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Customer code</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="customer_code" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Name</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="name" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Birthday</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="birthday" autocomplete="off" id="datepicker">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Gender</label>
                            </div>
                            <div class="col-8">
                                <select class="form-select" aria-label="Default select example" name="gender">
                                    <option selected>Chọn giới tính</option>
                                    <option value="1">Nam</option>
                                    <option value="2">Nữ</option>
                                    <option value="3">LGBT</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Id card</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="id_card" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Phone</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="phone" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Email</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="email" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Address</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="address" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Customer type</label>
                            </div>
                            <div class="col-8">
                                <select class="form-select" aria-label="Default select example" name="customer_type_id">
                                    <option selected>Chọn loại khách hàng</option>
                                    <option value="1">Diamond</option>
                                    <option value="2">Platinium</option>
                                    <option value="3">Gold</option>
                                    <option value="4">Silver</option>
                                    <option value="5">Member</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                            </div>
                            <div class="col-6">
                                <input type="submit" class="form-control" value="Create new customer">
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
