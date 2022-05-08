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
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>간트차트 페이지</title>

<!-- Gantt -->
<script src="${path}/gantt/codebase/dhtmlxgantt.js?v=7.1.9"></script>
<link rel="stylesheet" href="${path}/gantt/codebase/dhtmlxgantt.css?v=7.1.9">


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
 
 


</head>

<script type="text/javascript">
	$(document).ready(function(){
		var msg = "${msg}";
		if(msg!=""){
			alert(msg);
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
		
		
	});
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
                        <a class="collapse-item" href="${path}/myjobList.do">업무보기</a>
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
                <a class="nav-link" href="${path}/memberList.do">
                    <i class="fas fa-fw fa-list"></i>
                    <span>MemberList</span></a>
            </li>
            <!-- 메일발송 -->
			 <li class="nav-item">
                <a class="nav-link" href="${path}/mailFrm.do">
                    <i class="fas fa-fw fa-list"></i>
                    <span>Mail</span></a>
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
                <div class="container-fluid" style='height:100%;'>

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Gantt Chart</h1>
                        
                        <select name="project_num">
                        	<c:forEach var="project2" items="${projectList2}">
                        		<option value="${project2.project_list_num}">${project2.project_title}</option>
                        	</c:forEach>
                        </select>
                        <script type="text/javascript">
                        	$("[name=project_num]").val("${(empty param.project_num)?1:param.project_num}")
                        	$("[name=project_num]").change(function(){
                        		location.href="${path}/gantt.do?project_num="+$(this).val();
                        	});
                        </script>
                    </div>

                    <!-- Content Row -->

                    <div class="row">

                        
                                <!-- Card Body -->
                                
                                    <div class="chart-area">
                                        <div id="gantt_here" style='height:100%;'>
                                        	
                                        </div>
                                    </div>
                                
                                    <script>
                                    gantt.init("gantt_here");
                            		
                            		<%--gantt.config.resource_property = "user_id";--%>
									var project_num = $("[name=project_num]").val();
									

                            		$.ajax({
                            			type:"post",
                            			data:"project_num="+project_num,
                            			url:"${path}/ganttList.do",
                            			async : false,
                            			dataType:"json",
                            			success:function(data){
                            				console.log("리스트 출력");
                            				console.log(data.ganttList)
                            				
                            				gantttasks = data.ganttList;
                            				gantt.parse(gantttasks);
                            			
                            			}
                            		});
								
                       		

                            		                           		
                            		gantt.attachEvent("onAfterTaskAdd", function(id,item){
                            		    //any custom logic here
                            			console.log("#일정등록 후#");
                            			console.log(id);
                            			console.log(item);
                            			var gantt = {};
                            			gantt.project_num=project_num;
                            			gantt.id = id;
                            			//gantt.start_date = item.start_date;
                            			//console.log(typeof(item.start_date))
                            			var d = item.start_date;
                            			//d.getFullYear();
                            			//d.getMonth();
                            			//d.getDate();
                            			
                            			console.log(item.start_date.toLocaleDateString())
                            			console.log(d.getDate()+"-"+d.getMonth()+"-"+d.getFullYear())
                            			gantt.start_date = d.getDate()+"-"+(d.getMonth()+1)+"-"+d.getFullYear();
                            			gantt.duration = item.duration;
                            			gantt.text=item.text;
                            			gantt.progress=item.progress;
                            			gantt.sortorder=0;	
                            			gantt.parent=item.parent;
                            			gantt.open=true;
                            			console.log("#등록할데이터#");
                            			console.log(gantt)
                            			
                                		$.ajax({
                                			type:"post",
                                			data:gantt,
                                			url:"${path}/insertGantt.do",
                                			async : false,
                                			dataType:"json",
                                			success:function(data){
                                				console.log("등록 처리 후..");
                                				alert(data.msg);
                                				
                                				//gantttasks = data.ganttList;
                                				//gantt.parse(gantttasks);
         
                                				
                                			}
                                		});
                            			
                            		});
                            		gantt.attachEvent("onAfterTaskUpdate", function(id,item){
                            		    //any custom logic here
                            			console.log("#일정수정 후#");
                            			console.log(id);
                            			console.log(item);
                            			
                            			var gantt = {};
                            			gantt.project_num=project_num;
                            			gantt.id = id;
                            			//gantt.start_date = item.start_date;
                            			//console.log(typeof(item.start_date))
                            			var d = item.start_date;
                            			//d.getFullYear();
                            			//d.getMonth();
                            			//d.getDate();
                            			
                            			console.log(item.start_date.toLocaleString())
                            			console.log(d.getDate()+"-"+d.getMonth()+"-"+d.getFullYear())
                            			gantt.start_date = d.getDate()+"-"+(d.getMonth()-1)+"-"+d.getFullYear();
                            			gantt.duration = item.duration;
                            			gantt.text=item.text;
                            			gantt.progress=item.progress;
                            			gantt.sortorder=0;
                            			gantt.parent=item.parent;
                            			gantt.open=true;
                            			console.log("#등록할데이터#");
                            			console.log(gantt)
                            			
                                		$.ajax({
                                			type:"post",
                                			data:gantt,
                                			url:"${path}/updateGantt.do",
                                			async : false,
                                			dataType:"json",
                                			success:function(data){
                                				console.log("수정 처리 후..");
                                				alert(data.msg);
                                				
                                				//gantttasks = data.ganttList;
                                				//gantt.parse(gantttasks);
         
                                				
                                			}
                                		});                            			
                            		});    
                            		gantt.attachEvent("onAfterTaskDelete", function(id,item){
                            		    //any custom logic here
                            			console.log("#일정삭제 후#");
                            			console.log(id);
                            			console.log(item);
                            			
                            			var gantt = {};
                            			gantt.project_num=project_num;
                            			gantt.id = id;
                            			
                                		$.ajax({
                                			type:"post",
                                			data:gantt,
                                			url:"${path}/deleteGantt.do",
                                			async : false,
                                			dataType:"json",
                                			success:function(data){
                                				console.log("삭제 처리 후..");
                                				alert(data.msg);
                                				
                                				//gantttasks = data.ganttList;
                                				//gantt.parse(gantttasks);
         
                                				
                                			}
                                		});                              			
                            		});
                            		gantt.attachEvent("onAfterLinkAdd", function(id,item){
                            		    //any custom logic here
                              			console.log("#링크 등록#");
                            			console.log(id);
                            			
                            			var gantt = item;
                            			gantt.project_num=project_num;
                            			console.log("#타입크기#");    
                            			console.log(gantt.type.length);    
                                		$.ajax({
                                			type:"post",
                                			data:gantt,
                                			url:"${path}/insertLink.do",
                                			async : false,
                                			dataType:"json",
                                			success:function(data){
                                				console.log("link 등록 후..");
                                				alert(data.msg);
                                			}
                                		});                                			
                            			
                            		});
                            		gantt.attachEvent("onAfterLinkUpdate", function(id,item){
                            		    //any custom logic here
                              			console.log("#링크 수정#");
                            			console.log(id);
                            			console.log(item);     
                            			var gantt = item;
                            			gantt.project_num=project_num;
                            			
                                		$.ajax({
                                			type:"post",
                                			data:gantt,
                                			url:"${path}/updateLink.do",
                                			async : false,
                                			dataType:"json",
                                			success:function(data){
                                				console.log("link 수정 후..");
                                				alert(data.msg);
                                			}
                                		});                             			
                            		});                           		
                            		gantt.attachEvent("onAfterLinkDelete", function(id,item){
                            		    //any custom logic here
                              			console.log("#링크 삭제#");
                            			console.log(id);
                            			console.log(item);       
                            			var gantt = item;
                            			gantt.project_num=project_num;
                            			
                                		$.ajax({
                                			type:"post",
                                			data:gantt,
                                			url:"${path}/deleteLink.do",
                                			async : false,
                                			dataType:"json",
                                			success:function(data){
                                				console.log("link 삭제 후..");
                                				alert(data.msg);
                                			}
                                		});                             			
                            		});										
									</script>
                                <!-- </div> -->
                     </div>
                        

                        
                    </div>

                    

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
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${path}/pms_test/vendor/jquery/jquery.min.js"></script>
    <script src="${path}/pms_test/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${path}/pms_test/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${path}/pms_test/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${path}/pms_test/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${path}/pms_test/js/demo/chart-area-demo.js"></script>
    <script src="${path}/pms_test/js/demo/chart-pie-demo.js"></script>
<style>
		html, body{
			padding:0;
			margin: 0;
		}
	</style>
</body>
</html>