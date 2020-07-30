$(document).ready(function () {
    $("input[type='number']").inputSpinner();
    $("#checkboxAll").click(function () {
    	
        $('input:checkbox').not(this).prop('checked', this.checked);
        $(".btn-thanh-toan").click(function (event) {
            event.preventDefault();
            var tmp = $("#a-giohang").attr("href");
            if ($(".tong-tien").text() == " 0 đ") {
                $(".btn-thanh-toan").attr("data-target", "#myModal12");
                $("#a-giohang").attr("href", "#");
            } else {
                $(".btn-thanh-toan").attr("data-target", "#myModal1");
                $("#a-giohang").attr("href", "tmp");
            }
        });
    });
    $("#chinh-sua").click(function (e) {
        $('#ten').prop('disabled', function (i, v) { return !v; });
        $('#dia-chi').prop('disabled', function (i, v) { return !v; });
        $("#sdt").prop('disabled', function (i, v) { return !v; });
    });
});