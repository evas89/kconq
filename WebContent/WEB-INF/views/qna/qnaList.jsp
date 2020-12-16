<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

  <link rel="stylesheet" type="text/css" href="${root }css/qnalist.css" />

</head>

<body>
  <div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

      <!-- header.jsp 삽입 -->
      <c:import url="/WEB-INF/views/include/header.jsp"/>

      <!-- main -->
      <div id="templatemo_main">
      
        <!-- board_area -->
        <div id="board_area">
          <h1>Q&A List</h1>
          <div class="qnimg" align="center">
            <img src="${root }images/product/Thankyou1.png" />
          </div>
          <table class="list-table">
            <thead>
              <tr>
                <th width="70">NO</th>
                <th width="120">Keyword</th>
                <th width="500">Title</th>
                <th width="100">Writer</th>
                <th width="100">Date</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var='obj' items="${postList }">
              <tr>
                <td width="70">${obj.postidx }</td>
                <td width="120">${obj.keyword }</td>
                <td width="500" style="text-align:left; padding-left: 10px;">
                	<c:if test="${obj.restep gt 1 }">
                		<%-- <c:set var='end' value='${obj.restep -1 }' /> --%>
						<c:forEach var='indent' begin='1' end='${(obj.restep - 1) * 2 }' step='1'>
							&nbsp;
						</c:forEach>
                	</c:if>
                	<a href="${root }qna/qnaDetail?postidx=${obj.postidx}&page=${page}">${obj.title }</a>
                </td>
                <td width="100">${obj.nickname }</td>
                <td width="100">${obj.regdate }</td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
          <br>
          <div>
            <input class="button" type="button" value="Write" onclick="location.href='${root }qna/qnaWrite'">
          </div>
          <br>
        </div> <!-- end of board_area -->
        
        <!-- paging -->
        <div class="paging" align="center">
          <!-- prev -->
          <c:choose>
		  <c:when test="${pageBean.prevPage <= 0 }">
            <a class="prev"><span>◀ Prev &nbsp&nbsp</span></a>
          </c:when>
		  <c:otherwise>
		    <a href="${root }qna/qnaList?page=${pageBean.prevPage}"class="prev"><span>◀ Prev &nbsp&nbsp</span></a>
		  </c:otherwise>
		  </c:choose>
		  <!-- numbox -->
          <span class="numbox">
            <c:forEach var='idx' begin="${pageBean.min }" end='${pageBean.max }'>
			  <c:choose>
			  <c:when test="${idx == pageBean.currentPage }">
	            <a href="${root }qna/qnaList?page=${idx}" class="active"> ${idx }&nbsp</a>
	          </c:when>
			  <c:otherwise>
			    <a href="${root }qna/qnaList?page=${idx}"> ${idx } &nbsp</a>
			  </c:otherwise>
			  </c:choose>
			</c:forEach>
          </span>
          <!-- next -->
          <c:choose>
		  <c:when test="${pageBean.max >= pageBean.pageCnt }">
            <a class="next"><span>&nbsp&nbsp Next ▶</span></a>
          </c:when>
		  <c:otherwise>
		    <a href="${root }qna/qnaList?page=${pageBean.nextPage}" class="next"><span>&nbsp&nbsp Next ▶</span></a>
		  </c:otherwise>
		  </c:choose> 
        </div> <!-- end of paging -->

        <div class="cleaner"></div>

        <!-- 하단 이미지 -->
        <img class="bottom-bg" src="${root }images/bottom_bg.png" />
        <div class="cleaner"></div>

      </div> <!-- END of templatemo_main -->

      <!-- footer.jsp 삽입 -->
      <c:import url="/WEB-INF/views/include/footer.jsp"/>

    </div> <!-- END of templatemo_wrapper -->
  </div> <!-- END of templatemo_body_wrapper -->

</body>

</html>