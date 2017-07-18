
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>Sign in</title>
    <meta studentName="viewport" content="width=device-width, initial-scale=1"/>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/css/sign-in.css"/>">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <script src="<c:url value="/resources/js/jquery-1.10.2.js"/>"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <script src="<c:url value="/resources/js/signin.js"/>"></script>


</head>
<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a href="#" class="navbar-brand">ESCHOOL</a>
        </div>

        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="/">Войти</a></li>
                <li><a href="/signup">Регистрация</a></li>
            </ul>
        </div>
    </div>
</nav>


<div class="container">
    <div class="log-form form-box">
        <h4>Авторизуйтесь чтобы продолжить работу</h4>
        <hr>
        <form action="login" method="post">
            <div class="form-group">
                <input type="email" name="userName" class="form-control" id="email" placeholder="Введите email">
                <p class="help-block">Используйте email, который Вы указали при регистрации</p>
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control" id="password" placeholder="Введите пароль">
            </div>
            <p class="err">${logginError}</p>
            <button class="btn btn-primary btn-block" id="signin">Войти</button>
        </form>
    </div>
</div>
</body>
</html>
