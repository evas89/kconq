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
      <form:form action='${root }qna/qnaReply_proc' method='post' modelAttribute="replyPostBean" >
	    <form:hidden path="postidx"/>
	    <input type='hidden' name='page' value='${page }'/>
	    <form:hidden path="keyword"/>
	    <form:hidden path="useridx"/>
	    <form:hidden path="ref"/>
	    <form:hidden path="restep"/>
        
        <div id="board_area">
          <h1>Q&A Reply</h1>
          <table class="list-table">
            <thead>
              <tr>
                <th>Writer</th>
                <td><form:input path="nickname"/></td>
              </tr>
               <tr>
                <th>Title</th>
                <%-- <td><form:input path="title" ></form:input></td> --%>
                <td><input type="text" id="title" name="title" value="[re:]"/></td>
              </tr>
              <!-- <tr>
                <th>비밀번호</th>
                <td>
                  <input type="password" name="password" placeholder="비밀번호는 4~10자리로 입력해주세요.">
                </td>
              </tr>
              <tr>
                <th>이메일주소</th>
                <td><input type="text" name="email"></td>
              </tr> -->
              <tr>
                <th>Detail</th>
                <td><form:textarea cols="70" rows="15" style="height:150px" path="detail"></form:textarea></td>
              </tr>
            </thead>
            <br>
          </table>
          <br>
          <div>
            <form:button class="button">Complete</form:button>
            <form:button type="reset" class="button">Reset</form:button>
            <input class="button" type="button" value="List" onclick="location.href='${root }qna/qnaList'">
          </div>
        </div>
        </form:form>
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