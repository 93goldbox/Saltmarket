<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.saltmarket.common.model.vo.*, com.saltmarket.product.model.vo.Product, com.saltmarket.member.model.vo.Member" %>
<%
	ArrayList<Product> plist = (ArrayList<Product>)request.getAttribute("plist");
	ImgFile img = (ImgFile)request.getAttribute("img");
	int count = (int)request.getAttribute("count");
	Member m = (Member)request.getAttribute("m");
	String gradeName = (String)request.getAttribute("g");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매자 프로필 조회</title>

    <!-- 사이드바 아이콘 -->
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>

    <!-- jQuery 온라인 방식 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

    <style>
        body { font-family: 'Gowun Dodum', sans-serif; }

        div { box-sizing: border-box; }

        .profile {
            border: 3px solid #BFE9F9;
            width: 600px;
            height: 700px;
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

    </style>
</head>
<body>

    <%@ include file="../common/header.jsp" %>

    <div class="profile">
        <div id="profile">
            <div style="">

				<img src="<%= contextPath %>/<%if(img == null){%>resources/image/sogumi.png<%}else{%><%= contextPath %>/<%= img.getTitleImg()%><%}%>" style="border-radius: 60px;" width="120" height="120" align="middle">
				
				
				<b><%= m.getUserName() %></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="range" class="range" name="saltyScore" min="0" max="100" step="0.5" value="<%= m.getSaltyScore() %>" disabled>
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
                <b>판매상품 <%= count %> 개</b>&nbsp;
                <i class="fa fa-chevron-right" aria-hidden="true"></i>
            </div>
            <div class="slide">
                <div class="view-sellList">
                    <% if(plist.isEmpty()) { %>
		        		조회된 상품이 없습니다.
		        	<% } else { %>
		        		<% for(Product p : plist) { %>
				             <div class="col" >
				                 <div class="card list-body" >
				                     <img src="<%= contextPath %>/<%= p.getTitleImg() %>" class="card-img-top" alt="...">
				                     <div class="card-body">
				                     	 <input type="hidden" name="pno" value="<%= p.getProductNo() %>">
				                         <p class="card-title"><%= p.getProductName() %></p>
				                         <p class="card-text"><%= p.getPrice() %> 원</p>
				                         <a href="<%= contextPath %>/detail.pr?pno=<%= p.getProductNo() %>" class="btn btn-primary">매물상품 상세보기</a>
				                     </div>
				                 </div>
				             </div>
		            	<% } %>
		            <% } %>
                </div>
            </div>
            <hr>
            <div class="slideBtn">
                <b>받은 매너 평가 점수</b>&nbsp;
                <i class="fa fa-chevron-right" aria-hidden="true"></i>
            </div>
            <div class="slide">
                <br>
                <i class="fa fa-users" aria-hidden="true"></i> &nbsp;<%= m.getSaltyScore() %> °C<br><br>
                <br><br>
            </div>
        </div>
    </div>

    <script>
        $(function() {

            $(".slideBtn").click(function() {
                let $div = $(this).next();
                if($div.css("display") == "none") {
                    $(this).siblings(".slide").slideUp(1000);
                    $div.slideDown(1000);
                } else {
                    $div.slideUp(1000);
                }
            });
        });
    </script>

    <%@ include file="../common/footer.jsp" %>
    
</body>
</html>