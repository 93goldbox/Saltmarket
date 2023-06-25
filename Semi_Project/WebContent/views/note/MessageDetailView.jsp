<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쪽지 상세 보기</title>
   <!-- Latest compiled and minified CSS -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <!-- icon css cdn link -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
   <link rel=“stylesheet” href=“css/bootstrap.min.css”>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css%22%3E">
</head>
<style>
    .outer {
		width : 1000px;
		height : 800px;
		margin : auto;
		margin-top : 50px;
	}
    table{
        border : 1px solid lightgray;
    }
    th, td {
        border : 1px solid lightgray;

    }
	.detail-area { border : 1px solid lightgray; }
	.detail-area td { text-align : center; }
</style>
<body>
    <div class="outer">
		
		<br>
		<h3 align="center">쪽지 상세보기</h3>
		<br>

		<table class="detail-area" align="center">

			<tr>
				<td width="70" height="50">제목</td>
				<td colspan="3" width="600"><%= b.getBoardTitle() %></td>
			</tr>
			<tr>
				<td width="70" height="50">작성자</td>
				<td><%= b.getBoardWriter() %></td>
				<td>작성일</td>
				<td><%= b.getCreateDate() %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3">
					<p style="height : 400px;">
						<%= b.getBoardContent() %>
					</p>
				</td>
			</tr>
		</table>
	
	</div>
</body>
</html>