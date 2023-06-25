<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.saltmarket.common.model.vo.Region, com.saltmarket.common.model.vo.Grade" %>
<%
	// 지역, 등급 리스트 뽑기
	ArrayList<Region> regionList = (ArrayList<Region>)request.getAttribute("regionList");
	ArrayList<Grade> gradeList = (ArrayList<Grade>)request.getAttribute("gradeList");
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

    #enroll-form {
        width: 800px;
        margin: auto;
        padding-left: 70px;
    }

</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>

	<br><br>
    <h2 align="center">회원 가입</h2>
	<br>
	<form id="enroll-form" action="<%= contextPath %>/insert.me" method="post">
	    <div class="form-group" id="divId">
	        <label for="inputId" class="col-lg-2 control-label">* 아이디</label>
	        <div class="col-lg-10">
				<table>
					<tr>
						<td style="width: 600px;">
							<input type="text"  class="form-control onlyAlphabetAndNumber" id="userId" name="userId" data-rule-required="true" placeholder="영문자, 숫자를 포함 총 4~12자로 입력(첫글자는 영문자로)" maxlength="16" required>
						</td>
						<td style="width: 100px;">
							<input type="button" onclick="idCheck();" class="btn" value="중복 확인" style="width:100%">
						</td>
					</tr>
				</table>
	        </div>
	    </div>
	    <div class="form-group" id="divPassword">
	        <label for="inputPassword" class="col-lg-2 control-label">* 비밀번호</label>
	        <div class="col-lg-10">
	            <input type="password" class="form-control" name="userPwd" id="userPwd" data-rule-required="true" placeholder="영문자(대소문자), 숫자, 특수문자(!@#$%^)로 총 8~15자로 입력" maxlength="16" required>
	        </div>
	    </div>
	    <div class="form-group" id="divPasswordCheck">
	        <label for="inputPasswordCheck" class="col-lg-2 control-label">* 비밀번호 확인</label>
	        <div class="col-lg-10">
	            <input type="password" class="form-control" id="checkPwd" data-rule-required="true" placeholder="비밀번호 확인" maxlength="16" required>
	        </div>
	    </div>
	    <div class="form-group" id="divName">
	        <label for="inputName" class="col-lg-2 control-label">* 닉네임</label>
	        <div class="col-lg-10">
	            <input type="text" class="form-control onlyHangul" id="userName" name="userName" data-rule-required="true" placeholder="한글만 입력 가능" maxlength="15" required>
	        </div>
	    </div>
   	    <div class="form-group" id="divPhoneNumber">
	        <label for="inputPhone" class="col-lg-2 control-label">전화번호</label>
	        <div class="col-lg-10">
	            <input type="tel" class="form-control onlyNumber" name="phone" data-rule-required="true" placeholder="- 제외" maxlength="11">
	        </div>
	    </div>
	    <div class="form-group" id="divEmail">
	        <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
	        <div class="col-lg-10">
	            <input type="email" class="form-control" id="email" name="email" data-rule-required="true" placeholder="이메일 주소" maxlength="40">
	        </div>
	    </div>
	    <div class="form-group" id="divRegion">
	        <label for="inputRegion" class="col-lg-2 control-label">주소</label><br>
	        <select class="col-lg-10 form-control" name="regionNo" data-rule-required="true" maxlength="100" required>
				<option value="" selected disabled>=== 선택 ===</option>
				<% for(Region r : regionList) { %>
					<option value="<%= r.getRegionNo() %>"><%= r.getRegionName() %></option>
				<% } %>
	        </select>
	        <input type="hidden" name="address" value="">
	        <script>
	        	$(function() {
	        		$("#divRegion select[name=regionNo]").change(function() {
	        			// select 후손요소중에 ~~~한 놈을 찾겠다  innerText속성값을 가지고오겠다.
	        			let regionName = $(this).find(":selected").text(); // input type="hidden" 에 들어갈 값 (현재 선택된 동네명)
	        			
	        			$("#divRegion input[name=address]").val(regionName);
	        		});
	        	});
	        </script>
	    </div>
	    <br>
	    <div class="form-group">
	        <div class="col-lg-offset-2 col-lg-10" align="center">
	            <button type="submit" onclick="return validate();" class="btn btn-secondary">회원 가입</button>
	            <button type="reset" class="btn btn-secondary">취소</button>
	        </div>
	    </div>
	</form>
	
	<script>
		// 아이디 중복확인 버튼 클릭 시 실행
		function idCheck() {
			// 아이디 input 요소 객체를 변수에 담기
			let $userId = $("#enroll-form input[name=userId]");

			// ajax 요청 보내기
			$.ajax({
				url : "idCheck.me",
				type : "get",
				data : { checkId : $userId.val() },
				success : function(result) {
					if(result == "NNNNN") { // 사용 불가
						
						alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
						$userId.focus(); // 재입력 유도
						
					} else { // 사용 가능
						
						let answer = confirm("사용 가능한 아이디입니다. 사용하시겠습니까?");
						if(answer) { // 아이디 사용
							
							$("#enroll-form button[type=submit]").removeAttr("disabled"); // 회원가입 버튼 활성화
							$userId.attr("readonly", true); // 아이디값을 수정 못하게 설정
							
						} else { // 아이디 사용 안함
							
							$userId.focus(); // 재입력 유도
						}
					}
				},
				error : function() {
					console.log("아이디 중복체크용 ajax 통신 실패!");
				}
			});
		}
	</script>
	
	<script>
		// 유효성 검사 - 회원 가입 버튼 클릭 시 실행
		function validate() {
			// 검사 대상 : 아이디, 비밀번호, 비밀번호 확인, 이름
			let userId = document.getElementById("userId");
			let userPwd = document.getElementById("userPwd");
			let checkPwd = document.getElementById("checkPwd");
			let userName = document.getElementById("userName");

			// 아이디 검사
			// 첫글자는 반드시 영문자로, 그리고 영문자, 숫자를 포함하여 총 4~12자로 입력하시오.
			let regExp = /^[a-z][a-z\d]{3,11}$/;
			if(!regExp.test(userId.value)) { // 유효하지 않을 경우
				alert("유효한 아이디를 입력해주세요.");
				userId.select(); // 재입력 유도
				return false;
			}

			// 비밀번호 검사
			// 영문자(대소문자), 숫자, 특수문자(!@#$%^)로 총 8~15자로 입력하시오.
			regExp = /^[a-z\d!@#$%^]{8,15}$/i;
			if(!regExp.test(userPwd.value)) { // 유효하지 않을 경우
				alert("유효한 비밀번호를 입력해주세요.");
				userPwd.value = ""; // 초기화 효과
				userPwd.focus(); // 재입력 유도
				return false;
			}

			// 비밀번호 확인
			if(userPwd.value != checkPwd.value) { // 유효하지 않을 경우
				alert("동일한 비밀번호를 입력해주세요.");
				checkPwd.value = "";
				checkPwd.focue();
				return false;
			}

			// 이름 검사
			// 한글로만 이루어져야 하며 2글자 이상으로 입력하시오.
			regExp = /^[가-힣]{2,}$/;
			if(!regExp.test(userName.value)) { // 유효하지 않을 경우
				alert("유효한 이름을 입력해주세요.");
				userName.select();
				return false;
			}
			return true;
		}
	</script>
        
	<%@ include file="../common/footer.jsp" %>
        
</body>
</html>




