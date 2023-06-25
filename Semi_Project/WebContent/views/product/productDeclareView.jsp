<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.saltmarket.product.model.vo.Product" %>
<%
	int pno = (int)request.getAttribute("pno");
	int uno = (int)request.getAttribute("uno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .btn1 {
        background-color: #BFE9F9 !important;
        color: black !important;
        border: none !important;
    }
	.btn2 {
		border: solid 1px #BFE9F9 !important;
		color: #BFE9F9 !important;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>

	<br><br>
	<div class="container" align="center">
    	<h1>신고하기</h1>
    	
	    <form action="<%= contextPath %>/declare.pr" method="post" enctype="multipart/form-data">
	      	
	      	<input type="hidden" name="uno" value="<%= uno %>">
	      	<input type="hidden" name="pno" value="<%= pno %>">
	      	
	      	<br>
	      	<div class="container" style="margin-left:35px;">
	            <h5 style="display:inline-block;">제목: &nbsp;&nbsp;</h5>
	            <input type="text" name="title" size="85" placeholder="제목을 입력하세요" required>
	        </div>
	        <br>
	
			<div class="container" style="margin-left:35px;">
	        	<h5 style="display:inline-block; line-height:; position: relative; bottom : 122px " >내용: &nbsp;&nbsp;</h5>
	        	<textarea name="content" cols="85" rows="10" placeholder="내용을 입력하세요"></textarea>
	        </div>
	        <br>
	        
	        
	        <div id="fileInput" class="container">
				<h5>파일 첨부: </h5>
				<input type="file" id="file1" name="file1" onchange="loadImg(this, 1);">
				<input type="file" id="file2" name="file2" onchange="loadImg(this, 2);">
				<input type="file" id="file3" name="file3" onchange="loadImg(this, 3);">
			
			</div>
			<br>
			
	        <div id="fileImage" class="container">
	        	<h5>이미지 파일 첨부:
	        		<img id="declareImg1" width="200" height="200">
	        		<img id="declareImg2" width="200" height="200">
	        		<img id="declareImg3" width="200" height="200">
	        	</h5>
	        </div>
	        <br>
	        
			<script>
				$(function(){
					$("#fileInput").hide();
					$("#declareImg1").click(function(){
						$("#file1").click();
					});
					$("#declareImg2").click(function(){
						$("#file2").click();
					});
					$("#declareImg3").click(function(){
						$("#file3").click();
					});
				});

				function loadImg(inputFile, num){
					if(inputFile.files.length == 1){
						let reader = new FileReader();
						reader.readAsDataURL(inputFile.files[0]);
						reader.onload = function(e){
							switch(num){
								case 1: $("#declareImg1").attr("src", e.target.result); break;
								case 2: $("#declareImg2").attr("src", e.target.result); break;
								case 3: $("#declareImg3").attr("src", e.target.result); break;
							}
						};
					} else{
						switch(num){
							case 1: $("#declareImg1").attr("src", null); break;
							case 2: $("#declareImg2").attr("src", null); break;
							case 3: $("#declareImg3").attr("src", null); break;
						}
					}
				}
			</script>
	
			<div class="container"">
		        <button type="submit" class="btn btn-secondary btn1">신고 제출</button>
				<button type="button" class="btn btn-outline-primary btn2" onclick="history.back()">취소</button>
	        </div>
	    </form>
	</div>
	<br>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>