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

<title>캘린더</title>

<!-- Custom fonts for this template-->
<link href="${path}/pms_test/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${path}/pms_test/css/sb-admin-2.min.css" rel="stylesheet">

 
	<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
	<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">

<!--  FullCalendar css  -->
<link href='${path}/a00_com/lib/main.css' rel='stylesheet' />

<!--  FullCalendar js -->
<script src='${path}/a00_com/lib/main.js'></script>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: '2022-03-17',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
    	console.log("#일정등록시 속성 확인#")
    	console.log(arg)
    	$("#exampleModalLongTitle").text("일정등록");
    	$("#regBtn").show();
    	$("#uptBtn").hide();
    	$("#delBtn").hide();
    	$("#frm01")[0].reset(); // 상세데이터 확인 후, 다시 등록할 때, 초기화가 필요..
    	
    	
    	$("#modalBtn").click(); 
    	// 이벤트가 강제 수행하여 모달창이 로딩되도록 한다.

    	console.log("시작일:"+arg.start.toLocaleString())
    	console.log("마지막일:"+arg.end.toLocaleString())
    	console.log("종일여부:"+arg.allDay)
    	// 클릭시, 가져온 속성값을 화면에 기본적으로 로딩할 수 있게 처리..
    	//$("[name=start]").val(arg.start.toISOString().split("T")[0])
    	// fullcanlendar에서는 표준형식을 출력을 처리하게 한다.
    	$("[name=start]").val(arg.start.toISOString())
    	//$("[name=end]").val(arg.end.toISOString().split("T")[0])
    	$("[name=end]").val(arg.end.toISOString())
    	$("[name=allDay]").val(""+arg.allDay)
    	/*
        var title = prompt('일정등록:');
        if (title) {
          calendar.addEvent({
            title: title, // 타이틀
            start: arg.start, // 시작일자
            end: arg.end,	// 마지막일짜
            allDay: arg.allDay // 종일여부
          })
        }
        */
        calendar.unselect()
      },
      eventClick: function(arg) {
    	  console.log(arg.event)
		  formData(arg.event);	      
    	  $("#exampleModalLongTitle").text("일정상세");
    	  $("#regBtn").hide();
    	  $("#uptBtn").show();
    	  $("#delBtn").show();
    	  $("#modalBtn").click(); 
      },
      eventDrop:function(info){
    	  formData(info.event);
		  $("#frm01").attr("action","${path}/updateCalendar.do");
    	  $("#frm01").submit();
      },
      eventResize:function(info){
    	  formData(info.event);
		  $("#frm01").attr("action","${path}/updateCalendar.do");
    	  $("#frm01").submit();
      },	      
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: function(info, successCallback,failureCallback){
    	  // 서버에 있는 json 데이터 가져와서, fullcalenar 입력하기
    	  $.ajax({
    		  type:"post",
    		  url:"${path}/calList.do",
    		  dataType:"json",
    		  success:function(data){
    			  console.log(data.calList)
    			  successCallback(data.calList);
    			  document.getElementById('script-warning').style.display = 'none';
    		  },
    		  error:function(err){
    			  console.log(err)
    			  failureCallback(err);
    			  document.getElementById('script-warning').style.display = 'block';
    		  }
    	  });
      },
      /*
      events: {
    	  url: 'php/get-events.php', // controller에서 ajax데이터를 로딩하여 처리..
          failure: function() {
            document.getElementById('script-warning').style.display = 'block'
          } 
      }, */
      loading: function(bool) {
          document.getElementById('loading').style.display =
            bool ? 'block' : 'none';
      }
    });
    calendar.setOption('themeSystem', "Bootstrap 5");
    calendar.render();
    
  });
  function formData(event){
      $("[name=id]").val(event.id)
      $("[name=title]").val(event.title)
      // 내용을 기본 속성이 아니기에 extendedProps에 들어가 있다.
      $("[name=content]").val(event.extendedProps.content)
      $("[name=start]").val(event.start.toISOString())
	  $("[name=end]").val(event.end.toISOString())
      $("[name=borderColor]").val(event.borderColor)
      $("[name=backgroundColor]").val(event.backgroundColor)
      $("[name=textColor]").val(event.textColor)
	  $("[name=allDay]").val(""+event.allDay)	  
  }


	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();
		$("#regBtn").click(function(){
			if(confirm("일정등록하시겠습니까?")){
				$("#frm01").attr("action","${path}/insertCalendar.do");
				$("#frm01").submit();
			}		
		});
		$("#uptBtn").click(function(){
			if(confirm("일정수정하시겠습니까?")){
				$("#frm01").attr("action","${path}/updateCalendar.do");
				$("#frm01").submit();
			}		
		});		
		$("#delBtn").click(function(){
			if(confirm("일정삭제하시겠습니까?")){
				$("#frm01").attr("action","${path}/deleteCalendar.do");
				$("#frm01").submit();
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
</script>




</head>


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

                    <!-- Content Row -->
					<div id='calendar'></div>
					<div id='loading'>loading...</div>
					<div id='script-warning'>
    					<code>서버</code> must be running.
					</div>  

					<%--
						$("#modalBtn").click(); // 강제 수행하여 모달창이 로딩되도록 한다.
					 --%>
					<button id="modalBtn" data-toggle="modal" 
						data-target="#exampleModalCenter" style="display:none"></button>
					
					<div class="modal fade" id="exampleModalCenter"	tabindex="-1" role="dialog"	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLongTitle">일정등록</h5>
					        <button type="botton" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>					      
					      <div class="modal-body">
							<form id="frm01" class="form"  method="post">
							 <input type="hidden" name="id" value="0"/>
						     <div class="row">
						      <div class="col">
						        <input type="text" class="form-control" placeholder="제목 입력" name="title">
						      </div> 
						     </div>
						     <div class="row">	     
						      <div class="col">
						        <input type="text" class="form-control" 
						        	data-toggle="tooltip" data-placement="bottom" title="시작일"
						         name="start" readonly>
						      </div>
						      <div class="col">
						        <input type="text" class="form-control" 
						        	data-toggle="tooltip" data-placement="bottom" title="종료일"
						         name="end" readonly>
						      </div>
						     </div>
						     <div class="row">	     
						      <div class="col">
						      	<textarea  class="form-control" name="content"
						      		 placeholder="내용" 
						      		 cols="10" rows="10"></textarea>
						      </div>
						     </div>
						     <div class="row">	  
						      <div class="col">
						        <input type="color"
						        	data-toggle="tooltip" data-placement="bottom" title="배경색상"  value="#0099cc"
						         		class="form-control" name="backgroundColor">
						      </div>					
						      <div class="col">
						        <input type="color" class="form-control" 
						        	data-toggle="tooltip" data-placement="bottom" title="글자색상"  value="#ccffff"
						        name="textColor">
						      </div>
						     </div>
						     <div class="row">	
						      <div class="col">
						        <input type="color" class="form-control" 
						        	data-toggle="tooltip" data-placement="bottom" title="테두리색상" value="#4b0082"
						        name="borderColor">
						      </div>	       
						      <div class="col">
						      	<input type="hidden"name="allDay"  class="form-control" data-toggle="tooltip" data-placement="buttom" title="종일여부" value="true">
						      </div>
						     </div>	     
						    </form> 
   
					      </div>
					      <div class="modal-footer">					
					        <button type="button" id="regBtn" class="btn btn-primary">일정등록</button>
					        <button type="button" id="uptBtn" class="btn btn-info">일정수정</button>
					        <button type="button" id="delBtn" class="btn btn-danger">일정삭제</button>
					         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>       
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

    <!-- Bootstrap core JavaScript-->
    <script src="${path}/pms_test/vendor/jquery/jquery.min.js"></script>
    <script src="${path}/pms_test/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${path}/pms_test/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${path}/pms_test/js/sb-admin-2.min.js"></script>

    

</body>
</html>