<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>KconQ</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="${root }templatemo_style.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" type="text/css" href="${root }css/ddsmoothmenu.css" />

    <script type="text/javascript" src="${root }js/jquery.min.js"></script>
    <script type="text/javascript" src="${root }js/ddsmoothmenu.js">

        /***********************************************
        * Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
        * This notice MUST stay intact for legal use
        * Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
        ***********************************************/

    </script>

    <script type="text/javascript">

        ddsmoothmenu.init({
            mainmenuid: "top_nav", //menu DIV id
            orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
            classname: 'ddsmoothmenu', //class added to menu's outer DIV
            //customtheme: ["#1c5a80", "#18374a"],
            contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
        })

    </script>

    <!-- slick-slider -->
    <link rel="stylesheet" type="text/css" href="${root }slick/slick.css">
    <link rel="stylesheet" type="text/css" href="${root }slick/slick-theme.css">
    <!-- slick-slider css 추가 -->
    <link rel="stylesheet" type="text/css" href="${root }css/slick-slider.css">

    <!-- chat css -->
    <link rel="stylesheet" type="text/css" href="${root }css/chat.css">

    <!-- video layer popup -->
    <link rel="stylesheet" type="text/css" href="${root }css/popup.css">
    <script type="text/javascript" src="${root }js/popup.js"></script>

    <!-- detail.css -->
    <link rel="stylesheet" type="text/css" href="${root }css/contentdetail.css">
    
    <!-- mouse hover layer javascript -->
    <script type="text/javascript" src="${root }js/mouse-hover-layer.js"></script>
    
    <!-- contentsLoveit -->
    <script>
	function contentsLoveit(){
		
		let myListConIdx = $("#myListConIdx").val();
		let myListUserIdx = $("#myListUserIdx").val();
		
		$.ajaxSettings.traditional = true;
		$.ajax({
			url : '${root}contents/contentsLoveit',
			type : 'get',
			data : { myListConIdx : myListConIdx,
					 myListUserIdx : myListUserIdx},
		    contentType : "application/x-www-form-urlencoded; charset=utf-8",
		    dataType : "text",
			success : function(result){
				if(result == 'not_login'){
					alert('로그인 하세요.');
				}else if(result == 'true'){
					alert('찜하기에 성공하셨습니다.');
					$("#mylistCount").text('${loginUserBean.getCountMyList()+1}');
				} else {
					alert('이미 찜한 컨텐츠입니다.');
				}
			},error:function(request, error) {
				alert("fail");
				// error 발생 이유를 알려준다.
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	}
    </script>

</head>

<body>

    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">

            <!-- header.jsp 삽입 -->
            <c:import url="/WEB-INF/views/include/header.jsp"/>

            <div id="templatemo_main" align="center">

                <div id="content" class="">

                    <!-- 비디오 play, stop, link -->
                    <%-- <script type="text/javascript" src="${root }js/videoEnhance.js"></script> --%>

                    <!-- Margin -->
                    <div class="margin"></div>
                    <!-- 디테일 -->
                    <div>
                        <section class="content">
                            <!-- 동영상 레이어 팝업창 -->
                            <div class="popup">
                                <!-- 팝업창이 링크된 이미지 -->
                                <img src="${root }images/product/${readContentBean.conimg }" height="300" width="300">
                                <div class="coverlay" onclick="myFunctionlowery()">
                                </div>
                                <!-- 팝업창 레이어 -->
                                <span class="popuptext" id="lowery">
                                    <div
                                        style="position:relative; top:20vh; width:100%; max-width:1000px; margin:0 auto;">
                                        <!-- 팝업된 동영상 -->
                                        <%-- <iframe style="width:60%; max-width:1000px; height:40vh; max-height:700px;" src="${root }video/${readContentBean.maincon }" frameborder="0" allowfullscreen></iframe> --%>
										<video class="popup-video" src="${root }video/${readContentBean.maincon }" controls muted ></video>
                                        <!-- 동영상 옆 댓글 -->
                                        <div id="chat-container">
                                            <main>
                                                <ul id="chat">
                                                    <li class="you">
                                                        <div class="entete">
                                                            <span class="status green"></span>
                                                            <h2>Vincent</h2>
                                                            <h3>10:12AM, Today</h3>
                                                        </div>
                                                        <div class="triangle"></div>
                                                        <div class="message">
                                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                                                            Aenean commodo ligula eget dolor.
                                                        </div>
                                                    </li>
                                                    <li class="me">
                                                        <div class="entete">
                                                            <h3>10:12AM, Today</h3>
                                                            <h2>Vincent</h2>
                                                            <span class="status blue"></span>
                                                        </div>
                                                        <div class="triangle"></div>
                                                        <div class="message">
                                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                                                            Aenean commodo ligula eget dolor.
                                                        </div>
                                                    </li>
                                                    <li class="me">
                                                        <div class="entete">
                                                            <h3>10:12AM, Today</h3>
                                                            <h2>Vincent</h2>
                                                            <span class="status blue"></span>
                                                        </div>
                                                        <div class="triangle"></div>
                                                        <div class="message">
                                                            OK
                                                        </div>
                                                    </li>
                                                    <li class="you">
                                                        <div class="entete">
                                                            <span class="status green"></span>
                                                            <h2>Vincent</h2>
                                                            <h3>10:12AM, Today</h3>
                                                        </div>
                                                        <div class="triangle"></div>
                                                        <div class="message">
                                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                                                            Aenean commodo ligula eget dolor.
                                                        </div>
                                                    </li>
                                                    <li class="me">
                                                        <div class="entete">
                                                            <h3>10:12AM, Today</h3>
                                                            <h2>Vincent</h2>
                                                            <span class="status blue"></span>
                                                        </div>
                                                        <div class="triangle"></div>
                                                        <div class="message">
                                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                                                            Aenean commodo ligula eget dolor.
                                                        </div>
                                                    </li>
                                                    <li class="me">
                                                        <div class="entete">
                                                            <h3>10:12AM, Today</h3>
                                                            <h2>Vincent</h2>
                                                            <span class="status blue"></span>
                                                        </div>
                                                        <div class="triangle"></div>
                                                        <div class="message">
                                                            OK
                                                        </div>
                                                    </li>
                                                </ul>
                                                <footer>
                                                    <textarea placeholder="Type your message"></textarea>
                                                    <a href="#">Send</a>
                                                </footer>
                                            </main>
                                        </div> <!-- end of chat-container -->
                                        <div align="right">
                                            <img src="${root }images/closelabel.gif" onclick="myFunctionlowery()"
                                                style="cursor:pointer; border-radius:4px; margin-right:1%;">
                                        </div>
                                    </div> <!-- end of vidio&chat container-->
                                </span>

                            </div>
                            <div class="btn">
                                <button class="btnin" id="btn1" onclick="myFunctionlowery()">Watch</button>
                                <%-- <form action="${root }contents/contentsLoveit" method="post"> --%>
                                <input type="hidden" id="myListConIdx" name="myListConIdx" value="${conidx }" />
                                <input type="hidden" id="myListUserIdx" name="myListUserIdx" value="${loginUserBean.useridx }" />
                                <button class="btnin" id="btn2" onclick="contentsLoveit()">Add List</button>
                                <!-- </form> -->
                            </div>
                        </section>
                        <section>
                            <aside class="right-side">
                                <h2 class="curation">Curation</h2>
                                <div class="videoarea">
                                    <iframe src="${root }video/${readContentBean.qcon }" height="200" width="300"
                                        style="border:none;"></iframe>
                                </div>
                                <div class="textarea">
                                    <p></p>
                                    <p>release year : ${readContentBean.releaseyear }</p>
                                    <p class="ellipsis">description : <br><span class="data">${readContentBean.description }</span></p>
                                </div>
                                <!-- 마우스 오버 레이어 -->
							    <div id="divLayer" class="overLayer">
							        <div class="content2">
							            description :<br><span id="layerContent">내용</span>
							        </div>
							    </div>
                            </aside>
                        </section>
                    </div>
                    <div class="cleaner"></div>

                    <br>
                    <h2 class="bold">${readContentBean.entitle } / ${readContentBean.kotitle }</h2>



                    <!-- 동영상 -->
                    <h1 class=""></h1>
                    <div class="detail" id="slick-slider-video">
                        <header>
                            <h1 class="detail-text">&nbsp;</h1>
                        </header>
                        <div class="regular2 slider_bottom">
                        	<c:forEach var='obj' items='${relatedContentList }'>
	                            <div>
	                                <video src="${root }video/${obj.maincon }" width="135" height="100"
	                                    class="slide_image"></video>
	                                <script type="text/javascript">
		                                function videoEnhance() {
		                                    let slickSliderVideo = document.getElementById("slick-slider-video");
		                                	let vid = slickSliderVideo.getElementsByTagName("video");
	
		                                    // for (i = 0; i < vid.length; i++) {
		                                    <c:set var="i" value="4" />
		                                    <c:forEach var="obj" items="${relatedContentList}">
		                                        // vid[i].autoplay = true;
		                                        vid[${i}].muted = true;
		                                        // vid[i].controls = true;
	
		                                        vid[${i}].addEventListener("mouseover", playVid); //동영상 마우스 오버 했을때 함수 호출
		                                        vid[${i}].addEventListener("mouseout", pauseVid); //동영상 마우스 아웃 했을때 함수 호출
		                                        vid[${i}].addEventListener("click", function() {
			                                        location.href = "${root}contents/contentsDetail?conidx=${obj.conidx}"; // click link
			                                        console.log("video click target page");
			                                    }); //동영상 클릭 했을때 함수 호출
		                                        <c:set var="i" value="${i+1}" />
		                                    </c:forEach>
		                                    // }
	
		                                    function playVid(e) {
		                                        e.target.play(); // mouserover play
		                                        console.log("video is playing");
		                                    }
		                                    function pauseVid(e) {
		                                        e.target.pause(); // mouserout pause
		                                        console.log("video is paused");
		                                    }
		                                }
		                                window.onload = videoEnhance; // 페이지 로딩시 함수 실행
	                                </script>
	                            </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="cleaner"></div>


                </div>
                <div class="cleaner"></div>
            </div> <!-- END of templatemo_main -->

            <!-- slick-slider -->
            <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
            <script src="${root }slick/slick.js" type="text/javascript" charset="utf-8"></script>
            <!-- slick-slider 설정 -->
            <script type="text/javascript" src="${root }js/slick-slider.js"></script>

            <!-- footer.jsp 삽입 -->
            <c:import url="/WEB-INF/views/include/footer.jsp"/>

        </div> <!-- END of templatemo_wrapper -->
    </div> <!-- END of templatemo_body_wrapper -->




</body>

</html>