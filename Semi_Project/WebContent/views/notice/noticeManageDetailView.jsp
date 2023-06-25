<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.saltmarket.member.model.vo.Member" %>
    <%@ page import="java.util.ArrayList, com.saltmarket.notice.model.vo.*" %>
<%
    ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	String contextPath = request.getContextPath();
    Notice n = (Notice)request.getAttribute("n");
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>소금마켓 대시보드</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= contextPath %>/views/dashboard/css/styles.css" rel="stylesheet" />

        <style>
            tr:hover {
                cursor: pointer;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        
        <!-- 자바스크립트 가져올것들  -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<%= contextPath %>/views/dashboard/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="<%= contextPath %>/views/dashboard/js/datatables-simple-demo.js"></script>
        <script src="<%= contextPath %>/views/dashboard/assets/demo/chart.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> <!-- 온라인 방식 -->

        


            <!-- 네비게이션 바 -->
            <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    
                <!-- Navbar Brand-->
                <a class="navbar-brand ps-3" href="<%= contextPath %>/manageList.me">소금마켓 관리자</a>
    
                <!-- Sidebar Toggle-->
                <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            </nav>

            <div id="layoutSidenav">
                <div id="layoutSidenav_nav">
                    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                        <div class="sb-sidenav-menu">
                            <div class="nav">
                                
                                <div class="sb-sidenav-menu-heading">Core</div>
                                
                                <a class="nav-link" href="<%= contextPath %>">
                                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                    소금마켓 메인
                                </a>
                                <div class="sb-sidenav-menu-heading">Interface</div>
                                <a class="nav-link" href="<%= contextPath %>/manageList.me">
                                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                    회원 관리
                                </a>
    
                                <a class="nav-link" href="<%= contextPath %>/pmc.pr">
                                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                    거래 관리
                                </a>
    
                                <a class="nav-link" href="<%= contextPath %>/list.mpr">
                                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                    신고 관리
                                </a>

                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts_cs" aria-expanded="false" aria-controls="collapseLayouts">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    고객센터 관리
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>

                                <div class="collapse" id="collapseLayouts_cs" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
    
                                        <a class="nav-link" href="<%= contextPath %>/list.mno">
                                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                            공지사항게시판 관리
                                        </a>
                                        
                                        <a class="nav-link" href="<%= contextPath %>/list.mqna">
                                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                            1:1문의게시판 관리
                                        </a>
                                        
                                    </nav>
                                </div>

                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts_co" aria-expanded="false" aria-controls="collapseLayouts">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                        커뮤니티 관리
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapseLayouts_co" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="<%= contextPath %>/manage.fbo?currentPage=1&category=전체">
                                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                            자유게시판 관리
                                        </a>
                                        
                                        <a class="nav-link" href="<%= contextPath %>/manage.sbo?currentPage=1&regionNo=0&status=A">
                                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                            나눔게시판 관리
                                        </a>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <div class="sb-sidenav-footer">
                            <div class="small">로그인시</div>
                            소금마켓 관리자
                        </div>
                    </nav>
                </div>

            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">공지사항 상세조회
                        </h1>                        
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                공지사항 상세조회
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th style="width: 60px;"> <%= n.getNoticeNo() %> </th>
                                                <th colspan="2"><%= n.getNoticeTitle() %></th>
                                                <th style="width: 120px;"><%= n.getCreateDate() %></th>
                                                <th style="width: 75px;"> <%= n.getNoticeViews() %> </th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- list가 비어있지 않으면 -->
                                            <% if(!list.isEmpty()) { %>
                                                <tr>
                                                    <td colspan="5">
                                                        <% for(int i = 0; i < list.size(); i++) { %>
                                                            <a href="<%= contextPath %>/<%= list.get(i).getFilePath() + list.get(i).getChangeName() %>">
                                                            <img style="width: 300px ; height: 300px;" src="<%= contextPath %>/<%= list.get(i).getFilePath() + list.get(i).getChangeName() %>">
                                                            </a>
                                                        <% } %>
                                                    </td>
                                                </tr>
                                                
                                            <% } %>
                                            <tr>
                                                <!-- 내용 colspan4 -->
                                                <td colspan="5">
                                                    <pre>
<%= n.getNoticeContent() %>
                                                    </pre>
                                                </td>
                                            </tr>
                                            
                                        </tbody>
                                        
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </body>
</html>
