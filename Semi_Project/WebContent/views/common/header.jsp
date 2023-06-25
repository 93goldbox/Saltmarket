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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <!-- icon css cdn link -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/common.css">
    <link rel="stylesheet" href="resources/css/trade_board.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

    <!--font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    
</head>
<body>

	<script>
		let msg = "<%= alertMsg %>";
		
		if(msg != "null") {
			alert(msg);
			
			<%
				session.removeAttribute("alertMsg");
			%>
		}
	</script>
	
    <br>
    <div class="wrap1 wrap22">
        <div class="container">    
            <div class="row">
                <div class="col" style="padding-left: 55px;">
                	<a href="<%= contextPath %>">
                    	<img src="<%= contextPath %>/resources/image/logo.png" width="140" heigh="140" >
                	</a>
                </div>
                <div class="col">
                    <div class="input-group mb-3">
                        <h1 class="h1h1">
                        	<a href="<%= contextPath %>" style="text-decoration: none; color: black;">소금마켓</a>
                        </h1>
                    </div>
                    <form action="<%= contextPath %>/list.pr" method="get">
                    	<input type="hidden" name="currentPage" value="1">
                    	<input type="hidden" name="category" value="0">
                    	
                        <div class="goods_search">
                            <input type="search" name="keyword" class="form-control" placeholder="물품이나 동네를 검색해보세요"/>
                            <button type="submit" class="btn btn-outline-info">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>  
                            </button>
                        </div>
                    </form>
                </div>
                
                <% if(loginUser == null) { %>
                    <div class="col salt1">
                        <div>
                            <a href="<%= contextPath %>/loginPage.me">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-box-arrow-in-right login1" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
                                    <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                                </svg><br>
                                <span class="spanH0">로그인</span>
                            </a>
                        </div>
                        <div>
                            <a href="<%= contextPath %>/loginPage.me">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person svg2" viewBox="0 0 16 16">
                                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                                </svg><br>
                                <span class="spanH1">나의 소금</span>
                            </a>
                        </div>
                        <div>
                            <a href="<%= contextPath %>/loginPage.me">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-coin svg3" viewBox="0 0 16 16">
                                    <path d="M5.5 9.511c.076.954.83 1.697 2.182 1.785V12h.6v-.709c1.4-.098 2.218-.846 2.218-1.932 0-.987-.626-1.496-1.745-1.76l-.473-.112V5.57c.6.068.982.396 1.074.85h1.052c-.076-.919-.864-1.638-2.126-1.716V4h-.6v.719c-1.195.117-2.01.836-2.01 1.853 0 .9.606 1.472 1.613 1.707l.397.098v2.034c-.615-.093-1.022-.43-1.114-.9H5.5zm2.177-2.166c-.59-.137-.91-.416-.91-.836 0-.47.345-.822.915-.925v1.76h-.005zm.692 1.193c.717.166 1.048.435 1.048.91 0 .542-.412.914-1.135.982V8.518l.087.02z"/>
                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                    <path d="M8 13.5a5.5 5.5 0 1 1 0-11 5.5 5.5 0 0 1 0 11zm0 .5A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"/>
                                </svg><br>
                                <span class="spanH2" >판매하기</span>
                            </a>
                        </div>
                    </div>
                <% } else { %>
               
                    <div class="col salt1"> 
                       	<div>
	                    	 <div style="display : inline">
	                        <b><%= loginUser.getUserName() %>님</b> 환영합니다.
	                 		</div>
                 	    </div>
                 	
                        <div style="display : float;">
                            <a href="<%= contextPath %>/logout.me">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-box-arrow-in-right login1" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
                                    <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                                </svg><br>
                                <span class="spanH0">로그아웃</span>
                            </a>
                        </div>
                        <% if(loginUser.getUserNo() == 1 || loginUser.getUserNo() == 2) { %>
                            <div>
                                <a href="<%= contextPath %>/manageList.me">
                                    <span class="material-symbols-outlined" style="text-align: center; font-size: 25px;">
                                        &nbsp;dashboard
                                    </span>
                                    <br>
                                    <span class="spanH1"> 관리자 페이지</span>
                                </a>
                            </div>
                        <% } else { %>
                            <div>
                                <a href="<%= contextPath %>/myPageMain.me">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person svg2" viewBox="0 0 16 16">
                                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                                    </svg><br>
                                <span class="spanH1">나의 소금
                                </a>
                            </div>
                            <div>
                                <a href="<%= contextPath %>/registration.pr">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-coin svg3" viewBox="0 0 16 16">
                                        <path d="M5.5 9.511c.076.954.83 1.697 2.182 1.785V12h.6v-.709c1.4-.098 2.218-.846 2.218-1.932 0-.987-.626-1.496-1.745-1.76l-.473-.112V5.57c.6.068.982.396 1.074.85h1.052c-.076-.919-.864-1.638-2.126-1.716V4h-.6v.719c-1.195.117-2.01.836-2.01 1.853 0 .9.606 1.472 1.613 1.707l.397.098v2.034c-.615-.093-1.022-.43-1.114-.9H5.5zm2.177-2.166c-.59-.137-.91-.416-.91-.836 0-.47.345-.822.915-.925v1.76h-.005zm.692 1.193c.717.166 1.048.435 1.048.91 0 .542-.412.914-1.135.982V8.518l.087.02z"/>
                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                        <path d="M8 13.5a5.5 5.5 0 1 1 0-11 5.5 5.5 0 0 1 0 11zm0 .5A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"/>
                                    </svg><br>
                                    <span class="spanH2" >판매하기</span>
                                </a>
                            </div>
                           
                        <% } %>
                    </div>
                <% } %>
            </div>
        </div>
        <br>

            <nav class="navbar navbar-expand-sm navbar-light nav1">
                <div class="container-fluid d-flex justify-content-center">
                    <ul class="navbar-nav">

                        <li class="nav-item">
                            <a class="nav-link active nav2" href="<%= contextPath %>">홈</a>
                        </li>
                        
                        <li class="nav-item dropdown">
                          <a class="nav-link nav2 dropdown-toggle" href="<%= contextPath %>/list.pr">카테고리</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link nav2  dropdown-toggle" href="<%= contextPath %>" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">자유/나눔게시판</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="<%= contextPath %>/list.fbo?category=전체&currentPage=1">자유게시판</a></li>
                                <li><a class="dropdown-item" href="<%= contextPath %>/list.sbo?currentPage=1&regionNo=0&status=A">나눔게시판</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav2" href="<%= contextPath %>">시세조회</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link nav2  dropdown-toggle" href="<%= contextPath %>/view.cs">고객센터</a>
                        </li>
                        
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</body>
</html>
