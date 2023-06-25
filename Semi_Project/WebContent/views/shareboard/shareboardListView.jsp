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

<!-- jQuery 온라인 방식 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- 외부방식 board.css -->
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/css/shareboard.css">

<!-- 폰트어썸 아이콘 적용(ver. 5.15.4) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
<!-- 폰트어썸 아이콘 적용(ver. 4.7.0) -->	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">

<style>
/* 카테고리버튼 활성화시 css */
.btn.active {
  	background-color: #6ad4fd !important;
}
/* 버튼 기본색상 메인테마색으로 강제 변경 */
.btn {
	background-color: #BFE9F9 !important;
	color: black !important;
	border: none !important;
}
/* 버튼 위에 호버시 배경색 좀 더 진하게 강제 변경 */
.btn:hover {
	background-color: #6ad4fd !important;
}
/* 현재페이지버튼 흐리게만들기 */
#current-button:disabled {
	opacity: 1 !important;
	background-color: #6ad4fd !important;
}
hr {
    margin-top: 0px !important;
    margin-bottom: 0px !important;
}
</style>
</head>

<body>

	<%@ include file="../common/header.jsp"%>


	<div id="outer">
		<div id="left"></div>

		<div id="center">

			<h1 id="centertitle"><a href="<%= contextPath %>/list.sbo?currentPage=1&regionNo=0&status=A">월간 나눔 BEST</a></h1>
			
			<!----- 주간BEST 조회부분 ----->
			<% if(bestList.size() > 0) { %>
			<div id="bestdiv">
				<% int count = 0; %>
				<% if(bestList.size() > 5) { %>
					<!----- 5개 초과 조회 시 => 좌측 1~5순위 div ----->
					<table align="center" class="bestlist-area">
										<% for(int i = 0; i < 5; i++) { %>
											<tr>
												<td><input type="hidden" name="bno" value="<%= bestList.get(i).getShareboardNo() %>"></td>
												<td><%= i + 1 %></td>
												<td>
													<% if(bestList.get(i).getShareStatus().equals("Y")) { %>
														<%= bestList.get(i).getBoardTitle() %>
														<i style="margin: 5px;" class="fa fa-handshake-o" aria-hidden="true"></i>
													<% } else { %>
														<%= bestList.get(i).getBoardTitle() %>
													<% } %>
												</td>
												<td><i class="far fa-comment-dots" style="color: #000000;"></i> <%= bestList.get(i).getReplyCount() %></td>
												<td><i class="fas fa-eye" style="color: #000000;"></i> <%= bestList.get(i).getBoardViews() %></td>
											</tr>
											<% count++; %>
										<% } %>
					</table>
				<% } %>
				<!----- 좌측 1~5순위 or 우측 6~10순위 div ----->
				<table align="center" class="bestlist-area">
					<% for(int i = count; i < bestList.size(); i++) { %>
						<tr>
							<td><input type="hidden" name="bno" value="<%= bestList.get(i).getShareboardNo()  %>"></td>
							<td><%= i + 1 %></td>
							<td>
								<% if(bestList.get(i).getShareStatus().equals("Y")) { %>
									<%= bestList.get(i).getBoardTitle() %>
									<i style="margin: 5px;" class="fa fa-handshake-o" aria-hidden="true"></i>
								<% } else { %>
									<%= bestList.get(i).getBoardTitle() %>
								<% } %>
							</td>
							<td><i class="far fa-comment-dots" style="color: #000000;"></i> <%= bestList.get(i).getReplyCount() %></td>
							<td><i class="fas fa-eye" style="color: #000000;"></i> <%= bestList.get(i).getBoardViews() %></td>
							<% count++; %>
						</tr>
					<% } %>
					<% if(bestList.size() < 5) { %>
						<% for(int i = count; i < 5; i++) { %>
							<tr>
								<td><input type="hidden" name="bno" value="0"></td>
								<td><%= i + 1 %></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						<% } %>
					<% } else if(5 < bestList.size() && bestList.size() < 10) { %>
						<% for(int i = count; i < 10; i++) { %>
							<tr>
								<td><input type="hidden" name="bno" value="0"></td>
								<td><%= i + 1 %></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						<% } %>
					<% } %>
				</table>
				<% if(bestList.size() <= 5) { %>
				<!----- if) 5개 이하 조회시 => 우측 빈데이터 div(css이유) ----->
				<table align="center" class="bestlist-area">
					<% for(int i = 5; i < 10; i++) { %>
						<tr>
							<td><input type="hidden" name="bno" value="0"></td>
							<td><%= i + 1 %></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					<% } %>
				</table>
				<% } %>
			</div>
			<% } %>

			<!----- 주간Best 한 행 클릭(상세보기로 이동) 이벤트 ----->
			<script>
				$(function() {
					  $(".bestlist-area tr").click(function() {
						  
					    var bno = $(this).find("input[name='bno']").val();
					    if (bno !== "0") {
					    location.href = "<%= contextPath %>/detail.sbo?bno=" + bno;
					    }
					  });
				});
			</script>
			
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
							const url = '<%= contextPath %>/list.sbo?currentPage=1&regionNo=' + regionNo + '&status=' + status + '&kind=' + kind + '&keyword=' + keyword;
							location.href = url;
						});
						const regionName = $('select[name="region"] option:selected').text();
						$('#centertitle a').text(regionName + ' 월간 나눔 BEST');
					});
				</script>
				
				<!-- 나눔여부 필터 버튼들 -->
				<div class="status">
					<button class="btn btn-sm <% if ("A".equals(activeStatus)) { %>active<% } %>" onclick="redirectToStatus('A')">전체나눔</button>
					<button class="btn btn-sm <% if ("Y".equals(activeStatus)) { %>active<% } %>" onclick="redirectToStatus('Y')">나눔완료</button>
					<button class="btn btn-sm <% if ("N".equals(activeStatus)) { %>active<% } %>" onclick="redirectToStatus('N')">진행중</button>
				</div>
			
				<!----- 나눔여부 버튼 클릭이벤트 ----->
				<script>
					function redirectToStatus(status) {
						const urlParams = new URLSearchParams(window.location.search);
						const regionNo = encodeURIComponent(urlParams.get('regionNo'));
						const keyword = encodeURIComponent(urlParams.get('keyword'));
						const kind = encodeURIComponent(urlParams.get('kind'));
						
						location.href = '<%= contextPath %>/list.sbo?currentPage=1&status='
								+ encodeURIComponent(status) + '&kind=' + kind + '&keyword=' + keyword 
								+ '&regionNo=' + regionNo;
					}
				</script>
				
				
				<!----- 제목/닉네임 검색 폼 ----->
				<form action="<%= contextPath %>/list.sbo" method="get" class="search-container" accept-charset="UTF-8">
					<input type="hidden" name="status" value="<%= activeStatus %>">
					<input type="hidden" name="regionNo" value="<%= activeRegionNo %>">
  					<input type="hidden" name="currentPage" value="1">
					<select name="kind">
						<option value="title" <% if(si.getKind().equals("title")) { %>selected<% } %>>제목</option>
						<option value="name" <% if(si.getKind().equals("name")) { %>selected<% } %>>닉네임</option>
					</select>
					<input type="text" placeholder="검색어를 입력하세요" name="keyword" 
					value="<% if(!si.getKeyword().equals("null")) { %><%= si.getKeyword() %><% } %>">
					<button type="submit" class="btn btn-sm">검색</button>
				</form>
				
				<!-- listhead 끝나는 div -->
			</div>
				
				
			<!----- 게시글 목록 조회부분 ----->
			<table align="center" class="list-area">
				<thead>
					<tr>
						<th width="30">No</th>
						<th width="110">지역</th>
						<th width="350">제목</th>
						<th width="35"></th>
						<th width="75">작성자</th>
						<th width="50">조회수</th>
						<th width="100">작성일</th>
					</tr>
				</thead>
				<tbody>
					<% if(list.isEmpty()) { %>
					<tr>
						<td style="display: none;">0</td>
						<td colspan="7" style="font-size:14px;">조회된 리스트가 없습니다.</td>
					</tr>
					<% } else { %>
					<% for(Shareboard s : list) { %>
					<tr>
						<td><%= s.getShareboardNo() %></td>
						<td><%= s.getRegionName() %></td>
						<td>
							<% if(s.getShareStatus().equals("Y")) { %>
								<%= s.getBoardTitle() %>
								<i style="margin: 5px;" class="fa fa-handshake-o" aria-hidden="true"></i>
							<% } else { %>
								<%= s.getBoardTitle() %>
							<% } %>
						</td>
						<td><i class="far fa-comment-dots" style="color: #000000;"></i> <%= s.getReplyCount() %></td>
						<td><%= s.getUserName() %></td>
						<td><%= s.getBoardViews() %></td>
						<td><%= s.getCreatedDate() %></td>
					</tr>
					<% } %>
					<%} %>
				</tbody>
			</table>
		

			<!----- 글 작성하기 버튼 처리 ----->
			<% if(loginUser != null) { %>
				<div style="text-align: right; margin-right: 10px;">
					<button id="write" type="button" class="btn btn-sm"
						onclick="location.href ='<%= contextPath %>/enrollForm.sbo'">글작성</button>
				</div>
			<% } %>
			
			<!----- 리스트 한행 클릭이벤트(상세조회로 이동 파라미터 전달) 처리 ----->
			<script>
				$(function() {
					  $(".list-area>tbody>tr").click(function() {
						 
						let bno = $(this).children().eq(0).text();
					    if (bno !== "0") {
					    	location.href = "<%= contextPath %>/detail.sbo?bno=" + encodeURIComponent(bno);
					    }
					  });
				});
			</script>

			<!----- 페이징처리 ----->
			<div class="paging-area">
				<%-- 이전 페이지섹션으로 이동  --%>
				<% if(currentPage <= 1) { %>
					<button type="button" class="btn btn-sm" disabled>&lt;&lt;</button>
					<button type="button" class="btn btn-sm" disabled>&lt;</button>
				<% } else if(currentPageSection == 1) { %>
					<button type="button" class="btn btn-sm" onclick="redirectToPage(1)">&lt;&lt;</button>
					<button type="button" class="btn btn-sm" onclick="redirectToPage(<%= currentPage - 1 %>)">&lt;</button>
				<% } else { %>
					<button type="button" class="btn btn-sm" onclick="redirectToPage(<%= (currentPageSection - 2) * 10 + 1 %>)">&lt;&lt;</button>
					<button type="button" class="btn btn-sm" onclick="redirectToPage(<%= currentPage - 1 %>)">&lt;</button>
				<% } %>

				<%-- 페이징처리  --%>
				<% for(int p = startPage; p <= endPage; p++) { %>
					<% if(p != currentPage) { %>
						<button type="button" class="btn btn-sm" onclick="redirectToPage(<%= p %>)"><%= p %></button>
					<% } else { %>
						<button id="current-button" type="button" class="btn btn-sm" disabled><%= p %></button>
					<% } %>
				<% } %>

				<%-- 다음 페이지섹션으로 이동  --%>
				<% if(currentPageSection < maxPageSection ) { %>
					<button type="button" class="btn btn-sm" onclick="redirectToPage(<%= currentPage + 1 %>)">&gt;</button>
					<button type="button" class="btn btn-sm" onclick="redirectToPage(<%= currentPageSection * pageLimit + 1 %>)">&gt;&gt;</button>
				<% } else if(currentPage >= maxPage) { %>
					<button type="button" class="btn btn-sm" disabled>&gt;</button>
					<button type="button" class="btn btn-sm" disabled>&gt;&gt;</button>
				<% } else { %>
					<button type="button" class="btn btn-sm" onclick="redirectToPage(<%= currentPage + 1 %>)">&gt;</button>
					<button type="button" class="btn btn-sm" onclick="redirectToPage(<%= maxPage %>)">&gt;&gt;</button>
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

					location.href = '<%= contextPath %>/list.sbo?regionNo=' + regionNo + '&status=' + status + '&currentPage=' + page + '&kind=' + kind + '&keyword=' + keyword;
				}
			</script>
			
			
		</div>

		<div id="right"></div>

	</div>
	
	
	<%@ include file="../common/footer.jsp"%>
	
	
	

<script>
// --- 페이지 이동시 현재 페이지 스크롤 기억 ---
    window.onload = function() {
  var scrollPos = sessionStorage.getItem('scrollPos');
  if (scrollPos !== null) {
    window.scrollTo(0, scrollPos);
    sessionStorage.removeItem('scrollPos');
  }
}

window.onbeforeunload = function() {
  sessionStorage.setItem('scrollPos', window.scrollY);
}

function goToPage(url) {
  var scrollPos = window.scrollY;
  sessionStorage.setItem('scrollPos', scrollPos);
  location.href = url;
}
</script>
</body>

</html>