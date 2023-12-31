<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보내기</title>
<meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>쪽지보내기</title>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- icon css cdn link -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel=“stylesheet” href=“css/bootstrap.min.css”>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css%22%3E">
</head>
<style>
	.outer {
		width : 600px;
		height : 550px;
		margin : auto;
		margin-top : 50px;
	}

	#enroll-form input, #enroll-form textarea {
		width : 100%;
		box-sizing : border-box;
	}
	#enroll-form textarea { resize : none; }
</style>
<body>

    <%@ include file="../common/header.jsp" %>

    <div class="col">
        <div class="outer">
            
          <br>
          <h4 align="center">쪽지 보내기</h4>
          
          <form id="enroll-form" action="" method="post" enctype="multipart/form-data">
           
            <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
      
            <table align="center">
              <tr>
                <th width="50">받는 사람</th>
                <td width="350" height="100">
                  <input type="text" id="message-resever" name="message-resever" required>
                </td>
              </tr>
              <tr>
                <th width="50">제목</th>
                <td width="350" height="100">
                  <input type="text" id="message-title" name="message-title" required>
                </td>
              </tr>
              <tr>
                <th>내용</th>
                <td>
                  <textarea id= "message-content" name="message-content" rows="10" required></textarea>
                </td>
              </tr>
             
            </table>
      
            <br>
      
            <div align="center">
              <button type="submit" class="btn btn-primary">작성하기</button>
              <button type="reset" class="btn btn-primary">취소하기</button>
            </div>
      
          </form>
          
          
        </div>
                  
      </div>

    <%@ include file="../common/footer.jsp" %>


</body>
</html>