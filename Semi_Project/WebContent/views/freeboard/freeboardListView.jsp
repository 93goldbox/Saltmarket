<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.saltmarket.common.model.vo.PageInfo, com.saltmarket.common.model.vo.SearchInfo, java.util.ArrayList, com.saltmarket.freeboard.model.vo.Freeboard"%>
<% 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	SearchInfo si = (SearchInfo)request.getAttribute("si");
	ArrayList<Freeboard> list = (ArrayList<Freeboard>)request.getAttribute("list");
	ArrayList<Freeboard> bestList = (ArrayList<Freeboard>)request.getAttribute("bestList");

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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<!-- jQuery 온라인 방식 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- 외부방식 freeboard.css -->
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/css/freeboard.css">

<!-- 폰트어썸 아이콘 적용 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

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

			<h1 id="centertitle"><a href="<%= contextPath %>/list.fbo?currentPage=1&category=전체"><%= activeCategory %> 주간 BEST</a></h1>
			
			<!----- 주간BEST 조회부분 ----->
			<% if(bestList.size() > 0) { %>
			<div id="bestdiv">
				<% int count = 0; %>
				<% if(bestList.size() > 5) { %>
					<!----- 5개 초과 조회 시 => 좌측 1~5순위 div ----->
					<table align="center" class="bestlist-area">
										<% for(int i = 0; i < 5; i++) { %>
											<tr>
												<td><input type="hidden" name="bno" value="<%= bestList.get(i).getFreeboardNo() %>"></td>
												<td><%= i + 1 %></td>
												<td><%= bestList.get(i).getBoardTitle() %></td>
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
							<td><input type="hidden" name="bno" value="<%= bestList.get(i).getFreeboardNo()  %>"></td>
							<td><%= i + 1 %></td>
							<td><%= bestList.get(i).getBoardTitle() %></td>
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
					    location.href = "<%= contextPath %>/detail.fbo?bno=" + bno;
					    }
					  });
				});
			</script>

			<br>

			<!----- 카테고리 버튼들 ----->
			<div id="listhead">
				<div class="category">
					<button class="btn btn-sm <% if ("전체".equals(activeCategory)) { %>active<% } %>" onclick="redirectToCategory('전체')">전체</button>
					<button class="btn btn-sm <% if ("잡담".equals(activeCategory)) { %>active<% } %>" onclick="redirectToCategory('잡담')">잡담</button>
					<button class="btn btn-sm <% if ("질문".equals(activeCategory)) { %>active<% } %>" onclick="redirectToCategory('질문')">질문</button>
					<button class="btn btn-sm <% if ("정보".equals(activeCategory)) { %>active<% } %>" onclick="redirectToCategory('정보')">정보</button>
					<button class="btn btn-sm <% if ("축하".equals(activeCategory)) { %>active<% } %>" onclick="redirectToCategory('축하')">축하</button>
					<button class="btn btn-sm <% if ("고민/상담".equals(activeCategory)) { %>active<% } %>" onclick="redirectToCategory('고민/상담')">고민/상담</button>
				</div>
				  
				<!----- 카테고리 버튼 클릭이벤트 ----->
				<script>
					function redirectToCategory(category) {
						const urlParams = new URLSearchParams(window.location.search);
						const keyword = encodeURIComponent(urlParams.get('keyword'));
						const kind = encodeURIComponent(urlParams.get('kind'));
						
						location.href = '<%= contextPath %>/list.fbo?currentPage=1&category='
								+ encodeURIComponent(category) + '&kind=' + kind + '&keyword=' + keyword;
					}
				</script>
				
				<!----- 제목/닉네임 검색 폼 ----->
				<form action="<%= contextPath %>/list.fbo" method="get" class="search-container" accept-charset="UTF-8">
					<input type="hidden" name="category" value="<%= activeCategory %>">
  					<input type="hidden" name="currentPage" value="1">
					<select name="kind">
						<option value="title" <% if(si.getKind().equals("title")) { %>selected<% } %>>제목</option>
						<option value="name" <% if(si.getKind().equals("name")) { %>selected<% } %>>닉네임</option>
					</select>
					<input type="text" placeholder="검색어를 입력하세요" name="keyword" 
					value="<% if(!si.getKeyword().equals("null")) { %><%= si.getKeyword() %><% } %>">
					<button type="submit" class="btn btn-sm">검색</button>
				</form>	
			</div>

			<!----- 게시글 목록 조회부분 ----->
			<table align="center" class="list-area">
				<thead>
					<tr>
						<th width="30">No</th>
						<th width="80">카테고리</th>
						<th width="370">제목</th>
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
						<td colspan="7">조회된 리스트가 없습니다.</td>
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
					</tr>
					<% } %>
					<%} %>
				</tbody>
			</table>

			<!----- 글 작성하기 버튼 처리 ----->
			<% if(loginUser != null) { %>
				<div style="text-align: right; margin-right: 10px;">
					<button id="write" type="button" class="btn btn-sm"
						onclick="location.href ='<%= contextPath %>/enrollForm.fbo'">글작성</button>
				</div>
			<% } %>
			
			<!----- 리스트 한행 클릭이벤트(상세조회로 이동 파라미터 전달) 처리 ----->
			<script>
				$(function() {
					  $(".list-area>tbody>tr").click(function() {
						 
						let bno = $(this).children().eq(0).text();
					    if (bno !== "0") {
					    	location.href = "<%= contextPath %>/detail.fbo?bno=" + encodeURIComponent(bno);
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
					const category = encodeURIComponent(urlParams.get('category'));
					const keyword = encodeURIComponent(urlParams.get('keyword'));
					const kind = encodeURIComponent(urlParams.get('kind'));

					location.href = '<%= contextPath %>/list.fbo?category=' + category + '&currentPage=' + page + '&kind=' + kind + '&keyword=' + keyword;
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