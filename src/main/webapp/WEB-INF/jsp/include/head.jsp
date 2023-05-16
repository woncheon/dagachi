<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard</title>
  
  <style>
	#my_frame { width: 1600px; height: 1000px; }
  </style>
  
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/resource/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="/resource/bootstrap/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/resource/bootstrap/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="/resource/bootstrap/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resource/bootstrap/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="/resource/bootstrap/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="/resource/bootstrap/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="/resource/bootstrap/plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

 

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
       <!-- 즐겨찾기 -->
          <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
         <i class="fas fa-star text-yellow"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="/resource/bootstrap/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Brad Diesel
                  <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">Call me whenever you can...</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="/resource/bootstrap/dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  John Pierce
                  <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">I got your message bro</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="/resource/bootstrap/dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Nora Silvester
                  <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">The subject goes here</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
        </div>
      </li>
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
         <i class="nav-icon far fa-envelope"></i>
          <span class="badge badge-danger navbar-badge">3</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="/resource/bootstrap/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Brad Diesel
                  <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">Call me whenever you can...</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="/resource/bootstrap/dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  John Pierce
                  <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">I got your message bro</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="/resource/bootstrap/dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Nora Silvester
                  <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">The subject goes here</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
        </div>
      </li>
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
          <span class="badge badge-warning navbar-badge">15</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-item dropdown-header">15 Notifications</span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-envelope mr-2"></i> 4 new messages
            <span class="float-right text-muted text-sm">3 mins</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-users mr-2"></i> 8 friend requests
            <span class="float-right text-muted text-sm">12 hours</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-file mr-2"></i> 3 new reports
            <span class="float-right text-muted text-sm">2 days</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
        </div>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4" style="background-color:#5865F2;">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="/resource/bootstrap/dist/img/AdminLTELogo.png" alt="dagachi Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">dagachi</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex flex-wrap" style="background-color:white; justify-content:center;">
        <div class="image">
          <img src="/resource/bootstrap/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info mt-2 " style="background-color:#5865F2; margin-left:15px; ">
          <div class="d-block" style="color:white;">사용자이름</div>
          <div class="d-block" style="color:white;">사용자부서</div>
          <div class="d-block" style="color:white;">사용자상태</div>
        </div>
          <div class="select-group-wrap" style="display:block; margin-left:15px; margin-top:5px;">
           <select class="form-control" name="perPageNum" id="perPageNum" onchange="">                               
              <option value="" selected="상태">상태</option>
            <option value="">출근</option>
            <option value="">퇴근</option>
            <option value="">자리비움</option>
           </select>
        </div>
             <button class="btn btn-sidebar" style="margin-left:5px; margin-top:5px; background-color:#AAAAAA;">상태변경</button>
             <button class="btn btn-sidebar" style="margin-left:15px; margin-top:5px; background-color:#AAAAAA;">마이페이지</button>
             <button class="btn btn-sidebar" style="margin-left:15px; margin-top:5px; background-color:#AAAAAA;">로그아웃</button>
      </div>

      <!-- Sidebar Menu -->
