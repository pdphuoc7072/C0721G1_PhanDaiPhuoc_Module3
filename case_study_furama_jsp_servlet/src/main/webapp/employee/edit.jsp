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

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="../static/bootstrap-4.3.1-dist/css/bootstrap.min.css">
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
                    <input type="text" class="form-control" name="name" value="${requestScope["employee"].name}">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Birthday</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="birthday" value="${requestScope["employee"].birthday}">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Id card</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="id_card" value="${requestScope["employee"].idCard}">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Salary</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="salary" value="${requestScope["employee"].salary}">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Phone</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="phone" value="${requestScope["employee"].phone}">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Email</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="email" value="${requestScope["employee"].email}">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Address</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="address" value="${requestScope["employee"].address}">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Position</label>
                </div>
                <div class="col-8">
                    <c:choose>
                        <c:when test="${employee.positionId == 1}">
                            <input type="text" class="form-control" name="position" value="Lễ tân">
                        </c:when>
                        <c:when test="${employee.positionId == 2}">
                            <input type="text" class="form-control" name="position" value="Phục vụ">
                        </c:when>
                        <c:when test="${employee.positionId == 3}">
                            <input type="text" class="form-control" name="position" value="Chuyên viên">
                        </c:when>
                        <c:when test="${employee.positionId == 4}">
                            <input type="text" class="form-control" name="position" value="Giám sát">
                        </c:when>
                        <c:when test="${employee.positionId == 5}">
                            <input type="text" class="form-control" name="position" value="Quản lý">
                        </c:when>
                        <c:when test="${employee.positionId == 6}">
                            <input type="text" class="form-control" name="position" value="Giám đốc">
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Education degree</label>
                </div>
                <div class="col-8">
                    <c:choose>
                        <c:when test="${employee.educationDegreeId == 1}">
                            <input type="text" class="form-control" name="education_degree" value="Trung cấp">
                        </c:when>
                        <c:when test="${employee.educationDegreeId == 2}">
                            <input type="text" class="form-control" name="education_degree" value="Cao đẳng">
                        </c:when>
                        <c:when test="${employee.educationDegreeId == 3}">
                            <input type="text" class="form-control" name="education_degree" value="Đại học">
                        </c:when>
                        <c:when test="${employee.educationDegreeId == 4}">
                            <input type="text" class="form-control" name="education_degree" value="Sau đại học">
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Division</label>
                </div>
                <div class="col-8">
                    <c:choose>
                        <c:when test="${employee.divisionId == 1}">
                            <input type="text" class="form-control" name="division" value="Sale - Marketing">
                        </c:when>
                        <c:when test="${employee.divisionId == 2}">
                            <input type="text" class="form-control" name="division" value="Hành chính">
                        </c:when>
                        <c:when test="${employee.divisionId == 3}">
                            <input type="text" class="form-control" name="division" value="Phục vụ">
                        </c:when>
                        <c:when test="${employee.divisionId == 4}">
                            <input type="text" class="form-control" name="division" value="Quản lý">
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Username</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="username" value="${requestScope["employee"].username}">
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
