
var myMap,pointA, pointB, mainRoute, mBounds;
var doc = document;
var placemarkA = doc.getElementById("startPoint"),
    placemarkB = doc.getElementById("endPoint"),
    nameCustomer = doc.getElementById("nameCustomer"),
    shipingCost = doc.getElementById("shippingCost"),
    telephone = doc.getElementById("telephone");

ymaps.ready(init);

function init(){
    myMap = new ymaps.Map("map", {
        center: [53.90561620, 27.56740099],
        zoom: 11
    });
    mBounds = myMap.getBounds();
    console.log(mBounds);
}

function check(pointA,pointB) {
    if(pointB != undefined && pointA != undefined) {
        myMap.geoObjects.remove(mainRoute);
        ymaps.route([pointA, pointB], {
            multiRoute: false,
            boundedBy: mBounds,
            strictBounds: true
        }).then(function(route) {
            //console.log(route.getLength());
            mainRoute = route;
            route.options.set("mapStateAutoApply", true);
            myMap.geoObjects.add(route);
            var result = (route.getLength()/1000).toFixed(2);
            console.log(result);
            shipingCost.innerHTML = (result * 0.55).toFixed(2) + " BYN";
        }, function(err) {
            throw err;
        }, this);
    }
}





placemarkA.onblur = function() {
    if(this.value != "") {
        pointA = this.value;
        check(pointA,pointB);
    } else {
        this.classList.add("customDangerBorder");
    }
};
placemarkA.onfocus = function() {
    if(this.classList.contains("customDangerBorder")) {
        this.classList.remove("customDangerBorder");
    }
};
placemarkB.onblur = function() {
    if(this.value != "") {
        pointB = this.value;
        check(pointA,pointB);
    } else {
        this.classList.add("customDangerBorder");
    }
};
placemarkB.onfocus = function() {
    if(this.classList.contains("customDangerBorder")) {
        this.classList.remove("customDangerBorder");
    }
};
nameCustomer.onblur = function() {
    if(this.value == "") {
        this.classList.add("customDangerBorder");
    }
};
nameCustomer.onfocus = function() {
    if(this.classList.contains("customDangerBorder")) {
        this.classList.remove("customDangerBorder");
    }
};
telephone.onblur = function() {
    if(this.value != "") {
        pointA = this.value;
    } else {
        this.classList.add("customDangerBorder");
    }
};
telephone.onfocus = function() {
    if(this.classList.contains("customDangerBorder")) {
        this.classList.remove("customDangerBorder");
    }
};