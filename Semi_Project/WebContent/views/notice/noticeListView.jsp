	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.saltmarket.notice.model.vo.Notice, 
    com.saltmarket.common.model.vo.PageInfo, com.saltmarket.member.model.vo.Member"%>


<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
    
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>공지사항</title>
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

            .d-flex{
                width:800px;
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
                width: 720px;
                text-align: start;
            }
            .notice2{
                width: 160px;
                text-align: center;
                padding-left: 20px;
            }
            
            .noticeList>#title:hover{
                cursor: pointer;
                text-decoration: underline;
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
                            <a href="<%= contextPath %>/loginPage.me" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray; "onclick ="loginPl();">문의 내역</a>
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

                <div style="background-color: white; margin-top: 80px; box-shadow: 5px 5px 10px 5px gray; width: 970px; height: 890px;">
                    <div style="padding: 30px;">
                        <div class="notice" style= "border-top: 2px solid black;" >
                            <div class="notice1" style="text-align: center;">
                                <span style="font-size: 20px; font-weight: 900; color: black; text-align: center;">제목</span>
                            </div>
                            <div class="notice2" style="text-align: center;">
                                <span style="font-size: 20px; font-weight: 900; color: black; padding-left: 25px;">등록일</span>
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
                                <div class="notice noticeList" style="padding: 0px;">
                                    <div id="title" style="display: flex;">
                                        <span style="display: inline-block; font-size: 0px; width: 0px; height: 0px;"><%= n.getNoticeNo() %></span>
                                        <div class="notice1 " style=" margin: 20px;">
                                            <span><%= n.getNoticeTitle() %></span>
                                        </div>
                                    </div>
                                    <div style="display: flex;">
                                        <span style="display: inline-block; font-size: 0px; width: 0px; height: 0px;"><%= n.getNoticeNo() %></span>
                                        <div class="notice2" style="padding-right: 30px;  margin: 20px 0px 20px 0px  ">
                                            <span><%= n.getCreateDate() %></span>
                                        </div>
                                    </div>
                                </div>
                            <% } %>
                        <% } %>
                    </div>

                    <div align="center" class="paging-area">
                        <% if(currentPage != 1) { %>
                            <button onclick="location.href = '<%= contextPath %>/list.no?currentPage=<%= currentPage - 1 %>';">
                                &lt;
                            </button>
                        <% } %>
                        <% for(int p = startPage; p <= endPage; p++) { %>
                            <% if(p != currentPage) { %>
                                <button onclick="location.href = '<%= contextPath %>/list.no?currentPage=<%= p %>';">
                                    <%= p %>
                                </button>
                            <% } else { %>
                                <button disabled><%= p %></button>
                            <% } %>
                        <% } %>
                        
                        <% if(currentPage != maxPage) { %>
                            <button onclick="location.href = '<%= contextPath %>/list.no?currentPage=<%= currentPage + 1 %>';">
                                &gt;
                            </button>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <%@ include file="../common/footer.jsp"%>
    </body>
</html>
