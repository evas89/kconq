<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/"/>

<!-- header & menubar -->

<div id="templatemo_header">
    <div id="site_title">
        <h1><a href="${root }"></a></h1>
        <a href="${root }index"><p>Korean Contents Curation</p></a>
    </div>
    <div id="header_right">
        <c:choose>
			<c:when test="${loginUserBean.userLogin == true }">
	            <p class="member"><b>user : </b>${loginUserBean.getNickname() }</p>
				<a href="${root }user/logout">Log out</a> | <a href="${root }qna/qnaList">Q&A</a> | 
				<a href="${root }mylist/mylist">My list</a > : <span id="mylistCount">${loginUserBean.getCountMyList()}</span> items
	        </c:when>
			<c:otherwise>
				<p>
				<a href="${root }user/login">Log in</a> | <a href="${root }user/signup">Sign up</a> | 
				<a href="${root }qna/qnaList">Q&A</a></p>
			</c:otherwise>
		</c:choose>
    </div>
    <div class="cleaner"></div>
</div> <!-- END of templatemo_header -->

<div id="templatemo_menubar">
    <div id="top_nav" class="ddsmoothmenu">
        <ul>
            <li><a href="${root }index" class="">Home</a></li>
            <c:forEach var='obj' items='${topMenuList }'>
            	<li><a href="${root }contents/categoryList?catidx=${obj.catidx }">${obj.catname }</a></li>
            </c:forEach>
          </ul>
        <br style="clear: left" />
    </div> <!-- end of ddsmoothmenu -->
    <div id="templatemo_search">
		<form:form class="form-signin text-center"
			action="${root }search/resultProc" method="post"
			modelAttribute="searchBean">
			<form:input path="searchKeyword" onfocus="clearText(this)"
				onblur="clearText(this)" class="txt_field" type="text"/>
			<form:button id="searchbutton" class="sub_btn" />
		</form:form>
	</div>
</div> <!-- END of templatemo_menubar -->

<link rel="stylesheet" type="text/css" href="${root }css/scTop.css" />

<div id="scTop" style="cursor:pointer;" onclick="window.scrollTo(0,0);">
    <button class="btnTop">
        <img src="${root }images/top.png" alt="" style="width:30px; height:30px;">
    </button>
</div>

<script>
	let topNav = document.getElementById("top_nav");
	let aTag = topNav.getElementsByTagName('a');
	let i;
	for(i=0; i<7; i++){
		aTag[i].setAttribute('class', '');
	}
	switch(${selected}){
	case 0: aTag[0].setAttribute('class', 'selected'); break;
	case 10: aTag[1].setAttribute('class', 'selected'); break;
	case 20: aTag[2].setAttribute('class', 'selected'); break;
	case 30: aTag[3].setAttribute('class', 'selected'); break;
	case 40: aTag[4].setAttribute('class', 'selected'); break;
	case 50: aTag[5].setAttribute('class', 'selected'); break;
	case 60: aTag[6].setAttribute('class', 'selected'); break;
	default: break;
	}
</script>