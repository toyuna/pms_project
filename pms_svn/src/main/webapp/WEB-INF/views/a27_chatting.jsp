<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Chatting</title>

<!-- Custom fonts for this template-->
<link href="${path}/pms_test/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${path}/pms_test/css/sb-admin-2.min.css" rel="stylesheet">

<!-- -->
	<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
	<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
	<script src="${path}/a00_com/jquery.min.js"></script>
	<script src="${path}/a00_com/popper.min.js"></script>
	<script src="${path}/a00_com/bootstrap.min.js"></script>
	<script src="${path}/a00_com/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
 
 <style type="text/css">

	.input-group-text{width:100%;font-weight:bolder;}
	.input-group-prepend{width:20%;}
	#chatArea{
		width:80%;height:400px;overflow-y:auto;text-align:left;
		border:1px solid green;
	}

 </style>


</head>
<!-- Bootstrap core JavaScript-->
<script src="${path}/pms_test/vendor/jquery/jquery.min.js"></script>
<script src="${path}/pms_test/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${path}/pms_test/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${path}/pms_test/js/sb-admin-2.min.js"></script>
<script type="text/javascript">
	var wsocket;
	$(document).ready(function(){
		// 1. 웹 소켓 클라이언트를 통해 웹 서버 연결하기.
		
		$("#enterBtn").click(function(){
			conn();
		});
		$("#id").keyup(function(){
			if(event.keyCode==13){
				conn();
			}
		})
		$("#msg").keyup(function(){
			if(event.keyCode==13) sendMsg();
		});
		$("#sendBtn").click(function(){
			sendMsg();
		});
		// 접속 종료를 처리했을 시
		$("#exitBtn").click(function(){
			wsocket.send("msg:"+$("#id").val()+"님이 나가셨습니다.");
			wsocket.close();
		});
		// 메시지는 보내는 기능 메서드
		function sendMsg(){
			var id = $("#id").val();
			var msg = $("#msg").val();
			// message를 보내는 처리..서버의 handler의  handleTextMessage()와 연동
			wsocket.send("msg:"+id+":"+msg);
			$("#msg").val(""); $("#msg").focus();
		}
		var sessAuth="${member.auth}";
		$("#memBtn").click(function(){
			console.log(sessAuth);
			if(sessAuth!="PM"){
				alert("관리자만 접근 할 수 있습니다.")
			}else{
				location.href="${path}/memberList.do";	
			}
		});
		$("#mailBtn").click(function(){
			console.log(sessAuth);
			if(sessAuth!="PM"){
				alert("관리자만 접근 할 수 있습니다.")
			}else{
				location.href="${path}/mailFrm.do";	
			}
		});
		<%-- 
		
		--%>	
	});
	function conn(){
		//  원격 접속시에는 고정 ip 할당 받아서 처리..
		// wsocket = new WebSocket("ws:/106.10.23.227:7080/${path}/chat-ws.do");
		// local에서 다른 브라우저로 실행시 처리할 내용..
		wsocket = new WebSocket("ws:/49.238.170.24:5080/${path}/chat-ws.do");
		// handler :afterConnectionEstablished(WebSocketSession session)와 연결
		wsocket.onopen=function(evt){ 
			console.log(evt);
			wsocket.send("msg:"+$("#id").val()+":연결 접속했습니다!");
		}
		// handler의  handleTextMessage()
		// 연결되어 있으면 메시지를 push형식으로 서버에서 받을 수 있다.
		// ex) wsocket.send("msg:"+$("#id").val()+":연결 접속했습니다!");
		// push 방식으로 서버에서 전달되어 온 데이터를 받게 처리..
		wsocket.onmessage=function(evt){
			// 받은 데이터
			var msg = evt.data;
			// msg 내용 삭제 후, 처리
			if(msg.substring(0,4)=="msg:"){
				// 메시지 내용만 전달
				// 메시지 내용 scrolling 처리..
				var revMsg = msg.substring(4)
				$("#chatMessageArea").append(revMsg+"<br>");
				// 1. 전체 chatMessageArea의 입력된 최대 높이 구하기..
				var mx = parseInt($("#chatMessageArea").height())
				// 2. 포함하고 있는 div의 scrollTop을 통해 최하단의 내용으로 scrolling 하기..
				//    chatArea
				$("#chatArea").scrollTop(mx);
			}
		}
		// handler의 afterConnectionClose와 연동
		wsocket.onclose=function(){

			alert($("#id").val()+'접속 종료합니다.')
			$("#chatMessageArea").text("");
			$("#id").val("");
			$("#id").focus();
		}
		
	}
	
	
	
