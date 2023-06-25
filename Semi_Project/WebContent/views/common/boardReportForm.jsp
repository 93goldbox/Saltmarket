<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.saltmarket.common.model.vo.*"%>
<%
	int boardNo = (int)request.getAttribute("boardNo");
	String type = (String)request.getAttribute("type");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 온라인 방식 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- 외부방식 board.css -->
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/css/shareboard.css">

<!-- 폰트어썸 아이콘 적용 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
/* 파일선택버튼 기본색상 메인테마색으로 강제 변경 */
.filebtn::-webkit-file-upload-button {
	background-color: #BFE9F9 !important;
	color: black !important;
	border: none !important;
	border-radius: 5px; /* 테두리 둥글게 */
	cursor: pointer; /* 커서 타입 변경 */
}
/* 파일선택버튼 위에 호버시 배경색 좀 더 진하게 강제 변경 */
.filebtn::-webkit-file-upload-button:hover {
	background-color: #6ad4fd !important;
}
/* 파일추가유도 버튼 css */
#addbtn:hover {
	color: #6ad4fd !important;
}
</style>
</head>
<body>

<%@ include file="../common/header.jsp"%>

<div id="outer">

    <!-- header 부분 -->
    <div id="header">

    </div>

    <!-- 왼쪽여백 -->
    <div id="left"></div>

    <!-- 가운데 내용 -->
    <div id="center">

        <div id="centertitle">게시글 신고</div>

		<!-- 게시글 작성 입력받는 부분 -->
        <form action="<%= contextPath %>/report.bo" method="get">
        
        	<%-- 신고 대상의 게시판 종류를 히든으로 전달 --%>
        	<input type="hidden" name="type" value="<%= type %>">
        	<%-- 신고 대상의 게시판 번호를 히든으로 전달 --%>
        	<input type="hidden" name="boardNo" value="<%= boardNo %>">
        	<%-- 현재 작성자의 회원번호를 히든으로 전달 --%>
        	<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
        	
            <div id="enrollhead">
                <input type="text" name="title" size="" placeholder="제목을 입력하세요" required>
            </div>

            <textarea id="mytextarea" name="content" placeholder="내용을 입력하세요"></textarea>
            

			<div id="form-submit">
				<button type="button" class="btn btn-outline-danger btn-sm" id="goBackButton">뒤로가기</button>
                <button type="submit" class="btn btn-outline-success btn-sm">작성하기</button>
            </div>
        </form>
        
        <script>
			// 뒤로가기 버튼 기능 작성
			document.querySelector('#goBackButton').addEventListener('click', function() {
			    history.back();
			});
		</script>
        
        <!-- CKEditor 편집기 스크립트 파일 포함 -->
        <script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>

        <!-- CKEditor 편집기 초기화 -->
		<script>
	    ClassicEditor
	        .create( document.querySelector( '#mytextarea' ), {
	            // 제거 하고싶은 플러그인 (배열)
	            removePlugins: [ 'ImageUpload' ],
	        } )
	        .catch( error => {
	            console.error( error );
	        } );
	    </script>

        <br>

        <!-- 오른쪽여백 -->
        <div id="right"></div>

        <!-- footer부분 -->
        <div id="footer"></div>

    </div>


<%@ include file="../common/footer.jsp"%>

</body>
</html>