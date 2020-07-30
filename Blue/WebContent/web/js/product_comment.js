var resultStar;

function danhGiaSao(star) {
    console.log(resultStar);
    if (resultStar != null) {
        for (i = 1; i <= resultStar; i++) {
            document.getElementById("s" + i).classList.remove("far");
            document.getElementById("s" + i).classList.remove("fas");
            document.getElementById("s" + i).classList.add("far");
        }
    }
    for (i = 1; i <= star; i++) {
        document.getElementById("s" + i).classList.replace("far", "fas");
    }
}

function huyDanhGiaSao() {
    for (i = 1; i <= 5; i++) {
        document.getElementById("s" + i).classList.remove("far");
        document.getElementById("s" + i).classList.remove("fas");
        document.getElementById("s" + i).classList.add("far");
    }
    if (resultStar != null) {
        for (i = 1; i <= resultStar; i++) {
            document.getElementById("s" + i).classList.replace("far", "fas");
        }
    }

}

function trotDanhGiaSao(star) {
    danhGiaSao(star);
    resultStar = star;
    document.getElementById("value-rating").value = resultStar;
    return resultStar;
}
var btn = 0;

function doiNutBam() {
    if (btn == 0) {
        var tmp = document.getElementById("show-bieu-mau-danh-gia");
        tmp.classList.replace("btn-primary", "btn-outline-primary");
        tmp.innerHTML = "Đóng Lại"
        btn = 1;
    } else {
        if (btn == 1) {
            var tmp = document.getElementById("show-bieu-mau-danh-gia");
            tmp.classList.replace("btn-outline-primary", "btn-primary");
            tmp.innerHTML = "Đánh Giá"
            btn = 0;
        }
    }
}