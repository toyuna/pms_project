<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<link rel='stylesheet' href="a20_memList.css"/>
<link rel='stylesheet' href="a02_header.css"/>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
</script>
</head>

<body>
	
<div id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="#">개발부</a>
        <a href="#">김유나</a>
        <a href="#">내업무보기</a>
      </li>
      <li><a href="#">프로젝트보기</a></li>
      <li><a href="#">회의일지</a></li>
      <li><a href="#">업무일지</a></li>
      <li><a href="#">산출물관리</a></li>
      <li><a href="#">예산관리</a></li>
      <li><a href="#">일정관리</a></li>
      <li><a href="#">커뮤니케이션</a></li>
      <li><a href="#">간트차트</a></li>
    </ul>
  </div>
  <!-- /사이드바 -->
  
<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
    	<div class="container">
			<form method="post">
				<!-- 정보들 보여주는 곳 (수정도 가능) -->
				<!--  1열  -->
				<div class="input-group mb-3">	
					<div class="input-group-prepend ">
						<span class="input-group-text">아이디</span>
					</div>
					<input name="id" class="form-control" value="${member.id}" />	
					
					<div class="input-group-prepend">
						<span class="input-group-text">패스워드</span>
					</div>
					<input name="pass" class="form-control" value="${member.pass}" />	
				</div>	
				
				<!-- 2열 -->
				<div class="input-group mb-3">	
					<div class="input-group-prepend ">
						<span class="input-group-text ">이름</span>
					</div>
					<input name="name" class="form-control" value="${member.name}" />	
					
					<div class="input-group-prepend">
						<span class="input-group-text">부서명</span>
					</div>
					<input name="dname" class="form-control" value="${member.dname}" />	
				</div>
				
				<!-- 3열 -->
				<div class="input-group mb-3">	
					<div class="input-group-prepend ">
						<span class="input-group-text ">이메일</span>
					</div>
					<input name="email" class="form-control" value="${member.email}" />	
					
					<div class="input-group-prepend">
						<span class="input-group-text">휴대폰번호</span>
					</div>
					<input name="phone" class="form-control" value="${member.phone}" />	
				</div>
				
				<!-- 4열 -->
				<div class="input-group mb-3">	
					<div class="input-group-prepend ">
						<span class="input-group-text ">권한</span>
					</div>
					<select name="auth" class="form-control" id="auth" name="auth">
							<option value="${member.auth}"></option>
							<option>PM</option>
							<option>팀원</option>
					</select>
				</div>
				
				<!-- 하단에 수정 삭제 되돌아가기 버튼 -->
				<div style="text-align:right;">
					<input type="button" class="btn btn-info" value="수정" id="uptBtn"/>
					<input type="button" class="btn btn-danger" value="삭제" id="delBtn"/>
					<input type="button" class="btn btn-success" value="조회리스트" id="mainBtn"/>
			</div>	
			</form>	
		</div>
    </main>
 
</div>


</body>
<style>
td{
text-align:center;
}
</style>
</html>