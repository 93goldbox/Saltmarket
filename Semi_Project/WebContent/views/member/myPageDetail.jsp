<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.saltmarket.common.model.vo.*, com.saltmarket.product.model.vo.Product,
com.saltmarket.product.model.vo.WishList" %>
<%
	ArrayList<Region> regionList = (ArrayList<Region>)request.getAttribute("regionList");
	ArrayList<Product> sellList = (ArrayList<Product>)request.getAttribute("sellList");
	ArrayList<Product> wishList = (ArrayList<Product>)request.getAttribute("wishList");
	int sellCount = (int)request.getAttribute("sellCount");
	ProfileImg pImg = (ProfileImg)request.getAttribute("pImg");
	Member m = (Member)request.getAttribute("m");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지_상세프로필</title>

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

        .profile {
            border: 3px solid #BFE9F9;
            width: 800px;
            height: 1000px;
            margin: 0 auto;
            font-size: large;
            margin-top: 30px;
        }

        #profile img { margin: 20px; }

        input.btn {
            float: right;
            margin: 20px;
            background-color: #BFE9F9;
            color: black;
            border: none;
        }

        .info { margin: 20px;}

        .slide { display: none; }

        .view-sellList>div {
            display: inline-block;
            margin: 20px;
        }
        
        .sellList>div { display: inline-block; }
        
        .thumbnail { margin: 10px; }

    </style>
</head>
<body>

    <%@ include file="../common/header.jsp" %>

    <div class="profile">
        <div id="profile">
            <div style="">
                <img src="<%= contextPath %>/<% if(pImg != null) { %><%= pImg.getFilePath() + pImg.getChangeName() %><% } else { %>resources/image/sogumi.png<% } %>" style="border-radius: 60px;" width="120" height="120" align="middle">
				<b><%= m.getUserName() %></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="range" class="range" name="saltyScore" min="0" max="100" step="0.5" value="<%= loginUser.getSaltyScore() %>" disabled>
                <input type="button" onclick="location.href='<%= contextPath %>/updateProfileForm.me?userNo=<%= loginUser.getUserNo() %>';" class="btn btn-secondary" value="프로필 변경" align="left">
                <a></a>
            </div>
        </div>
        
        <script>
        
	    	$(function(){
	    		
	    		// 천일염 등급명 구하는 요청
	    		$.ajax({
	    			url: "grade.me",
	    			type : "post",
	    			success : function(gradeName){
	    				
	    				// console.log(gradeName);
	    				
	    				$("#profile a").text(gradeName);
	    				
	    			},
	    			error: function(){
	    				console.log("등급 조회용 ajax 통신 실패");
	    			}
	    		});
	    		
	    	});
    	
        </script>
        
        <div class="info">
            <div>
                <b>지역</b>&nbsp;
                <i class="fa fa-map-marker" aria-hidden="true"></i>
                &nbsp;<%= m.getAddress() %>
            </div>
            <hr>
            <div class="slideBtn">
                <b>판매상품 <%= sellCount %> 개</b>&nbsp;
                <i class="fa fa-chevron-right" aria-hidden="true"></i>
            </div>
            <div class="slide">
                <div class="view-sellList">
	                <div class="sellList">
		               	<% if(sellList.isEmpty()) { %>
		                	조회된 상품이 없습니다.
		                <% } else { %>
		                	<% for(Product p : sellList) { %>
			                    <div class="thumbnail">
			                    	<img onclick="moveDetailView(<%= p.getProductNo() %>)" class="pro-img" src="<%= contextPath %>/<%= p.getFilePath() %>" width="85" height="85">
			                        <div class="pro-dsc"id="pInfo">
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
            <hr>
            <div class="slideBtn">
                <b>받은 매너 평가</b>&nbsp;
                <i class="fa fa-chevron-right" aria-hidden="true"></i>
            </div>
            <div class="slide">
                <br>
                <i class="fa fa-users" aria-hidden="true"></i> &nbsp;친절하고 매너가 좋아요.<br><br>
                <i class="fa fa-users" aria-hidden="true"></i> &nbsp;시간 약속을 잘 지켜요.
                <br><br>
            </div>
            <hr>
            <div class="slideBtn">
                <b>받은 거래 후기</b>&nbsp;
                <i class="fa fa-chevron-right" aria-hidden="true"></i><br><br>
            </div>
            <div class="slide">
                <i class="fa fa-user" aria-hidden="true"></i> &nbsp;<b>인생에 따뜻한</b><br>
				친절하고 매너가 좋아요. <br><br>
                <i class="fa fa-user" aria-hidden="true"></i> &nbsp;<b>인생에 따뜻한</b><br>
				시간 약속을 잘 지켜요.
            </div>
        </div>
    </div>

    <script>
        $(function() {

            $(".slideBtn").click(function() {

                let $div = $(this).next();

                if($div.css("display") == "none") {
                    // 기존 열려있던 p 태그들은 닫아주기
                    $(this).siblings(".slide").slideUp(1000);

                    $div.slideDown(1000); // 보여지게끔 (시간 부여 가능)
                } else {

                    $div.slideUp(1000); // 사라지게끔 (시간 부여 가능)
                }
            });
        });
        
    	function moveDetailView(pno) {
    		var url = '<%= contextPath %>/detail.pr?pno=' + pno;
    		location.href = url;
    	}

    </script>

    <%@ include file="../common/footer.jsp" %>
    
</body>
</html>