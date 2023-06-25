<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String errorMsg = (String)request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<br><br>
	<h1 align="center" style="color : red;"><%= errorMsg %></h1>
	<div align="center">
	<img src="../../resources/image/errorPage2.png" style="">
	</div>
	<%@ include file="../common/footer.jsp" %>

</body>
</html>