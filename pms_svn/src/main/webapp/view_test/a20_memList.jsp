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
    	<table class="table table-hover table-striped">
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
	        <th>핸드폰번호</th>
	        <th>권한</th>
	      </tr>
	    </thead>	
	    <tbody>
	    
	    <tr>
	    	<td>1</td>
	    	<td>2</td>
	    	<td>3</td>
	    	<td>4</td>
	    	<td>5</td>
	    	<td>6</td>
	    	<td>7</td>
	    </tr>
	    <tr>
	    	<td>1</td>
	    	<td>2</td>
	    	<td>3</td>
	    	<td>4</td>
	    	<td>5</td>
	    	<td>6</td>
	    	<td>7</td>
	    </tr>
	     <!-- 
	    	<c:forEach var="emp" items="${emplist}">
		    	<tr ondblclick="goDetail(${emp.empno})">
		    		<td>${emp.empno}</td>
		    		<td>${emp.ename}</td>
		    		<td>${emp.job}</td>
		    		<td><fmt:formatNumber value="${emp.sal}"/></td>
		    		<td>${emp.deptno}</td>
		    	</tr>
	    	</c:forEach>
	      -->
	    </tbody>
	</table>
    </main>
 
</div>


</body>
<style>
td{
text-align:center;
}
</style>
</html>