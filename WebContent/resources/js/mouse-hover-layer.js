$(function () {
    $('.data').mouseover(function (e) { // mouse hover 좌표
        $(this).mousemove(function (e) {

            $('#divLayer #layerContent').empty().append($(this).text());
            var t = e.pageY - 15;
            var l = e.pageX + 20;
            $('#divLayer').css({ "top": t, "left": l, "position": "absolute", "opacity": "1" }).show();
        });
    });
    $('.data').mouseout(function () {
        $('#divLayer').hide();
    });
});