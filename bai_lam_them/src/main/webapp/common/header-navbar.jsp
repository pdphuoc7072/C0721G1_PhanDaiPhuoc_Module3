<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="row">
    <div class="col-6">
        <header class="jumbo jumbo-fluid">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="../static/images/dien-may-xanh.jpg" width="70" height="50"
                         class="d-inline-block align-top" alt="">
                    <h2 class="navbar-text">Siêu thị điện máy</h2>
                </a>
            </div>
        </header>
    </div>
    <div class="col-3">
    </div>
    <div class="col-3">
        <div>
            <p class="navbar-text" style="float: right"><a href="/login">Login</a></p>
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
                <a class="nav-link dropdown-toggle" href="#" id="Product" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Product
                </a>
                <div class="dropdown-menu" aria-labelledby="Product">
                    <a class="dropdown-item" href="#">Create new product</a>
                    <a class="dropdown-item" href="#">Show list all product</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="Contract" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Contract
                </a>
                <div class="dropdown-menu" aria-labelledby="Contract">
                    <a class="dropdown-item" href="#">Create new contract</a>
                    <a class="dropdown-item" href="#">Show list all contract</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="Support" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Support
                </a>
                <div class="dropdown-menu" aria-labelledby="Support">
                    <a class="dropdown-item" href="#">Contact with us by phone</a>
                    <a class="dropdown-item" href="#">Contact with us by email</a>
                </div>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
