<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/5/2021
  Time: 7:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculator App</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>

<form method="post" action="/calculate">

    <legend>Simple Calculator</legend>
    <div class="row mt-2">
        <div class="col-4">
            <div class="row">
                <div class="col-4">
                    <label class="col-form-label">First operand</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="first_number">
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Operator</label>
                </div>
                <div class="col-8">
                    <select class="form-select" aria-label="Default select example" name="operator">
                        <option selected>Open this select menu</option>
                        <option value="+">Addition</option>
                        <option value="-">Subtraction</option>
                        <option value="*">Multiplication</option>
                        <option value="/">Division</option>
                    </select>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Second operand</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="second_number">
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-4">
                </div>
                <div class="col-4">
                    <input type="submit" class="form-control" value="Calculate">
                </div>
                <div class="col-4">
                </div>
            </div>
        </div>
    </div>

</form>
</body>
</html>
