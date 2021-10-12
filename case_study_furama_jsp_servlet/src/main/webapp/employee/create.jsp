<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/9/2021
  Time: 3:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Employee Management</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="/static/bootstrap-4.3.1-dist/css/bootstrap.min.css">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
</head>
<body>
<h1>Employee Management</h1>
<h4>
    <a href="/employee">Back to list all employees</a>
</h4>
<h4>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</h4>
<form method="post">
    <legend>Employee information</legend>
    <div class="row mt-2">
        <div class="col-5">
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
                    <input type="text" class="form-control" name="birthday" id="datepicker" autocomplete="off">
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
                    <label class="col-form-label">Salary</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="salary" autocomplete="off">
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
                    <label class="col-form-label">Position</label>
                </div>
                <div class="col-8">
                    <select class="form-select" aria-label="Default select example" name="position_id">
                        <option selected>Chọn vị trí</option>
                        <option value="1">Lễ tân</option>
                        <option value="2">Phục vụ</option>
                        <option value="3">Chuyên viên</option>
                        <option value="4">Giám sát</option>
                        <option value="5">Quản lý</option>
                        <option value="6">Giám đốc</option>
                    </select>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Education degree</label>
                </div>
                <div class="col-8">
                    <select class="form-select" aria-label="Default select example" name="education_degree_id">
                        <option selected>Chọn trình độ</option>
                        <option value="1">Trung cấp</option>
                        <option value="2">Cao đẳng</option>
                        <option value="3">Đại học</option>
                        <option value="4">Sau đại học</option>
                    </select>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Division</label>
                </div>
                <div class="col-8">
                    <select class="form-select" aria-label="Default select example" name="division_id">
                        <option selected>Chọn bộ phận</option>
                        <option value="1">Sale - Marketing</option>
                        <option value="2">Hành chính</option>
                        <option value="3">Phục vụ</option>
                        <option value="4">Quản lý</option>
                    </select>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Username</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="username" autocomplete="off">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                </div>
                <div class="col-6">
                    <input type="submit" class="form-control" value="Create new employee">
                </div>
                <div class="col-2">
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
