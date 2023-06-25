<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.saltmarket.member.model.vo.Member" %>
    <%@ page import="java.util.ArrayList, com.saltmarket.common.model.vo.*" %>
<%
    ArrayList<ImgFile> list = (ArrayList<ImgFile>)request.getAttribute("list");
	String contextPath = request.getContextPath();
    Declaration d = (Declaration)request.getAttribute("d");
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
                        <h1 class="mt-4">상품신고 상세조회
                        </h1>                        
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                상품신고 상세조회
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th style="width: 80px;">No. <%= d.getDeclareNo() %> </th>
                                                <th style="width: 140px;">Id :  <%= d.getUserId() %></th>
                                                <th style="width: 120px;"> 유형 : <%= d.getDeclareType() %></th>
                                                <th style="width: 180px;">
                                                    <% if(d.getShareBoardNo()!= 0) {%>
                                                        나눔게시판 ( No.<%= d.getShareBoardNo() %> )
                                                    <% } else if(d.getFreeBoardNo()!= 0) {%>
                                                        자유게시판 ( No.<%= d.getFreeBoardNo() %> )
                                                    <% } %>

                                                </th>
                                                <th>제목 : <%= d.getDeclareTitle() %></th>
                                                <th style="width: 200px;"> 신고일 : <%= d.getDeclareDate() %></th>
                                                <th style="width: 75px;">
                                                    <% if (d.getDeclareCheck() == 1) { %>
                                                        <span style="color: red;">처리중</span>
                                                    <% } else if (d.getDeclareCheck() == 2) { %>
                                                        <span style="color: blue;">승인</span>
                                                    <% } else if (d.getDeclareCheck() == 3) { %>
                                                        <span style="color: green;">반려</span>
                                                    <% } %>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <% if(!list.isEmpty()) { %>
                                                    <% for(int i = 0; i < list.size(); i++) { %>
                                                        <a href="<%= contextPath %>/<%= list.get(i).getFilePath() + list.get(i).getChangeFileName() %>">
                                                            <img src="<%= contextPath %>/<%= list.get(i).getFilePath() + list.get(i).getChangeFileName() %>">
                                                        </a>
                                                    <% } %>
                                                <% } else { %>
                                                    <td colspan="7">첨부파일이 없습니다.</td>
                                                <% } %>
                                            </tr>
                                            <tr>
                                                <td colspan="7">
                                                    <pre>
<span style="font-weight:900; font-size: 20px;">신고 내용</span>

<%= d.getDeclareContent() %>
                                                    </pre>
                                                </td>
                                            </tr>
                                            <% if(d.getDeclareReason()!= null) { %>
                                                <tr>
                                                    <td colspan="4">
                                                        <pre>
<span style="font-weight:900; font-size: 20px;">사유</span>

<%= d.getDeclareReason() %>
                                                        </pre>
                                                    </td>

                                                    <th colspan="2">
                                                        답변일 : <%= d.getDeclareCheckDate() %>
                                                    </th>
                                                </tr>
                                            <% } %>
                                            
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="6">
                                                    <div class="container" style="display: flex; justify-content: center;">
                                                        <button type="button" class="btn btn-success showModal" data-bs-toggle="modal" data-bs-target="#declareCheck">
                                                            처리하기
                                                        </button>
                                                        <button class="btn btn-primary" onclick="location.href='<%= contextPath %>/list.mpr'">목록가기</button>
                                                        <form action="<%= contextPath %>/decide.dc" method="post">
                                                            <input type="hidden" name="dno" value="<%= d.getDeclareNo() %>">
                                                            <div class="modal" id="score" tabindex="-1">
                                                                <div class="modal-dialog modal-dialog-centered">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header" style="display: flex;">
                                                                            <h5 class="modal-title" style="justify-content: start;">신고 처리</h5>
                                                                            <select name="check" id="">
                                                                                <option value="2">승인</option>
                                                                                <option value="3">반려</option>
                                                                            </select>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <div class="slideBtn">
                                                                                <b>사유</b>&nbsp;<i class="bi bi-chevron-down" aria-hidden="true"></i>
                                                                            </div>
                                                                            <div class="slide">
                                                                                <br>
                                                                                <textarea name="reason" id="" cols="30" rows="10"></textarea>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="submit" class="btn btn-primary" id="scoreSubmit">평가 제출</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>   
                                        </tfoot>
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
        <script>
            $(function(){
                $(".showModal").click(function(){
                    $("#score").modal("show");
                });
            });
        </script>
    </body>
</html>
