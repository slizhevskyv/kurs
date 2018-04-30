
var myMap,pointA, pointB, mainRoute, mBounds;
var doc = document;
var placemarkA = doc.getElementById("startPoint"),
    placemarkB = doc.getElementById("endPoint"),
    nameCustomer = doc.getElementById("nameCustomer"),
    shipingCost = doc.getElementById("shippingCost"),
    telephone = doc.getElementById("telephone"),
    fieldMainForm = doc.getElementsByClassName("customForm"),
    buttonCallTaxi = doc.getElementById("callTaxi"),
    fieldHelpBox = doc.getElementsByClassName("custom-help-block");

ymaps.ready(init);

function init(){
    myMap = new ymaps.Map("map", {
        center: [53.90561620, 27.56740099],
        zoom: 11
    });
    mBounds = myMap.getBounds();
}
function check(pointA,pointB) {
    if(pointB != undefined && pointA != undefined) {
        myMap.geoObjects.remove(mainRoute);
        ymaps.route([pointA, pointB], {
            multiRoute: false,
            boundedBy: mBounds,
            strictBounds: true
        }).then(function(route) {
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


buttonCallTaxi.onclick = function(e) {
    var count = 0;
    var invalidField = [];
    for(var i = 0; i < fieldMainForm.length; i++) {
        if(!fieldMainForm[i].classList.contains("customDangerBorder") && fieldMainForm[i].value != "") {
                count++;
        } else {
            invalidField.push(i);
        }
    }
    if(count === fieldMainForm.length) {
    }else {
        console.log(invalidField);
        for(var i = 0; i < invalidField.length; i++) {
            var index = invalidField[i];
            fieldMainForm[index].classList.add("customDangerBorder");
            fieldHelpBox[index].style.display = "block";
        }
        e.preventDefault();
    }
}

placemarkA.onblur = function() {
    if(this.value != "") {
        pointA = this.value;
        check(pointA,pointB);
    } else {
        this.classList.add("customDangerBorder");
        fieldHelpBox[0].style.display = "block";
    }
};
placemarkA.onfocus = function() {
    if(this.classList.contains("customDangerBorder")) {
        this.classList.remove("customDangerBorder");
        fieldHelpBox[0].style.display = "none";
    }
};
placemarkB.onblur = function() {
    if(this.value != "") {
        pointB = this.value;
        check(pointA,pointB);
    } else {
        this.classList.add("customDangerBorder");
        fieldHelpBox[1].style.display = "block";
    }
};
placemarkB.onfocus = function() {
    if(this.classList.contains("customDangerBorder")) {
        this.classList.remove("customDangerBorder");
        fieldHelpBox[1].style.display = "none";
    }
};
nameCustomer.onblur = function() {
    if(this.value == "") {
        fieldHelpBox[2].style.display = "block";
        this.classList.add("customDangerBorder");
    }
};
nameCustomer.onfocus = function() {
    if(this.classList.contains("customDangerBorder")) {
        this.classList.remove("customDangerBorder");
        fieldHelpBox[2].style.display = "none";
    }
};
telephone.onblur = function() {
    var value = this.value;
    if(value && value.search(/(\d){3}-(\d){2}-(\d){2}/ig) != -1) {
        if(this.classList.contains("customDangerBorder")) {
            this.classList.remove("customDangerBorder");
            fieldHelpBox[3].style.display = "none";
        }
    } else {
        this.classList.add("customDangerBorder");
        fieldHelpBox[3].style.display = "block";
    }
};
telephone.onfocus = function() {
    if(this.classList.contains("customDangerBorder")) {
        this.classList.remove("customDangerBorder");
        fieldHelpBox[3].style.display = "none";
    }
};