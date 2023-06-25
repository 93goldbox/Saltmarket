<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*, com.saltmarket.notice.model.vo.Notice" %>
<% ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list"); %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>고객센터</title>
        <!-- 부트스트랩 CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

        <!-- bootstrap watch file link -->
        

        <!-- bootstrap icons CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

        <!-- font -->
        
        <!-- trade_board.css -->
        <link rel="stylesheet" href="resources/css/trade_board.css">

        <!-- 구글 아이콘 -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/cesiumjs/1.78/Build/Cesium/Cesium.js"></script> <!--온라인 방식-->
        <style>
            
            #up{
                box-shadow: 1px 2px 10px 5px gray;
                position: relative;
            }

            #up>div{
                padding: 40px;
            }
            .col-qs{
                display: flex;
                justify-content: center;
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
                /* background: linear-gradient(to bottom,lightgray, white); */
            }
            
            #its{
                /* background: linear-gradient(to bottom,lightgray, white); */
            }

            .notice{
                display: flex;
                padding: 13px;
                border-bottom: 1px solid black;
                
            }
            .notice>div span{
                font-size: 20px;
                color: black;
                
            }
            .notice1{
                width: 1090px;
                text-align: start;
                margin: 0px;
            }
            .notice2{
                width: 236px;
                text-align: center;
                padding-left: 20px;
            }
            .noticeList>#title:hover{
                cursor: pointer;
                text-decoration: underline;
            }
        </style>
    </head>
    <body>

        <%@ include file="../common/header.jsp" %>
        <div id="its">
            <div class="container container2" style="height: 1700px;">
                
                <br>
                <div style="display: flex; width: 1300px; justify-content: center; ">
                    <div style="width: 50px;"></div>
                    <div style="  margin: 20px; width: 170px; text-align: center; height: 170px;  border-radius: 100%; background-color: white; box-shadow: 1px 8px 10px 5px gray; ">
                        <% if(loginUser != null) { %>
                            <a href="<%= contextPath %>/enroll.qna" style="width: 100%; height: 100%;">
                                <span class="material-symbols-outlined" style="font-size: 165px; color: #1C8FED;">
                                    communication
                                </span>
                            </a>
                        <% } else { %>
                            <a href="<%= contextPath %>/loginPage.me" style="width: 100%; height: 100%;" onclick ="loginPl();">
                                <span class="material-symbols-outlined" style="font-size: 165px; color: #1C8FED;">
                                    communication
                                </span>
                            </a>
                        <% } %>
                        <p style="margin-top:20px;">1:1문의 하러가기</p>
                    </div>
                    <div style="  margin: 20px; width: 170px; text-align: center; height: 170px;  border-radius: 100%; background-color: white; box-shadow: 1px 8px 10px 5px gray;">
                        <% if(loginUser != null) { %>
                            <a href="<%= contextPath %>/list.qna?userNo=<%= loginUser.getUserNo() %>&currentPage=1" style="width: 100%; height: 100%;">  <!-- 스클립틀릿 두개 보내기-->
                                <span class="material-symbols-outlined" style="font-size: 120px;  padding: 23px 7px 0px 0px ;color: #1C8FED;">
                                    clinical_notes
                                </span>
                            </a>
                        <% } else { %>
                            <a href="<%= contextPath %>/loginPage.me" style="width: 100%; height: 100%;" onclick ="loginPl();">
                                <span class="material-symbols-outlined" style="font-size: 120px;  padding: 23px 7px 0px 0px ;color: #1C8FED;">
                                    clinical_notes
                                </span>
                            </a>
                        <% } %>
                        <p style="margin-top:41px;">내 문의 보러가기</p>
                    </div>
                    <div onclick="scroll1()" style="  margin: 20px; width: 170px; text-align: center; height: 170px;  border-radius: 100%; background-color: white; box-shadow: 1px 8px 10px 5px gray;">
                        <div style="width: 100%; height: 100%;">
                            <span class="material-symbols-outlined" style="font-size: 140px;  padding: 10px 0px 0px 0px; color: #1C8FED;">
                                support_agent
                            </span>
                        </div>
                        <p style="margin-top:20px;">고객센터 번호보기</p>
                    </div>
                    <div style="  margin: 20px; width: 170px; text-align: center; height: 170px;  border-radius: 100%; background-color: white; box-shadow: 1px 8px 10px 5px gray;">
                        <a href="<%= contextPath %>" style="width: 100%; height: 100%;">
                            <img src="resources/image/logo-removebg-preview.png" style="width: 100%; height: 100%;" alt="">
                        </a>
                        <p style="margin-top:20px;">소금마켓 가기</p>
                    </div>
                </div>
                <br><br>
                <span style="display : inline-block; font-size: 25px; font-weight: bolder; color: black; width: 1209px;">자주 묻는 질문 TOP 5</span> 
                <a href="<%= contextPath %>/faq.no" style="text-align: end; font-size: 25px; font-weight: bolder; text-decoration: none; color: black;">전체보기 &gt;</a>
                <br><br>

                <div style="padding: 20px; background-color: white; box-shadow: 5px 5px 10px 5px gray;  border-bottom-right-radius: 20px;">
                    <br>
                    <div style="display: flex; justify-content: center;">
                        <div style="border: 1.5px solid black; width: 1284px;"></div>
                    </div>
                    <div class="accordion" id="accordionExample" style="margin : 20px; ">
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
                    </div>
                </div>
                
                
                
                <div style="margin-top: 80px;">
                    <span style="display : inline-block; font-size: 25px; font-weight: bolder; color: black; width: 1209px;">공지사항</span> 
                    <a href="<%= contextPath %>/list.no?currentPage=1" style="text-align: end; font-size: 25px; text-decoration: none; color: black;">전체보기 &gt;</a>
                </div>
                <br>
                <div id="box1" style="height:400px; background-color: white; box-shadow: 5px 5px 10px 5px gray; border-bottom-right-radius: 20px; ">
                    <div style="padding: 30px;">
                        <div class="notice" style= "border-top: 2px solid black;" >
                            <div class="notice1" style="text-align: center;">
                                <span style="font-size: 20px; font-weight: 900; color: black; text-align: center;">제목</span>
                            </div>
                            <div class="notice2" style="text-align: center;">
                                <span style="font-size: 20px; font-weight: 900; color: black; padding-left: 44px;">등록일</span>
                            </div>
                        </div>

                        <% if(list.isEmpty()) { %>
                            <div class="notice noticeList">
                                <div class="notice1">
                                    <span>등록된 공지사항이 없습니다.</span>
                                </div>
                                <div class="notice2">
                                    <span>2023.03.16</span>
                                </div>
                            </div>
                            <% } else { %>
    
                                <% for(Notice n : list) { %>
                                    <div  class="notice noticeList">
                                        <div id="title"  style="display: flex;">
                                            <span style="display: inline-block; font-size: 0px; width: 0px; height: 0px;"><%= n.getNoticeNo() %></span>
                                            <div class="notice1">
                                                <span><%= n.getNoticeTitle() %></span>
                                            </div>
                                        </div>
                                        <div style="display: flex;">
                                            <span style="display: inline-block; font-size: 0px; width: 0px; height: 0px;"><%= n.getNoticeNo() %></span>
                                            <div class="notice2" style="padding-right: 30px; text-align: start;">
                                                <span><%= n.getCreateDate() %></span>
                                            </div>
                                        </div>
                                    </div>
                                <% } %>
                            <% } %>
                    </div>
                </div>

                <div style="display: flex; margin-top: 80px;">
                    <div style="width: 640px; height: 170px;  margin-right: 48px; background-color: white; box-shadow: 5px 5px 10px 5px gray; border-bottom-right-radius: 20px; padding: 30px 40px; display: flex;">
                        <div style=" background-color: lightgray; border-radius: 100%; width: 110px; ">
                            <span class="material-symbols-outlined" style="font-size: 108px;">
                                support_agent
                            </span>
                        </div>
                        <div style="margin-left:30px">
                            <p style="font-size: 25px; color: black; margin-bottom: 10px ;"> 고객센터 1670-2910</p>
                            <div style="display: flex; height: 33px;" >
                                <p style="font-size: 20px; color: black; margin-right: 10px;">월 ~ 금요일 </p>
                                <p style="font-size: 20px; "> 09:00 ~ 18:00</p>
                            </div>
                            <div style="display: flex;">
                                <p style="font-size: 20px; color: black; margin-right: 2px;">주말, 공휴일</p> <p style="font-size: 20px;">휴무</p>
                            </div>
                            
                        </div>
                    </div>
                    <div style="width: 640px; height: 170px;  background-color: white; box-shadow: 5px 5px 10px 5px gray; border-bottom-right-radius: 20px; padding: 30px 40px; display: flex;">
                        <div style=" background-color: lightgray; border-radius: 100%; width: 110px; ">
                            <span class="material-symbols-outlined" style="font-size: 108px;">
                                pin_drop
                            </span>
                        </div>
                        <div style="margin-left:30px">
                            <p style="font-size: 25px; color: black; margin-bottom: 10px ;"> 소금마켓 오시는 길</p>
                            <div style="display: flex; height: 33px;" >
                                <p style="font-size: 20px; color: black; margin-right: 10px;">여의도점 </p>
                                <p style="font-size: 20px; "> 서울특별시 영등포구 여의대로 108</p>
                            </div>
                            <div style="display: flex;">
                                <p style="font-size: 20px; color: black; margin-right: 2px;">코엑스점</p> 
                                <p style="font-size: 20px;">서울특별시 강남구 영동대로 513</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <script>
            function scroll1(){
                window.scrollTo(0, document.body.scrollHeight);
            }
        </script>

        <script>
            $(function() {
                $(".noticeList #title").click(function() {
                    let nno = $(this).children().eq(0).text();
                    location.href = "<%= contextPath %>/detail.no?nno=" + nno;
                });
            });
        </script>

        <script>
            function loginPl(){
                window.alert("로그인 후 이용해주세요.");
            }
        </script>

    <%@ include file="../common/footer.jsp"%>
    </body>
</html>