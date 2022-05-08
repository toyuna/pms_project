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

<title>공지사항 상세</title>

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
		var sessId = "${member.name}"
		var msg = "${msg}";
		if(msg!=""){
			if(msg=="수정되었습니다"){
				if(confirm(msg+"\n조회화면이동하시겠습니까?")){
					location.href="${path}/meeting.do?method=list";
				}	
			}
			if(msg=="삭제되었습니다."){
			
				alert(msg+"\n조회화면으로 이동")
				location.href="${path}/meeting.do?method=list";
			}
		}
		<%-- 
		
		--%>
		$("#goMain").click(function(){
			location.href="${path}/meeting.do?method=list";
		});
		// 삭제버튼 클릭시, session으로 수정권한 확인 해서(작성자와 동일)
		// 권한이 있는 경우에만 삭제 처리..
		$("#delBtn").click(function(){
			if(sessId!=$("[name=writer]").val()){
				alert("삭제는 작성자만 가능합니다.")
			}else{
				if(confirm("삭제하시겠습니까?")){
					location.href="${path}/meeting.do?method=del&meeting_list_num="+$("[name=meeting_list_num]").val();	
				}
			}
		});
		$("#uptBtn").click(function(){
			if(sessId!=$("[name=writer]").val()){
				alert("수정은 작성자만 가능합니다!");
			}else{
				if(confirm("수정하시겠습니까?")){
					$("form").attr("action","${path}/meeting.do?method=upt");
					$("form").submit();
				}
			}
		});
		$("#reBtn").click(function(){
			if(confirm("답글을 작성하시겠습니까?")){
				// 등록 form에 기본적인 답글 형식을 만들어서 요청값으로 전송하여,
				// 등록 form에서 추가 데이터를 입력하여 처리하게 한다.
				$("[name=meeting_refno]").val($("[name=meeting_list_num]").val());
				$("[name=meeting_title]").val("RE:"+$("[name=meeting_title]").val());
				$("[name=meeting_content]").val("\n\n\n\n\n\n\======이전글======\n"+$("[name=meeting_content]").val());
				$("form").attr("action","${path}/meeting.do?method=insertFrm");
				$("form").submit();
			}
		});
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
	function downFile(fname){
		if(confirm("다운로드할 파일:"+fname)){
			location.href="${path}/download.do?fname="+fname;
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
                        <h1 class="h3 mb-0 text-gray-800">회의일지 상세</h1>
                    </div>

            <!-- Content Row -->

<div class="container">
	<form method="post" enctype="multipart/form-data"
		action="${path}/meeting.do?method=upt">
		
	<div class="input-group mb-3 fileCls">	
		<div class="input-group-prepend">
			<span class="input-group-text">프로젝트명</span>
		</div>
			<input name="project_name" class="form-control" value="${meeting.project_name}"
					placeholder="" readonly /> 
		<div class="input-group-prepend">
			<span class="input-group-text">부서명</span>
		</div>
			<input name="dname" class="form-control" value="${meeting.dname}" readonly/>	
	</div>											
	<div class="input-group mb-3 fileCls">	
			<div class="input-group-prepend">
				<span class="input-group-text">작 성 자</span>
			</div>
			<input name="writer" class="form-control" 
				placeholder="작성자입력하세요"   value="${meeting.writer}" readonly/>
			<!-- 작성자는 입력해서 변경불가능 처리 -->	
			<div class="input-group-prepend">
				<span class="input-group-text">조회수</span>
			</div>
			<input name="readcnt" class="form-control" value="${meeting.readcnt}" readonly/>	
	</div>			
	<div class="input-group mb-3 fileCls">	
		<div class="input-group-prepend">
			<span class="input-group-text">글번호</span>
		</div>
		<input name="meeting_list_num" class="form-control" value="${meeting.meeting_list_num}" readonly/>	
		<div class="input-group-prepend">
			<span class="input-group-text">상위글번호</span>
		</div>
		<input name="meeting_refno" class="form-control" value="${meeting.meeting_refno}" readonly/>	
	</div>			
		
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">제 목</span>
		</div>
		<input name="meeting_title" class="form-control" value="${meeting.meeting_title}" />			 
	</div>  
	
	<div class="input-group mb-3 fileCls">	
		<div class="input-group-prepend">
			<span class="input-group-text">등 록 일</span>
		</div>
		
		<input class="form-control" 
			placeholder="작성자입력하세요"  readonly
			value='<fmt:formatDate type="both" value="${meeting.meeting_reg}"  />'/>	
		<div class="input-group-prepend">
			<span class="input-group-text">수 정일</span>
		</div>
		<input  class="form-control" readonly
			value='<fmt:formatDate type="both" value="${meeting.meeting_upt}" />'/>	
	</div>			
	<div class="input-group mb-3 fileCls">
		<div class="input-group-prepend">
			<span class="input-group-text">내 용</span>
		</div>
		<textarea name="meeting_content" rows="10" 
			class="form-control" 
			placeholder="내용입력하세요" >${meeting.meeting_content}</textarea>		 
	</div> 
	<c:forEach var="fname" items="${meeting.fnames}">
	<div class="input-group mb-3 fileCls">
		<div class="input-group-prepend">
			<span class="input-group-text" 
				onclick="downFile('${fname}')">첨부 파일(다운로드)</span>
		</div>
		<div class="custom-file">
			<input type="file" name="report" 
				class="custom-file-input" id="file01"/>
			<label class="custom-file-label" for="file01">${fname}</label>
		</div>		
	</div> 	 
	</c:forEach>
 	</form>
 	<div style="text-align:right;">
 		<input type="button" class="btn btn-primary"
			value="답글" id="reBtn"/>	
		<input type="button" class="btn btn-warning"
			value="수정" id="uptBtn"/>
		<input type="button" class="btn btn-danger"
			value="삭제" id="delBtn"/>			
		<input type="button" class="btn btn-success"
			value="조회 화면으로" id="goMain"/>
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
    <style type="text/css">
	.input-group-text{width:100%;background-color:dark;color:black;font-weight:bolder;}
	.input-group-prepend{width:20%;}
	td{text-align:center;}
	</style>

</body>
</html>