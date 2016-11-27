$(document).ready(function(){
    // Initialize Tooltip
    $('[data-toggle="tooltip"]').tooltip();

    // Add smooth scrolling to all links in navbar + footer link
    $(".navbar a, footer a[href='#page']").on('click', function(event) {

        // Make sure this.hash has a value before overriding default behavior
        if (this.hash !== "") {

            // Prevent default anchor click behavior
            event.preventDefault();

            // Store hash
            var hash = this.hash;

            // Using jQuery's animate() method to add smooth page scroll
            // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
            $('html, body').animate({
                scrollTop: $(hash).offset().top
            }, 900, function(){

                // Add hash (#) to URL when done scrolling (default click behavior)
                window.location.hash = hash;
            });
        } // End if
    });
})

function call_me(form) {
    var elems = form;

    if(!elems.name.value) {
        document.getElementById('call_me_status').innerHTML = "Введите имя";
        document.getElementById('call_me_status').className = "call_me_fail";
        return;
    }

    if(elems.phone.value.search(/^(\+\d{12}|\d{11})$/) == -1){
        if(!elems.phone.value) {
            document.getElementById('call_me_status').innerHTML = "Введите номер телефона";
        } else {
            document.getElementById('call_me_status').innerHTML = "Введите правильный номер телефона";
            document.getElementById('phone').value = "";
        }

        document.getElementById('call_me_status').className = "call_me_fail";
        document.getElementById("phone").placeholder="+375xxxxxxxxx"
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
