<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.saltmarket.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath();
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

        <script>
            let msg = "<%= alertMsg %>";
            
            if(msg != "null") {
                alert(msg);
                
                <%
                    session.removeAttribute("alertMsg");
                %>
            }
        </script>


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
                            <div style="padding: 30px;">
                                <form action="<%= contextPath %>/insert.no" method="post" enctype="multipart/form-data">
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">공지사항 제목</label>
                                        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목" name="title" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlTextarea1" class="form-label" >공지사항 내용</label>
                                        <textarea class="form-control"name="content" id="" cols="30" rows="10" style=" height: 300px; resize: none;" required ></textarea>
                                    </div>
                                    <div  style="height: 300px; display: flex; flex-wrap: nowrap;">
                                        <span style="width: 140px; font-size: 20px" >사진 첨부</span>
                                        <div style="border: 1px solid rgb(133, 133, 133); width: 200px; height: 200px; margin-right: 50px; border-radius: 1px;">
                                            <img id="contentImg1" width="100%" height="100%">
                                        </div>
                                        <div style="border: 1px solid rgb(133, 133, 133); width: 200px; height: 200px; margin-right: 50px; border-radius: 1px;">
                                            <img id="contentImg2" width="100%" height="100%">
                                        </div>
                                        <div style="border: 1px solid rgb(133, 133, 133); width: 200px; height: 200px; margin-right: 50px; border-radius: 1px;">
                                            <img id="contentImg3" width="100%" height="100%">
                                        </div>
                                    </div>
                                    <div class="file-area">
                                        <input type="file" id="file1" name="file1" onchange="loadImg(this, 1);">
                                        <input type="file" id="file2" name="file2" onchange="loadImg(this, 2);">
                                        <input type="file" id="file3" name="file3" onchange="loadImg(this, 3);">
                                    </div>
                                    <br>
                                    <br>
                                    <div style="height: 300px; display: flex ; justify-content: center;">
                                        <button type="submit" style="width: 265px; height: 60px; background-color: black; color: white; font-size: 25px; font-weight: 900;">등록하기</button>
                                    </div>
                                </form>
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
                    $(".file-area").hide(); 
    
                    $("#contentImg1").click(function() {
                        $("#file1").click();
                    });
    
                    $("#contentImg2").click(function() {
                        $("#file2").click();
                    });
    
                    $("#contentImg3").click(function() {
                        $("#file3").click();
                    });
    
                });
    
                function loadImg(inputFile, num) {
    
                    if(inputFile.files.length == 1) { 
                        
                        let reader = new FileReader();
    
                        reader.readAsDataURL(inputFile.files[0]);
                        
                        reader.onload = function(e) {
    
                            switch(num) {
                                case 1: $("#contentImg1").attr("src", e.target.result); break;
                                case 2: $("#contentImg2").attr("src", e.target.result); break;
                                case 3: $("#contentImg3").attr("src", e.target.result); break;
                            }
                        };
                    } else { 
    
                        switch(num) {
                            case 1: $("#contentImg1").attr("src", null); break;
                            case 2: $("#contentImg2").attr("src", null); break;
                            case 3: $("#contentImg3").attr("src", null); break;
                        }
                    }
                }
            </script>
        </body>
    </html>
    