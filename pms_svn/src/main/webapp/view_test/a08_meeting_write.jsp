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
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<link rel='stylesheet' href="a02_header.css"/>
<style>
   td{text-align:center;}
	.input-group-prepend{width:20%;}
	.input-group-text{width:100%;font-weight:bolder;}
	
	.jumbotron{
		background:white;
	}

</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var msg = "${msg}";
		if(msg!=""){
			if(confirm(msg+"\n메인화면으로 이동할까요?")){
				location.href="${path}/board.do?method=list";
			}
		}
		
		<%-- 
		#goMain #regBtn .custom-file-input
		--%>
		$("#goMain").click(function(){
			location.href="${path}/board.do?method=list";
		});
		$("#regBtn").click(function(){
			// 등록 처리 유효성  check
			if(confirm("등록하시겠습니까?")){
				if($("[name=title]").val()==""){
					alert("제목은 필수항목입니다.")
					$("[name=title]").focus();
					return;
				}
				$("form").submit();
			}
		});
		$("form").on("change",".custom-file-input",function(){
			$(this).next(".custom-file-label").text($(this).val())
		});
		/*
		$(".custom-file-input").on("change",function(){
			$(this).next(".custom-file-label").text($(this).val());
		});
		*/
		$("#addFile").click(function(){
			console.log("추가");
			$("form").append($(".fileCls").eq(-1).clone());
		});
		
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
  
  <!--  본문  -->
	<div class="jumbotron text-center">
 		 <h2 data-toggle="modal" data-target="#exampleModalCenter">회의일지 등록</h2>
	</div>
  
	<div class="container">
		<form method="post" enctype="multipart/form-data" action="${path}/board.do?method=insert">
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">제 목</span>
		</div>
		<input name="title" class="form-control" value="${board.title}" placeholder="제목입력하세요" />			 
	</div>  
	<div class="input-group mb-3 fileCls">	
		<div class="input-group-prepend">
			<span class="input-group-text">작 성 자</span>
		</div>
		<input name="writer" class="form-control" value="${member.id}"
			placeholder="작성자입력하세요" readonly/> 
			<!-- 작성자는 session id으로만 등록/수정 불가 처리 -->	
		<div class="input-group-prepend">
			<span class="input-group-text">상위글번호</span>
		</div>
		<input name="refno" class="form-control" value="${board.refno}"/>	
	</div>		
	<div class="input-group mb-3 fileCls">
		<div class="input-group-prepend">
			<span class="input-group-text">내 용</span>
		</div>
		<textarea name="content" rows="10" 
			class="form-control" 
			placeholder="내용입력하세요" >${board.content}</textarea>		 
	</div> 
	<div class="input-group mb-3 fileCls">
		<div class="input-group-prepend">
			<span class="input-group-text"
				id="addFile"
			>첨부 파일(추가)</span>
		</div>
		<div class="custom-file">
			<input type="file" name="report" 
				class="custom-file-input" id="file01"/>
			<label class="custom-file-label" for="file01">
			파일을 선택하세요!</label>
		</div>		
	</div> 	 
 	</form>
 	<div style="text-align:right;">
		<input type="button" class="btn btn-info"
			value="등록" id="regBtn"/>
		<input type="button" class="btn btn-success"
			value="조회 화면으로" id="goMain"/>
	</div>	
</div>

</div>


</body>

</html>