<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
    <div class="col-3">
    </div>

    <c:if test="${sessionScope.user == null}">
        <div class="col-3">
            <div>
                <p class="navbar-text" style="float: right"><a href="/login">Login</a></p>
            </div>
        </div>
    </c:if>
    <c:if test="${sessionScope.user != null}">
        <div class="col-2">
            <div>
                <p class="navbar-text" style="float:right">Welcome ${sessionScope.user.employeeName}</p>
            </div>
        </div>
        <div class="col">
            <div>
                <a class="navbar-text" style="float:right" href="/logout">Logout</a>
            </div>
        </div>
    </c:if>
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
                    <c:if test="${sessionScope.user.roleId == 1}">
                        <a class="dropdown-item" href="/employee?action=create">Create new employee</a>
                    </c:if>
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
                    <a class="dropdown-item" href="/service-detail">Show list all service detail</a>
                </div>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="Contract" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Contract
                </a>
                <div class="dropdown-menu" aria-labelledby="Contract">
                    <a class="dropdown-item" href="/contract?action=create">Create new contract</a>
                    <a class="dropdown-item" href="/contract">Show list all contracts</a>
                    <a class="dropdown-item" href="/contract-detail?action=create">Create new contract detail</a>
                    <a class="dropdown-item" href="/contract-detail">Show list all contract detail</a>
                </div>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