</script>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${path}/main.do">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-solid fa-database"></i>
                </div> 
                <div class="sidebar-brand-text mx-3">"YY PMS"</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="${path}/main.do">
                    <i class="fas fa-fw  fa-users"></i>
                    <span>${member.dname}</span></a>
                <a class="nav-link" href="${path}/mypage.do">
                    <i class="fas fa-fw  fa-user"></i>
                    <span>${member.name}</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                MEMBER
            </div>

				
			<!-- 대시보드 -->
			<li class="nav-item">
                <a class="nav-link" href="${path}/main.do">
                    <i class="fas fa-fw fa-clipboard-check"></i>
                    <span>Dashboard</span></a>
            </li>	
			
			<!-- 업무보기 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-list"></i>
                    <span>My job</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">View</h6>
                        <a class="collapse-item" href="${path}/myjob.do?method=list">업무보기</a>
                        <a class="collapse-item" href="${path}/project.do?method=list">Project</a>
                        <a class="collapse-item" href="${path}/gantt.do">Gantt Chart</a>
                        <a class="collapse-item" href="${path}/calendar.do">Calendar</a>
                    </div>
                </div>
            </li>
				
			
	
			<!-- 커뮤니케이션 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-comment"></i>
                    <span>Communicate</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">View</h6>
                        <a class="collapse-item" href="${path}/notice.do?method=list">Notice</a>
                        <a class="collapse-item" href="${path}/chatting.do">Chatting</a>
                    </div>
                </div>
            </li>
            
            <!-- 문서탭 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-file"></i>
                    <span>Documents</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">View</h6>
                        <a class="collapse-item" href="${path}/meeting.do?method=list">Meeting</a>
                        <a class="collapse-item" href="${path}/working.do?method=list">Work</a>
                        <a class="collapse-item" href="${path}/output.do?method=list">Outputs</a>
                    </div>
                </div>
            </li>

			<!-- 내정보 -->
			<li class="nav-item">
                <a class="nav-link" href="${path}/mypage.do">
                    <i class="fas fa-fw fa-list"></i>
                    <span>My Info</span></a>
            </li>           

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                ADMIN
            </div>


            <!-- 회원관리 -->
            <li class="nav-item">
            	<div id="memBtn">
                <a class="nav-link">
                    <i class="fas fa-fw fa-list"></i>
                    <span>MemberList</span></a>
                </div>
            </li>
        
        	<!-- 메일발송 -->
			 <li class="nav-item">
			 	<div id="mailBtn">
                <a class="nav-link">
                    <i class="fas fa-fw fa-list"></i>
                    <span>Mail</span></a>
                </div>
             </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

           
			
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    

                    <!-- Topbar Search -->
                    

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                       

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"> ${member.name} 님</span>
                                <img class="img-profile rounded-circle"
                                    src="${path}/a01_img/${member.photo}">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="${path}/mypage.do">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="${path}/loginFrm.do" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
   <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">채팅방</h1>
                    </div>


        <!-- Content -->
       <div class="container-xl px-4 mt-4">

<div class="container">
	<div class="input-group mb-2">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">아이디</span>
		</div>
		<input id="id" class="form-control" value="${member.name}" readonly/>
		<input type="button" class="btn btn-primary" value="채팅입장" id="enterBtn"/>	
		<input type="button" class="btn btn-success" value="나가기" id="exitBtn"/>	
	</div>	 
	<div class="input-group mb-2">	
		<div class="input-group-prepend ">
			<span class="input-group-text justify-content-center">내 용</span>
		</div>
		<div id="chatArea" class="input-group-append">
			<div id="chatMessageArea"></div>
		</div>
	</div>
	<div class="input-group mb-2">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">메시지</span>
		</div>
		<input id="msg" class="form-control" placeholder="보낼 메시지 입력하세요" />
		<input type="button" class="btn btn-primary" value="전송" id="sendBtn"/>		
	</div>
	
</div>
 
      </div>
   </div>

 </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Author KIM YUNA and Author HEO YOONSEOK</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">정말 로그아웃 하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="${path}/loginFrm.do">Logout</a>
                </div>
            </div>
        </div>
    </div>




</body>
</html>