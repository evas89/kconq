<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!-- templatemo 367 shoes -->
<!-- 
Shoes Template 
http://www.templatemo.com/preview/templatemo_367_shoes 
-->
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
    <link rel="stylesheet" type="text/css" href="${root }slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="${root }slick/slick-theme.css" />
    <!-- slick-slider css 추가 -->
    <link rel="stylesheet" type="text/css" href="${root }css/slick-slider.css" />
    
</head>

<body>

    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">

			<!-- header.jsp 삽입 -->
            <c:import url="/WEB-INF/views/include/header.jsp"/>

            <div id="templatemo_main" align="center">

                <div id="content" class="">

                    <!-- 비디오 태그 위에서 작동하는 코드 over, out , click -->
                    <!-- <script type="text/javascript" src="js/videoEnhanceImg.js"></script> -->
                    
                    <!-- 큰 동영상 관련 javascript -->
                    <script type="text/javascript">
	                    function videoEnhanceImg(){
	                        let vid = document.getElementsByTagName("video");
	                        let videoTopLayer = document.getElementById("videoTopLayer");
	                        
	                        vid[0].muted = true;
			                             
	                        vid[0].addEventListener("mouseover", playVidImg);
	                        vid[0].addEventListener("mouseout", pauseVidImg);
	                        vid[0].addEventListener("click", linkVidImg); 

	
	                        function playVidImg() {
	                               // videoTopLayer.style.opacity = 1;
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
                   </script> <!-- end of 동영상 관련 javascript -->

                    <!-- 큰영상 -->
                    <div style="position:relative;">
                        <video src="${root }video/intro.mp4" width="660px" hieght="300px">
                            <strong>Your browser does not support the video tag.</strong>
                        </video>
                        <%-- <img id="videoTopLayer" src="${root }images/slider/transparent3.png" width="680px" height="372px" style="position: absolute; top: 0px; left: 0px; opacity: 0;" /> --%>
                    </div>
                    <br><br><br>

					<!-- 웹페이지 리딩 순서: Java -> Jstl -> Html, -> Javascript -->
					
					<!-- 카테고리별 분류 for문 -->
					<c:forEach var='obj' items='${contentListList }' varStatus='status'>
						<c:set var='index' value='${status.index }' />
						<!-- 카테고리 이름 출력 -->
		                <h1 class="text-left">${topMenuList[index].catname }</h1>
		                <!-- slick-slider -->
		                <div class="slick-wrapper">
		                	<!-- 카테고리 내 동영상 출력 for문 -->
							<c:forEach var='obj2' items='${obj }' varStatus='status2' >
								<c:set var='index2' value='${status2.index }' />
		                        <div class="product_box">
		                            <video src="${root }video/${obj2.maincon}" width="200px" hieght="150px">
		                                <strong>Your browser does not support the video tag.</strong>
		                            </video>
		                            <p>${obj2.entitle}</p>
		                            
		                            <!-- 작은 동영상 관련 javascript -->
		                            <script type="text/javascript">
					                    function videoEnhance(){
					                        
					                        let slickWrapper = document.getElementsByClassName("slick-wrapper");
					                        let vid2;
											
									        <c:forEach var='i' begin='0' end='${fn:length(contentListList) - 1}' step='1'>
									        	vid2 = slickWrapper[${i}].getElementsByTagName("video");
									        	<c:forEach var='j' begin='0' end='${fn:length(contentListList[i])}' step='1' varStatus='status3'>
									        		<c:if test="${not status3.last}" >
										        		<c:set var="i" value="${i}" />
										        		<c:set var="j" value="${j}" />
										        		
							                            // vid[i].autoplay = true;
							                            vid2[${j+3}].muted = true;
							                            // vid[i].controls = true;
							                            
							                            vid2[${j+3}].addEventListener("mouseover", playVid); //동영상 마우스 오버 했을때 함수 호출
							                            vid2[${j+3}].addEventListener("mouseout", pauseVid); //동영상 마우스 아웃 했을때 함수 호출
							                            vid2[${j+3}].addEventListener("click", function() {
											            	/* jstl 동적 변수 선언 및 대입 */
											                location.href = "${root }contents/contentsDetail?conidx=${contentListList[i][j].conidx}"; // click link
											                console.log("video click target page");
											            }); //동영상 클릭 했을때 함수 호출
							                            
							                        </c:if>
					                            </c:forEach>
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
					                    window.addEventListener('load', videoEnhance); // 페이지 로딩시 함수 실행
				                    </script> <!-- end of 동영상 관련 javascript -->
		                        </div>	<!-- end of product_box -->
	                   		</c:forEach>  <!-- end of 카테고리 내 동영상 출력 for문 -->
		                </div>  <!-- end of slick-wrapper -->
		                <div class="cleaner"></div>
	                </c:forEach>  <!-- end of 카테고리별 분류 for문 -->
                
                </div>  <!-- end of content -->
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