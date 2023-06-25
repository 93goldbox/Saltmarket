<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>자주 묻는 질문</title>
        <!-- 부트스트랩 CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

        <!-- bootstrap watch file link -->
        <link rel="stylesheet" href="resources/css/bootstrap_th.min.css">

        <!-- bootstrap icons CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

        <!-- font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

        <!-- trade_board.css -->
        <link rel="stylesheet" href="resources/css/trade_board.css">

        <!-- 구글 아이콘 -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <style>
            

            @media (max-width: 3000px) {
                .containerQNA {
                    min-width: 970px;
                    
                }
            }
            @media (min-width: 1200px) {
                .containerQNA {
                    max-width: 970px;
                    
                }
            }

            
            #searchs{
                display: flex;
                justify-content: center;
            }
            .d-flex{
                width:800px;
            }
            .searchss{
                display: flex;
                justify-content: center;
            }
            .searchss div{
                text-align: center;
                width: 800px;
            }

            .searchss a{
                margin: 30px;
            }
            .container2{
                height: 1500px;
                width: 1500px;
            }
            
            .nav:hover a{
                color: black !important;
                font-size: 28px;
            }
            .nav_salt:hover a{
                color:  #1C8FED !important;
                font-size: 28px;
            }

        </style>
    </head>
    <body >
        <%@ include file="../common/header.jsp" %>

        
        <div id="its">
            <div class="container container2" style="height: 1100px; display: flex; padding: 0px; ">
                <div style=" width: 300px; margin-right: 80px; margin-top: 80px; height: 280px;">
                    <div class="nav_salt" style="height: 70px; font-size:27px; border-bottom: 1.5px solid gray; padding: 13px; cursor: pointer;">
                        <a  href="<%= contextPath %>" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray;">소금마켓 가기</a>
                    </div>
                    <div class="nav" style="height: 70px; font-size:27px; border-bottom: 1.5px solid gray; padding: 13px; cursor: pointer;">
                        <a  href="<%= contextPath %>/view.cs" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray;">고객센터 가기</a>
                    </div>
                    <div  class="nav" style="height: 70px; font-size:27px; border-bottom: 1.5px solid gray; padding: 13px;">
                        <% if(loginUser != null) { %>
                            <a href="<%= contextPath %>/enroll.qna" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray; ">1:1 문의</a>
                        <% } else { %>
                            <a href="<%= contextPath %>/loginPage.me" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray; "onclick ="loginPl();">1:1 문의</a>
                        <% } %>
                    </div>
                    <div  class="nav" style="height: 70px; font-size:27px; border-bottom: 1.5px solid gray; padding: 13px;">
                        <% if(loginUser != null) { %>
                            <a href="<%= contextPath %>/list.qna?userNo=<%= loginUser.getUserNo() %>&currentPage=1" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray; ">문의 내역</a>
                        <% } else { %>
                            <a href="<%= contextPath %>/loginPage.me" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray; "onclick ="loginPl();">문의 내역</a>
                        <% } %>
                    </div>
                    <div class="nav" style="height: 70px; font-size:27px; border-bottom: 1.5px solid gray; padding: 13px;">
                        <span style="color: black; font-weight: 900;">자주 묻는 질문</span>
                    </div>
                    <div class="nav" style="height: 70px; font-size:27px; padding: 13px;">
                        <a href="<%= contextPath %>/list.no?currentPage=1" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray; ">공지사항</a>
                    </div>
                    
                    <div id="box1" style="height:160px; background-color: white; box-shadow: 5px 5px 10px 5px gray; border-bottom-right-radius: 20px; margin-top: 80px; padding: 20px 0px 20px 50px;">
                        <p style="font-size: 40px; color: #1C8FED; margin: 0px;  ">1670-2910</p>
                        <p style="font-size: 20px; margin: 0px; ">월~금 09:00~18:00</p>
                        <p style="font-size: 20px; ; ">주말, 공휴일 휴무</p>
                    </div>
                </div>

                
                <div class="" style="width: 970px; padding: 0px; margin: 0px;">
                    <div  style="background-color: white; margin-top: 80px; box-shadow: 5px 5px 10px 5px gray; ">
                        <div class="accordion" id="accordionExample" style="margin : 20px; padding: 40px 10px 100px 10px;  ">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne1" aria-expanded="false" aria-controls="collapseOne">
                                        <span class="material-symbols-outlined">
                                            question_mark
                                            </span>
                                        [분쟁해결절차] 사기꾼의 주요 사기패턴 유형이 궁금해요.
                                    </button>
                                </h2>
                                <div id="collapseOne1" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" >
                                    <div class="accordion-body">
                                    <strong>주요사기 패턴을 알려드려요!</strong> #최근 빈번하게 발생하는 사기유형
                                    거래 전, 아래와 같이 행동하는 상점이 있다면 즉시 신고해 주세요!
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne3" aria-expanded="false" aria-controls="collapseOne">
                                        <span class="material-symbols-outlined">
                                            question_mark
                                            </span>
                                            [분쟁해결절차] 사기를 당하면 어떻게 처리해야 되나요?
                                    </button>
                                </h2>
                                <div id="collapseOne3" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" >
                                    <div class="accordion-body">
                                        사기거래 발생 시 수사기관 접수 
    
     
    
                                        사기거래 발생 시 즉시 수사기관을 통해 신고 접수해 주시기 바라며, 아래의 접수 방법 참고를 부탁드립니다.
                                        
                                         
                                        
                                         [수사기관 접수 채널 및 신고 방법] 
                                        
                                        1. 상대방과 거래한 내용에 대해 증거자료 수집 (대화내용, 입금내역)
                                        
                                         
                                        
                                        2. 경찰청 사이버안전지킴이 신고(온라인 접수 바로가기)
                                        
                                         ※ 범죄유형은 사이버사기 > 직거래사기로 선택
                                        
                                         ※ 사전 질문 '2. 환불 관련 문제인가요?' 에 [아니오] 를 선택하여야 수사가 진행되며, 사건에 따라 경찰서 방문이 필요할 수 있습니다.
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne2" aria-expanded="false" aria-controls="collapseOne">
                                        <span class="material-symbols-outlined">
                                            question_mark
                                            </span>
                                            거래를 하면 안 되는 것들은 어떤 것이 있나요?
                                    </button>
                                </h2>
                                <div id="collapseOne2" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" >
                                    <div class="accordion-body">
                                        거래금지품목은 이용약관 및 현행 법률에 따라 즉시 삭제 및 계정 차단이 될 수 있으므로 운영정책을 참고하셔서 이용 부탁 드립니다.  
    
     
    
                                        개인정보 : 개인정보를 사고파는 행위와 면허증, 허가증, 등록증 등을 위, 변조하는 행위는 형법에 따라 처벌받을 수 있습니다.
                                        
                                        예시) 주민등록증, 여권, 학생증, 수험표, 운전면허증, 대포통장, 듀얼폰, 듀얼넘버 등 
                                        
                                         
                                        
                                        온라인 개인 계정 : 개인 계정 및 인증번호를 통해 각종 피해가 발생되고 있어 번개장터 운영정책에 따라 제재 됩니다.
                                        예시) 카톡계정, 인스타 계정, 페이스북 계정, 네이버 계정, 카카오톡, 네이버, 페이스북 인증번호 등
                                        
                                        
                                        
                                        불법현금융통 : 정보통신망 이용촉진 및 정보보호등의 관한 법률 제 72조 통신과금을 이용해 매입하는 행위는 불법현금융통으로 제재 됩니다. 
                                        예시) 불법 현금융통을 목적으로 한 모든 상품 (불법대출, 돈구해요, 개인돈빌려요, 리니지M등)
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne4" aria-expanded="false" aria-controls="collapseOne">
                                        <span class="material-symbols-outlined">
                                            question_mark
                                            </span>
                                            통신판매업자일 경우 상품 판매에 필요한 절차가 있나요?
                                    </button>
                                </h2>
                                <div id="collapseOne4" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" >
                                    <div class="accordion-body">
                                        프로상점 가입 및 사업자 정보 등록 후 판매 필요
    
                                        전자상거래 법상 통신판매업자가 상품을 판매하기 위해서는 사업자정보 등록을 완료해주셔하며,
                                        프로상점 서비스 가입 후 등록이 가능합니다.
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingTwo">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne5" aria-expanded="false" aria-controls="collapseTwo">
                                        <span class="material-symbols-outlined">
                                            question_mark
                                        </span>
                                        수신한 개인정보 이용내역 메시지가 궁금해요.
                                    </button>
                                </h2>
                                <div id="collapseOne5" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample" >
                                    <div class="accordion-body">
                                        1. 개인정보 이용내역이 무엇인가요?
    
                                        "개인정보보호법" 제39조의8(개인정보 이용내역 통지)에 따라 번개장터에서 개인정보가 
                                      
                                        어떤 목적으로 이용되고 있는지 안내해 드리기 위해 연 1회 정기적으로 발송되는 메시지입니다. 
                                      
                                      
                                      
                                      2. 저는 탈퇴 했는데, 왜 개인정보 이용내역 메시지가 왜 발송 된거죠? 
                                      
                                        12/8일을 기준으로 번개장터의 가입자를 대상으로 발송하였습니다.
                                      
                                        12/8일 이후 탈퇴를 하신 경우 메시지를 받으실 수 있습니다. 
                                      
                                      
                                    </div>
                                </div>
                            </div>
                            
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne6" aria-expanded="false" aria-controls="collapseOne" style="height: 70px;">
                                        <span class="material-symbols-outlined">
                                            question_mark
                                            </span>
                                            휴면 계정이란 무엇인가요?
                                    </button>
                                </h2>
                                <div id="collapseOne6" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" >
                                    <div class="accordion-body">
                                        최근 1년간 로그인 이력이 없는 계정

 

                                        정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라
                                        
                                        최근 1년간 번개장터 서비스를 이용하지 않은 계정은 휴면계정으로 분류됩니다.
                                        
                                         
                                        
                                        휴면계정으로 전환되는 즉시 고객님의 개인정보는 안전하게 보관되며,
                                        
                                        전환 되기 전 알림을 보내드리니 자세한 내용은 아래를 침고해 주시기 바랍니다.
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne7" aria-expanded="false" aria-controls="collapseOne" style="height: 70px;">
                                        <span class="material-symbols-outlined">
                                            question_mark
                                            </span>
                                            등록한 상품이 갑자기 삭제 됐어요.                                    </button>
                                </h2>
                                <div id="collapseOne7" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" >
                                    <div class="accordion-body">
                                        운영정책위반을 위반한 상품은 삭제 처리 

 

                                        아래와 같이 운영정책을 위반한 상품은 삭제처리 되며 제재를 받을 수 있으니 유의해 주세요.
                                        
                                        나의 제재 현황은 MY > 고객센터 > 내상점 제재내역'을 통해 확인 가능합니다.
                                        
                                         
                                        
                                        [운영정책 위반 대상]
                                        
                                        - 거래금지품목(술,전자담배,계정,의약품 등)을 판매 등록한 경우
                                        
                                        - 타 사이트 홍보 및 외부 url이 있는 경우
                                        
                                        - 도배 또는 카테고리와 맞지 않는 상품인 경우
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne8" aria-expanded="false" aria-controls="collapseOne" style="height: 70px;">
                                        <span class="material-symbols-outlined">
                                            question_mark
                                            </span>
                                            식품 판매 시 허가/신고증 제출 필요한 상품 및 제출 방법은 무엇인가요?

                                    </button>
                                </h2>
                                <div id="collapseOne8" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" >
                                    <div class="accordion-body">
                                        식품 카테고리 중 특정 상품은 필요 서류 제출 후 판매가 가능합니다. 



                                        허가/신고증 필요 상품 판매 절차
                                        
                                        프로상점 가입
                                        
                                        상품에 따른 필요 서류 제출
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne9" aria-expanded="false" aria-controls="collapseOne" style="height: 70px;">
                                        <span class="material-symbols-outlined">
                                            question_mark
                                            </span>
                                            거래금지품목을 거래한 경우 어떻게 제재되나요?
                                    </button>
                                </h2>
                                <div id="collapseOne9" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" >
                                    <div class="accordion-body">
                                        거래금지품목에 따라 기간제 차단 또는 영구 차단 

 

                                        거래금지품목에 따라 제재 수위는 상이하며 기간제 차단 또는 영구 차단으로 진행 됩니다.
                                        
                                        ※ 나의 제재 내역은 'MY > 고객센터 > 내상점 제재내역'을 통해 확인이 가능 합니다.
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne10" aria-expanded="false" aria-controls="collapseOne" style="height: 70px;">
                                        <span class="material-symbols-outlined">
                                            question_mark
                                            </span>
                                            [분쟁해결절차] 상품을 보냈는데, 구매자가 상품금액을 입금하지 않았어요.
                                    </button>
                                </h2>
                                <div id="collapseOne10" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" >
                                    <div class="accordion-body">
                                        사기정황 판단 후 이용 제재 조치

 

                                        거래 시, 구매자의 입금확인 후 거래를 진행해 주세요.
                                        
                                        구매자에게 상품을 발송했으나 상품금액을 입금하지 않는 경우 아래의 요청 자료와 함께 고객센터 > 1:1문의 접수를 부탁드립니다.
                                        
                                        사기정황 판단 후 다른 계정으로도 문제를 발생 시키지 않도록 조치 하겠습니다.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> 
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script>
            function loginPl(){
                window.alert("로그인 후 이용해주세요.");
            }
        </script>
        <%@ include file="../common/footer.jsp"%>
    </body>
</html>

    
