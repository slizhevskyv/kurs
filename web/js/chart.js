var doc = document;
var chart = doc.getElementById("curve_chart"),
    orderTable = doc.getElementById("orders"),
    chartA = doc.getElementById("chart"),
    orderA = doc.getElementById("allOrders");
var data, dataArr;

chartA.onclick = function() {
    orderTable.style.display = "none";
    chart.style.display = "flex";
    ajax(getDataAndCost);
    dataArr = getDataArr(data);
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
}

orderA.onclick = function() {
    chart.style.display = "none";
    orderTable.style.display = "flex";
}





function getDataArr(data) {
    console.log(data)
    var arr = data.split("\n");
    var result = [];
    for(var i = 0; i < arr.length; i++) {
        result.push(arr[i].split(" "));
    }
    for(var i = 0; i < result.length; i++) {
        for(var j = 0; j < result[i].length; j++) {
            if(j % 2 == 1) {
                result[i][j] = parseFloat(result[i][j]);
            } else {
                var sec = Date.parse(result[i][j]);
                var date = new Date(sec);
                result[i][j] = date.toLocaleString("ru", {day:"numeric",month:"long",year:"numeric"});
            }
        }
    }
    return result;
}

function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ['Дата', 'Сумма'],
        dataArr[0],
        dataArr[1],
        dataArr[2],
        dataArr[3],
        dataArr[4]
    ]);

    var options = {
        title: 'График общих заказов',
        curveType: 'function',
        legend: { position: 'bottom' }
    };

    var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

    chart.draw(data, options);
}

function ajax(callback) {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (this.status == 200) {
            callback(this.responseText);
        }
    };
    xhr.open("POST", "/fetchCostAndDate", false);
    xhr.send();
}

function getDataAndCost(text) {
    data = text;
}

