function videoEnhance() {
    let vid = document.getElementsByTagName("video");

    for (i = 0; i < vid.length; i++) {
        // vid[i].autoplay = true;
        vid[i].muted = true;
        // vid[i].controls = true;

        vid[i].addEventListener("mouseover", playVid); //동영상 마우스 오버 했을때 함수 호출
        vid[i].addEventListener("mouseout", pauseVid); //동영상 마우스 아웃 했을때 함수 호출
        vid[i].addEventListener("click", linkVid); //동영상 클릭 했을때 함수 호출
    }

    function playVid(e) {
        e.target.play(); // mouserover play
        console.log("video is playing");
    }
    function pauseVid(e) {
        e.target.pause(); // mouserout pause
        console.log("video is paused");
    }
    function linkVid(e) {
        location.href = "${root}"; // click link
        console.log("video click target page");
    }
}
window.onload = videoEnhance; // 페이지 로딩시 함수 실행