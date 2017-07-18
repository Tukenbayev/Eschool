
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>Sign in</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/css/sign-in.css"/>">
    <script src="<c:url value="/resources/js/jquery-1.10.2.js"/>"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <script src="<c:url value="/resources/js/signup.js"/> "></script>


</head>
<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a href="#" class="navbar-brand">ESCHOOL</a>
        </div>

        <div>
            <ul class="nav navbar-nav">
                <li><a href="/">Войти</a></li>
                <li class="active"><a href="/signup">Регистрация</a></li>
            </ul>
        </div>
    </div>
</nav>


<div class="container">
    <form:form action="/signup" method="post" commandName="newUser">
        <div class="signup-form form-box">
            <h4>Форма регистрации</h4>
            <hr>
            <div class="message green">${registrationSuccess}</div>
            <div class="message err">${emailUsed}</div>
            <div class="form-group">
                <form:input path="login" type="email" class="form-control" id="newemail" placeholder="Введите email"/>
                <p class="help-block">Введенный email будет использоваться для входа в систему</p>
            </div>
            <div class="form-group">
                <form:input path="password" type="password" class="form-control" id="password1" placeholder="Введите пароль"/>
                <p class="help-block no err" id="emptyerr">Поле не может быть пустым</p>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="password2" placeholder="Повторите пароль">
                <p class="help-block no err" id="noteq">Пароли не совпадают</p>
            </div>
            <button class="btn btn-success btn-block" id="signup">Зарегистрироваться</button>
        </div>
    </form:form>
</div>
</body>
</html>