<nav class="mt-2" style="margin: 15px;">
  <div class="accordion" id="accordion">
    <div id="card1" style="text-align: center;">
      <div class="card-header" id="headingOne">
        <h2 class="mb-0">
          <button class="btn btn-link" type="button"
                  data-toggle="collapse" data-target="#collapse1"
                  aria-expanded="false" aria-controls="collapse1"
                  style="color:white;">전자결재</button>
        </h2>
      </div>
      <div id="collapse1" class="collapse"
           aria-labelledby="headingOne" data-parent="#accordion">
        <div class="card-body">
         <div>
                <a href="">발신</a>
            </div>
           <div>
                <a href="">수신</a>
             </div>
             <div>
                <a href="">임시저장</a>
            </div>
        </div>
      </div>
    </div>
    <div id="card2" style="text-align: center;">
      <div class="card-header" id="headingTwo">
        <h2 class="mb-0">
          <button class="btn btn-link" type="button"
                  data-toggle="collapse" data-target="#collapse2"
                  aria-expanded="false" aria-controls="collapse2"
                  style="color:white;">업무관리</button>
        </h2>
      </div>
      <div id="collapse2" class="collapse"
           aria-labelledby="headingTwo" data-parent="#accordion">
        <div class="card-body">
         <div>
                <a href="">업무 조회</a>
            </div>
           <div>
                <a href="">업무 등록 및  수주</a>
             </div>
             <div>
                <a href="">업무 분배</a>
            </div>
        </div>
      </div>
    </div>
    <div id="card3" style="text-align: center;">
      <div class="card-header" id="headingThree">
        <h2 class="mb-0">
          <button class="btn btn-link" type="button"
                  data-toggle="collapse" data-target="#collapse3"
                  aria-expanded="false" aria-controls="collapse3"
                  style="color:white;">일정관리</button>
        </h2>
      </div>
      <div id="collapse3" class="collapse"
           aria-labelledby="headingThree" data-parent="#accordion">
        <div class="card-body">
          <div>
                <a href="">사내일정</a>
            </div>
           <div>
                <a href="">개인일정</a>
             </div>
        </div>
      </div>
    </div>
    <div id="card4" style="text-align: center;">
      <div class="card-header" id="headingFour">
        <h2 class="mb-0">
          <button class="btn btn-link" type="button"
                  data-toggle="collapse" data-target="#collapse4"
                  aria-expanded="false" aria-controls="collapse4"
                  style="color:white;">커뮤니티</button>
        </h2>
      </div>
    <div id="collapse4" class="collapse"
           aria-labelledby="headingFour" data-parent="#accordion">
  <div class="card-body">
    <div>
      <a href="">공지사항</a>
    </div>
    <div>
      <a href="">공유 게시판</a>
    </div>
     <div id="card8" style="text-align: center;">
        <div class="card-header" id="headingFive">
        <a href="">
            <button class="btn btn-link" type="button"
                    data-toggle="collapse" data-target="#collapse4"
                    aria-expanded="false" aria-controls="collapse4"
                    style="color:white;">회의록</button>
          </a>
        </div>
           <div id="collapse4" class="collapse"
                    aria-labelledby="headingFive" data-parent="#accordion">
           <div class="card-body">
             <div>
               <a href="">회의록 휴지통</a>
             </div>
                 </div>
           </div>
        </div>
        </div>
  </div>
</div>

    </div>
      <div id="card5" style="text-align: center;">
      <div class="card-header" id="headingFour">
        <h2 class="mb-0">
        <a href="">
          <button class="btn btn-link" type="button"
                  data-toggle="collapse" data-target="#collapse5"
                  aria-expanded="false" aria-controls="collapse5"
                  style="color:white;">회의실 예약</button>
        </a>
        </h2>
      </div>
    </div>
    <div id="card6" style="text-align: center;">
      <div class="card-header" id="headingFour">
        <h2 class="mb-0">
        <a href="">
          <button class="btn btn-link" type="button"
                  data-toggle="collapse" data-target="#collapse6"
                  aria-expanded="false" aria-controls="collapse6"
                  style="color:white;">근태</button>
        </a></h2>
      </div>
    </div>
   <div id="card7" style="text-align: center;">
      <div class="card-header" id="headingFour">
        <h2 class="mb-0">
          <button class="btn btn-link" type="button"
                  data-toggle="collapse" data-target="#collapse7"
                  aria-expanded="false" aria-controls="collapse7"
                  style="color:white;">주소록</button>
        </h2>
      </div>
      <div id="collapse7" class="collapse"
           aria-labelledby="headingFour" data-parent="#accordion">
        <div class="card-body">
           	<div>
                <a href="">중요주소록</a>
            </div>
           <div>
                <a href="">공유주소록</a>
             </div>
             <div>
                <a href="">개인주소록</a>
            </div>
            <div>
                <a href="">휴지통</a>
             </div>
        </div>
      </div>
    </div>
    </div>
</nav>

      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>