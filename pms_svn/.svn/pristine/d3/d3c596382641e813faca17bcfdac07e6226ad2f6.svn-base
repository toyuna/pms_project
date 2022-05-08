<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- chart.js cdn -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<style>
	div{
		 width:500px;
		 height:500px;
		 float: left;
		 margin-right: 200px
	}
</style>

</head>
<body>

<div>
	<canvas id="pie-chart"></canvas>
</div>

<div>
	<canvas id="doughnut-chart"></canvas>
</div>


</body>

<script>
						
						$.ajax({
							type:"post",
							url:"${path}/projectName.do",
							dataType:"json",
							success:function(data){
								console.log("리스트 출력");
								console.log(data.projectName);
								
								pname = data.pname;
								
								console.log(pname);
								
								chart = new Chart(document.getElementById("pie-chart"), {
									 type: 'pie',
									 data: { pname
									    	
									 }
								}
							}
						});
						
						<%--
							  new Chart(document.getElementById("pie-chart"), {
								    type: 'pie',
								    data: {
								      labels: ["네트워크 통신 프로젝트", "웹페이지 개발 프로젝트", "신세계 INC 프로젝트"],
								      datasets: [{
								        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f"],
								        data: [5,12,2]
								      }]
								    }
								});
						</script>
						  
						  --%>
			
                   <%--
						<script>
                    	 new Chart(document.getElementById("doughnut-chart"), {
                    	    type: 'doughnut',
                    	    data: {
                    	      labels: ["개발1팀", "개발2팀", "개발3팀", "개발4팀", "개발5팀","PM"],
                    	      datasets: [
                    	        {
                    	          label: "인원",
                    	          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#cd513e","#b8b8b8"],
                    	          data: [3,2,4,2,5,2]
                    	        }
                    	      ]
                    	    }
                    	});
                     	</script>
                     	
                     	--%>
                     	
</html>