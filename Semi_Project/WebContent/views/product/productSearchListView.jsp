<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.saltmarket.product.model.vo.Product" %>
<%
	ArrayList<Product> searchList = (ArrayList<Product>)request.getAttribute("searchList");
	Product product = new Product();
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>상세 검색 페이지</title>
    <!-- bootstrap watch file link -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap_th.min.css">
    <!-- trade_board.css -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/trade_board.css">
</head>
<body>
    <%@ include file="../common/header.jsp" %>
    
    <!-- 바디 시작 -->

    <br><br>
    <div class="container" id="category1">
        <div class="row">
            <div class="col">
                <h2>카테고리</h2>
            </div>
        </div>
    </div>

    <br>

    <div class="container" id="category2">
        <div class="row row-cols-5 text-center" >
            <div class="col">여성가방</div>
            <div class="col">남성가방</div>
            <div class="col">여행용</div>
            <div class="col">가정용</div>
            <div class="col">몰라요</div>
            <div class="col">몰라요</div>
            <div class="col">몰라요</div>
            <div class="col">몰라요</div>
            <div class="col">몰라요</div>
        </div>
    </div>

    <br><br>

    <div class="container" id="category3">
        <div class="row">
            <div class="category3_left">
                <p id="category_name">자켓</p><p>의 검색결과</p>
                <p id="category_count">60,010개</p>
            </div>
            <div class="category3_right">
                <a href="">정확도순</a>
            </div>
            &nbsp; |
            <div class="category3_right_1">
                <a href="" >최신순</a>
            </div>
            &nbsp; |
            <div class="category3_right_1">
                <a href="" >저가순</a>
            </div>
            &nbsp; |
            <div class="category3_right_1">
                <a href="" >고가순</a>
            </div>
        </div>
    </div>

    <br>

    <div class="container" id="view_count">
        <div class="btn-group" role="group" aria-label="Button group with nested dropdown" >
            <button type="button" class="btn btn-primary">20개씩 보기</button>
            <div class="btn-group" role="group">
                <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1" >
                    <a class="dropdown-item" href="#">40개씩 보기</a>
                    <a class="dropdown-item" href="#">50개씩 보기</a>
                </div>
            </div>
        </div>
    </div>

    <br>
	
	<div class="container search_input">
		<form action="" method="">
		검색할 키워드 입력: <input type="text" name="keyword" placeholder="검색어를 입력하여 주세요"/>
		<!-- <button type="submit" width="80px;" height="30px;" onclick="location='/search.pr?keyword=${keyword}'">검색</button> -->
		</form>
	</div>
	
	<script>
		var $searchInputClick = _$('.search_input').find('button');
	
		$searchInputClick.on('click', searchText);
	
		var _$searchInput = _$('.search_input').find('input');
	
		_$searchInput.keyup(function(e){
	
		if(e.keyCode == 13) {        // 웹에서 엔터쳤을때
		          searchText();
		     }
		});
		
		function searchText($e){
		     var thisText = $('.search_input input').val();  // 검색한 단어

		     if(thisText == ''){
		           alert('검색어가 없습니다.');
		      } else {
		            window.location.href = ("<%= contextPath %>/search.pr?keyword=" + encodeURIComponent(thisText));                                                                //이동시킬 페이지                     //encodeURIComponent로 변환하여 넘기기 
		      }
		}
	</script>
	
    <div class="container" id="thumbnail">
   	<input type="hidden" name="pno" value="<%= product.getProductNo() %>">
        <div class="row row-cols-4">
            <% if(searchList.isEmpty()) { %>
        		조회된 상품이 없습니다.
        	<% } else { %>
        		<% for(Product p : searchList) { %>
		            <div class="col" >
		                <div class="card list-body" >
		                    <img src="<%= contextPath %>/<%= p.getTitleImg() %>" class="card-img-top" alt="..." style="height: 318px !important;">
		                    <div class="card-body">
		                        <h5 class="card-title"><%= p.getProductName() %></h5>
		                        <p class="card-text"><%= p.getPrice() %></p>
		                        <a href="<%= contextPath %>/detail.pr?pno=<%= p.getProductNo() %>" class="btn btn-primary">매물상품 상세보기</a>
		                    </div>
		                </div>
		            </div>
            	<% } %>
            <% } %>
        </div>
    </div>
    <br><br>

    <div class="container" >
        <ul class="pagination" > 
            <li class="page-item disabled">
                <a class="page-link" href="#">&laquo;</a>
            </li>
            <li class="page-item active">
                <a class="page-link" href="#">1</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="#">2</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="#">3</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="#">4</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="#">5</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="#">&raquo;</a>
            </li>
        </ul>
    </div>

    <!-- 바디 끝 -->

	<%@ include file="../common/footer.jsp" %>
</body>
</html>
