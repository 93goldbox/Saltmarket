<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.saltmarket.freeboard.model.vo.*, com.saltmarket.common.model.vo.*" %>
    <%
		Freeboard fb = (Freeboard)request.getAttribute("fb");
    	ArrayList <ImgFile> imgList = (ArrayList <ImgFile>)request.getAttribute("imgList");
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
    hr {
        margin-top: 5px !important;
        margin-bottom: 5px !important;
    }
/* 댓글 작성버튼 기본색상 메인테마색으로 강제 변경 */
.btn.hoonbtn {
	background-color: #e9f4f8 !important;
	color: black !important;
	border: none !important;
}
/* 댓글 작성버튼 위에 호버시 배경색 좀 더 진하게 강제 변경 */
.btn.hoonbtn:hover {
	background-color: #2dc3ff !important;
}
</style>
</head>
<body>

<%@ include file="../common/header.jsp"%>
	
	
	<%-- 헤더에 출력구문이 있으므로 주석처리함
		if (alertMsg != null) {
			out.println("<script>alert('" + alertMsg + "');</script>");
			session.removeAttribute("alertMsg");
		} 
	--%>    

    <div id="outer">

        <!-- 왼쪽여백 -->
        <div id="left"></div>

        <!-- 가운데 내용 -->
        <div id="center">
            <div id="centertitle"><a href="<%= contextPath %>/list.fbo?currentPage=1&category=전체" 
                class=".inline">자유게시판</a>
                <h5 id="categorytitle" class=".inline"> - <%= fb.getCategory() %></h5>
            </div>

            <div class="black boardtitle" style="font-size: 20px;">
                <div>No.<%= fb.getFreeboardNo() %> : <%= fb.getBoardTitle() %></div>
            </div>

            <div id="board-info">
                <a href="<%= contextPath %>/sellerprofile.pr?pno=1" class="black underline-none"><i class="fas fa-user" style="color: #000000;"></i>
                    <%= fb.getUserName() %>
                </a>
                <i class="far fa-comment-dots" style="color: #000000;"></i>
                	<span id="replycount"><%= fb.getReplyCount() %></span>
                <i class="fas fa-eye" style="color: #000000;"></i>
                	<%= fb.getBoardViews() %>
                <!-- 날짜 표시 부분 -->
                <div id="board-date">
                    <%= fb.getCreatedDate() %>
                </div>
            </div>

            <div id="board-content" style="margin-top: 5px;">
            	<%= fb.getBoardContent() %>
            	
	            <!-- 이미지 첨부파일들 표시되는 부분 -->
	            <% if(imgList.size() > 0) { %>
					<div class="image-list">
					    <% for(int i = 0; i < imgList.size(); i++) { %>
					        <div class="image-item">
					            <img src="<%= contextPath %>/<%= imgList.get(i).getFilePath() + imgList.get(i).getChangeFileName() %>">
					            <br>
					            <a class="black" download="<%= imgList.get(i).getOriginName() %>" 
					                href="<%= contextPath %>/<%= imgList.get(i).getFilePath() + imgList.get(i).getChangeFileName() %>">
					                <%= imgList.get(i).getOriginName() %></a>
					        </div>
					    <% } %>
					</div>
				<% } %>
            </div>
            
            <div id="board-bottom">
                <!-- 좋아요 / 싫어요 부분 -->
                <div id="like-dislike">
                </div>

				<!-- 쉬운버젼 개별 반복가능한 좋아요/싫어요 클릭이벤트 -->
				<script>
					// 좋아요/싫어요 조회 호출
                    $(function() {
                        selectLike();
                    });
					
               	  	// 좋아요/싫어요 조회 요청
                    function selectLike() {
                        $.ajax({
                            url : "lselect.fbo",
                            type : "get",
                            data : { bno : <%= fb.getFreeboardNo() %> },
                            success : function(count) {
                                let result = "";
                                result += "<button id='like' class='clear-button' onclick='updateLike()'>"
                                        + "<i class='far fa-thumbs-up fa-lg' style='color: #000000;'></i>"
                                        + "<span id='like-count'>" + count.likeCount + "</span></button>"
                                        + "<button id='dislike' class='clear-button' onclick='updateDislike()'>"
                                        + "<i class='far fa-thumbs-down fa-lg' style='color: #000000;'></i>"
                                        + "<span id='dislike-count'>" + count.dislikeCount + "</span></button>"
								$("#like-dislike").html(result);
                            },
                            error : function() {
                				console.log("좋아요 조회 ajax 통신 실패!");
                        	}
                   		});
                 	}
                    
               	  	// 좋아요 요청
					function updateLike() {
						<% if(loginUser != null) { %>
							$.ajax({
							    url: "lupdate.fbo",
							    type: "POST",
							    data: {
							        bno: <%= fb.getFreeboardNo() %>,
							        type: "like"
							    },
							    success: function(result) {
							    	if(result > 0) {
							    		selectLike()
							    	} else {
							    		alert("좋아요 추가에 실패했습니다.");
							    	}
							    },
							    error: function(xhr, status, error) {
							        alert('서버와 통신 중 오류가 발생했습니다.');
							    }
							});
						<% } else { %>
							// 사용자가 로그인하지 않은 경우
							alert("로그인 후에 이용해주세요.");
						<% } %>
					}
               	  	
					// 싫어요 요청
					function updateDislike() {
						<% if(loginUser != null) { %>
							$.ajax({
							    url: "lupdate.fbo",
							    type: "POST",
							    data: {
							        bno: <%= fb.getFreeboardNo() %>,
							        type: "dislike"
							    },
							    success: function(result) {
							    	if(result > 0) {
							    		selectLike()
							    	} else {
							    		alert("싫어요 추가에 실패했습니다.");
							    	}
							    },
							    error: function(xhr, status, error) {
							        alert('서버와 통신 중 오류가 발생했습니다.');
							    }
							});
						<% } else { %>
							// 사용자가 로그인하지 않은 경우
							alert("로그인 후에 이용해주세요.");
						<% } %>
					}
				</script>


                <!-- 
	                고급버전 좋아요/싫어요 클릭이벤트
	                => 로그인한 사용자별 둘중에 한개를 한번만 클릭할 수 있는 버전은 나중에 연구!!!!
	            -->
                <%--
                <script>
                    $(document).ready(function () {
                        var liked = false;
                        var disliked = false;
                        var likeButton = $('#like');
                        var dislikeButton = $('#dislike');
                        var likeIcon = likeButton.find('i');
                        var dislikeIcon = dislikeButton.find('i');
                        var likeCount = likeButton.find('#like-count');
                        var dislikeCount = dislikeButton.find('#dislike-count');

                        likeButton.on('click', function () {
                            <% if(loginUser != null) { %>
                                if (liked) {
                                    // 좋아요 취소
                                    likeIcon.removeClass('fas').addClass('far');
                                    likeCount.text(parseInt(likeCount.text()) - 1);
                                    liked = false;
                                } else {
                                    // 좋아요
                                    likeIcon.removeClass('far').addClass('fas');
                                    likeCount.text(parseInt(likeCount.text()) + 1);
                                    liked = true;
                                    
                                    if (disliked) {
                                        dislikeIcon.removeClass('fas').addClass('far');
                                        dislikeCount.text(parseInt(dislikeCount.text()) - 1);
                                        disliked = false;
                                    }
                                }
                            <% } else { %>
                                // 사용자가 로그인하지 않은 경우
                                alert("로그인 후에 이용해주세요.");
                            <% } %>
                        });

                        dislikeButton.on('click', function () {
                        	<% if(loginUser != null) { %>
                                if (disliked) {
                                    dislikeIcon.removeClass('fas').addClass('far');
                                    dislikeCount.text(parseInt(dislikeCount.text()) - 1);
                                    disliked = false;
                                } else {
                                    dislikeIcon.removeClass('far').addClass('fas');
                                    dislikeCount.text(parseInt(dislikeCount.text()) + 1);
                                    disliked = true;
                                    if (liked) {
                                        likeIcon.removeClass('fas').addClass('far');
                                        likeCount.text(parseInt(likeCount.text()) - 1);
                                        liked = false;
                                    }
                                }
							<% } else { %>
                                // 사용자가 로그인하지 않은 경우
                                alert("로그인 후에 이용해주세요.");
							<% } %>
                        });
                    });
                </script>
                 --%>

                <div id="update-delete">
                    <% if(loginUser != null) { %>
                	<button type="button" class="btn btn-danger btn-sm" style="text-align: center; margin-right:10px;" 
                		onclick="location.href='<%= contextPath %>/reportForm.bo?bno=<%= fb.getFreeboardNo() %>&type=free'">신고</button>
                	<% } %>
                    <a href="javascript:history.back()" class="btn btn-secondary btn-sm" style="text-align: center;">목록가기</a>

					<%-- 작성자와 관리자만 수정/삭제 보이게 --%>
                    <% if(
                    		(loginUser != null) && (
                    				loginUser.getUserNo() == fb.getUserNo() ||
             						loginUser.getUserNo() == 1 ||
                    				loginUser.getUserNo() == 2)
                    		) { %>
	                    <button type="button" class="btn-margin btn btn-outline-primary btn-sm"
	                        onclick="location.href ='<%= contextPath %>/updateForm.fbo?bno=<%= fb.getFreeboardNo() %>'">수정</button>
						<button type="button" class="btn btn-outline-danger btn-sm"
						        onclick="showConfirmationModal(<%= fb.getFreeboardNo() %>)">삭제</button>
					<% } %>

						<!-- 삭제 확인 모달 -->
						<div class="modal fade" id="deleteFormModal" tabindex="-1" role="dialog" aria-labelledby="deleteFormModalLabel"
						     aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="deleteFormModalLabel">게시글 삭제 확인</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        정말로 이 글을 삭제하시겠습니까?
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						        <button type="button" class="btn btn-danger" onclick="deleteForm()">삭제</button>
						      </div>
						    </div>
						  </div>
						</div>
						
						<script>
						// 모달창 스크립트 구문
						$('#deleteFormModal .close, #deleteFormModal .btn-secondary').click(function () {
							  $('#deleteFormModal').modal('hide');
							});
						
						function showConfirmationModal(freeboardNo) {
							  $('#deleteFormModal').data('freeboardNo', freeboardNo);
							  $('#deleteFormModal').modal('show');
						  }
						
						  function deleteForm() {
							  var freeboardNo = $('#deleteFormModal').data('freeboardNo');
							  if (!freeboardNo) {
							    alert('삭제할 글을 찾을 수 없습니다.');
							    return;
							  }
							  location.href = '<%= contextPath %>/delete.fbo?bno=' + freeboardNo;
							  $('#deleteFormModal').modal('hide');
						  }
						</script>
                    	
                    
                </div>
            </div>


            <!-- 댓글 입력 폼 -->
			<div style="display: flex; align-items: center; background-color: #BFE9F9; padding: 15px;">
				<label id="comment-title" for="comment">댓글:</label>
				
				<% if(loginUser != null) { %>
					<textarea id="comment" name="comment" rows="3" cols="50" style="resize: none; margin-right: 5px; white-space: pre-wrap;"
						required></textarea>
                        <!--
                            textarea에 white-space: pre-wrap; 속성을 주고
                            $(".comments").html(result.replace(/\n/g, "<br>")); 라고 출력해주면
                            개행이 잘 반영됨
                        -->
					
					<button class="btn btn-sm hoonbtn" type="button" onclick="insertReply();">작성</button>
				<% } else { %>
					<textarea id="comment" name="comment" rows="3" cols="50" style="resize: none; margin-right: 5px;"
						readonly>로그인 후 이용 가능한 서비스입니다.</textarea>
				
					<button class="btn btn-sm hoonbtn" type="button" disabled>작성</button>
				<% } %>
			</div>
			
			<br>

			<!-- 댓글 목록 조회될 부분 -->
			<div class="comments"></div>

			<script>
			
	        	$(function() {
	        		selectReplyList();
	        	});
	        	
	        	// 댓글 조회 요청용 함수
            	function selectReplyList() {
            		$.ajax({
            			url : "rlist.fbo",
            			type : "get",
            			data : { bno : <%= fb.getFreeboardNo() %> },
            			success : function(list) {
            				
            				// 댓글 crud 시 => 게시글 상세페이지 본문 댓글 수 비동기식으로 변경
            				$("#replycount").html(list.length);
            				
            				let result = "";
            				
            				for(let i in list) {
            					
            					result += "<div class='comment'>"
            								+ "<div class='comment-info'>"
            								+ "<i class='fas fa-user' style='color: #000000;'></i>"
            								+ "<a href='<%= contextPath %>/sellerprofile.pr?pno=1' class='black underline-none'><span class='comment-author'>" + list[i].userName + "</span></a>"
            								+ "<span class='comment-date'>" + list[i].createdDate + "</span>";
            								
								// 수정 및 삭제 버튼 추가
								<% if(loginUser != null) { %>
									if(<%= loginUser.getUserNo() %> == list[i].userNo || <%= loginUser.getUserNo() %> == 1 || <%= loginUser.getUserNo() %> == 2) {
									result += "<div class='comment-btns'>"
												+ "<a class='black' onclick='updateReply(" + list[i].replyNo + ")'>수정</a>"
												+ "<a class='black' onclick='deleteReply(" + list[i].replyNo + ")'>삭제</a>"
												+ "</div></div>";
									// 수정 폼 추가
									result += "<div id='updateForm" + list[i].replyNo + "' class='update-form' style='display:none;'>"
                                                + "<table>"
												+ "<tr><td><textarea id='updateContent" + list[i].replyNo + "'style='white-space: pre-wrap;'>" 
                                                + list[i].replyContent
                                                + "</textarea></td>"
												+ "<td><button class='btn btn-sm hoonbtn' onclick='submitUpdate(" + list[i].replyNo + ")'>수정</button></td></tr>"
												+ "</table></div>";
									} else {
										 result += "</div>";
									}
                                <% } else { %>
                                    result += "</div>";
                                <% } %>
            					result += "<p class='comment-content'>" + list[i].replyContent + "</p></div>";
            				}
            				$(".comments").html(result.replace(/\n/g, "<br>"));
            			},
            			error : function() {
            				console.log("댓글리스트 조회용 ajax 통신 실패!");
            			}
            		});
            	}
	        	
            	// 수정 버튼 클릭시 텍스트 박스와 수정 버튼 표시
            	function updateReply(replyNo) {
            	    $('#updateForm' + replyNo).css('display', 'block');
                    // <br> 태그를 줄바꿈 문자(\n)로 변환하여 보여주기
                    let content = $("#updateContent" + replyNo).val().replace(/<br>/gi, "\n");
                    $("#updateContent" + replyNo).val(content);
                }

	        	// 댓글 작성 요청
	        	function insertReply() {
	        		if ($("#comment").val() === "") {
	        		    alert("내용을 입력해주세요.");
	        		    return false;
	        		}
	        		$.ajax({
	        			url : "rinsert.fbo",
	        			type : "post",
	        			data : {
	        				content: $("#comment").val(),
	        				bno : <%= fb.getFreeboardNo() %>
	        			},
	        			success : function(result) {
	        				
	        				if(result > 0) { // 댓글 작성 성공
	        					
	        					// 갱신된 댓글 리스트 조회
	        					selectReplyList();
	        				
	        					// 댓글작성용 textarea 초기화
	        					$("#comment").val("");
	        				}
	        			},
	        			error : function() {
	        				console.log("댓글 작성용 ajax 통신 실패!");
	        			}
	        		});
	        	}

                // 댓글 수정 요청
                function submitUpdate(replyNo) {
                    let content = $('#updateContent' + replyNo).val();
                    if (content.trim() === "") { // 내용이 없는 경우
                        alert("내용을 입력해주세요.");
                    } else { // 내용이 있는 경우
	                    $.ajax({
	                        url : "rupdate.fbo",
	                        type : "post",
	                        data : {
	                            rno : replyNo,
	                            rcontent : content
	                        },
	                        success : function() {
	                            alert("댓글이 수정되었습니다.");
	                            selectReplyList();
	                        },
	                        error : function() {
	                            console.log("댓글 수정 ajax 통신 실패!");
	                        }
	                    });
                    }
                }

                // 댓글 삭제 요청
                function deleteReply(replyNo) {
                    if(confirm("정말 삭제하시겠습니까?")) {
                        $.ajax({
                            url: "rdelete.fbo",
                            type: "post",
                            data: { rno: replyNo },
                            success: function(result) {
    	        				if(result > 0) { // 댓글 삭제 성공
    	        					alert("댓글이 삭제되었습니다.");
    	        					// 갱신된 댓글 리스트 조회
    	        					selectReplyList();
                                } else {
                                    console.log("댓글 삭제 실패");
                                }
                            },
                            error: function() {
                                console.log("댓글 삭제용 ajax 통신 실패");
                            }
                        });
                    }
                }
			</script>

        </div>
        <!-- 가운데 영역 끝 -->
        
        
            <!-- 오른쪽여백 -->
            <div id="right"></div>


<%@ include file="../common/footer.jsp"%>

	
</body>
</html>