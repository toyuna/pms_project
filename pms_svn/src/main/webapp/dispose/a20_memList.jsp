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
<meta charset="UTF-8">ktj 
<title>Insert title here</title>

<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<link rel="stylesheet" type="text/css" href="${path}/view_test/a20_memList.css">
<link rel="stylesheet" type="text/css" href="${path}/view_test/a02_header.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
		var proc = "${proc}";
		if(proc!=""){rldi
			alert(proc);
			location.href="${path}/memberList.do"
		}
		
		$("#regBtn").click(function(){
			if(confirm("등록하시겠습니까?")){
				$("#frm02").submit(); 
			}
		});
		
		
	});
	
	<%-- 회원 상세 정보로 이동! --%>
	function goDetail(mem_num){
		location.href="${path}/memdetail.do?mem_num="+mem_num;
	}
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

<!-- 회원 리스트 및 검색란 -->
<main class="col-10 py-md-3 pl-md-5 bd-content" role="main">
	<div class="container">
		<!-- 검색란 -->
		<form id="frm01" class="form-inline"  method="post">
		  	<nav class="navbar navbar-expand-sm navbar-dark">
			    <input class="form-control mr-sm-2" placeholder="이름" name="name" value="${member.name}"/>
			    <button class="btn btn-secondary" type="submit">검색</button>
			    <button data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-light" type="button" >등록</button>
		 	</nav>
		</form>
	
		<!-- 회원 리스트 -->
    	<table class="table table-hover table-striped">
	   	<col width="10%">
	   	<col width="10%">
	   	<col width="10%">
	   	<col width="10%">
	   	<col width="10%">
	   	<col width="10%">
	   	<col width="10%">
	   	<col width="10%">
	    <thead>
	      <tr class="table-hover text-center">
	        <th>고유번호</th>
	        <th>아이디</th>
	        <th>패스워드</th>
	        <th>이름</th>
	        <th>부서이름</th>
	        <th>이메일</th>
	        <th>핸드폰번호</th>
	        <th>권한</th>
	      </tr>
	    </thead>	
	    <tbody>
	    	<c:forEach var="member" items="${memberlist}">
		    	<tr ondblclick="goDetail(${member.mem_num})">
		    		<td>${member.mem_num}</td>
		    		<td>${member.id}</td>
		    		<td>${member.pass}</td>		    		
		    		<td>${member.name}</td>		    		
		    		<td>${member.dname}</td>		    		
		    		<td>${member.email}</td>		    		
		    		<td>${member.phone}</td>		    		
		    		<td>${member.auth}</td>		    		
		    	</tr>
	    	</c:forEach>
	      
	    </tbody>
	</table>	
	</div>
    </main>
 
</div>

<!-- 회원정보 입력 부분 dialog -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">사원정보등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form" action="${path}/insertMem.do"  method="post">
		<!-- 아이디, 비밀번호 -->
	     <div class="row">
	      	<div class="col">
	       		 <input type="text" class="form-control" placeholder="아이디 입력" name="id">
	      	</div>
	      	<div class="col">
	        	<input type="text" class="form-control" placeholder="비밀번호 입력" name="pass">
	      	</div>
	     </div>
	     
	     <!-- 이름, 부서명 -->
	     <div class="row">
	      	<div class="col">
	       		 <input type="text" class="form-control" placeholder="이름 입력" name="name">
	      	</div>
	      	<div class="col">
	        	<input type="text" class="form-control" placeholder="부서 입력" name="dname">
	      	</div>
	     </div>
	     
	     <!-- 이메일, 핸드폰번호 -->
	     <div class="row">
	      	<div class="col">
	       		 <input type="text" class="form-control" placeholder="이메일 입력" name="email">
	      	</div>
	      	<div class="col">
	        	<input type="text" class="form-control" placeholder="핸드폰번호 입력" name="phone">
	      	</div>
	     </div>
	     
	     <!-- 권한 -->
	     <div class="row">
	      	<div class="col">
	       		 <select name="auth" class="form-control" name="auth">
							<option>팀원</option>
							<option>PM</option>
				 </select>
	      	</div>
	     </div>
    	     	      
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" id="regBtn" class="btn btn-primary">등록</button>
      </div>
    </div>
  </div>
</div>

</body>
<style>
td{
text-align:center;
}
</style>
</html>