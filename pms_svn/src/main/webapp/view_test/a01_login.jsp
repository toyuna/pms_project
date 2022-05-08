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
<link rel='stylesheet' href="a01_login.css"/>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#loginBtn").hide();
		var loginMsg="${loginMsg}";
		if(loginMsg!=""){
			alert(loginMsg)
			if(loginMsg=="로그인 실패"){
				$("loginBtn").click();
			}
		}
		// login 후 session이 있을 때..
		var hasSession="${member.name}";
		
		
		
		$("#login").click(function(){ 
    		$("#login-form").submit();
    	});
	});
</script>
</head>

<body>



<div class="container">
    <div>
        <div class="panel panel-success">    
            <div class="panel-body">
                <form id="login-form" action="${path}/board.do?method=login" method="post">
                	<div class="col-md-6">
	    	            <div class="panel-title">로그인</div>
    	        	</div>
                    <div class="col-md-6">
                        <input type="text" class="form-control" name="id" placeholder="ID" autofocus>
                    </div>
                    <div class="col-md-6">
                        <input type="password" class="form-control" name="pass" placeholder="Password">
                    </div>
                    <div class="col-md-6">
                        <button type="submit" id="login" class="form-control btn btn-outline-primary">로그인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
<style>
   
</style>
</html>