
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Главная</title>
    <meta studentName="viewport" content="width=device-width, initial-scale=1"/>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="<c:url value="/resources/js/jquery-1.10.2.js"/>"></script>
    <script src="<c:url value="/resources/js/mustache.js"/>"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<c:url value="/resources/js/jquery-ui-1.10.3/themes/base/jquery.ui.all.css"/>"/>
    <script src="<c:url value="/resources/js/jquery-ui-1.10.3/ui/jquery.ui.core.js"/> "></script>
    <script src="<c:url value="/resources/js/jquery-ui-1.10.3/ui/jquery.ui.widget.js"/> "></script>
    <script src="<c:url value="/resources/js/jquery-ui-1.10.3/ui/jquery.ui.mouse.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-ui-1.10.3/ui/jquery.ui.button.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-ui-1.10.3/ui/jquery.ui.draggable.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-ui-1.10.3/ui/jquery.ui.position.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-ui-1.10.3/ui/jquery.ui.dialog.js"/> "></script>
    <script src="<c:url value="/resources/js/main.js"/>"></script>


</head>
<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a href="#" class="navbar-brand">ESCHOOL</a>
        </div>

        <div>
            <ul class="nav navbar-nav">
                <li id="schoolId" class="hide">${loggedUser.id}</li>
                <li><a href="#">${loggedUser.login}</a></li>
                <li><a href="logout">Выйти</a></li>
            </ul>
        </div>
    </div>
</nav>

<div id="dialog" class="main-cont popup">
    <div class="form-group" >
        <input type="text" class="form-control" id="studentName" placeholder="Ф.И.О. Ученика">
    </div>
    <div class="form-group">
        <input type="text" class="form-control" id="clazz" placeholder="Класс">
        <p class="help-block" id="maxlength">Максимум 3 символа. Например: 11А</p>
        <p class="help-block hide err" id="emptyerr">Все поля обязательные</p>

    </div>
</div>

<div class="container main-cont">
    <button class="btn btn-success" id="addNewStudent">Добавить</button>
    <button class="btn btn-danger" id="deleteStudents">Удалить выбранных</button>
    <div class="table-container">
        <table class="table table-hover">
            <thead>
            <tr class="active">
                <th></th>
                <th>Ф.И.О. Ученика</th>
                <th>Класс</th>
                <th>Удалить</th>
            </tr>
            </thead>
            <tbody id="tbody">
            </tbody>
        </table>
    </div>
</div>

<template id="student-row">
    <tr>
        <td><input type="checkbox" datafld="{{studentId}}"></td>
        <td>{{studentName}}</td>
        <td>{{studentClass}}</td>
        <td>
            <button datafld="{{studentId}}" class="btn btn-danger btn-sm dlt"><span class="glyphicon glyphicon-trash"
                                                        aria-hidden="true"></span></button>
        </td>
    </tr>
</template>

</body>
</html>
