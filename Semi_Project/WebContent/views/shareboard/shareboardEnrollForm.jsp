<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.saltmarket.common.model.vo.*"%>
<%
    ArrayList<Region> regionList = (ArrayList<Region>)request.getAttribute("regionList");
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

        <div id="centertitle"><a href="<%= contextPath %>/list.sbo?currentPage=1&regionNo=0&status=A" 
            class=".inline">나눔게시판</a>
        </div>

		<!-- 게시글 작성 입력받는 부분 -->
        <form action="<%= contextPath %>/insert.sbo" method="post" enctype="multipart/form-data">
        
        	<%-- 현재 작성자의 회원번호를 히든으로 전달 --%>
        	<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
        	
            <div id="enrollhead">
                <h6>지역 :
						<select name="regionNo">
							<% for(Region r : regionList) { %>
								<option value="<%= r.getRegionNo() %>">
									<%= r.getRegionName() %>
								</option>					
							<% } %>
						</select>
                </h6>
                <input type="text" name="title" size="" placeholder="제목을 입력하세요" required>
            </div>

            <textarea id="mytextarea" name="content" placeholder="내용을 입력하세요"></textarea>
            
            
			<!------------------------ 새로운 이미지 파일 첨부 섹션 ------------------------>
			<button class="btn btn-small filebtn-margin" type="button" onclick="addFileInput()"><u id="addbtn">파일을 추가하려면 클릭하세요</u></button>
			
			<!-- 이미지파일 첨부부분 -->
			<div id="file-inputs"></div>

			<!-- 파일첨부가 되었을 때 이벤트들 정의 -->
			<script>

				let count = 0;

				// 파일추가 클릭시 파일선택 div 만들기
				function addFileInput() {
					count++;
					const div = document.createElement("div");
					div.id = 'file-input' + count;
					// 추가된 파일선택 dic 에서 미리보기img 태그와 위치 조정을 위해 클래스명 추가
					div.classList.add('file-input'); 
					div.innerHTML = 
						'<br><input class="filebtn filebtn-margin" type="file" name="' + 'file' + count + '" id="' + 'file' + count + '" onchange="' + 'loadImg(this, ' + count + ')">' +
						// <input class="filebtn filebtn-margin" type="file" name="file1" id="file1" onchange="loadImg(this, 1)">
						'<button type="button" class="remove-btn" onclick="removeFileInput(' + count + ')">삭제</button>' +
						'<input type="hidden" name="filelastno" value="' + count + '">';
					document.getElementById("file-inputs").appendChild(div);
				}

				// 파일선택 삭제버튼 누르면 파일선택div 제거
				function removeFileInput(count) {
					const elem = document.getElementById('file-input' + count);
					elem.parentNode.removeChild(elem);
				}
				
				function loadImg(inputFile, num) {
					 
					const fileInputDiv = document.getElementById('file-input' + num);
					// 이전에 선택된 파일이 있다면 삭제
					if (fileInputDiv.querySelector('img')) {
						fileInputDiv.removeChild(fileInputDiv.querySelector('img'));
					}

					if(inputFile.files.length == 1) { // 선택된 파일이 있는 경우
					
						// 파일을 읽어들일 FileReader 객체 생성
						let reader = new FileReader();
						// => 우리가 읽어들일 파일은 inputFile.files[0] 에 들어있음
						reader.readAsDataURL(inputFile.files[0]);
						
						// 파일 읽기가 완료되었을 때 실행 처리
						reader.onload = function(e) {

							// 이미지 태그를 생성하고, 미리보기에 추가
							let img = document.createElement('img');
							img.src = e.target.result;
							// 파일 선택된 div 요소에 미리보기 추가
							let fileInputDiv = document.getElementById('file-input' + num);
							// 파일 선택된 div 요소의 첫번째 자식으로 미리보기 추가
							fileInputDiv.insertBefore(img, fileInputDiv.firstChild); 
						}
					} 
				}

			</script>

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