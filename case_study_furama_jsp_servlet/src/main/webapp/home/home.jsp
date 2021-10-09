<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/8/2021
  Time: 1:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Home</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="../static/bootstrap-4.3.1-dist/css/bootstrap.min.css">
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-6">
            <header class="jumbo jumbo-fluid">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="../static/images/logo_furama.jpg" width="100" height="100"
                             class="d-inline-block align-top" alt="">
                        <h2 class="navbar-text">Furama Resort</h2>
                    </a>
                </div>
            </header>
        </div>
        <div class="col-2">
        </div>
        <div class="col-4">
            <div>
                <p class="navbar-text" style="float: right">Signed in as Thomas</p>
            </div>
        </div>
    </div>

    <nav class="navbar navbar-expand-lg navbar-light bg-success sticky-top">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="Home" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        Home
                    </a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="Employee" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Employee
                    </a>
                    <div class="dropdown-menu" aria-labelledby="Employee">
                        <a class="dropdown-item" href="/employee?action=create">Create new employee</a>
                        <a class="dropdown-item" href="/employee">Show list all employees</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="Customer" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Customer
                    </a>
                    <div class="dropdown-menu" aria-labelledby="Customer">
                        <a class="dropdown-item" href="/customer?action=create">Create new customer</a>
                        <a class="dropdown-item" href="/customer">Show list all customer</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="Service" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Service
                    </a>
                    <div class="dropdown-menu" aria-labelledby="Service">
                        <a class="dropdown-item" href="/service?action=create">Create new service</a>
                        <a class="dropdown-item" href="/service">Show list all services</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="Contract" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Contract
                    </a>
                    <div class="dropdown-menu" aria-labelledby="Contract">
                        <a class="dropdown-item" href="#">Create new contract</a>
                        <a class="dropdown-item" href="#">Show list all contracts</a>
                    </div>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>

    <div class="row">
        <div class="col-3 bg-light">
            <p>Nội dung mục liên kết</p>
            <ul class="nav nav-pills flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="#">Item 1</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Item 2</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Item 3</a>
                </li>
            </ul>
        </div>

        <div class="col-9">
            <div class="row">
                <div class="col-12">
                    <img src="../static/images/furama.jpg">
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <p>Hướng ra bãi biển Đà Nẵng trải dài cát trắng, Furama Resort Đà Nẵng là cửa ngõ đến với 3 di sản
                        văn hoá thế giới: Hội An (20 phút), Mỹ Sơn (90 phút) và Huế (2 tiếng. 196 phòng hạng sang cùng
                        với 70 căn biệt thự từ hai đến bốn phòng ngủ có hồ bơi riêng đều được trang trí trang nhã, theo
                        phong cách thiết kế truyền thống của Việt Nam và kiến trúc thuộc địa của Pháp, biến Furama thành
                        khu nghỉ dưỡng danh giá nhất tại Việt Nam – vinh dự được đón tiếp nhiều người nổi tiếng, giới
                        hoàng gia, chính khách, ngôi sao điện ảnh và các nhà lãnh đạo kinh doanh quốc tế.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="py-3 bg-light">
    <div class="container">
        <p class="text-center">Copyright &copy; Furama</p>
    </div>
</footer>

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

