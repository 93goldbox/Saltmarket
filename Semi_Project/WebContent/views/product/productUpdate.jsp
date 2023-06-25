<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.saltmarket.common.model.vo.*, com.saltmarket.product.model.vo.*"
 %>
<%
	ArrayList<Region> regionList = (ArrayList<Region>)request.getAttribute("regionList");

	Product p = (Product)request.getAttribute("p");
	
	ImgFile img = (ImgFile)request.getAttribute("img");

%>
    
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>상품등록페이지</title>
	
	<!-- 부트스트랩 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

	<!-- 외부 css -->
   <link href="<%=request.getContextPath()%>/resources/css/productUpdate.css" rel="stylesheet" type="text/css">
    
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

	 <!-- jQuery -->
	 
	 <script src="http://code.jquery.com/jquery.min.js"></script>
	 <link href="<%=request.getContextPath()%>/resources/css/select2.css" rel="stylesheet" type="text/css">
	<script src="<%=request.getContextPath()%>/resources/js/select2.js"></script>
	<script type="text/javascript">

		var newJquery = $.noConflict(true);

		newJquery(document).ready(function () {
			newJquery("#region").select2();
		});
  </script>

</head>
<body>
	<%@ include file="../common/header.jsp" %>

	<!-- body 시작 -->
		
	<form id="productrUpdate-form" action="<%= contextPath %>/ProductUpdate.pr" method="post"  enctype="multipart/form-data">

		<input type="hidden" name="productNo" value="<%=p.getProductNo() %>">

		<br><br>
			<div class="container" id="product-title">
					<div class="row">
						<div class="col text-center">
							<h2>제목</h2>
					</div>
						<div class="col-9">
								<input type="text" id="productName" name="productName" value="<%= p.getProductName() %>"  placeholder="상품 제목을 입력해주세요" required>
								&nbsp;&nbsp;
								<input class="form-check-input" type="checkbox" value="" id="direct-trade">
								<label for="direct-trade"> 직거래 선호 </label>
						</div>
					</div>
			</div>
			<div class="container" id="sell-category">
					<div class="row">
						<div class="col text-center">
							<h2>카테고리</h2>
					</div>
						<div class="col-9">
							<table>
								<tr>
									<td>
										<input type="radio" id="category1" name="category" value="1" required>&nbsp;
										<label for="category1"> 패션/잡화 </label>&nbsp;&nbsp;
									</td>
									<td>
										<input type="radio" id="category2" name="category" value="2">&nbsp;
										<label for="category2"> 디지털/가전 </label>&nbsp;&nbsp;
									</td>
									<td>
										<input type="radio" id="category3" name="category" value="3">&nbsp;
										<label for="category3"> 스포츠/레저 </label>&nbsp;&nbsp;
									</td>
									<td>
										<input type="radio" id="category4" name="category" value="4">&nbsp;
										<label for="category4"> 도서/티켓/문구 </label>&nbsp;&nbsp;
									</td>
									<td>
										<input type="radio" id="category5" name="category" value="5">&nbsp;
										<label for="category5"> 뷰티/미용 </label>&nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										<input type="radio" id="category6" name="category" value="6">&nbsp;
										<label for="category6"> 가구/인테리어</label>&nbsp;&nbsp;
									</td>
									<td>
										<input type="radio" id="category7" name="category" value="7">&nbsp;
										<label for="category7"> 생활/주방용품	 </label>&nbsp;&nbsp;
									</td>
									<td>
										<input type="radio" id="category8" name="category" value="8">&nbsp;
										<label for="category8"> 반려동물용품 </label>&nbsp;&nbsp;
									</td>
									<td>
										<input type="radio" id="category9" name="category" value="9">&nbsp;
										<label for="category9">기타 </label>&nbsp;&nbsp;
									</td>
									<td>
										
									</td>
								</tr>
							</table>
						</div>
					</div>
			</div>
		<div class="container" id="area">
			<div class="row">
					<div class="col text-center">
						<h2>거래지역</h2>
			</div>
					<div class="col-9">
								<select id="region" name="region" required>
									<% for(Region r : regionList) { %>
											<option value="<%= r.getRegionNo() %>"><%=r.getRegionName() %></option>
									<% } %>
							</select>
							<script>
								$(function(){
										$("productrUpdate-form option").each(function() {
												if($(this).val() ==  "<%= p.getRegionNo() %>") {
														$(this).attr("selected", true);
												}
											
										});
								});
							</script>
					</div>
			</div>
		</div>
		<div class="container" id="sellPrice">
			<div class="row">
					<div class="col text-center">
						<h2>가격</h2>
					</div>
					<div class="col-9">
						<input type="number" min="0" step="10" name="price" placeholder="숫자만 입력해주세요" value="<%= p.getPrice() %>" required><h4>원</h4>
						&nbsp;&nbsp;
						<input class="form-check-input" type="checkbox" value="" id="delivery-fee">
						<label for="delivery-fee"> 배송비포함 </label>
					</div>
			</div>
		</div>
			<div class="container" id="content">
					<div class="row">
						<div class="col text-center">
							<h2>설명</h2>
						</div>
						<div class="col-9">
							<textarea type="content" rows="10" cols="80" id="description" name="description" placeholder="상품 설명을 입력해주세요(2000자 이내)" required><%= p.getDescription() %></textarea>
						</div>
					</div>
			</div>
			<div class="container" id="image">
					<div class="row">
						<div class="col text-center">
							<h2>상품<br>이미지</h2>
					</div>
					<div class="col-9">
						<div id="file-image" name="file-image">
							<table align="center">
								<tr align="center" width="185" height="230">
									<td align="center" width="185" height="230">
										<img id="productImg1" width="180" height="230">
									</td>
									<td id="fileInput" name="fileInput">
										<input type="hidden" name="originFileNo" value="<%= img.getFileNo() %>">
										<input type="hidden" name="originFIleName" value="<%= img.getChangeFileName() %>">
										<input type="file" id="reUpFile1" name="reUpFile1" onchange="loadImg(this, 1);" required>
									</td>
									<td align="center" width="50" height="230">
									</td>
									<td align="center" width="300" height="230">
										수정 전 파일명 : <%= img.getOriginName() %><br>
										매물 이미지는 썸네일<b>(필수 입력)</b><br>
										이미지 파일의 크기은 <b>10MB</b>를 넘어가면 안됨<br>
										매물과 관련된 이미지를 입력해주세요						
									</td>
								</tr>
						</table>
						<script>
							$(function() {

								$("#fileInput").hide();

								$("#productImg1").click(function() {
									$("#reUpFile1").click();
								});
							});
							
							
							function loadImg(inputFile, num) {	
								
								if(inputFile.files.length == 1) { // 선택된 파일이 있는 경우

									// 선택된 파일을 읽어들여서 그 영역에 맞는 곳에 미리보기

									let reader = new FileReader();

									reader.readAsDataURL(inputFile.files[0]);

									reader.onload = function(e) {

										switch(num) {
											case 1 : $("#productImg1").attr("src", e.target.result); break;               
                                                                        
											}
										};
									} else {

										switch(num) {
											case 1 : $("#productImg1").attr("src", null); break;        
										}
									}
								}
							
						</script>
						</div>
					</div>
			</div>
		</div>
		<div class="container" id="product-status">
			<div class="row">
					<div class="col text-center">
						<h2>상품&nbsp;상태</h2>
					</div>
					<div class="col-9">
						<input type="radio" id="productStatus1" name="productStatus" value="Y" >&nbsp;
						<label for="productStatus1">거래&nbsp;가능</label>&nbsp;&nbsp;<br>
						<input type="radio" id="productStatus2" name="productStatus" value="N" >&nbsp;
						<label for="productStatus2">거래&nbsp;불가능</label>&nbsp;&nbsp;
					</div>
				</div>
		</div>
		<div class="container" id="update-submit">
			<div class="row">
					<div class="col">
						<input type="submit" id="update-submit-btn" value="수정하기">
					</div>
			</div>
		</div>
</form>
<!-- 바디 끝 -->
		
			<%@ include file="../common/footer.jsp" %>

</body>
</html>