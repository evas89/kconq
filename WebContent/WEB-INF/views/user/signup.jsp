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
  <title>KconQ - Sign up</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <link href="${root }templatemo_style.css" rel="stylesheet" type="text/css" />

  <link rel="stylesheet" type="text/css" href="${root }css/ddsmoothmenu.css" />

  <!-- 달력 css -->
  <link rel="stylesheet" href="${root }css/pikaday.css" />
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
  
  <script>
	function checkUserIdExist(){
		
		var userid = $("#userid").val()
		
		if(userid.length == 0){
			alert('아이디를 입력해주세요')
			return
		}
		
		$.ajax({
			url : '${root}user/checkUserIdExist/' + userid,
			type : 'get',
			dataType : 'text',
			success : function(result){
				if(result.trim() == 'true'){
					alert('사용할 수 있는 아이디입니다')
					$("#userIdExist").val('true')
				} else {
					alert('사용할 수 없는 아이디 입니다')
					$("#userIdExist").val('false')
				}
			}
		})
	}
	  
	function checkNicknameExist(){
		
		var nickname = $("#nickname").val()
		
		if(nickname.length == 0){
			alert('닉네임을 입력해주세요')
			return
		}
		
		$.ajax({
			url : '${root}user/checkNicknameExist/' + nickname,
			type : 'get',
			dataType : 'text',
			success : function(result){
				if(result.trim() == 'true'){
					alert('사용할 수 있는 닉네임입니다')
					$("#nicknameExist").val('true')
				} else {
					alert('사용할 수 없는 닉네임 입니다')
					$("#nicknameExist").val('false')
				}
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


      <div id="templatemo_main">
        <div class="card align-middle">
          <div class="card-title-signup">
            <br><br>
            <h2 class="card-title-signup text-center">Sign up page</h2>
          </div>
          <div class="card-body">
            <form:form class="form-signin text-center" action="${root }user/signup_proc" method="post" modelAttribute="signupUserBean">
              <form:hidden path="userIdExist"/>
              <form:hidden path="nicknameExist"/>
              
              <h5 class="form-signin-heading">Input your id and password.</h5><br>
              
              <form:label path="userid" class="sr-only"></form:label>
              <form:input path="userid" class="form-control with-check" placeholder="Your ID" />
              <button type="button" id="btn-chk" class="btn btn-lg btn-primary btn-block" onclick="checkUserIdExist()">Check</button><br>
              <form:errors path="userid" style='color:red'/><br>
              
              <form:label path="userpw" class="sr-only"></form:label>
              <form:password path="userpw" class="form-control" placeholder="Password" /><br>
              <form:errors path="userpw" style='color:red'/><br>
              
              <form:label path="userpw2" class="sr-only"></form:label>
              <form:password path="userpw2" class="form-control" placeholder="Password Check" /><br>
              <form:errors path="userpw2" style='color:red'/><br>
              
              <form:label path="nickname" class="sr-only"></form:label>
              <form:input path="nickname" class="form-control with-check" placeholder="Nick Name" />
              <button type="button" id="btn-chk" class="btn btn-lg btn-primary btn-block" onclick="checkNicknameExist()">Check</button><br>
              <form:errors path="nickname" style='color:red'/><br>
              
              <form:label path="email" class="sr-only"></form:label>
              <form:input path="email" class="form-control" placeholder="Email" /><br>
              <form:errors path="email" style='color:red'/><br>
              
              <p>choose your birth</p>
              <form:input path='birthday' class="form-control" /><br>
              <form:errors path="birthday" style='color:red'/><br><br>
              <form:button id="btn-sign" class="btn btn-lg btn-primary btn-block" >Sign up</form:button><br><br><br>
            </form:form>

          </div>
        </div>

        <br><br><br>

      </div>


      <!-- footer.jsp 삽입 -->
      <c:import url="/WEB-INF/views/include/footer.jsp"/>

    </div> <!-- END of templatemo_wrapper -->
  </div> <!-- END of templatemo_body_wrapper -->
  <script src="${root }js/pikaday.js" type="text/javascript"></script>
  <script src="${root }js/pikaday-config.js" type="text/javascript"></script>
</body>

</html>