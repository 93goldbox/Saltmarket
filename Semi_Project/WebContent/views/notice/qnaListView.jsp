<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.saltmarket.notice.model.vo.*, 
    com.saltmarket.common.model.vo.PageInfo" %>
<%
    PageInfo pi = (PageInfo)request.getAttribute("pi");
    ArrayList<QNA> list = (ArrayList<QNA>)request.getAttribute("list");
    ArrayList<Attachment> aList = (ArrayList<Attachment>)request.getAttribute("aList");
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
        <title>문의 내역</title>
        
        <!-- 부트스트랩 CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        
        <!-- bootstrap watch file link -->
        <link rel="stylesheet" href="../../resources/css/bootstrap_th.min.css">
        
        <!-- bootstrap icons CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        
        <!-- font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
        
        <!-- trade_board.css -->
        <link rel="stylesheet" href="../../resources/css/trade_board.css">
        
        <!-- 구글 아이콘 -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <style style="height: 3000px;">
/*             
            @media (max-height: 1000px) {
                .container2 {
                    min-height: 500px !important;
                }
            } */
            .col-qs{
                text-align: start; 
            }

            .container2{
                
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
            .notice{
                display: flex;
                padding: 20px;
                border-bottom: 1px solid gray;
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

            #title:hover{
                text-decoration: underline;
                cursor: pointer;
            }
            

        </style>
    </head>
    <body>

        <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script>
        $(document).ready(function(){
            $("#title").click(function(){
                if($("#conts").is(":visible")){
                    $("#conts").css("display", "none");
                }else{
                    $("#conts").css("display", "block");
                }
            });
        });
        </script>
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> 

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

        <%@ include file="../common/header.jsp" %>
        
        <div id="its">
            <div class="container container2" style=" display: flex; padding: 0px; ">
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
                            <a href="<%= contextPath %>/loginPage.me" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray; ">1:1 문의</a>
                        <% } %>
                    </div>
                    <div  style="height: 70px; font-size:27px; border-bottom: 1.5px solid gray; padding: 13px;">
                        <span style="color: black; font-weight: 900;">문의 내역</span>
                    </div>
                    <div class="nav" style="height: 70px; font-size:27px; border-bottom: 1.5px solid gray; padding: 13px;">
                        <a href="<%= contextPath %>/faq.no" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray; ">자주 묻는 질문</a>
                    </div>
                    <div  class="nav" style="height: 70px; font-size:27px; padding: 13px;">
                        <a href="<%= contextPath %>/list.no?currentPage=1" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray; ">공지사항</a>
                    </div>
                    
                    <div id="box1" style="height:160px; background-color: white; box-shadow: 5px 5px 10px 5px gray; border-bottom-right-radius: 20px; margin-top: 80px; padding: 20px 0px 20px 50px;">
                        <p style="font-size: 40px; color: #1C8FED; margin: 0px;  ">1670-2910</p>
                        <p style="font-size: 20px; margin: 0px; ">월~금 09:00~18:00</p>
                        <p style="font-size: 20px; ; ">주말, 공휴일 휴무</p>
                    </div>
                </div>

                <div style="background-color: white; margin-top: 80px; box-shadow: 5px 5px 10px 5px gray; height: auto; min-height: 700px; ">
                    <div style="padding: 30px; width: 970px;">
                        <table style="color: black; font-size: 20px;">
                            <thead style="border-top: 2px solid black; border-bottom: 1px solid;">
                                <tr>
                                    <th style="width:150px; text-align: center; padding: 20px;">문의 유형</th>
                                    <th style="width:490px; text-align: center; padding: 20px;">제목</th>
                                    <th style="width:150px; text-align: center; padding: 20px;">작성일</th>
                                    <th style="width:150px; text-align: center; padding: 20px;">처리상태</th>
                                </tr>
                            </thead>

                            <tbody id="contents">
                                <% if(list.isEmpty()) { %>
                                    <tr>
                                        <td colspan="4" style="text-align: center; padding: 20px;">문의 내역이 없습니다.</td>
                                    </tr>
                                <% } else {%>
                                    <% for (QNA q : list) { %>
                                        <tr id="title" style="border-bottom: 1.5px solid black; " onclick="toggleContent(<%= q.getQnaNo() %>)">
                                            <td style="text-align: center; padding: 20px;"> <%= q.getqCategory() %> </td>
                                            <td style="text-align: start; padding: 20px; "> <%= q.getqTitle()  %> </td>
                                            <td style="text-align: center; padding: 20px; "> <%= q.getqDate() %> </td>
                                            <% if (q.getaContent() == null) { %>
                                                <td style="text-align: center; padding: 20px; ">아직</td>
                                            <% } else { %>
                                                <td style="text-align: center; padding: 20px; ">완료</td>
                                            <% } %>
                                        </tr>
                                        <tr class="content content<%= q.getQnaNo() %>" 
                                            style= "display: none; border-bottom: 1.5px solid black; border-left: 1px solid black; border-right: 1px solid black;"  >
                                            <td colspan="4" style=" padding: 20px; ">
                                                <pre>
<%= q.getqContent() %>
                                                </pre>
                                                <% if(!aList.isEmpty()) {%>
                                                    <% for(int i = 0; i<aList.size(); i++) { %>
                                                        <% if(aList.get(i).getRefNo() == q.getQnaNo()) { %>
                                                            <a href="<%= contextPath %>/<%= aList.get(i).getFilePath() + aList.get(i).getChangeName() %>">
                                                                <img src="<%= contextPath %>/<%= aList.get(i).getFilePath() + aList.get(i).getChangeName() %>" alt=""
                                                                width="280" height="200">
                                                            </a>
                                                        <% } %>
                                                    <% } %>
                                                <% } %>
                                                
                                                <div style="text-align: right; margin-top: 20px;">
                                                    
                                                    <a href="<%= contextPath %>/delete.qna?qno=<%= q.getQnaNo() %>&qWriter=<%= q.getqWriter() %>" style="text-decoration: none; color: black; font-size: 20px; margin-right: 20px; border: 1px solid black;">삭제</a>
                                                </div>
                                                
                                            </td>
                                        </tr>
                                        <% if(q.getaContent()!= null) { %>
                                            <tr class="content content<%= q.getQnaNo() %>" 
                                                style= "display: none; border-bottom: 1.5px solid black; border-left: 1px solid black; border-right: 1px solid black;"  >
                                                <td colspan="4" style=" padding: 20px; ">
                                                    <pre>
<%= q.getaContent() %>
                                                    </pre>
                                                </td>
                                            </tr>
                                        <% } else { %>
                                            <tr class="content content<%= q.getQnaNo() %>" 
                                                style= "display: none; border-bottom: 1.5px solid black; border-left: 1px solid black; border-right: 1px solid black;"  >
                                                <td colspan="4" style=" padding: 20px; ">
                                                    <pre>
답변이 등록되지 않았습니다.
                                                    </pre>
                                                </td>
                                            </tr>
                                        <% } %>
                                    <% } %>
                                <% } %>
                                    
                            </tbody>
                        </table>
                    </div>

                    <div align="center" class="paging-area">
                        <% if(currentPage != 1) { %>
                            <button onclick="location.href = '<%= contextPath %>/list.qna?currentPage=<%= currentPage - 1 %>';">
                                &lt;
                            </button>
                        <% } %>
                        <% for(int p = startPage; p <= endPage; p++) { %>
                            <% if(p != currentPage) { %>
                                <button onclick="location.href = '<%= contextPath %>/list.qna?currentPage=<%= p %>';">
                                    <%= p %>
                                </button>
                            <% } else { %>
                                <button disabled><%= p %></button>
                            <% } %>
                        <% } %>
                        
                        <% if(currentPage != maxPage) { %>
                            <button onclick="location.href = '<%= contextPath %>/list.qna?currentPage=<%= currentPage + 1 %>';">
                                &gt;
                            </button>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        
        
        <script>
            function toggleContent(qnoNo) {
                console.log(document.querySelectorAll('.content' + qnoNo));
                console.log('.content' + qnoNo);
                var content = document.querySelectorAll('.content' + qnoNo);
                for(var i = 0; i < content.length; i++) {
                    if (content[i].style.display == "none") {
                        content[i].style.display = "table-row";
                    } else {
                        content[i].style.display = "none";
                    }
                }
                
            }
        </script>
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <%@ include file="../common/footer.jsp"%>
    </body>
</html>
    