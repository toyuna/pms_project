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
<link rel='stylesheet' href="a03_mypage.css"/>
<style>
	td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
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

  <!-- 본문 -->
  <div id="page-content-wrapper">
 <div id="wrapper">
		<form id="frm01" method="post">
			<div id="content">
			<!--  아이디 -->
				<div>
					<h3>	<!-- h3태그를 모아서 한번에 스타일을 적용하기 위해 사용 -->
						<label for="id">아이디</label>
					</h3>
					<span class="box int_id">
						<input type="text" id="id" class="int" maxlength="20" name="id" value="${member.id}" >
						<!--  label태그에는 label태그를 클릭하면, 동일한 값을 가진 input태그에 자동으로 포커스가 되는 기능이 포함되어있다.
						 따라서 input태그의 id값과 label태그의 id값을 동일하게 설정함	-->								
						
					</span>
					<span class="error_next_box"></span><!--  아이디값을 잘못입력했을 때, 입력폼 아래에 에러메세지가 표시될 부분을 나타내기 위해 사용-->
				</div>
				
				<!-- 패스워드 -->
				<div>
					<h3 class="join_tilte">
						<label for="pswd1">비밀번호</label>
					</h3>
					<span class="box int_pass">
						<input type="text" id="pswd1" class="int" onchange="check_pw()" maxlength="20" name="pass" value="${member.pass }">
						<span id="alertTxt">사용불가</span>
					</span>
					<span class="error_next_box"></span>
				</div>
				<!-- 패스워드 확인 -->
				<div>
					<h3 class="join_title">
						<label for="pswd2">비밀번호 재확인</label>
					</h3>
					<span class="box int_pass_check">
						<input type="text" id="pswd2" class="int" onchange="check_pw()" maxlength="20" >
					</span>	
					<span class="error_next_box" id="check"></span>
				</div>
				<!-- Name -->
				<div>
					<h3 class="join_tilte">
						<label for="name">이름</label>
					</h3>
					<span class="box int_name">
						<input type="text" id="name" class="int" maxlength="20" name="user_name" value="${member.user_name}">
					</span>
					<span class="error_next_box"></span>
				</div>

				<!-- Email -->
				<div>
					<h3 class="join_title">
						<label for="email">이메일
						</label>
					</h3>
					<span class="box int_email">
							<input type="text" id="email" class="int" maxlength="100" name="email" value="${member.email}">
					</span>	
					<span class="error_next_box">이메일주소를 다시 확인해주세요.</span>
				</div>
				
				<!-- mobile -->
				<div>
					<h3 class="join_title">					
						<label for="phoneNo">휴대전화</label>
					</h3>
					<span class="box int_mobile">
						<input type="tel" id="mobile" class="int" maxlength="16" name="ph_num" value="${member.ph_num}">
					</span>
					<span class="error_next_box"></span>
				
				<!-- join btn -->
				<div class="btn_area">
					<button type="button" id="btnJoin">
						<span>수정</span>
					</button>
				</div>
			</div>
		</div>
		</form>
	</div>
	<form class="user">
		
    </form>
  </div>
  <!-- /본문 -->
</div>
</body>
</html>