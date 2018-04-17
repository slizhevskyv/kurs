<%--
  Created by IntelliJ IDEA.
  User: VladIsLove
  Date: 19.03.2018
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-1 customCol">
                <nav class="navbar navbar-light bg-light h-100 flex-column align-items-center justify-content-start">
                    <a class="nav-link navbar-brand text-center font-weight-bold text-primary mb-5" href="#">Лого</a>
                    <ul class="nav nav-pills flex-column w-100">
                        <li class="nav-item">
                            <a href="#call" role="tab" data-toggle="pill" class="nav-link active d-flex flex-column align-items-center">
                                Вызов
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#tarif" role="tab" data-toggle="pill" class="nav-link d-flex flex-column align-items-center">
                                Тарифы
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#information" role="tab" data-toggle="pill" class="nav-link d-flex flex-column align-items-center">
                                О такси
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-11 tab-content h-100 pr-0 overflowBlock">
                <div role="tabpanel" id="call" class="tab-pane fade show active">
                    <div class="row">
                        <div class="col-3 h-100 overflowBlock">
                            <form action="" method="post">
                                <br>
                                <h3 class="font-weight-light text-center">Заказать такси</h3>
                                <br>
                                <div class="form-row">
                                    <div class="form-group w-100">
                                        <input type="text" class="form-control form-control-sm" id="startPoint" placeholder="Пункт отправления">
                                    </div>
                                    <div class="form-group w-100">
                                        <input type="text" class="form-control form-control-sm" id="endPoint" placeholder="Пункт назначения">
                                     </div>
                                    <div class="form-group w-100 p-3 shpCost">
                                        <p class="font-weight-light text-center m-0">Стоимость: <span id="shippingCost">0</span></p>
                                    </div>
                                    <div class="form-group w-100">
                                        <input type="text" class="form-control form-control-sm" id="nameCustomer" placeholder="Имя">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-3 pl-0">
                                        <input type="text" class="form-control form-control-sm" placeholder="+375" readonly>
                                    </div>
                                    <div class="form-group col-3">
                                        <select id="inputTelCode" class="form-control form-control-sm">
                                            <option selected>29</option>
                                            <option>25</option>
                                            <option>33</option>
                                            <option>44</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-6 pr-0">
                                        <input type="text" id="telephone" class="form-control form-control-sm" placeholder="123-45-67">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group w-100">
                                        <textarea class="form-control form-control-sm" id="comment" rows="4" placeholder="Комментарий" maxlength="120"></textarea>
                                    </div>
                                </div>
                                <div class="form-row mb-3">
                                    <div class="form-group w-100">
                                        <a href="#addReq" aria-expanded="false" class="customA"  data-toggle="collapse">Дополнительные требования</a>
                                        <div id="addReq" class="collapse mt-3">
                                            <div class="form-check">
                                                <input class="form-check-input radioActive" type="radio" name="carType" id="any" value="any" checked>
                                                <label class="form-check-label font-weight-light pl-2 radioLabel checked" for="any">
                                                    Любой
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input radioActive" type="radio" name="carType" id="wagon" value="wagon">
                                                <label class="form-check-label font-weight-light pl-2 radioLabel" for="wagon">
                                                    Универсал
                                                </label>
                                            </div>
                                            <div class="form-check mb-3">
                                                <input class="form-check-input radioActive" type="radio" name="carType" id="minivan" value="minivan">
                                                <label class="form-check-label font-weight-light pl-2 radioLabel" for="minivan">
                                                    Минивен
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input checkboxActive" type="checkbox" value="" id="terminal">
                                                <label class="form-check-label font-weight-light pl-2" for="terminal">
                                                    Терминал
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input checkboxActive" type="checkbox" value="" id="babyChair">
                                                <label class="form-check-label font-weight-light pl-2" for="babyChair">
                                                    Детское кресло
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input checkboxActive" type="checkbox" value="" id="transportAnimal">
                                                <label class="form-check-label font-weight-light pl-2" for="transportAnimal">
                                                    Перевозка животных
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <button type="submit" class="btn btn-primary w-100">Вызвать</button>
                                </div>
                            </form>
                        </div>
                        <div id="map" class="col-9 w-100 h-100 p-0"></div>
                    </div>
                </div>
                <div role="tabpanel" id="tarif" class="tab-pane fade">
                    <div class="container">
                        <h3 class="font-weight-light text-center mt-3 mb-5">Тарифы</h3>
                        <div class="customRow py-4">
                            <a href="#lightCar" aria-expanded="false" class="d-flex align-items-center  customRate font-weight-light" data-toggle="collapse">
                                <img src="/img/svg/price-1.svg" class="mr-3" alt="lightCar" width="37" height="18">
                                Легковая
                            </a>
                            <div id="lightCar" class="collapse mt-3">
                                <p>Проезд</p>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Город</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">0,55 BYN</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Загород</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">0,85 BYN</p>
                                    </div>
                                </div>
                                <p>Простой</p>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Город</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">5,50 BYN</p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-10">
                                        <p class="font-weight-light">Загород</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">8,50 BYN</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Посадка</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">2,85 BYN</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Абонирование такси (посадка + 3 км)</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">4,50 BYN</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="customRow py-4">
                            <a href="#minivanCar" aria-expanded="false" class="d-flex align-items-center  customRate font-weight-light" data-toggle="collapse">
                                <img src="/img/svg/price-1.svg" class="mr-3" alt="lightCar" width="37" height="18">
                                Минивэн
                            </a>
                            <div id="minivanCar" class="collapse mt-3">
                                <p>Проезд</p>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Город</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">0,85 BYN</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Загород</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">0,90 BYN</p>
                                    </div>
                                </div>
                                <p>Простой</p>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Город</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">8,50 BYN</p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-10">
                                        <p class="font-weight-light">Загород</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">9,00 BYN</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Посадка</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">3,85 BYN</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Абонирование такси (посадка + 3 км)</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">6,40 BYN</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="customRow py-4">
                            <a href="#wagonCar" aria-expanded="false" class="d-flex align-items-center customRate font-weight-light" data-toggle="collapse">
                                <img src="/img/svg/price-1.svg" class="mr-3" alt="lightCar" width="37" height="18">
                                Универсал
                            </a>
                            <div id="wagonCar" class="collapse mt-3">
                                <p>Проезд</p>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Город</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">0,55 BYN</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Загород</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">0,85 BYN</p>
                                    </div>
                                </div>
                                <p>Простой</p>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Город</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">5,50 BYN</p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-10">
                                        <p class="font-weight-light">Загород</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">8,50 BYN</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Посадка</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">2,85 BYN</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Абонирование такси (посадка + 3 км)</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">4,50 BYN</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="customRow py-4">
                            <a href="#airport" aria-expanded="false" class="d-flex align-items-center customRate font-weight-light" data-toggle="collapse">
                                <img src="/img/svg/price-4.svg" class="mr-3" alt="lightCar" width="37" height="18">
                                Аэропорт
                            </a>
                            <div id="airport" class="collapse mt-3">
                                <p>Легковой и универсал</p>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Туда</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">30 BYN</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Обратно</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">25 BYN</p>
                                    </div>
                                </div>
                                <p>Минивэн</p>
                                <div class="row">
                                    <div class="col-10">
                                        <p class="font-weight-light">Туда</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">40 BYN</p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-10">
                                        <p class="font-weight-light">Обратно</p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-right">35 BYN</p>
                                    </div>
                                </div>
                                <p class="font-weight-light p-0 text-justify">
                                    Действует при поездке по кратчайшему маршруту Дом-Аэропорт или Аэропорт-Дом (т.е. от точки А до точки Б). Необходимо оформить заказ по телефону и сообщить диспетчеру о поездке в/из Аэропорта Минск-2. На заказы из пригорода (Хатежино, Боровляны и т.д.) или в пригород из Аэропорта тариф не распространяется.
                                </p>
                            </div>
                        </div>
                        <div class="customRow py-4">
                            <a href="#specialService" aria-expanded="false" class="d-flex align-items-center customRate font-weight-light" data-toggle="collapse">
                                Услуга "Фиксированная стоимость"
                            </a>
                            <div id="specialService" class="collapse mt-3">
                                <ul>
                                    <li class="font-weight-light">Стоимость поездки рассчитывается из точки А в точку Б, остается неизменной до окончания поездки и действует в пределах МКАД.</li>
                                    <li class="font-weight-light">Программа рассчитывает поездку по кратчайшему маршруту.</li>
                                    <li class="font-weight-light">В случае изменения маршрута или осуществления остановок по желанию пассажира, расчет производится по показаниям таксометра по действующим тарифам службы.</li>
                                </ul>
                                <br/>
                                <p class="font-weight-light">Оформить заказ можно по телефонным номерам 111, 80296666001, 80293333001, 80292222001, 80259999001 у диспетчера или через сайт.</p>

                            </div>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" id="information" class="tab-pane fade">Third block</div>
            </div>
        </div>
    </div>







    <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/jquery.js"></script>
    <script src="js/custom.js"></script>
</body>
</html>
