<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Панель администратора</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body class="bdy">
    <nav class="navbar navbar-light bg-light">
        <div class="container justify-content-between align-items-center">
            <div class="align-items-center flex-row">
                <button id="giveJoyButton" class="btn btn-primary">Подарить радость детям</button>
                <p id="newCost" class="d-inline font-weight-light">Общая сумма: ${requestScope.cost} BYN</p>
            </div>
            <ul class="navbar-nav flex-row mr-5">
                <li class="nav-item mr-3">
                    <a class="nav-link" id="chart" href="javascript:void(0);">График заказов</a>
                </li>
                <li class="nav-item mr-5">
                    <a class="nav-link" id="allOrders" href="javascript:void(0);">Все заказы</a>
                </li>
            </ul>
            <p class="d-inline m-0 pr-3">Hello, ${sessionScope.login}!</p>
            <a href="/logout">Logout</a>
        </div>
    </nav>
    <div class="container">
        <div id="curve_chart" class="d-noneCustom" style="height: 600px;"></div>
        <div id="orders" class="d-noneCustom p-3 mt-5 flex-column">
            <div class="row">
                <div class="col-sm-12">
                    <a href="/admin/downloadFile">Скачать таблицу</a>
                </div>
            </div>
            <table id="tableOrders" class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th scope="col">№</th>
                        <th scope="col">Пункт отправления</th>
                        <th scope="col">Пункт прибытия</th>
                        <th scope="col">Имя заказчика</th>
                        <th scope="col">Телефон</th>
                        <th scope="col">Стоимость заказа</th>
                        <th scope="col">Тип машины</th>
                        <th scope="col">Дополнительные требования</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.orders}" var="order" varStatus="i">
                        <tr>
                            <th>${i.count}</th>
                            <td>${order.pointOfDeparture}</td>
                            <td>${order.destination}</td>
                            <td>${order.customerName}</td>
                            <td>${order.phoneNumber}</td>
                            <td>${order.cost}</td>
                            <td>${order.typeOfMachine}</td>
                            <td>${order.addRequirement}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <c:import url="fragment/scriptFragment.jsp"></c:import>
    <script src="js/chart.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap4.min.js"></script>
    <script>
            $('#tableOrders').DataTable();
    </script>
</body>
</html>
