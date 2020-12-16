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

  <!-- card css -->
  <link rel="stylesheet" type="text/css" href="${root }css/card.css" />

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



</head>

<body>

  <div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

      <!-- header.jsp 삽입 -->
      <c:import url="/WEB-INF/views/include/header.jsp"/>


      <div id="templatemo_main">
        <div class="card align-middle">
          <div class="card-title-login">
            <br><br>
            <h2 class="card-title-login text-center">KconQ</h2>
          </div>
          <div class="card-body">
            <form:form class="form-signin" action="${root }user/login_proc" method="post" modelAttribute="tempLoginUserBean">
              
              <h5 class="form-signin-heading">Input your id and password.</h5><br>
              
              <form:label path="userid" class="sr-only"></form:label>
              <form:input path="userid" class="form-control" placeholder="ID" /><br>
              <form:errors path='userid' style='color:red'/><br>
              
              <label path="userpw" class="sr-only"></label>
              <form:password path="userpw" class="form-control" placeholder="Password" /><br>
              <form:errors path='userpw' style='color:red'/><br><br>
              
              <form:button id="btn-Yes" class="btn btn-lg btn-primary btn-block">Login</form:button>
              <button type="button" id="btn-sign" class="btn btn-lg btn-primary btn-block" onclick="location.href='${root }user/signup'">Sign up</button><br><br><br>
            </form:form>

          </div>
        </div>


        <br><br><br>

      </div>


      <!-- footer.jsp 삽입 -->
      <c:import url="/WEB-INF/views/include/footer.jsp"/>

    </div> <!-- END of templatemo_wrapper -->
  </div> <!-- END of templatemo_body_wrapper -->

</body>

</html>