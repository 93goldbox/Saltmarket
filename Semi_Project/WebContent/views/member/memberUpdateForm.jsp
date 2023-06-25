<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.saltmarket.common.model.vo.Region" %>
<%
	// 지역, 등급 리스트 뽑기
	ArrayList<Region> regionList = (ArrayList<Region>)request.getAttribute("regionList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입</title>

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
    body {
    padding: 2em;
    font-family: 'Gowun Dodum', sans-serif;
    }

    .submit-btn input{
    float: right;
    }

    .btn {
        background-color: #BFE9F9 !important;
        color: black !important;
        border: none !important;
    }

    #divRegion select {
		width: 650px;
        margin-left : 13px;
        display: inline-block;
    }

    #update-form {
        width: 800px;
        margin: auto;
        padding-left: 70px;
    }

</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<%
		// 회원정보 조회를 위한 데이터들
		String userId = loginUser.getUserId();
		String userName = loginUser.getUserName();
		String phone = (loginUser.getPhone() == null)? "" : loginUser.getPhone();
		String email = (loginUser.getEmail() == null)? "" : loginUser.getEmail();
		String address = loginUser.getAddress();
		int regionNo = loginUser.getRegionNo();
	%>

	<br><br>
    <h2 align="center">회원 정보 변경</h2>
	<br>
	<form id="update-form" action="<%= contextPath %>/update.me" method="post">
	    <div class="form-group" id="divId">
	        <label for="inputId" class="col-lg-2 control-label">* 아이디</label>
	        <div class="col-lg-10">
				<input type="text" value="<%= userId %>" class="form-control onlyAlphabetAndNumber" name="userId" data-rule-required="true" placeholder="아이디" maxlength="16" required readonly>
	        </div>
	    </div>
	    <div class="form-group" id="divName">
	        <label for="inputName" class="col-lg-2 control-label">* 닉네임</label>
	        <div class="col-lg-10">
	            <input type="text" value="<%= userName %>" class="form-control onlyHangul" name="userName" data-rule-required="true" placeholder="한글만 입력 가능" maxlength="15" required>
	        </div>
	    </div>
   	    <div class="form-group" id="divPhone">
	        <label for="inputPhone" class="col-lg-2 control-label">전화번호</label>
	        <div class="col-lg-10">
	            <input type="tel" value="<%= phone %>" class="form-control onlyNumber" name="phone" data-rule-required="true" placeholder="- 제외" maxlength="11">
	        </div>
	    </div>
	    <div class="form-group" id="divEmail">
	        <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
	        <div class="col-lg-10">
	            <input type="email" value="<%= email %>" class="form-control" name="email" data-rule-required="true" placeholder="이메일 주소" maxlength="40">
	        </div>
	    </div>
	    <div class="form-group" id="divRegion">
	        <label for="inputRegion" class="col-lg-2 control-label">* 지역</label><br>
	        <select class="col-lg-10 form-control" name="regionNo" data-rule-required="true" maxlength="100" required>
				<option value="" disabled>=== 선택 ===</option>
				<% for(Region r : regionList) { %>
					<option value="<%= r.getRegionNo() %>"><%= r.getRegionName() %></option>
				<% } %>
	        </select>
	    	<input type="hidden" name="address" value="<%= address %>">
	        <script>
	        	$(function() {
	        		
	        		//여기에서 기존 지역정보랑 일치하는 option 을 찾기 (모든 option 태그를 다 선택 후 each메소드로 반복 돌려가며)
	        		$("#divRegion option").each(function() {
	        			if($(this).text() == "<%= address %>") {
	        				$(this).attr("selected", true);
	        			}
	        		});
	        		
	        		$("#divRegion select[name=regionNo]").change(function() {
	        			
	        			// select 후손요소중에 ~~~한 놈을 찾겠다  innerText속성값을 가지고오겠다.
	        			let regionName = $(this).find(":selected").text(); // input type="hidden" 에 들어갈 값 (현재 선택된 동네명)
	        			
	        			// *** html 요소의 id 속성값은 한 html 파일 내에서는 중복 불가!!!!!!
	        			// => 중복되는 순간 아이디선택자로 요소를 선택하면 무조건 첫번째놈만 하나선택되고맘
	        			// 해결하려면 : class 속성활용 (중복이 가능한 속성이니까!!)
	        			
	        			$("#divRegion input[name=address]").val(regionName);
	        		});
	        	});
	        </script>
	    </div>
	    <br>
	    <div class="form-group">
	        <div class="col-lg-offset-2 col-lg-10" align="center">
	            <button type="submit" class="btn btn-secondary">회원 정보 변경</button>
				<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#updatePwdForm">비밀번호 변경</button>
				<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#deleteForm">회원 탈퇴</button>
	        </div>
	    </div>
	</form>

	<!-- 비밀번호 변경용 모달창 (부트스트랩) -->
	<!-- The Modal -->
    <div class="modal" id="updatePwdForm">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">비밀번호 변경</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body" align="center">
                
                    <form action="<%= contextPath %>/updatePwd.me" method="post">
                        <!--
                        	비밀번호 변경 시 고려할 사항
                        	현재 비밀번호, 변경할 비밀번호, 변경할 비밀번호 재입력
                        	
                        	추가적으로 로그인한 회원의 아이디도 같이 넘기기 (hidden)
                        -->
                        <input type="hidden" name="userId" value="<%= userId %>">
						<div class="form-group">
							<label for="inputPassword" class="col-lg-8 control-label">현재 비밀번호</label>
							<div class="col-lg-8">
								<input type="password" class="form-control" name="userPwd" required>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPasswordCheck" class="col-lg-8 control-label">변경할 비밀번호</label>
							<div class="col-lg-8">
								<input type="password" class="form-control" name="updatePwd" required>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPasswordCheck" class="col-lg-8 control-label">변경할 비밀번호 확인</label>
							<div class="col-lg-8">
								<input type="password" class="form-control" name="checkPwd" required>
							</div>
						</div>
                        
                        <br>
                        
                        <button type="submit" class="btn btn-block" onclick="return validatePwd();">비밀번호 변경</button>
                    </form>
                    
                    <script>
                    	// 비밀번호 일치 여부를 검사 (유효성 검사)
                    	function validatePwd() {
                    		
                    		// 일치하지 않는다면 기본이벤트 제거 => false 리턴
                    		if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()) {
                    			
                    			alert("비밀번호가 일치하지 않습니다.");
                    			return false;
                    		}
                    	}
                    </script>
                </div>
            </div>
        </div>
    </div>

	<!-- 회원탈퇴용 모달창 (부트스트랩) -->
	<!-- The Modal -->
    <div class="modal" id="deleteForm">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회원 탈퇴</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body" align="center">
                
                	탈퇴 후 복구가 불가능합니다. <br>
                	정말로 탈퇴하시겠습니까? <br><br>
                	
                	<form action="<%= contextPath %>/delete.me" method="post">
                	
						<div class="form-group">
							<label for="inputPassword" class="col-lg-8 control-label">비밀번호</label>
							<div class="col-lg-8">
								<input type="password" class="form-control" name="userPwd" required>
							</div>
						</div>
                	
                		<br>
                		
                		<button type="submit" class="btn btn-block">회원 탈퇴</button>
                		
                	</form>
                
                </div>
            </div>
        </div>
    </div>
        
	<%@ include file="../common/footer.jsp" %>
        
</body>
</html>




