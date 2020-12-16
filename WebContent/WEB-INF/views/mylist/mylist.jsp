<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
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
    <script type="text/javascript" src="${root }js/ddsmoothmenu.js"></script>

    <%-- <script type="text/javascript" src="${root }js/videoEnhance.js"></script> --%>
    

    <script type="text/javascript">

        ddsmoothmenu.init({
            mainmenuid: "top_nav", //menu DIV id
            orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
            classname: 'ddsmoothmenu', //class added to menu's outer DIV
            //customtheme: ["#1c5a80", "#18374a"],
            contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
        })
    </script>
    <link rel="stylesheet" type="text/css" href="${root }css/mylist.css" />
    
    <!-- mouse hover layer javascript -->
    <script type="text/javascript" src="${root }js/mouse-hover-layer.js"></script>
    
</head>

<body>
    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">

            <!-- header.jsp 삽입 -->
      <c:import url="/WEB-INF/views/include/header.jsp"/>

            <div id="templatemo_main" align="center">
                <div id="content" class="">
                    <h1 style="width:700px;">My List</h1>
                    <table width="700px" cellspacing="0" cellpadding="5">
                        <tr bgcolor="#ddd">
                            <th width="220" align="center">My Content </th>
                            <th width="220" align="center">Curation </th>
                            <th width="220" align="center">Description </th>
							<th width="40" align="center">Delete</th>
                        </tr>
                        <c:forEach var='obj' items="${myList}">
							<tr>
								<td align="center"><video src="${root}video/${obj.maincon}"
										width="210px" height="150px" style="padding:10px;" /></td>
								<td align="center"><video src="${root}video/${obj.qcon}"
										width="210px" height="150px" style="padding:10px;" /></td>
								<td align="left" style="padding:10px;">
									<c:set var='catidx' value='${(obj.catidx/10)-1 }' />
									<p>category : ${topMenuList[catidx].getCatname() }</p>
									<p>kotitle : ${obj.kotitle}</p>
									<p>entitle : ${obj.entitle}</p>
									<p>release : ${obj.releaseyear}</p>
									<div style="width:200px">
										<p class="ellipsis"><span class="data">description : ${obj.description}</span></p>
									</div>
								</td>
								<td align="center">
									<a href="${root}mylist/delmyListProc/?conidx=${obj.conidx}">									
		           				        <img class="btnClick"
												src="${root}images/product/delete.png" width="18px"
												height="18px" style="opacity:0.5; align-content: center;" />
									</a>
								</td>
							</tr>
							
							<script>
							function videoEnhance() {
							    let vid = document.getElementsByTagName("video");
							
							    <c:forEach var='i' begin='0' end='${(fn:length(myList) * 2) - 2}' step='2'>
							    	<c:set var='j' value='${i/2}' />
							    	// vid[i].autoplay = true;
							        vid[${i}].muted = true;
							        vid[${i+1}].muted = true;
							        // vid[i].controls = true;
							
							        vid[${i}].addEventListener("mouseover", playVid); //동영상 마우스 오버 했을때 함수 호출
							        vid[${i}].addEventListener("mouseout", pauseVid); //동영상 마우스 아웃 했을때 함수 호출
							        vid[${i}].addEventListener("click", function () {
								        location.href = "${root}contents/contentsDetail?conidx=${myList[j].conidx}"; // click link
								        console.log("video click target page");
								    }); //동영상 클릭 했을때 함수 호출
								    vid[${i+1}].addEventListener("mouseover", playVid); //동영상 마우스 오버 했을때 함수 호출
							        vid[${i+1}].addEventListener("mouseout", pauseVid); //동영상 마우스 아웃 했을때 함수 호출
							        vid[${i+1}].addEventListener("click", function () {
								        location.href = "${root}contents/contentsDetail?conidx=${myList[j].conidx}"; // click link
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
							window.addEventListener('load', videoEnhance);
							</script>
						</c:forEach>
                        <tr>
                            <td colspan="5">
                                <hr style="border: solid 1px rgb(214, 214, 214);">
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="cleaner"></div>
                
                <!-- 마우스 오버 레이어 -->
			    <div id="divLayer" class="overLayer">
			        <span id="layerContent">내용</span>
			    </div>
			    
                <br><br>
                <div>
             		<a href="${root}mylist/deleteAll">
            		<img src="${root}images/product/deleteAll.png"
			         style="opacity:1; align-content: center; width:50px;height:50px;" >
			         </a> 
         	    </div>
            </div> <!-- END of templatemo_main -->

            <!-- footer.jsp 삽입 -->
      <c:import url="/WEB-INF/views/include/footer.jsp"/>

        </div> <!-- END of templatemo_wrapper -->
    </div> <!-- END of templatemo_body_wrapper -->
</body>
</html>