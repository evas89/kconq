<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    
    

</head>

<body>

    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">

            <!-- header.jsp 삽입 -->
            <c:import url="/WEB-INF/views/include/header.jsp"/>
            
            <div id="templatemo_main" align="center">

                <div id="content" class="">

                    <!-- 비디오 태그 위에서 작동하는 코드 over, out , click -->
                    <%-- <script type="text/javascript" src="${root }js/videoEnhance.js"></script> --%>
                    

                    <!-- 슬라이드   -->
                    <h1 class="detail-text slider-margin">${catname}</h1>
                    <div class="regular slider-margin">
                    	<c:forEach var="obj" items="${ImgContentList }" >
	                        <div>
	                            <img src="${root }images/product/${obj.conimg }" onclick="location.href='${root }contents/contentsDetail?conidx=${obj.conidx}'" width="400" height="280">
	                        </div>
                        </c:forEach>
                    </div>

                    <!-- <h1 class="text-left">Movie</h1> -->
                    <div class="">
                    	<!-- 웹페이지 리딩 순서: Java -> Jstl -> Html, -> Javascript -->
                    	<c:forEach var='obj' items='${contentList }'>
                    		<script type="text/javascript">
							    function videoEnhance() {
							        let vid = document.getElementsByTagName("video");
							        
							        console.log("vid.length : " + vid.length);
							        
							        let i;
							        <c:forEach var='i' begin='0' end='${fn:length(contentList) - 1}' step='1'>
							            i = ${i}
							        	// vid[i].autoplay = true;
							            vid[i].muted = true;
							            // vid[i].controls = true;
							
							            vid[i].addEventListener("mouseover", playVid); //동영상 마우스 오버 했을때 함수 호출
							            vid[i].addEventListener("mouseout", pauseVid); //동영상 마우스 아웃 했을때 함수 호출
							            vid[i].addEventListener("click", function() {
							            	/* jstl 동적 변수 선언 및 대입 */
							            	<c:set var="index" value="${i}" />
							                location.href = "${root }contents/contentsDetail?conidx=${contentList[index].conidx}"; // click link
							                console.log("video click target page");
							            }); //동영상 클릭 했을때 함수 호출
							        </c:forEach>
							
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
	                        <div class="product_box">
	                            <video src="${root }video/${obj.maincon}" width="200px" hieght="150px">
	                                <strong>Your browser does not support the video tag.</strong>
	                            </video>
	                            <p>${obj.entitle}</p>
	                        </div>
                        </c:forEach>
                    </div>
                    <div class="cleaner"></div>

                </div>
                <div class="cleaner"></div>
            </div> <!-- END of templatemo_main -->

            <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
            <script src="${root }slick/slick.js" type="text/javascript" charset="utf-8"></script>
            <!-- slick-slider 설정-->
            <script type="text/javascript" src="${root }js/slick-slider.js"></script>

           <!-- footer.jsp 삽입 -->
            <c:import url="/WEB-INF/views/include/footer.jsp"/>

        </div> <!-- END of templatemo_wrapper -->
    </div> <!-- END of templatemo_body_wrapper -->




</body>

</html>