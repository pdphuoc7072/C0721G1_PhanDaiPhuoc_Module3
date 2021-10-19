<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/9/2021
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Employee Management</title>
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
            <a href="/employee" class="btn btn-dark">Back to list all employees</a>
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
                <legend>Employee information</legend>
                <div class="row mt-2">
                    <div class="col-6">
                        <c:if test="${employee != null}">
                            <div class="row mt-2">
                                <div class="col-4">
                                    <label class="col-form-label">Id</label>
                                </div>
                                <div class="col-8">
                                    <input type="text" disabled class="form-control" name="id" value="${requestScope["employee"].id}">
                                </div>
                            </div>
                        </c:if>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Name</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="name" value="${requestScope["employee"].name}" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Birthday</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="birthday" id="datepicker" value="${requestScope["employee"].birthday}" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Id card</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="id_card" value="${requestScope["employee"].idCard}" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Salary</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="salary" value="${requestScope["employee"].salary}" autocomplete="off" required>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Phone</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="phone" value="${requestScope["employee"].phone}" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Email</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="email" value="${requestScope["employee"].email}" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Address</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="address" value="${requestScope["employee"].address}" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Position</label>
                            </div>
                            <div class="col-8">
                                <select class="form-select" name="position">
                                    <option>Chọn vị trí</option>
                                    <c:forEach items="${positionList}" var="position">
                                        <c:choose>
                                            <c:when test="${employee.positionId == position.id}">
                                                <option value="${position.id}" selected>${position.name}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${position.id}">${position.name}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Education degree</label>
                            </div>
                            <div class="col-8">
                                <select class="form-select" name="education_degree">
                                    <option>Chọn trình độ</option>
                                    <c:forEach items="${educationDegreeList}" var="educationDegree">
                                        <c:choose>
                                            <c:when test="${employee.educationDegreeId == educationDegree.id}">
                                                <option value="${educationDegree.id}" selected>${educationDegree.name}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${educationDegree.id}">${educationDegree.name}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Division</label>
                            </div>
                            <div class="col-8">
                                <select class="form-select" name="division">
                                    <option>Chọn vị trí</option>
                                    <c:forEach items="${divisionList}" var="division">
                                        <c:choose>
                                            <c:when test="${employee.divisionId == division.id}">
                                                <option value="${division.id}" selected>${division.name}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${division.id}">${division.name}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Username</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="username" value="${requestScope["employee"].username}" autocomplete="off">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                            </div>
                            <div class="col-8">
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                    Update employee
                                </button>

                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Confirm update</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                Are you sure to update this employee?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary">Yes</button>
                                                <button type="submit" class="btn btn-secondary" data-dismiss="modal">No</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
