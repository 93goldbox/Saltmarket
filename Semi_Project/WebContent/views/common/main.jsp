<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.saltmarket.product.model.vo.Product"%>
<%
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<br><br>
  <div class="wrapM1">
     <div class="container">
      <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="3" aria-label="Slide 4"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="4" aria-label="Slide 5"></button>
          </div>
          <div class="carousel-inner">
              <div class="carousel-item active" data-bs-interval="3000">
                <img src="https://media.bunjang.co.kr/images/nocrop/978280358_w3087.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block"></div>
              </div>
              <div class="carousel-item" data-bs-interval="2000">
                <img src="https://media.bunjang.co.kr/images/nocrop/975270692_w3087.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block"></div>
              </div>
              <div class="carousel-item">
                <img src="https://media.bunjang.co.kr/images/nocrop/978167591_w2058.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block"></div>
              </div>
              <div class="carousel-item">
                <img src="https://media.bunjang.co.kr/images/nocrop/978280206_w3087.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block"></div>
              </div>
              <div class="carousel-item">
                <img src="https://media.bunjang.co.kr/images/nocrop/972479333_w4116.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block"></div>
              </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
      </div>
      <br><br>

      <div class="card mb-3">

     </div>
    <script>
	    $(function(){
			$(".list-body").click(function(){
				let pno = $(this).children().eq(0).val();
				location.href = "<%= contextPath %>/detail.pr?pno=" + pno;
			});
		});
    </script>

      <br><br>
      <h1>최신 상품</h1>
      <br><br>
      <div class="row">
          <div class="col-xl-3 col-md-6">
              <div class="card">
                  <img class="card-img-top" src="https://image.msscdn.net/images/goods_img/20230418/3242240/3242240_16817913492129_320.jpg" alt="Card image">
                  <div class="card-body">
                      <h4 class="card-title">XRS 16 자전거</h4>
                      <p class="card-text">180,000 원</p>
                      <a href="#" class="btn btn-primary mainBtn1">상세보기</a>
                  </div>
              </div>
          </div>
          <div class="col-xl-3 col-md-6">
              <div class="card">
                  <img class="card-img-top" src="https://image.msscdn.net/images/goods_img/20220802/2693978/2693978_16790132624005_320.jpg" alt="Card image">
                  <div class="card-body">
                      <h4 class="card-title">정품)메트로시티지갑풀박스</h4>
                      <p class="card-text">35,000 원</p>
                      <a href="#" class="btn btn-primary mainBtn1">상세보기</a>
                  </div>
              </div>
          </div>
          <div class="col-xl-3 col-md-6">
              <div class="card">
                  <img class="card-img-top" src="https://image.msscdn.net/images/goods_img/20211021/2192777/2192777_2_320.jpg" alt="Card image">
                  <div class="card-body">
                      <h4 class="card-title">c263여성 쉬폰원피스</h4>
                      <p class="card-text">5,000 원</p>
                      <a href="#" class="btn btn-primary mainBtn1">상세보기</a>
                  </div>
              </div>
          </div>
          <div class="col-xl-3 col-md-6">
              <div class="card">
                  <img class="card-img-top" src="https://image.msscdn.net/images/goods_img/20230131/3051039/3051039_16753912309555_320.jpg" alt="Card image">
                  <div class="card-body">
                      <h4 class="card-title">[미개봉] 올리브영 웜쿨키트 </h4>
                      <p class="card-text">9,000 원</p>
                      <a href="#" class="btn btn-primary mainBtn1">상세보기</a>
                  </div>
              </div>
          </div>
      </div>
      <br>
      
      <div class="row">
        <div class="col-xl-3 col-md-6">
            <div class="card">
                <img class="card-img-top" src="<%= contextPath %>/resources/product_upfiles/main1.jpg" alt="Card image">
                <div class="card-body">
                    <h4 class="card-title">스틸라 헤븐스듀 실버레이크</h4>
                    <p class="card-text">30000 원</p>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
              <div class="card">
                  <img class="card-img-top" src="<%= contextPath %>/resources/product_upfiles/main2.jpg" alt="Card image">
                  <div class="card-body">
                      <h4 class="card-title">[미개봉] 올리브영 웜쿨키트</h4>
                      <p class="card-text">50000 원</p>
                  </div>
              </div>
          </div>
          <div class="col-xl-3 col-md-6">
              <div class="card">
                  <img class="card-img-top" src="<%= contextPath %>/resources/product_upfiles/main3.jpg" alt="Card image">
                  <div class="card-body">
                      <h4 class="card-title">c263여성 쉬폰원피스</h4>
                      <p class="card-text">10000 원</p>
                  </div>
              </div>
          </div>
          <div class="col-xl-3 col-md-6">
              <div class="card">
                  <img class="card-img-top" src="<%= contextPath %>/resources/product_upfiles/main4.jpg" alt="Card image">
                  <div class="card-body">
                      <h4 class="card-title">XRS 16 자전거</h4>
                      <p class="card-text">딸기가 맛나요</p>
                  </div>
              </div>
          </div>
      </div>
      <br>
      
      <div class="row">
        <div class="col-xl-3 col-md-6">
            <div class="card">
                <img class="card-img-top" src="<%= contextPath %>/resources/product_upfiles/main5.jpg" alt="Card image">
                <div class="card-body">
                    <h4 class="card-title">딸기</h4>
                    <p class="card-text">50000 원</p>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
              <div class="card">
                  <img class="card-img-top" src="<%= contextPath %>/resources/product_upfiles/main6.jpg" alt="Card image">
                  <div class="card-body">
                      <h4 class="card-title">딸기</h4>
                      <p class="card-text">20000 원</p>
                  </div>
              </div>
          </div>
          <div class="col-xl-3 col-md-6">
              <div class="card">
                  <img class="card-img-top" src="<%= contextPath %>/resources/product_upfiles/main7.jpg" alt="Card image">
                  <div class="card-body">
                      <h4 class="card-title">딸기</h4>
                      <p class="card-text">1000 원</p>
                  </div>
              </div>
          </div>
          <div class="col-xl-3 col-md-6">
              <div class="card">
                  <img class="card-img-top" src="<%= contextPath %>/resources/product_upfiles/main8.jpg" alt="Card image">
                  <div class="card-body">
                      <h4 class="card-title">딸기</h4>
                      <p class="card-text">딸기가 맛나요</p>
                      <a href="#" class="btn btn-primary mainBtn1">상세보기</a>
                  </div>
              </div>
          </div>
      </div>
      <br><br><br><br><br><br>

      <h1>오늘의 상품 추천</h1>
      	  <br><br>
      <div class="row row-cols-1 row-cols-md-3 g-1">
        <div class="col">
          <div class="card">
            <img src="https://image.msscdn.net/images/goods_img/20230202/3055246/3055246_16763618084983_320.jpg" class="card-img-top" alt="..." height="436px;">
            <div class="card-body">
              <h5 class="card-title">슈프림 더블니23ss</h5>
              <p class="card-text">400000 원</p>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card">
            <img src="https://image.msscdn.net/images/goods_img/20220609/2605850/2605850_1_320.jpg" class="card-img-top" alt="..." height="436px;">
            <div class="card-body">
              <h5 class="card-title">무스너클 발리스틱</h5>
              <p class="card-text">200000 원</p>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card">
            <img src="https://image.msscdn.net/images/goods_img/20220331/2458214/2458214_1_320.jpg" class="card-img-top" alt="..." height="436px;">
            <div class="card-body">
              <h5 class="card-title">크롬하츠 안경 딥3 블랙실버</h5>
              <p class="card-text">2150000 원</p>
            </div>
          </div>
        </div>
      </div>
      <br><br>
      
      <h1>매물 리스트</h1>
      <br><br>
      <div>
        <div class="row row-cols-1 row-cols-md-5 g-1">
            <div class="col">
              <div class="card">
                <img src="<%= contextPath %>/resources/product_upfiles/main9.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">슈프림 더블니23ss</h5>
                  <p class="card-text">400,000 원</p>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card">
                <img src="<%= contextPath %>/resources/product_upfiles/main10.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">무스너클 발리스틱</h5>

                  <p class="card-text">200,000 원</p>
                </div>
              </div>
            </div>
            <div class="col" height="401.02px !important;">
              <div class="card" height="401.02px">
                <img src="<%= contextPath %>/resources/product_upfiles/main11.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">크롬하츠 안경 딥3 블랙실버</h5>
                  <p class="card-text">2,150,000 원</p>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card">
                <img src="<%= contextPath %>/resources/product_upfiles/main12.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">소니 zv-1 카메라</h5>
                  <p class="card-text">620,000 원</p>
                </div>
              </div>
            </div>
            <div class="col">
                <div class="card">
                <img src="<%= contextPath %>/resources/product_upfiles/main13.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">소니 zv-1 카메라</h5>
                    <p class="card-text">620,000 원</p>
                </div>
                </div>
            </div>
        </div>
      </div>
      <div>
        <div class="row row-cols-1 row-cols-md-5 g-1">
            <div class="col">
              <div class="card">
                <img src="<%= contextPath %>/resources/product_upfiles/main14.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">슈프림 더블니23ss</h5>
                  <p class="card-text">400,000 원</p>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card">
                <img src="<%= contextPath %>/resources/product_upfiles/main15.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">무스너클 발리스틱</h5>
                  <p class="card-text">200,000 원</p>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card" height="401.02px;">
                <img src="<%= contextPath %>/resources/product_upfiles/main16.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">크롬하츠 안경 딥3 블랙실버</h5>
                  <p class="card-text">2,150,000 원</p>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card">
                <img src="<%= contextPath %>/resources/product_upfiles/main17.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">소니 zv-1 카메라</h5>
                  <p class="card-text">620,000 원</p>
                </div>
              </div>
            </div>
            <div class="col">
                <div class="card">
                  <img src="<%= contextPath %>/resources/product_upfiles/main18.jpg" class="card-img-top" alt="...">
                  <div class="card-body">
                      <h5 class="card-title">소니 zv-1 카메라</h5>
                      <p class="card-text">620,000 원</p>
                  </div>
                </div>
            </div>
        </div>
      </div>
    </div>
  </div>
  </div>
  
  <%@ include file="footer.jsp" %>

</body>
</html>
