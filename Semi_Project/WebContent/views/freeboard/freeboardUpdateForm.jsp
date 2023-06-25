<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.saltmarket.freeboard.model.vo.*, com.saltmarket.common.model.vo.*" %>
<%
	// 게시글 정보, 이미지파일들 정보 뽑기
	Freeboard fb = (Freeboard)request.getAttribute("fb");
	ArrayList<ImgFile> imgList = (ArrayList<ImgFile>)request.getAttribute("imgList");

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
	href="<%= request.getContextPath() %>/resources/css/freeboard.css">

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
    <!-- 왼쪽여백 -->
    <div id="left"></div>

    <!-- 가운데 내용 -->
    <div id="center">

        <div id="centertitle"><a href="<%= contextPath %>/list.fbo?currentPage=1&category=전체" 
            class=".inline">자유게시판</a>
        </div>

		<!-- 게시글 수정하기 입력받는 부분 -->
        <form action="<%= contextPath %>/update.fbo" method="post" enctype="multipart/form-data">
        
        	<!-- 게시글 번호를 hidden 으로 넘기기 -->
			<input type="hidden" name="bno" value="<%= fb.getFreeboardNo() %>">

        	<!-- 카테고리 선택부분 -->
            <div id="enrollhead">
                <h6>카테고리 :
                    <select name="category">
                    	<!-- 카테고리가 기존 카테고리를 자동으로 선택하도록 작성 -->
						<option value="잡담" <%= fb.getCategory().equals("잡담") ? "selected" : "" %>>잡담</option>
						<option value="질문" <%= fb.getCategory().equals("질문") ? "selected" : "" %>>질문</option>
						<option value="정보" <%= fb.getCategory().equals("정보") ? "selected" : "" %>>정보</option>
						<option value="축하" <%= fb.getCategory().equals("축하") ? "selected" : "" %>>축하</option>
						<option value="고민/상담" <%= fb.getCategory().equals("고민/상담") ? "selected" : "" %>>고민/상담</option>
                    </select>
                </h6>
                <!-- 제목 수정부분 -->
                <input type="text" name="title" size="" value="<%= fb.getBoardTitle() %>" placeholder="제목을 입력하세요" required>
            </div>

			<!-- 내용 수정부분 -->
            <textarea id="mytextarea" name="content" placeholder="내용을 입력하세요" required><%= fb.getBoardContent() %></textarea>
			
            
			<!------------------------ 기존 이미지 파일 로드되는 섹션(삭제기능가능) ------------------------>
			<div id="originfile-inputs">
			
				<div class="origin image-list">
					<!-- 업데이트 처리를 위해 기존 이미지리스트의 개수를 서버로 전송 -->
					<input type="hidden" name="originfilelastno" value="<%= imgList.size() %>">
					<% for(int i = 0; i < imgList.size(); i++) { %>
						<div class="image-item" data-file-no="<%= imgList.get(i).getFileNo() %>">
							<img src="<%= contextPath %>/<%= imgList.get(i).getFilePath() + imgList.get(i).getChangeFileName() %>">
							<br>
							<p>
							<%= imgList.get(i).getOriginName() %>
							<!-- 삭제기능구현을 위한 삭제버튼 추가 -->
							<button type="button" class="btn btn-sm btn-outline-danger" 
								onclick="deleteImage(<%= imgList.get(i).getFileNo() %>, '<%= imgList.get(i).getChangeFileName() %>')">삭제</button>
							</p>
						</div>
					<% } %>
				</div>
			</div>
			<script>
					// 파일번호를 넘기기위한 name값의 순번을 담을 변수 셋팅
					let origincount = 0;

					function deleteImage(fileNo, fileName) {
						
						// 0출발 1부여하기 위해 => name값의 순번 증가
						origincount++;

						// 삭제할 이미지가 포함된 div 요소를 찾아 제거
						const imageItem = document.querySelector('.image-item[data-file-no="' + fileNo + '"]');
						if (imageItem) {
							imageItem.parentElement.removeChild(imageItem);
						}

						// 삭제할 파일번호를 넘기기 위해 동적으로 hidden input 요소 생성
						const hiddenInputFileNo = document.createElement('input');
						hiddenInputFileNo.type = 'hidden';
						hiddenInputFileNo.name = 'deletefileno' + origincount;
						hiddenInputFileNo.value = fileNo;

						// 삭제할 파일이름을 넘기기 위해 동적으로 hidden input 요소 생성
						const hiddenInputFileName = document.createElement('input');
						hiddenInputFileName.type = 'hidden';
						hiddenInputFileName.name = 'deletefilename' + origincount;
						hiddenInputFileName.value = fileName;

						// 생성한 hidden input 요소를 origin file-inputs 영역에 추가
						const originFileInputs = document.getElementById('originfile-inputs');
						originFileInputs.appendChild(hiddenInputFileNo);
						originFileInputs.appendChild(hiddenInputFileName);

					}
			</script>

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
                <button type="submit" class="btn btn-outline-success btn-sm">수정하기</button>
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
</div>


<%@ include file="../common/footer.jsp"%>

</body>
</html>












