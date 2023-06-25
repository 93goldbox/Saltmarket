<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.saltmarket.common.model.vo.*, java.util.ArrayList, com.saltmarket.shareboard.model.vo.Shareboard"%>
<% 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	SearchInfo si = (SearchInfo)request.getAttribute("si");
	ArrayList<Region> regionList = (ArrayList<Region>)request.getAttribute("regionList");
	ArrayList<Shareboard> list = (ArrayList<Shareboard>)request.getAttribute("list");
	ArrayList<Shareboard> bestList = (ArrayList<Shareboard>)request.getAttribute("bestList");

            int currentPage = pi.getCurrentPage();
            int startPage = pi.getStartPage();
            int endPage = pi.getEndPage();
            int maxPage = pi.getMaxPage();
            int pageLimit = pi.getPageLimit();
            int currentPageSection = ((currentPage - 1) / pageLimit) + 1;
            int maxPageSection = ((maxPage - 1) / pageLimit) + 1;
            
			// 현재 활성화된 나눔여부버튼의 정보를 세션에 저장
			String activeStatus = request.getParameter("status");
			session.setAttribute("activeStatus", activeStatus);
			
			// 현재 활성화된 지역 드롭다운의 정보를 세션에 저장
			int activeRegionNo = Integer.parseInt(request.getParameter("regionNo"));
			session.setAttribute("activeRegionNo", activeRegionNo);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

	
