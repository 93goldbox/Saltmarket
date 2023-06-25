<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}
</style>
</head>
<body>

<%@ include file="../common/header.jsp"%>
<div class="container">
<img src="<%= contextPath %>/resources/image/ready.png" style="text-align: center;">
</div>
<%@ include file="../common/footer.jsp"%>


</body>
</html>