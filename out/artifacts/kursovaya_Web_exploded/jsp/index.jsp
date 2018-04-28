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
                            <form method="post" id="taxiForm" action="javascript:void(0);" onsubmit=call()>
                                <br>
                                <h3 class="font-weight-light text-center">Заказать такси</h3>
                                <br>
                                <div class="form-row">
                                    <div class="form-group w-100">
                                        <input type="text" class="form-control form-control-sm customForm" id="startPoint" placeholder="Пункт отправления">
                                        <span class="custom-help-block font-weight-light">Некорректно заполнено поле</span>
                                    </div>
                                    <div class="form-group w-100">
                                        <input type="text" class="form-control form-control-sm customForm" id="endPoint" placeholder="Пункт назначения">
                                        <span class="custom-help-block font-weight-light">Некорректно заполнено поле</span>
                                    </div>
                                    <div class="form-group w-100 p-3 shpCost">
                                        <p class="font-weight-light text-center m-0">Стоимость: <span id="shippingCost">0</span></p>
                                    </div>
                                    <div class="form-group w-100">
                                        <input type="text" class="form-control form-control-sm customForm" id="nameCustomer" placeholder="Имя">
                                        <span class="custom-help-block font-weight-light">Некорректно заполнено поле</span>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-3 pl-0">
                                        <input  type="text" class="form-control form-control-sm" id="inputTelPrefix" placeholder="+375" readonly>
                                    </div>
                                    <div class="form-group col-3">
                                        <select  id="inputTelCode" class="form-control form-control-sm">
                                            <option selected>29</option>
                                            <option>25</option>
                                            <option>33</option>
                                            <option>44</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-6 pr-0">
                                        <input  type="text" id="telephone" class="form-control form-control-sm customForm" placeholder="123-45-67">
                                        <span class="custom-help-block font-weight-light">Некорректно заполнено поле</span>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group w-100">
                                        <textarea  class="form-control form-control-sm" id="comment" rows="4" placeholder="Комментарий" maxlength="120"></textarea>
                                    </div>
                                </div>
                                <div class="form-row mb-3">
                                    <div class="form-group w-100">
                                        <a href="#addReq" aria-expanded="false" class="customA"  data-toggle="collapse">Дополнительные требования</a>
                                        <div id="addReq" class="collapse mt-3">
                                            <div class="form-check">
                                                <input class="form-check-input radioActive" type="radio" name="carType" id="any" value="Любой" checked>
                                                <label class="form-check-label font-weight-light pl-2 radioLabel checked" for="any">
                                                    Любой
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input radioActive" type="radio" name="carType" id="wagon" value="Универсал">
                                                <label class="form-check-label font-weight-light pl-2 radioLabel" for="wagon">
                                                    Универсал
                                                </label>
                                            </div>
                                            <div class="form-check mb-3">
                                                <input class="form-check-input radioActive" type="radio" name="carType" id="minivan" value="Минивен">
                                                <label class="form-check-label font-weight-light pl-2 radioLabel" for="minivan">
                                                    Минивен
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input name="other" class="form-check-input checkboxActive" value="Терминал" type="checkbox" id="terminal">
                                                <label class="form-check-label font-weight-light pl-2 checkbox" for="terminal">
                                                    Терминал
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input name="other" class="form-check-input checkboxActive" value="Кресло" type="checkbox" id="babyChair">
                                                <label class="form-check-label font-weight-light pl-2 checkbox" for="babyChair">
                                                    Детское кресло
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input name="other" class="form-check-input checkboxActive" value="Животные" type="checkbox" id="transportAnimal">
                                                <label class="form-check-label font-weight-light pl-2 checkbox" for="transportAnimal">
                                                    Перевозка животных
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <button type="submit" id="callTaxi" class="btn btn-primary w-100">Вызвать</button>
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
                <div role="tabpanel" id="information" class="tab-pane fade">
                    <div class="row">
                        <div class="col-3 p-0">
                            <nav class="navbar navbar-light bg-faded mt-5">
                                <ul class="nav navbar-nav w-100">
                                    <li class="nav-item d-block navItemBorder">
                                        <a class="nav-link active d-flex align-items-center" id="taxiInfoTab" data-toggle="tab" role="tab" aria-controls="taxiInfo" aria-selected="true" href="#taxiInfo">
                                            О такси
                                        </a>
                                    </li>
                                    <li class="nav-item d-block navItemBorder">
                                        <a class="nav-link" id="promotionTab" data-toggle="tab" role="tab" aria-controls="promotion" aria-selected="false" href="#promotion">Акции</a>
                                    </li>
                                    <li class="nav-item d-block navItemBorder">
                                        <a class="nav-link" id="contactTab" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false" href="#contact">Контакты</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <div class="col-9 p-0">
                            <div class="container-fluid">
                                <div class="tab-content" id="nav-tabContent">
                                    <div class="tab-pane fade show active" role="tabpanel" aria-labelledby="taxiInfoTab" id="taxiInfo">
                                        <div class="container-fluid pt-5">
                                            <div class="about-item mb-5">
                                                <h2 class="d-flex align-items-center text-center font-weight-light justify-content-center">
                                                    <img src="/img/svg/about-history.svg" class="mr-3" alt="history" width="40" height="50">
                                                    История
                                                </h2>
                                                <p class="font-weight-light text-justify px-5">В 2018 году начала свою деятельность такси "791". Начиналось все с нескольких каналов радиосвязи и заключения договоров с перевозчиками и индивидуальными предпринимателями</p>
                                            </div>
                                            <div class="about-item mb-5">
                                                <h2 class="d-flex align-items-center text-center font-weight-light justify-content-center">
                                                    <img src="/img/svg/about-autopark.svg" class="mr-4 pt-2" alt="history" width="40" height="50">
                                                    Автопарк
                                                </h2>
                                                <p class="font-weight-light text-justify px-5">Служба такси "791" насчитывает парк автомобилей в количестве более 1000 единиц, различных марок. Все автомобили, осуществляющие перевозку пассажиров, обратившихся в диспетчерскую, принадлежат индивидуальным предпринимателям либо организациям, имеющим право на осуществление данной услуги.</p>
                                            </div>
                                            <div class="about-item mb-5">
                                                <h2 class="d-flex align-items-center text-center font-weight-light justify-content-center">
                                                    <img src="/img/svg/about-help.svg" class="mr-4 pt-2" alt="history" width="40" height="50">
                                                    Автопомощь «СПАС»
                                                </h2>
                                                <p class="font-weight-light text-justify px-5">Эвакуация автомобиля в случае его технической поломки или ДТП по всей территории РБ;</br>
                                                    Техническая помощь в пути: замена колеса, запуск двигателя от внешнего источника питания, вскрытие и ремонт замков любых видов, отключение зависших сигнализаций и т.д.;</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" role="tabpanel" aria-labelledby="promotionTab" id="promotion">
                                        <div class="container-fluid pt-5">
                                            <div class="pt-3">
                                                <h2 class="text-center font-weight-light mb-3">Подари радость детям!</h2>
                                                <p class="font-weight-light text-justify px-3">
                                                    С 1 марта 2008 года стартовал проект «Подари радость детям», в рамках которого диспетчерская служба такси «791» отчисляла в ГУО «Социально-педагогический центр с приютом Партизанского района г.Минска» денежные средства, приобретала одежду, канцелярские принадлежности и другие необходимые вещи, помогала в благоустройстве их быта, организовывала ознакомительные и культурно-развлекательные экскурсии на предприятия, производящие товары или оказывающие услуги, поздравляла с праздниками и днём рождения каждого ребёнка. Осенью 2011 года приют расформировали, и c 2012 мы взяли под свою опеку ГУ «Детский дом-интернат для детей-инвалидов с особенностями психофизического развития».

                                                    Помните! Пользуясь услугами нашей диспетчерской службы такси «791», а так же технической помощью «СПАС» – Вы вместе с нами участвуете в акции «Подари радость детям!».

                                                    Воспитанники приюта с радость будут ждать Вас по адресу г. Минск ул. Выготского, 16.

                                                    Вы хотите помочь интернату материально? Денежные средства можно перечислить по следующим реквизитам:
                                                </p>
                                                <p class="font-weight-bold px-3">
                                                    р/с 3632000001103</br>
                                                    ф-л 510 АСБ «Беларусбанк» код 603</br>
                                                    ул. Куйбышева, 18, г. Минск</br>
                                                    УНП 600302128, ОКПО 37365512</br>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" role="tabpanel" aria-labelledby="contactTab" id="contact">
                                        <div class="container-fluid pt-5 mt-5">
                                            <div class="row pt-3">
                                                <div class="col-6">
                                                    <div class="contact-item px-2">
                                                        <h2 class="text-center font-weight-light mb-5">Телефоны для вызова</h2>
                                                        <div class="contact-item__item contact-item__item d-flex align-items-center mb-3">
                                                            <span class="textColorBlue mr-3 fs-13">135</span>
                                                            <span class="font-weight-light fs-13">с городского или мобильного</span>
                                                        </div>
                                                        <div class="contact-item__item d-flex align-items-center mb-3">
                                                            <span class="mr-3"><img src="/img/svg/tel.svg" alt="" width="35" height="35"></span>
                                                            <span class="font-weight-light fs-13">+375 44 111-22-33 (Viber, Telegram, WhatsApp)</span>
                                                        </div>
                                                        <div class="contact-item__item d-flex align-items-center mb-3">
                                                            <span class="mr-3"><img src="/img/svg/tel-vel.svg" alt="" width="35" height="35"></span>
                                                            <span class="font-weight-light fs-13">+375 44 111-22-33, +375 29 123-45-67</span>
                                                        </div>
                                                        <div class="contact-item__item d-flex align-items-center mb-3">
                                                            <span class="mr-3"><img src="/img/svg/tel-mts.svg" alt="" width="35" height="35"></span>
                                                            <span class="font-weight-light fs-13">+375 44 111-22-33, +375 29 123-45-67</span>
                                                        </div>
                                                        <div class="contact-item__item d-flex align-items-center mb-3">
                                                            <span class="mr-3"><img src="/img/svg/tel-life.svg" alt="" width="35" height="35"></span>
                                                            <span class="font-weight-light fs-13">+375 44 111-22-33, +375 29 123-45-67</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6 pr-5">
                                                    <div class="contact-item">
                                                        <form action="" method="post">
                                                            <h2 class="text-center font-weight-light mb-4">Обратная связь</h2>
                                                            <p class="small font-weight-light text-center">Если возникли вопросы по работе службы такси "791", пожалуйста, заполните форму.</p>
                                                            <br>
                                                            <div class="form-row justify-content-center">
                                                                <div class="form-group w-100">
                                                                    <input type="text" class="form-control form-control-sm" placeholder="Имя">
                                                                </div>
                                                                <div class="form-group col-3 pl-0">
                                                                    <input type="text" class="form-control form-control-sm" placeholder="+375" readonly>
                                                                </div>
                                                                <div class="form-group col-3">
                                                                    <select class="form-control form-control-sm">
                                                                        <option selected>29</option>
                                                                        <option>25</option>
                                                                        <option>33</option>
                                                                        <option>44</option>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group col-6 pr-0">
                                                                    <input type="text" class="form-control form-control-sm" placeholder="123-45-67">
                                                                </div>
                                                                <div class="form-group w-100">
                                                                    <input type="text" class="form-control form-control-sm" placeholder="Email">
                                                                </div>
                                                                <div class="form-group w-100">
                                                                    <input type="text" class="form-control form-control-sm" placeholder="Сообщение">
                                                                </div>
                                                                <button type="submit" class="btn btn-primary w-75">Отправить</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
