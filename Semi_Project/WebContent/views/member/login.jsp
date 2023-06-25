<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>

    <!-- Bootstrap -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
	<script src="http://code.jquery.com/jquery.js"></script>
	<!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> <!-- 온라인 방식 -->
	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>

    body { font-family: 'Gowun Dodum', sans-serif; }

    #login_area, #user-info {
        width: 200px;
        text-align: center;
        margin: auto;
    }

    #user-info, .form-group a {
        text-decoration: none;
        color: black;
    }

    .btn {
        background-color: #BFE9F9 !important;
        color: black !important;
        border: none !important;
    }

    .form-group input { margin: 5px; }

    .searchPwd, .searchId {
        border: none;
        background-color: rgba(0,0,0,0) !important;
    }

</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
    <br><br>
    <div id="login_area">
    
    	<% if(loginUser == null) { %>
	        <!-- 로그인 하기 전에 보여지는 로그인 form -->
	        <form id="login-form" action="<%= contextPath %>/login.me" method="post">
	            <div class="form-group">
	                <input type="text" name="userId" class="form-control" placeholder="아이디" required>
	            </div>
	            <div class="form-group">
	                <input type="password" name="userPwd" class="form-control" placeholder="비밀번호" required>
	            </div>
	            <br>
	            <div class="form-group">
	                <button type="button" class="btn searchId" data-toggle="modal" data-target="#searchIdForm">아이디 찾기/</button>
                    <button type="button" class="btn searchPwd" data-toggle="modal" data-target="#searchPwdForm">비밀번호 찾기</button><br>
	                <a href="<%= contextPath %>/enrollForm.me">회원가입</a>
	            </div>
	            <br>
	            <button type="submit" class="btn btn-secondary">로그인</button>
	        </form>
        <% } %>
        
    </div>

    <script>
        $(function(){
            $(".searchPwd").click(function(){
                $("#searchPwdForm").modal("show");
            });
        });

        $(function(){
            $(".searchId").click(function(){
                $("#searchIdForm").modal("show");
            });
        });
        
        $(function(){
        	$(".close").click(function(){
        		$("#searchPwdForm").modal("hide");
        		$("#searchIdForm").modal("hide");
        	});
        });

    </script>

    <!-- 비밀번호 찾기 모달창 (부트스트랩) -->
    <!-- The Modal -->
    <div class="modal" id="searchPwdForm">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">비밀번호 찾기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="searchPwd" align="center">
                    <div class="form-group">
                        <label for="userId" class="col-lg-2 control-label">아이디</label>
						<div class="col-lg-8">
							<input type="text" class="form-control" id="userId" name="userId" required>
						</div>
                    </div>
					<div class="form-group" id="divEmail">
					    <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
					    <div class="col-lg-8">
					        <input type="email" class="form-control" id="email" name="email" maxlength="40">
					    </div>
					</div>
                    <div id="searchPwd"><b></b></div>
                    <br>
                    <button type="button" class="btn btn-block" onclick="return searchPwd();">찾기</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 아이디 찾기 모달창 (부트스트랩) -->
	<!-- The Modal -->
    <div class="modal" id="searchIdForm">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">아이디 찾기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="searchId" align="center">
					<div class="form-group">
						<label for="inputUserName" class="col-lg-2 control-label">닉네임</label>
						<div class="col-lg-8">
							<input type="text" class="form-control" id="userName" name="userName" required>
						</div>
					</div>
					<div class="form-group" id="divEmail">
					    <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
					    <div class="col-lg-8">
					        <input type="email" class="form-control" name="email" maxlength="40">
					    </div>
					</div>
                    <div id="searchId"><b></b></div>
                    <br>

                    <button type="button" class="btn btn-block" onclick="searchId();">찾기</button>
                </div>
            </div>
        </div>
    </div>

	<script>
        // 아이디, 이메일 일치 여부를 검사
        function searchPwd() {
            
            let userId = document.getElementById("userId").value;
            let email = document.getElementById("email").value;

            if(userId != "" && email != "") { // 둘다 입력한경우
                // searchPwd.me 로 ajax 요청 보내기
                $.ajax({
                    url : "searchPwd.me", // 1. 서블릿 만들기 => 2. userId, email 뽑아내기 => 3. 아이디와 이메일이 모두 일치하면 비밀번호만 조회해오기 SELECT USERPWD FROM MEMBER WHERE ~~~~~
                    type : "post",
                    data : {userId : userId, email : email},
                    success : function(result) { // 조회된 비밀번호 받아오기 => 모달창 안에서 그냥 출력
	
                        if(result == null) { // 잘못된 정보입니다. 이런식으로 처리
                        	
                        	$("#searchPwd b").text("잘못된 정보를 입력했습니다.");
                        
                    	} else { // 비밀번호 모달창에 띄우기
                    		
                    		$("#searchPwd b").text("비밀번호는 "+ result +"입니다.");
                    	}
                    },
                    error : function() {
                        console.log("비밀번호 찾기용 ajax 통신 실패!");
                    }
                });
            } else {
                alert("아이디와 이메일을 모두 입력해주세요.");
            }
        }

        // 닉네임, 이메일 일치 여부를 검사
        function searchId() {
            
            let userName = $("#searchIdForm input[name=userName]").val();
            let email = $("#searchIdForm input[name=email]").val();

            if(userName != "" && email != "") { // 둘다 입력한경우
                // searchId.me 로 ajax 요청 보내기
                $.ajax({
                    url : "searchId.me",
                    type : "post",
                    data : {userName : userName, email : email},
                    success : function(result) { // 조회된 아이디 받아오기 => 모달창 안에서 그냥 출력
	
                    	if(result == null) { // 잘못된 정보입니다. 이런식으로 처리
                        	
                        	$("#searchId b").text("잘못된 정보를 입력했습니다.");
                        
                    	} else { // 비밀번호 모달창에 띄우기
                    		
                    		$("#searchId b").text("아이디는 "+ result +"입니다.");
                    	}
                    },
                    error : function() {
                        console.log("아이디 찾기용 ajax 통신 실패!");
                    }
                });
            } else {
                alert("닉네임과 이메일을 모두 입력해주세요.");
            }
        }
        
    </script>

    <%@ include file="../common/footer.jsp" %>
    
</body>
</html>