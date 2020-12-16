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

  <!-- qnadetail.css -->
  <link rel="stylesheet" type="text/css" href="${root }css/qnadetail.css" />

</head>


<body>
  <div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

      <!-- header.jsp 삽입 -->
      <c:import url="/WEB-INF/views/include/header.jsp"/>

      <!-- main -->
      <div id="templatemo_main">
        <div id="board_area">
          <h1> Q&A Detail </h1>
          <table class="list-table">
            <thead>
              <tr>
                <th>Writer</th>
                <td><input type="text" name="nickname" value="${readPostBean.nickname }" disabled="disabled" /></td>
              </tr>
              <tr>
                <th>Date</th>
                <td><input type="text" name="regdate" value="${readPostBean.regdate }" disabled="disabled" /></td>
              </tr>
              <tr>
                <th>Title</th>
                <td>
                  <input type="text" name="title" value="[${readPostBean.keyword }] ${readPostBean.title }" disabled="disabled" />
                </td>
              </tr>
              <tr>
                <th>Detail</th>
                <td><textarea cols="70" rows="15" style="height:150px" name="detail" disabled="disabled" >${readPostBean.detail }</textarea></td>
              </tr>
            </thead>
            <br>
          </table>
          <br>
          <div>
          	<c:if test="${loginUserBean.userLogin == true && loginUserBean.useridx == readPostBean.useridx }">
	            <input class="button" type="button" value="Delete" onclick="location.href='${root }qna/qnaDelete?postidx=${postidx}'">
	            <input class="button" type="button" value="Modify" onclick="location.href='${root }qna/qnaModify?postidx=${postidx}&page=${page}'">
            </c:if>
            <input class="button" type="button" value="Reply" onclick="location.href='${root }qna/qnaReply?postidx=${postidx}&page=${page}'">
            <input class="button" type="button" value="List" onclick="location.href='${root }qna/qnaList'">
          </div>
        </div>
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