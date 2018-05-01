<%--
  Created by IntelliJ IDEA.
  User: VladIsLove
  Date: 30.04.2018
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Авторизация пользователя</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-light bg-light">
        <div class="container justify-content-end align-items-center">
            <p class="d-inline m-0 pr-3">Hello, ${sessionScope.login}!</p>
            <a href="/logout">Logout</a>
        </div>
    </nav>
    <div class="container">
        hello
    </div>
    <c:import url="fragment/scriptFragment.jsp"></c:import>
</body>
</html>
