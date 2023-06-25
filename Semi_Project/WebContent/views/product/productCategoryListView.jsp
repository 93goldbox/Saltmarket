<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.saltmarket.common.model.vo.PageInfo, 
com.saltmarket.product.model.vo.Product, com.saltmarket.product.model.vo.Category"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Product> plist = (ArrayList<Product>)request.getAttribute("plist");
	
	ArrayList<Product> ilist = (ArrayList<Product>)request.getAttribute("list");
	
    int category = Integer.parseInt((request.getParameter("category") == null ? "0" : request.getParameter("category")));

	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();

%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>카테고리 검색 페이지</title>
	<!-- trade_board.css -->
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/trade_board.css">
	<!-- bootstrap watch file link -->
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap_th.min.css">
</head>
<style>
	.divtext1{
		color: black !important;
		background-color: none !important;
		border: 1px solid #BFE9F9 !important;
		border-radius: 5px !important;
		font-size: 20px !important;
		font-weight: 200 !important;
	}
</style>
<body>
    <%@ include file="../common/header.jsp" %>
    <!-- 바디 시작 -->

	<br>
    <div class="container" id="category1">
        <div class="row">
            <div class="col-1" id="category1_icon">
                <h2 style="width: 200px;"><i class="bi bi-houses"></i> 홈&gt; </h2>
            </div>
        </div>
    </div>

    <br>
    
    <div class="container" id="category2">
        <div class="row row-cols-5 text-center" >
            <div class="col divtext1" style="cursor: pointer;" onclick="location.href='<%= contextPath %>/list.pr?currentPage=1&category=0';">전체</div>
            <div class="col divtext1" style="cursor: pointer;" onclick="location.href='<%= contextPath %>/list.pr?currentPage=1&category=1';">패션/잡화</div>
            <div class="col divtext1" style="cursor: pointer;" onclick="location.href='<%= contextPath %>/list.pr?currentPage=1&category=2';">디지털/가전</div>
            <div class="col divtext1" style="cursor: pointer;" onclick="location.href='<%= contextPath %>/list.pr?currentPage=1&category=3';">스포츠/레저</div>
            <div class="col divtext1" style="cursor: pointer;" onclick="location.href='<%= contextPath %>/list.pr?currentPage=1&category=4';">도서/티켓/문구</div>
            <div class="col divtext1" style="cursor: pointer;" onclick="location.href='<%= contextPath %>/list.pr?currentPage=1&category=5';">뷰티/미용</div>
            <div class="col divtext1" style="cursor: pointer;" onclick="location.href='<%= contextPath %>/list.pr?currentPage=1&category=6';">가구/인테리어</div>
            <div class="col divtext1" style="cursor: pointer;" onclick="location.href='<%= contextPath %>/list.pr?currentPage=1&category=7';">생활/주방용품</div>
            <div class="col divtext1" style="cursor: pointer;" onclick="location.href='<%= contextPath %>/list.pr?currentPage=1&category=8';">반려동물용품</div>
            <div class="col divtext1" style="cursor: pointer;" onclick="location.href='<%= contextPath %>/list.pr?currentPage=1&category=9';">기타</div>
        </div>
    </div>
    <script>
	    function handleDivClick(div) {
	        var divValue = div.innerHTML; // 클릭된 div의 값 추출
	        $(".divtext1").text(divValue);
	        $("#category_name").text(divValue);
	    }
    </script>
    
    <br><br>

    <div class="container" id="category3">
        <div class="row" id="asc" id="items">
            <div class="category3_left">
                <p id="category_name"></p><p> 카테고리의 매물 상품</p>
            </div>
        </div>
    </div>
    <br><br>

    <div class="container" id="thumbnail">
        <div class="row row-cols-3">
        	<% if(plist.isEmpty()) { %>
        		조회된 상품이 없습니다.
        	<% } else { %>
        		<% for(Product p : plist) { %>
		             <div class="col">
		                 <div class="card list-body" >
		                     <input type="hidden" name="pno" value="<%= p.getProductNo() %>">
		                     <% if(p.getTitleImg() == null){ %>
		                     	 <div>
		                     	 	<img src="resources/image/noimage.png" class="img-fluid rounded-start pimg1" alt="...">
		                		 </div>
		                     <% } else{ %>
			                     <img src="<%= contextPath %>/<%= p.getTitleImg() %>" class="card-img-top" alt="..." style="height: 318px !important;">
			                     <div class="card-body" id="hiddenImg">
			                         <p class="card-title"><%= p.getProductName() %></p>
			                         <p class="card-text"><%= p.getPrice() %> 원</p>
			                     </div>
			                 <% } %>
		                 </div>
		             </div>
            	<% } %>
            <% } %>
        </div>
    </div>
    <script>
	    $(function(){
			$(".list-body").click(function(){
				let pno = $(this).children().eq(0).val();
				location.href = "<%= contextPath %>/detail.pr?pno=" + pno;
			});
		});
    </script>
	    
    <br><br>
    
    <div class="container" align="center">
        <ul class="pagination" >
        
        	<% if(currentPage != 1) { %>
	            <li class="page-item">
	                <a class="page-link" href="<%= contextPath %>/list.pr?currentPage=<%= currentPage - 1 %>&category=<%= category%>">&laquo;</a>
	            </li>
            
            <% } %>
                
            <% for(int page1 = startPage; page1 <= endPage; page1++) { %>
            	<% if(page1 != currentPage){ %>
		            <li class="page-item active">
		                <a class="page-link" href="<%= contextPath %>/list.pr?currentPage=<%= page1 %>&category=<%= category%>"><%= page1 %></a>
		            </li>
	            <% } else {%>
	            	<li class="page-item active">
	                	<a class="page-link" href="#" disabled><%= page1 %></a>
	            	</li>
	            <% } %>
			<% } %>
            
			<% if(currentPage != maxPage) { %>
	            <li class="page-item">
	                <a class="page-link" href="<%= contextPath %>/list.pr?currentPage=<%= currentPage + 1%>&category=<%= category%>">&raquo;</a>
	            </li>
	        <% } %>
        </ul>
    </div>

     <!-- 바디 끝 -->
	<%@ include file="../common/footer.jsp" %>
    </body>
</html>
