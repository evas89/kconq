function videoEnhanceImg(){
    let vid = document.getElementsByTagName("video");
    let videoTopLayer = document.getElementById("videoTopLayer");
    
    vid[0].muted = true;
                 
    videoTopLayer.addEventListener("mouseover", playVidImg);
    videoTopLayer.addEventListener("mouseout", pauseVidImg);
    videoTopLayer.addEventListener("click", linkVidImg); 


    function playVidImg() {
           videoTopLayer.style.opacity = 1;
           vid[0].play();
           console.log("layer on play");
       }
    function pauseVidImg() {
           vid[0].pause();
           console.log("layer on pause");
       }
    function linkVidImg() {
        location.href="${root }"; // click link
        console.log("video click target page");
    }
}
window.onload=videoEnhanceImg; // 페이지 로딩시 함수 실행