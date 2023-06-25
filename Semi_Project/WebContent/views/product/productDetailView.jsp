<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.saltmarket.product.model.vo.*, com.saltmarket.common.model.vo.*, java.util.ArrayList, com.saltmarket.common.model.vo.Region" %>
<%
	Product p = (Product)request.getAttribute("p");
	Region r = (Region)request.getAttribute("r");
	int count = (int)request.getAttribute("count");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품상세페이지</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/productDetail.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <%@ include file="../common/header.jsp" %>
    

	<br><br>
	<div class="container">
	    <div class="row row11">
	        <div class="card mb-3 card1">
	            <div class="row g-0">
	                <% if(p.getTitleImg() == null){ %>
		            	<div class="col-md-4">
		                	<img src="resources/image/noimage.png" class="img-fluid rounded-start pimg1" alt="...">
		                </div>
		            <% } else {%>
		                <div class="col-md-4">
		                	<img src="<%= contextPath %>/<%= p.getTitleImg() %>" class="img-fluid rounded-start pimg1" alt="...">
		                </div>
		            <%} %>
	                <div class="col-md-8">
		                <div class="card-body pcard1">
		                    <div class="row prow1">
		                        <div class="prow2">	                        
		                            <div class="col-sm-3 pname1" style="width:200px;">상품명</div>
		                            <div class="col-sm-9 pcontent1"><%= p.getProductName() %></div>
		                        </div>
		                        <div class="prow2">
			                        <div class="col-sm-3 pname1" style="width:200px;">거래 가능 여부</div>
			                        <div class="col-sm-9 pcontent1"><%= p.getProductStatus() %></div>
		                        </div>
		                        <div class="prow2">
			                        <div class="col-sm-3 pname1" style="width:200px;">가격</div>
			                        <div class="col-sm-9 pcontent1"><%= p.getPrice() %></div>
		                        </div>
		                        <div class="prow2">
			                        <div class="col-sm-3 text-truncate pname1" style="width:200px;">등록일</div>
			                        <div class="col-sm-9 pcontent1"><%= p.getCreatedAt() %></div>
		                        </div>
		                        <div class="prow2">
			                        <div class="col-sm-3 text-truncate pname1" style="width:200px;">조회수</div>
			                        <div class="col-sm-9 pcontent1"><%= p.getProductViews() %></div>
		                        </div>
		                        <div class="prow2">
			                        <div class="col-sm-3 text-truncate pname1" style="width:200px;">거래지역</div>
			                        <div class="col-sm-9 pcontent1"><%= r.getRegionName() %></div>
		                        </div>
		                    </div>
		                </div>
	                </div>
	            </div>

				<div style="margin-left: 342px; display:inline-block;">
			    
                      
					

					<% if(loginUser != null) {%>
					<button type="button" class="btn btn-outline-info" onclick="location.href='<%= contextPath %>/sellerprofile.pr?pno=<%= p.getProductNo()%>'">판매자 프로필 조회</button>
						<a href="<%= contextPath %>/ready">
							<i class="fa-regular fa-comment-dots fa-2xl" style="color:#0befeb !important; margin-left:50px;"></i>
						</a>
			            <form action="<%= contextPath %>/enroll.pr" method="post" style="display:inline-block; margin-left:5px;">
	                    	<input type="hidden" name="pno" value="<%= p.getProductNo() %>">
	                    	<input type="hidden" name="uno" value="<%= p.getUserNo() %>">
						
							<button type="submit" class="declareBtn1">
								<i class="fa-solid fa-hammer fa-bounce fa-2xl" style="color: #0befeb; backrground-color: none; color:none;"></i>
				            </button>
			            </form>

	                   	<form action="<%= contextPath %>/wishlist.pr" method="post" style="display:inline-block; margin-left:5px;">
	                    	<input type="hidden" name="pno" value="<%= p.getProductNo() %>">
	                    	<input type="hidden" name="uno" value="<%= p.getUserNo() %>">
	                    	
	                    	<button type="submit" class="declareBtn1">
	                    		<% if(count > 0) {%>
	                          		<i class="fa-solid fa-heart fa-beat fa-2xl" style="color: #f20707;"></i>
	                      		<% } else{ %>
	                          		<i class="fa-regular fa-heart fa-beat-fade fa-2xl" style="color: #f21202;"></i>
	                     		<% } %>
	                     	</button>
	                 	</form>
			       <% } %>
			       <br><br>
			       <% if(loginUser != null && loginUser.getUserNo()==p.getUserNo()) { %>
                      <button type="button" onclick = "location.href = '<%= contextPath %>/ProductUpdateForm.pr?productNo=<%= p.getProductNo() %>' ">수정</button>
                      <button type="button" onclick = "location.href = '<%= contextPath %>/ProductDeleteForm.pr?productNo=<%= p.getProductNo() %>' ">삭제</button>	
					<% } else if(loginUser!=null && (loginUser.getUserNo()==1||loginUser.getUserNo()==2)) { %>
								<button type="button" onclick = "location.href = '<%= contextPath %>/ProductUpdateForm.pr?productNo=<%= p.getProductNo() %>' ">수정</button>
                     	 		<button type="button" onclick = "location.href = '<%= contextPath %>/ProductDeleteForm.pr?productNo=<%= p.getProductNo() %>' ">삭제</button>	
					<% } %>
			    </div>
	        </div>
	    </div>
	</div>
	
    <br><br><br><br>
    
    <div class="container">
    <hr><br>

	    <h3 align="center">상품정보</h3><br>
	    <p align="center">
	    <%= p.getDescription() %>
	        빙그레 이번 겨울을 맞아 바나나맛우유의 새로운 버전을 내놨다. <br>
	        2016년부터 겨울마다 새로운 바나나맛우유 에디션을 선보이고 있는 연장선에서다. <br>
	        빙그레는 겨울 에디션마다 겨울 감성이 느껴지는 색채와 귀여운 얼굴 모양이 들어간 <br>
	        패키지 디자인을 적용해 소비자에게 친숙한 이미지로 다가섰다. 이번 바나나맛우유 <br>
	        시즈널 패키지는 최근 유행한 뉴트로 트렌드를 담았다. 시즈널 패키지의 주요 요소인 <br>
	        얼굴 모양은 1980~90년대에 사용한 빙그레 로고에 그려진 마스코트를 새겨 넣었다. <br>
	        또 4개입 멀티팩은 좀 더 과감하게 레트로 디자인을 반영해 과거 로고와 카피를 넣어 <br>
	        기성 세대에게 추억과 향수를, 젊은 세대에게는 신선함을 전달했다.<br>
	    </p>
	    <br><br><br><br>
	    <hr><br><br>
	
		<h3 align="center">더 나은 거래를 위해 거래를 평가해주세요.</h3><br>
		<div class="container" align="center">
			<button type="button" class="btn btn-primary showModal" data-toggle="modal" data-target="#score" style="width:280px;height:80px;color:black;">평가하기</button>
			<form action="<%= contextPath %>/score.tr">
				<input type="hidden" name="uno" value="<%= p.getUserNo() %>">
				<input type="hidden" name="pno" value="<%= p.getProductNo() %>">
				
			    <div class="modal" id="score" tabindex="-1">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				    
				      <div class="modal-header">
					        <h5 class="modal-title">거래 평가하기</h5>
					        <button type="button" class="close" data-dismiss="modal" style="border:none; background-color:white;">&times;</button>
				      </div>
				      
				      <div class="modal-body">
				            <div class="slideBtn">
				                <b>매너 평가</b>&nbsp;<i class="bi bi-chevron-down" aria-hidden="true"></i>
				            </div>
				            <div class="slide">
				                <br>
				                <input type="checkbox" id="score1" name="score[]" value="+">
				                <label for="score1">친절하고 매너가 좋아요</label><br>
				                
				                <input type="checkbox" id="score2" name="score[]" value="+">
				                <label for="score2">시간 약속을 잘지켜요</label><br>
				                
				                <input type="checkbox" id="score3" name="score[]" value="+">
				                <label for="score3">응답이 빨라요</label><br>
				            </div>
			            	<hr>
			            
				            <div class="slideBtn">
				                <b>비매너 평가</b>&nbsp;<i class="bi bi-chevron-down" aria-hidden="true"></i>
				            </div>
				            <div class="slide">
				                <br>
				                <input type="checkbox" id="score4" name="score[]" value="-">
				                <label for="score4">불친절해요</label><br>
				                
				                <input type="checkbox" id="score5" name="score[]" value="-">
				                <label for="score5">무리하게 가격을 깎아요</label><br>
				                
				                <input type="checkbox" id="score6" name="score[]" value="-">
				                <label for="score6">쪽지를 보내도 답이 없어요</label><br>
				            </div>
				          
			        	</div>
			        	
			        	<div class="modal-footer">
					        <button type="submit" class="btn btn-primary" id="scoreSubmit">평가 제출</button>
				        </div>
			    	</div>
			      </div>
			    </div>
		   </form>
		</div>
	
	    <script>
	        $(function() {
	            $(".slideBtn").click(function() {
	                let $div = $(this).next();
	
	                if($div.css("display") == "none") {
	                	$(this).siblings(".slide").slideUp(1000);
	                    $div.slideDown(1000);
	                } else {
	                    $div.slideUp(1000);
	                }
	            });
	        });
	                   	
	   </script>
	   <script>
			$(function(){
				$(".showModal").click(function(){
					$("#score").modal("show");
				});
				$(".close").click(function(){
					$("#score").modal("hide");
				});
			});
		</script>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
