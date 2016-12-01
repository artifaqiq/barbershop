$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();

    $(".navbar a, footer a[href='#page']").on('click', function (event) {
        if (this.hash !== "") {

            event.preventDefault();

            var hash = this.hash;

            $('html, body').animate({
                scrollTop: $(hash).offset().top
            }, 900, function () {

                window.location.hash = hash;
            });
        }
    });

})

ymaps.ready(function () {
    var myMap = new ymaps.Map('map', {
            center: [53.90684, 27.437882],
            zoom: 11
        }, {
            searchControlProvider: 'yandex#search'
        }),
        myPlacemark = new ymaps.Placemark(myMap.getCenter(), {
            hintContent: 'Собственный значок метки',
            balloonContent: 'Это красивая метка'
        }, {});

    myMap.geoObjects.add(myPlacemark);
});


function call_me(form) {
    var elems = form;

    if (!elems.name.value) {
        document.getElementById('call_me_status').innerHTML = "Введите имя";
        document.getElementById('call_me_status').className = "call_me_fail";
        return;
    }

    if (elems.phone.value.search(/^(\+\d{12}|\d{11})$/) == -1) {
        if (!elems.phone.value) {
            document.getElementById('call_me_status').innerHTML = "Введите номер телефона";
        } else {
            document.getElementById('call_me_status').innerHTML = "Введите правильный номер телефона";
            document.getElementById('phone').value = "";
        }

        document.getElementById('call_me_status').className = "call_me_fail";
        document.getElementById("phone").placeholder = "+375xxxxxxxxx"
        return;
    }


    var json = JSON.stringify({
        name: elems.name.value,
        phone: elems.phone.value,
        comment: elems.comment.value

    });

    $.ajax({
        cache: false,
        type: "POST",
        url: '/api/call_me',
        data: json,
        datatype: 'json',
        success: success(form)
    });
}

function success(form) {
    document.getElementById('call_me_status').innerHTML = "Мы свяжемся с вами!";
    document.getElementById('call_me_status').className = "call_me_success"
    form.reset();

}

function animationHover(element, animation) {
    element = $(element);
    element.hover(
        function () {
            element.addClass('animated ' + animation);
        },
        function () {
            window.setTimeout(function () {
                element.removeClass('animated ' + animation);
            }, 2000);
        });
}

function showHide(element_id) {
    hideAllPrices(element_id);

    if (document.getElementById(element_id)) {
        var obj = document.getElementById(element_id);
        if (obj.style.display != "inline-table") {
            obj.style.display = "inline-table";
        }
        else obj.style.display = "none";
    }
}

function hideAllPrices(except_id) {
    var el;
    for(var i = 0; ; i++) {
        if ((el = document.getElementById("prices" + i)) == null)
            return;
        if(el.id != except_id)
            el.style.display = "none";

    }
}