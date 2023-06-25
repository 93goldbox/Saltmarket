<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.saltmarket.notice.model.vo.*"%>
<%
    ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	Notice n = (Notice)request.getAttribute("n");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>공지사항뷰</title>
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
                .containerNotice {
                    min-width: 970px;
                    
                }
            }
            @media (min-width: 1200px) {
                .containerNotice {
                    max-width: 970px;
                    
                }
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
            
            .nav:hover a{
                color: black !important;
                font-size: 28px;
                
                
            }
            
            .nav_salt:hover a{
                color:  #1C8FED !important;
                font-size: 28px;
            }

            .notice{
                display: flex;
                padding: 20px;
                border-bottom: 1px solid black;
                
            }
            .notice>div span{
                font-size: 20px;
                color: black;
                
            }
            
            .notice1{
                width: 740px;
                text-align: start;
            }
            .notice2{
                width: 160px;
                text-align: center;
                padding-left: 20px;
            }
            

        </style>
    </head>
    <body style="height: 1300px;">
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> 

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

        <%@ include file="../common/header.jsp" %>
        
        <div id="its">
            <div class="container container2" style="height: 1100px; display: flex; padding: 0px;">
                <div style="width: 300px; margin-right: 80px; margin-top: 80px; height: 280px;">
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
                            <a href="<%= contextPath %>/loginPage.me" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray; " onclick ="loginPl();">1:1 문의</a>
                        <% } %>
                    </div>
                    <div  class="nav" style="height: 70px; font-size:27px; border-bottom: 1.5px solid gray; padding: 13px;">
                        <% if(loginUser != null) { %>
                            <a href="<%= contextPath %>/list.qna?userNo=<%= loginUser.getUserNo() %>&currentPage=1" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray; ">문의 내역</a>
                        <% } else { %>
                            <a href="<%= contextPath %>/loginPage.me" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray; " onclick ="loginPl();">문의 내역</a>
                        <% } %>
                    </div>
                    <div class="nav" style="height: 70px; font-size:27px; border-bottom: 1.5px solid gray; padding: 13px;">
                        <a href="<%= contextPath %>/faq.no" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray; ">자주 묻는 질문</a>
                    </div>
                    <div style="height: 70px; font-size:27px; padding: 13px;">
                        <span style="color: black; font-weight: 900;">공지사항</span>
                    </div>
                    
                    <div id="box1" style="height:160px; background-color: white; box-shadow: 5px 5px 10px 5px gray; border-bottom-right-radius: 20px; margin-top: 80px; padding: 20px 0px 20px 50px;">
                        <p style="font-size: 40px; color: #1C8FED; margin: 0px;  ">1670-2910</p>
                        <p style="font-size: 20px; margin: 0px; ">월~금 09:00~18:00</p>
                        <p style="font-size: 20px; ; ">주말, 공휴일 휴무</p>
                    </div>
                </div>

                <div style="background-color: white; margin-top: 80px; box-shadow: 5px 5px 10px 5px gray; width: 970px; height: auto;">
                    <div style="padding: 30px;">
                        <div style="margin-bottom: 16px;">
                            <span style="display: inline-block; width: 680px; font-size: 24px; font-weight: 900; "><%= n.getNoticeTitle() %></span>
                            <span style="display: inline-block; width: 90px; font-size: 17px"><%= n.getCreateDate() %></span>
                            |
                            <span style="display: inline-block; width: 50px; font-size: 17px">조회수</span>
                            <span style="display: inline-block; width: 37px; font-size: 17px; text-align: end;"><%= n.getNoticeViews() %></span>
                        </div>
                        
                        <div style="border-top: 2px solid black;"></div>
                        <div>
                            <% for(int i = 0; i < list.size(); i++) { %>
                                <a href="<%= contextPath %>/<%= list.get(i).getFilePath() + list.get(i).getChangeName() %>">
                                    <img style="width: 300px; height: 300px;" src="<%= contextPath %>/<%= list.get(i).getFilePath() + list.get(i).getChangeName() %>">
                                </a>
                            <% } %>
                        </div>
                        
                    </div>
                    <pre style="padding: 30px; font-size: 21px;  white-space: pre-wrap; height: 100%; ">
<%= n.getNoticeContent() %>
                    </pre>  
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script>
            function loginPl(){
                window.alert("로그인 후 이용해주세요.");
            }
        </script>
        <%@ include file="../common/footer.jsp"%>
    </body>
</html>