<!-- 폰트어썸 아이콘 적용 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- 폰트어썸 아이콘 적용(ver. 4.7.0) -->	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">

	

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
			<h1 class="mt-4">나눔게시판관리</h1>     
			<br> 
			

			
			<!----- 지역 드롭다운 리스트  ----->
			<div id="listhead">
				<div class="region">
					<select name="region" onchange="goToRegion()">
							<option value="0">전체</option>
						<% for(Region r : regionList) { %>
							<option value="<%= r.getRegionNo() %>" <% if (r.getRegionNo() == Integer.parseInt(request.getParameter("regionNo"))) { %>selected<% } %>>
								<%= r.getRegionName() %>
							</option>					
						<% } %>
					</select>
				</div>
				
				<!----- 지역 드롭다운 선택이벤트 ----->
				<script>
					$(document).ready(function() {
						$('select[name="region"]').change(function() {
							const urlParams = new URLSearchParams(window.location.search);
							const status = encodeURIComponent(urlParams.get('status'));
							const keyword = encodeURIComponent(urlParams.get('keyword'));
							const kind = encodeURIComponent(urlParams.get('kind'));
							const regionNo = $(this).val();
							const regionName = $('select[name="region"] option:selected').text();
							const url = '<%= contextPath %>/manage.sbo?currentPage=1&regionNo=' + regionNo + '&status=' + status + '&kind=' + kind + '&keyword=' + keyword;
							location.href = url;
						});
						const regionName = $('select[name="region"] option:selected').text();
						$('#centertitle a').text(regionName + ' 월간 나눔 BEST');
					});
				</script>
				
				<!-- 나눔여부 필터 버튼들 -->
				<div class="status">
					<button class="hoon btn btn-sm <% if ("A".equals(activeStatus)) { %>active<% } %>" onclick="redirectToStatus('A')">전체나눔</button>
					<button class="hoon btn btn-sm <% if ("Y".equals(activeStatus)) { %>active<% } %>" onclick="redirectToStatus('Y')">나눔완료</button>
					<button class="hoon btn btn-sm <% if ("N".equals(activeStatus)) { %>active<% } %>" onclick="redirectToStatus('N')">진행중</button>
				</div>
			
				<!----- 나눔여부 버튼 클릭이벤트 ----->
				<script>
					function redirectToStatus(status) {
						const urlParams = new URLSearchParams(window.location.search);
						const regionNo = encodeURIComponent(urlParams.get('regionNo'));
						const keyword = encodeURIComponent(urlParams.get('keyword'));
						const kind = encodeURIComponent(urlParams.get('kind'));
						
						location.href = '<%= contextPath %>/manage.sbo?currentPage=1&status='
								+ encodeURIComponent(status) + '&kind=' + kind + '&keyword=' + keyword 
								+ '&regionNo=' + regionNo;
					}
				</script>
				
				
				<!----- 제목/닉네임 검색 폼 ----->
				<form action="<%= contextPath %>/manage.sbo" method="get" class="search-container" accept-charset="UTF-8">
					<input type="hidden" name="status" value="<%= activeStatus %>">
					<input type="hidden" name="regionNo" value="<%= activeRegionNo %>">
  					<input type="hidden" name="currentPage" value="1">
					<select name="kind">
						<option value="title" <% if(si.getKind().equals("title")) { %>selected<% } %>>제목</option>
						<option value="name" <% if(si.getKind().equals("name")) { %>selected<% } %>>닉네임</option>
					</select>
					<input type="text" placeholder="검색어를 입력하세요" name="keyword" 
					value="<% if(!si.getKeyword().equals("null")) { %><%= si.getKeyword() %><% } %>">
					<button type="submit" class="hoon btn btn-sm">검색</button>
				</form>
				
				<!-- listhead 끝나는 div -->
			</div>
				
				
			<!----- 게시글 목록 조회부분 ----->
			<table align="center" class="list-area">
				<thead>
					<tr>
						<th width="60">No</th>
						<th width="160">지역</th>
						<th width="500">제목</th>
						<th width="35"></th>
						<th width="100">작성자</th>
						<th width="70">조회수</th>
						<th width="110">작성일</th>
						<th width="130">처리</th>
					</tr>
				</thead>
				<tbody>
					<% if(list.isEmpty()) { %>
					<tr>
						<td style="display: none;">0</td>
						<td colspan="8" style="font-size:14px;">조회된 리스트가 없습니다.</td>
					</tr>
					<% } else { %>
					<% for(Shareboard s : list) { %>
					<tr>
						<td><%= s.getShareboardNo() %></td>
						<td><%= s.getRegionName() %></td>
						<td>
							<% if(s.getShareStatus().equals("Y")) { %>
								<%= s.getBoardTitle() %>
								<i class="far fa-handshake" style="color: #000000;"></i>
							<% } else { %>
								<%= s.getBoardTitle() %>
							<% } %>
						</td>
						<td><i class="far fa-comment-dots" style="color: #000000;"></i> <%= s.getReplyCount() %></td>
						<td><%= s.getUserName() %></td>
						<td><%= s.getBoardViews() %></td>
						<td><%= s.getCreatedDate() %></td>
						<td>
							<button type="button" class="btn btn-outline-success btn-sm"
								onclick="location.href='<%= contextPath %>/manageDetail.sbo?bno=<%= s.getShareboardNo() %>'">상세</button>
							<button type="button" class="btn btn-outline-danger btn-sm"
								onclick="showConfirmationModal(<%= s.getShareboardNo() %>)">삭제</button>
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
						
						function showConfirmationModal(shareboardNo) {
							  $('#deleteFormModal').data('shareboardNo', shareboardNo);
							  $('#deleteFormModal').modal('show');
						  }
						
						  function deleteForm() {
							  var shareboardNo = $('#deleteFormModal').data('shareboardNo');
							  if (!shareboardNo) {
							    alert('삭제할 글을 찾을 수 없습니다.');
							    return;
							  }
								const urlParams = new URLSearchParams(window.location.search);
								const regionNo = encodeURIComponent(urlParams.get('regionNo'));
								const status = encodeURIComponent(urlParams.get('status'));
								const currentPage = encodeURIComponent(urlParams.get('currentPage'));
								const kind = encodeURIComponent(urlParams.get('kind'));
								const keyword = encodeURIComponent(urlParams.get('keyword'));

							  location.href = '<%= contextPath %>/manageDelete.sbo?bno=' + shareboardNo +
									  													'&regionNo=' + regionNo +
									  													'&currentPage=' + currentPage +
									  													'&status=' + status +
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
					const regionNo = encodeURIComponent(urlParams.get('regionNo'));
					const status = encodeURIComponent(urlParams.get('status'));
					const keyword = encodeURIComponent(urlParams.get('keyword'));
					const kind = encodeURIComponent(urlParams.get('kind'));

					location.href = '<%= contextPath %>/manage.sbo?regionNo=' + regionNo + '&status=' + status + '&currentPage=' + page + '&kind=' + kind + '&keyword=' + keyword;
				}
			</script>
			
			
		</div>


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