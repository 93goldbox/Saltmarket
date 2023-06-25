<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.saltmarket.member.model.vo.Member, com.saltmarket.common.model.vo.PageInfo, com.saltmarket.common.model.vo.SearchInfo, java.util.ArrayList, com.saltmarket.freeboard.model.vo.Freeboard" %>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	SearchInfo si = (SearchInfo)request.getAttribute("si");
	ArrayList<Freeboard> list = (ArrayList<Freeboard>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int pageLimit = pi.getPageLimit();
	int currentPageSection = ((currentPage - 1) / pageLimit) + 1;
	int maxPageSection = ((maxPage - 1) / pageLimit) + 1;
	
	// 현재 활성화된 카테고리버튼의 정보를 세션에 저장
	String activeCategory = request.getParameter("category");
	session.setAttribute("activeCategory", activeCategory);
%>

<!DOCTYPE html>
<html lang="en">
    <head>
		<meta charset="UTF-8">
        <title>소금마켓 대시보드</title>
        
 


<style>
            /* 카테고리버튼 활성화시 css */
.hoon.active {
  background-color: #313131 !important;
  color: white !important;
}
/* 버튼 기본색상 메인테마색으로 강제 변경 */
.hoon {
	background-color: #cecece !important;
	color: black !important;
	border: none !important;
}
/* 버튼 위에 호버시 배경색 좀 더 진하게 강제 변경 */
.hoon:hover {
	background-color: #313131 !important;
    color: white !important;
}
/* 현재페이지버튼 흐리게만들기 */
#current-button:disabled {
	opacity: 1 !important;
	background-color: #313131 !important;
    color: white !important;
}
.hoon:disabled {
    opacity: 1 !important;
    background-color: #f3f3f3 !important;
}
hr {
    margin-top: 0px !important;
    margin-bottom: 0px !important;
}
        </style>
    </head>
    <body>
        
        
        
		<%@ include file="./boardManageSidebar.jsp"%>
                                
                        <!-- ------------------------------------------------------------------------ -->
                                
                                
       <div id="center">
            <h1 class="mt-4">자유게시판관리</h1>                        
       		<br>
			<!----- 카테고리 버튼들 ----->
			<div id="listhead">
				<div class="category">
					<button class="hoon btn btn-sm <% if ("전체".equals(activeCategory)) { %>active<% } %>" onclick="redirectToCategory('전체')">전체</button>
					<button class="hoon btn btn-sm <% if ("잡담".equals(activeCategory)) { %>active<% } %>" onclick="redirectToCategory('잡담')">잡담</button>
					<button class="hoon btn btn-sm <% if ("질문".equals(activeCategory)) { %>active<% } %>" onclick="redirectToCategory('질문')">질문</button>
					<button class="hoon btn btn-sm <% if ("정보".equals(activeCategory)) { %>active<% } %>" onclick="redirectToCategory('정보')">정보</button>
					<button class="hoon btn btn-sm <% if ("축하".equals(activeCategory)) { %>active<% } %>" onclick="redirectToCategory('축하')">축하</button>
					<button class="hoon btn btn-sm <% if ("고민/상담".equals(activeCategory)) { %>active<% } %>" onclick="redirectToCategory('고민/상담')">고민/상담</button>
				</div>
				  
				<!----- 카테고리 버튼 클릭이벤트 ----->
				<script>
					function redirectToCategory(category) {
						const urlParams = new URLSearchParams(window.location.search);
						const keyword = encodeURIComponent(urlParams.get('keyword'));
						const kind = encodeURIComponent(urlParams.get('kind'));
						
						location.href = '<%= contextPath %>/manage.fbo?currentPage=1&category='
								+ encodeURIComponent(category) + '&kind=' + kind + '&keyword=' + keyword;
					}
				</script>
				
				<!----- 제목/닉네임 검색 폼 ----->
				<form action="<%= contextPath %>/manage.fbo" method="get" class="search-container" accept-charset="UTF-8">
					<input type="hidden" name="category" value="<%= activeCategory %>">
  					<input type="hidden" name="currentPage" value="1">
					<select name="kind">
						<option value="title" <% if(si.getKind().equals("title")) { %>selected<% } %>>제목</option>
						<option value="name" <% if(si.getKind().equals("name")) { %>selected<% } %>>닉네임</option>
					</select>
					<input type="text" placeholder="검색어를 입력하세요" name="keyword" 
					value="<% if(!si.getKeyword().equals("null")) { %><%= si.getKeyword() %><% } %>">
					<button type="submit" class="hoon btn btn-sm">검색</button>
				</form>	
			</div>
                                
                                
                                
                                
                                			<!----- 게시글 목록 조회부분 ----->
			<table align="center" class="list-area">
				<thead>
					<tr>
						<th width="60">No</th>
						<th width="120">카테고리</th>
						<th width="500">제목</th>
						<th width="35"></th>
						<th width="110">작성자</th>
						<th width="70">조회수</th>
						<th width="120">작성일</th>
						<th width="130">처리</th>
					</tr>
				</thead>
				<tbody>
					<% if(list.isEmpty()) { %>
					<tr>
						<td style="display: none;">0</td>
						<td colspan="8">조회된 리스트가 없습니다.</td>
					</tr>
					<% } else { %>
					<% for(Freeboard b : list) { %>
					<tr>
						<td><%= b.getFreeboardNo() %></td>
						<td><%= b.getCategory() %></td>
						<td><%= b.getBoardTitle() %></td>
						<td><i class="far fa-comment-dots" style="color: #000000;"></i> <%= b.getReplyCount() %></td>
						<td><%= b.getUserName() %></td>
						<td><%= b.getBoardViews() %></td>
						<td><%= b.getCreatedDate() %></td>
						<td>
							<button type="button" class="btn btn-outline-success btn-sm"
								onclick="location.href='<%= contextPath %>/manageDetail.fbo?bno=<%= b.getFreeboardNo() %>'">상세</button>
							<button type="button" class="btn btn-outline-danger btn-sm"
								onclick="showConfirmationModal(<%= b.getFreeboardNo() %>)">삭제</button>
						</td>
					</tr>
					<% } %>
					<%} %>
				</tbody>
			</table>
			
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
								const urlParams = new URLSearchParams(window.location.search);
								const category = encodeURIComponent(urlParams.get('category'));
								const currentPage = encodeURIComponent(urlParams.get('currentPage'));
								const kind = encodeURIComponent(urlParams.get('kind'));
								const keyword = encodeURIComponent(urlParams.get('keyword'));
								
							  location.href = '<%= contextPath %>/manageDelete.fbo?bno=' + freeboardNo + 
							 															 '&category=' + encodeURIComponent(category) +
							 															'&currentPage=' + currentPage +
							 															'&kind=' + kind +
									  													'&keyword=' + encodeURIComponent(keyword);
							  $('#deleteFormModal').modal('hide');
						  }
						</script>
                                
                                
                                
                                
                                			<!----- 페이징처리 ----->
			<div class="paging-area">
				<%-- 이전 페이지섹션으로 이동  --%>
				<% if(currentPage <= 1) { %>
					<button type="button" class="hoon btn btn-sm" disabled>&lt;&lt;</button>
					<button type="button" class="hoon btn btn-sm" disabled>&lt;</button>
				<% } else if(currentPageSection == 1) { %>
					<button type="button" class="hoon btn btn-sm" onclick="redirectToPage(1)">&lt;&lt;</button>
					<button type="button" class="hoon btn btn-sm" onclick="redirectToPage(<%= currentPage - 1 %>)">&lt;</button>
				<% } else { %>
					<button type="button" class="hoon btn btn-sm" onclick="redirectToPage(<%= (currentPageSection - 2) * 10 + 1 %>)">&lt;&lt;</button>
					<button type="button" class="hoon btn btn-sm" onclick="redirectToPage(<%= currentPage - 1 %>)">&lt;</button>
				<% } %>

				<%-- 페이징처리  --%>
				<% for(int p = startPage; p <= endPage; p++) { %>
					<% if(p != currentPage) { %>
						<button type="button" class="hoon btn btn-sm" onclick="redirectToPage(<%= p %>)"><%= p %></button>
					<% } else { %>
						<button id="current-button" type="button" class="btn btn-sm" disabled><%= p %></button>
					<% } %>
				<% } %>

				<%-- 다음 페이지섹션으로 이동  --%>
				<% if(currentPageSection < maxPageSection ) { %>
					<button type="button" class="hoon btn btn-sm" onclick="redirectToPage(<%= currentPage + 1 %>)">&gt;</button>
					<button type="button" class="hoon btn btn-sm" onclick="redirectToPage(<%= currentPageSection * pageLimit + 1 %>)">&gt;&gt;</button>
				<% } else if(currentPage >= maxPage) { %>
					<button type="button" class="hoon btn btn-sm" disabled>&gt;</button>
					<button type="button" class="hoon btn btn-sm" disabled>&gt;&gt;</button>
				<% } else { %>
					<button type="button" class="hoon btn btn-sm" onclick="redirectToPage(<%= currentPage + 1 %>)">&gt;</button>
					<button type="button" class="hoon btn btn-sm" onclick="redirectToPage(<%= maxPage %>)">&gt;&gt;</button>
				<% } %>
			</div>
			
			<!----- 각페이지버튼 누를때 파라미터 전달 처리 ----->
			<script>
				function redirectToPage(page) {
					const urlParams = new URLSearchParams(window.location.search);
					const category = encodeURIComponent(urlParams.get('category'));
					const keyword = encodeURIComponent(urlParams.get('keyword'));
					const kind = encodeURIComponent(urlParams.get('kind'));

					location.href = '<%= contextPath %>/manage.fbo?category=' + category + '&currentPage=' + page + '&kind=' + kind + '&keyword=' + keyword;
				}
			</script>
       </div>                         
                                
                                
                                
                                
                                
                                
                                
                                <!--
                                
                             
                                <div class="card-body">
                                
                                
                                	
                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>카테고리</th>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>조회수</th>
                                                <th>작성일</th>
                                                <th>처리</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Tiger Nixon</td>
                                                <td>System Architect</td>
                                                <td>Edinburgh</td>
                                                <td>61</td>
                                                <td>2011/04/25</td>
                                                <td>$320,800</td>
                                                <td>$320,800</td>
                                            </tr>

                                            
                                        </tbody>
                                    </table>
                                    
                                </div>
                                  -->
                                
                                
                        <!-- ------------------------------------------------------------------------ -->         
                        
                                               
                                                
                                                
             <!------------ 인클루드할 때 아래 같이 적어줘야 제대로 작동!!! --------------->   
             
             
         					</div>
                        </div>
                    </main>
                    <footer class="py-4 bg-light mt-auto">
                        <div class="container-fluid px-4">
                            <div class="d-flex align-items-center justify-content-between small">
                                <div class="text-muted">Copyright &copy; Your Website 2023</div>
                                <div>
                                    <a href="#">Privacy Policy</a>
                                    &middot;
                                    <a href="#">Terms &amp; Conditions</a>
                                </div>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>        
            
            <!------------ ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 여기까지 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ --------------->   
            
            
    
        </body>
    </html>
    