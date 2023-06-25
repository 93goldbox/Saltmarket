<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.saltmarket.common.model.vo.*" %>
<%
	ProfileImg pImg = (ProfileImg)request.getAttribute("pImg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 변경</title>
<style>
        .btn {
        background-color: #BFE9F9 !important;
        color: black !important;
        border: none !important;
    }
</style>
</head>
<body>

    <%@ include file="../common/header.jsp" %>

    <div class="updateProfileForm">
        <br>
        <h3 class="title" align="center">프로필 변경</h3>
        <div class="body" align="center">
            <form action="<%= contextPath %>/updateProfile.me" method="post" enctype="multipart/form-data">
                <label for="inputUserName" class="col-lg-2 control-label">닉네임</label>
                <div class="col-lg-2">
                    <input type="hidden" class="form-control" name="userNo" value="<%= loginUser.getUserNo() %>" required>
                    <input type="text" class="form-control" name="userName" value="<%= loginUser.getUserName() %>" required>
                </div>
                <br>
                <label for="inputProfileImg" class="col-lg-2 control-label">프로필 사진</label>
                <div class="col-lg-8">
                    <% if(pImg != null) { %>
						<img id="profileImg" width="200" height="200" src="<%= contextPath %>/<%= pImg.getFilePath() + pImg.getChangeName() %>"><br>
						<!-- 기존 게시글에 첨부파일이 있다면 원본명을 보여주기 -->
						<%= pImg.getOriginName() %>
						
						<!--
							기존 게시글에 딸린 원래 첨부파일의 파일번호 (PK), 수정명을 hidden 으로 같이 넘기기
							=> 파일번호 : ATTACHMENT UPDATE 를 위해서 넘길 것
							=> 수정명 : 파일도 수정된 경우 기존의 파일은 삭제하기 위해 넘길 것
						-->
                        <input type="hidden" name="originFileNo" value="<%= pImg.getFileNo() %>">
                        <input type="hidden" name="originFileName" value="<%= pImg.getChangeName() %>">
                        
                    <% } %>
                </div>
                <br>
                <div id="file-area" class="col-lg-8">
                    <!-- input[type=file id=file$ name=file$]*4 -->
                    <input type="file" id="upfile" name="upfile" onchange="loadImg(this);"> <!-- 대표이미지(썸네일) 필수 -->
                    <!--
                        change 이벤트 : input 태그의 내용물이 변경될 때 발생하는 이벤트
                        => onchange 이벤트속성명 인라인 이벤트 모델로 이벤트 걸기
                        change 이벤트가 발생할 때마다 선언적 함수인 loadImg 라는 함수를 호출할 것
                        (매번 인자값으로 현재 이벤트가 발생한 타겟요소(this), 이미지의 위치값을 넘길 것)
                    -->
                </div>
                <br>
                <button type="submit" class="btn btn-secondary">완료</button>
            </form>
        </div>
    </div>

    <%@ include file="../common/footer.jsp" %>

</body>
</html>