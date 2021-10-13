<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/13/2021
  Time: 9:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Login</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="/static/bootstrap-4.3.1-dist/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="login.css">
</head>
<body>
<div class="pt-5">
    <h1 class="text-center"><img src="/static/images/logo_furama.jpg" alt="" width="150" height="130"></h1>
    <div class="container">
        <div class="row">
            <div class="col-md-5 mx-auto">
                <div class="card card-body">
                    <p class="text-danger">${message}</p>
                    <form id="submitForm" action="/login" method="post">
                        <div class="form-group">
                            <label for="username"> Username </label>
                            <input type="text" class="form-control" id="username" name="username" value="${userNameCookie}" autocomplete="off" required>
                        </div>
                        <div class="form-group">
                            <label class="d-flex flex-row align-items-center" for="password"> Password
                                <a class="ml-auto border-link small-xl" href="#"> Forget Password? </a> </label>
                            <input type="password" class="form-control" id="password" name="password" value="${passwordCookie}" autocomplete="off" required>
                        </div>
                        <div class="form-group mt-4 mb-4">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="remember" name="remember" data-parsley-multiple="remember">
                                <label class="custom-control-label" for="remember"> Remember me </label>
                            </div>
                        </div>
                        <div class="form-group pt-1">
                            <button class="btn btn-primary btn-block" type="submit"> Log In </button>
                        </div>
                    </form>
                    <p class="small-xl pt-3 text-center">
                        <span class="text-muted"> Not a member? </span>
                        <a href="#"> Sign up </a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="/static/jquery/jquery-3.5.1.min.js"></script>
<script src="/static/js/popper.min.js"></script>
<script src="/static/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>

<script src="/static/datatables/js/jquery.dataTables.min.js"></script>
<script src="/static/datatables/js/dataTables.bootstrap4.min.js"></script>
</body>
</html>
