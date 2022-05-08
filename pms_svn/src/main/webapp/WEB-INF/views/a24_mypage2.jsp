<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>MyPage</title>

<!-- Custom fonts for this template-->
<link href="${path}/pms_test/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${path}/pms_test/css/sb-admin-2.min.css" rel="stylesheet">

<!-- 
	<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
	<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
	<script src="${path}/a00_com/jquery.min.js"></script>
	<script src="${path}/a00_com/popper.min.js"></script>
	<script src="${path}/a00_com/bootstrap.min.js"></script>
	<script src="${path}/a00_com/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
 -->



</head>
<!-- Bootstrap core JavaScript-->
<script src="${path}/pms_test/vendor/jquery/jquery.min.js"></script>
<script
	src="${path}/pms_test/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${path}/pms_test/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${path}/pms_test/js/sb-admin-2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var proc = "${proc}";
		if (proc != "") {
			alert(proc);
			location.href = "${path}/mypage.do";
		}
		$(".uptBtn").click(function() {
			if (confirm("수정하시겠습니까?")) {
				$("#mypage_frm").attr("action", "${path}/uptMypage.do");
				$("#mypage_frm").submit();
			}
		});

		var msg = "${msg}";
		if (msg != "") {
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
<%--
	function downFun(fname){
		if(confirm(fname+"을 다운하시겠습니까?")){
			location.href="${path}/download.do?fname="+fname;
		}
	}	
	--%>
	// 이미지 업로드
	/*  $('#frm01').on('change', function() {
	  ext = $(this).val().split('.').pop().toLowerCase(); //확장자
	  //배열에 추출한 확장자가 존재하는지 체크
	  if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
	      resetFormElement($(this)); //폼 초기화
	      alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
	  } else {
	      file = $('#frm01').prop("files")[0];
	      blobURL = window.URL.createObjectURL(file);
	      $('#image_preview img').attr('src', blobURL);
	      $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
	      $(this).slideUp(); //파일 양식 감춤
	  }
	  });*/
</script>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="${path}/main.do">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-solid fa-database"></i>
				</div>
				<div class="sidebar-brand-text mx-3">"YY PMS"</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="${path}/main.do"> <i class="fas fa-fw  fa-users"></i> <span>${member.dname}</span></a>
				<a class="nav-link" href="${path}/mypage.do"> <i
					class="fas fa-fw  fa-user"></i> <span>${member.name}</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">MEMBER</div>


			<!-- 대시보드 -->
			<li class="nav-item"><a class="nav-link" href="${path}/main.do">
					<i class="fas fa-fw fa-clipboard-check"></i> <span>Dashboard</span>
			</a></li>

			<!-- 업무보기 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-list"></i> <span>My job</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">View</h6>
						<a class="collapse-item" href="${path}/myjob.do?method=list">업무보기</a> 
						<a class="collapse-item" href="${path}/project.do?method=list">Project</a>
						<a class="collapse-item" href="${path}/gantt.do">Gantt Chart</a>
						<a class="collapse-item" href="${path}/calendar.do">Calendar</a>
					</div>
				</div></li>



			<!-- 커뮤니케이션 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-comment"></i> <span>Communicate</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">View</h6>
						<a class="collapse-item" href="${path}/notice.do?method=list">Notice</a>
						<a class="collapse-item" href="${path}/chatting.do">Chatting</a>
					</div>
				</div></li>

			<!-- 문서탭 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-file"></i> <span>Documents</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">View</h6>
						<a class="collapse-item" href="${path}/meeting.do?method=list">Meeting</a>
						<a class="collapse-item" href="${path}/working.do?method=list">Work</a>
						<a class="collapse-item" href="${path}/output.do?method=list">Outputs</a>
					</div>
				</div></li>

			<!-- 내정보 -->
			<li class="nav-item"><a class="nav-link"
				href="${path}/mypage.do"> <i class="fas fa-fw fa-list"></i> <span>My
						Info</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">ADMIN</div>


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
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800"></h1>
					</div>


					<!-- Content -->
					<form id="mypage_frm" class="form"
											enctype="multipart/form-data" method="post"
											action="${path}/uptMypage.do">					
					<div class="container-xl px-4 mt-4">


						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-xl-4">
								<div class="card mb-4 mb-xl-0">
									<div class="card-header">Profile Picture</div>
									<div class="card-body text-center">

											<div id="image_container"></div>

											<img id="img01" class="img-account-profile rounded-circle mb-2"
												src="${path}/a01_img/${member.photo}" width="180px"
												height="180px"> 
												<hr>
												<label for="img">사진변경</label> 
												<input
												id="img" type="file" style="display: none;" name="report" 
												onchange="setThumbnail(event);"

												/>
											<hr>
											<button class="btn btn-primary uptBtn" type="button">Upload
												new image</button>
											<script>
											function setThumbnail(event) { 
												console.log("## 이미지 변경 ##");
												console.log(event.target.files);
												for (var image of event.target.files) { 
													var reader = new FileReader(); 
													reader.onload = function(event) {
														var img = document.querySelector("#img01");
														img.setAttribute("src", event.target.result); 
													};
													console.log(image); 
													reader.readAsDataURL(image); 
												}
											}
											</script>
										
									</div>
								</div>
							</div>

							<div class="col-xl-8">
								<div class="card mb-4">
									<div class="card-header">Account Details</div>

									<div class="card-body">

											<!-- 고유번호 -->
											<div class="form-group">
												<input type="hidden" name="mem_num"
													value="${member.mem_num}">
											</div>

											<!-- 아이디 -->
											<div class="form-group">
												<input type="text" class="form-control form-control-user"
													id="exampleInputId" placeholder="Id" name="id"
													value="${member.id}">
											</div>

											<!-- 패스워드  -->

											<div class="form-group">
												<input type="text" class="form-control form-control-user"
													id="exampleInputPassword" placeholder="Password"
													name="pass" value="${member.pass}">
											</div>

											<!-- 이름 -->
											<div class="form-group">
												<input type="text" class="form-control form-control-user"
													id="exampleInputName" placeholder="Name" name="name"
													value="${member.name}">
											</div>

											<!-- 이메일 -->
											<div class="form-group">
												<input type="email" class="form-control form-control-user"
													id="exampleInputEmail" placeholder="Email Address"
													name="email" value="${member.email}">
											</div>

											<!-- 핸드폰번호 -->
											<div class="form-group">
												<input type="text" class="form-control form-control-user"
													id="exampleInputPhone" placeholder="Phone number"
													name="phone" value="${member.phone}">
											</div>

											<!-- 수정버튼 -->
											<button type="button"
												class="btn btn-primary btn-user btn-block uptBtn" >
												Change details</button>


									</div>
								</div>
							</div>
						</div>
					</div>
					</form>
					
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
				<span>Copyright &copy; Author KIM YUNA and Author HEO
					YOONSEOK</span>
			</div>
		</div>
	</footer>
	<!-- End of Footer -->

	</div>
	<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
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