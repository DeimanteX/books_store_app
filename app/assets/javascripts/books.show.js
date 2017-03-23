$(document).ready(function() {

    $("#get_coupon")
        .bind("ajax:success", function(event, data, status, xhr) {
            $('#coupon-link').text(data.coupon_link);
            $('#coupon-modal').modal('show');
        });
})