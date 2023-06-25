<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.saltmarket.common.model.vo.*, com.saltmarket.product.model.vo.Product" %>
<%
	ArrayList<Region> regionList = (ArrayList<Region>)request.getAttribute("regionList");
	ArrayList<Product> wishList = (ArrayList<Product>)request.getAttribute("wishList");
	ProfileImg pImg = (ProfileImg)request.getAttribute("pImg");
	Member m = (Member)request.getAttribute("m");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- icon css cdn link -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- 구글 Gowun Dodum 폰트 적용 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

    <!-- 사이드바 아이콘 -->
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>

    <!-- jQuery 온라인 방식 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

    <style>

        body { font-family: 'Gowun Dodum', sans-serif; }

        .wrapper_myPage>div { box-sizing: border-box; }

        .wrapper_myPage {
            width: 1000px;
            height: 700px;
            margin: 0 auto;
            font-size: large;
        }

        #wrap_content { height: 75%; }
        #profile { width: 100%; height: 25%; }
        #sidebar { width: 25%; height: 80%; }
        #content { width: 75%; height: 80%; }
        #wrap_content>div { height: 100%; float: left; }
        
        .wrapper_myPage>div {
            width: 100%;
            box-sizing: border-box;
        }

        #profile {
            border: 3px solid #BFE9F9;
            width: 1000px;
            margin-top: 20px;
        }

        #profile img { margin: 20px; }

        #sidebar a {
            text-decoration: none;
            color: black;
        }

        #sidebar a:hover { font-weight: bold; }

        input.btn {
            float: right;
            margin-right: 20px;
            background-color: #BFE9F9 !important;
            color: black !important;
            border: none !important;
        }

        .nav-item i {
            display: inline-block;
            vertical-align: middle;
            margin-right: 5px;
        }

        .nav-item a {
            display: inline-block;
            vertical-align: middle;
        }

        nav, .header, .wishList { margin: 30px; }

        .wishList>div { display: inline-block; }
        
        .thumbnail { margin: 10px; }
        
        .nav>li { margin: 10px }

    </style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>

    <div class="wrapper_myPage">

        <!-- 프로필 -->
        <div id="profile">

            <table style="width: 990px;">
                <tr>
                    <td rowspan="3">
                        <img src="<%= contextPath %>/<% if(pImg != null) { %><%= pImg.getFilePath() + pImg.getChangeName() %><% } else { %>resources/image/sogumi.png<% } %>" style="border-radius: 60px;" width="120" height="120" align="middle">
                    </td>
                    <td>
                        <b><%= m.getUserName() %></b>
                    </td>
                    <td>
                        <input type="button" onclick="myPageDetail();" class="btn btn-secondary" value="상세 프로필" align="left">
                        <input type="button" onclick="updatePage();" class="btn btn-secondary" value="회원 정보 변경">
                    </td>
                </tr>
                <tr>
                    <td>
                        <a></a>&nbsp;&nbsp;
                        <input type="range" class="range" name="saltyScore" min="0" max="100" step="0.5" value="<%= loginUser.getSaltyScore() %>" disabled>&nbsp;&nbsp;
						염도&nbsp;<%= loginUser.getSaltyScore() %>%
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </table>

        </div>

        <script>
        	$(function(){
        		
        		// 천일염 등급명 구하는 요청
        		$.ajax({
        			url: "grade.me",
        			type : "post",
        			success : function(gradeName){
        				
        				$("#profile a").text(gradeName);
        				
        			},
        			error: function(){
        				console.log("등급 조회용 ajax 통신 실패");
        			}
        		});
        		
        	});
        
            function updatePage() {
                location.href = "<%= contextPath %>/updateForm.me"
            }
            
            function myPageDetail() {
            	location.href = "<%= contextPath %>/myPageDetail.me"
            }
        </script>

        <div id="wrap_content">
            <div id="sidebar">
                <nav>
                    <ul class="nav flex-column">
                        <li class="title"><b>나의 거래</b></li>
                        <li class="nav-item">
                            <i class="fa fa-heart-o" aria-hidden="true"></i>
                            <a class="nav-link active" href="<%= contextPath %>/myPageMain.me">관심목록</a>
                        </li>
                        <li class="nav-item">
                            <i class="fa fa-krw"></i>
                            <a class="nav-link" href="<%= contextPath %>/myPageSellList.me">판매내역</a>
                        </li>
                        <li class="nav-item">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                            <a class="nav-link" href="<%= contextPath %>/ready">구매내역</a>
                        </li>
                        <li class="nav-item">
                            <i class="fa fa-envelope-o"></i>
                            <a class="nav-link" href="<%= contextPath %>/ready">쪽지함</a>
                        </li>
                        <li class="title"><b>나의 커뮤니티</b></li>
                        <li class="nav-item">
                            <i class="fa fa-smile-o"></i>
                            <a class="nav-link active" href="<%= contextPath %>/ready">커뮤니티 글</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div id="content">
                <header class="header">
                    <i class="fa fa-chevron-left" aria-hidden="true"></i>
                    <b>&nbsp;관심목록</b>
                </header>
                <hr>
                <div class="wishList">
                	<% if(wishList.isEmpty()) { %>
	                	조회된 상품이 없습니다.
	                <% } else { %>
	                	<% for(Product p : wishList) { %>
		                    <div class="thumbnail">
		                    	<img onclick="moveDetailView(<%= p.getProductNo() %>)" class="pro-img" src="<%= contextPath %>/<%= p.getFilePath() %><%= p.getCn() %>" width="130" height="130">
		                    	<div class="pro-dsc" id="pInfo">
                                    <input type="hidden" name="pno" value="<%= p.getProductNo() %>">
		                            <div class="name"><%= p.getProductName() %></div>
		                            <div class="price"><%= p.getPrice() %></div>
		                        </div>
		                    </div>
	                    <% } %>
	                <% } %>
                </div>
			</div>			                
		</div>
	</div>
		
	<script>
	function moveDetailView(pno) {
		var url = '<%= contextPath %>/detail.pr?pno=' + pno;
		location.href = url;
	}
	</script>
		
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>