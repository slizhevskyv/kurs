<%--
  Created by IntelliJ IDEA.
  User: VladIsLove
  Date: 30.04.2018
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Авторизация пользователя</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <div class="container pt-5 mt-4">
        <form action="/admin" method="post">
            <div class="form-group">
                <label for="log">Login:</label>
                <input type="text" class="form-control" name="login" id="log">
            </div>
            <div class="form-group">
                <label for="pwd">Password:</label>
                <input type="password" class="form-control" name="password" id="pwd">
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
    </div>
    <c:import url="fragment/scriptFragment.jsp"></c:import>
</body>
</html>
