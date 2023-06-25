<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>1대1 문의</title>
        <!-- 부트스트랩 CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

        <!-- bootstrap watch file link -->
        <link rel="stylesheet" href="../../resources/css/bootstrap_th.min.css">

        <!-- bootstrap icons CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

        <style>
            
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
    <body style="height: 1300px;">

        <%@ include file="../common/header.jsp" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> 

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        
        <div id="its">
            <div class="container container2" style="height: 1100px; display: flex; padding: 0px;">
                <div style="width: 300px; margin-right: 80px; margin-top: 80px; height: 280px;">
                    <div class="nav_salt" style="height: 70px; font-size:27px; border-bottom: 1.5px solid gray; padding: 13px; cursor: pointer;">
                        <a  href="<%= contextPath %>" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray;">소금마켓 가기</a>
                    </div>
                    <div class="nav" style="height: 70px; font-size:27px; border-bottom: 1.5px solid gray; padding: 13px; cursor: pointer;">
                        <a  href="<%= contextPath %>/view.cs" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray;">고객센터 가기</a>
                    </div>
                    <div  style="height: 70px; font-size:27px; border-bottom: 1.5px solid gray; padding: 13px;">
                        <span style="color: black; font-weight: 900;">1:1 문의</span>
                    </div>
                    <div  class="nav" style="height: 70px; font-size:27px; border-bottom: 1.5px solid gray; padding: 13px;">
                        <a href="<%= contextPath %>/list.qna?userNo=<%= loginUser.getUserNo() %>&currentPage=1" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray; ">문의 내역</a>
                    </div>
                    <div class="nav" style="height: 70px; font-size:27px; border-bottom: 1.5px solid gray; padding: 13px;">
                        <a href="<%= contextPath %>/faq.no" style="display: inline-block; width: 100%; height: 100%; text-decoration: none; color: gray; ">자주 묻는 질문</a>
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

                <div style="background-color: white; margin-top: 80px; box-shadow: 5px 5px 10px 5px gray; width: 970px;">
                    <form action="<%= contextPath %>/insert.qna" method="post" enctype="multipart/form-data">

                        <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
                        <div style="display: flex; flex-direction: column; padding: 40px; ">
                            <div style="height: 100px; display: flex;">
                                <span style="width: 140px; font-size: 20px;" >유형</span>
                                <select name="category" id="" style="width: 400px; height: 40px;">
                                    <option value="회원/계정">회원/계정</option>
                                    <option value="오류/신고/건의">오류/신고/건의</option>
                                    <option value="기타">기타</option>
                                </select>
                            </div>
                            <div style="height: 100px; display: flex;">
                                <span style="width: 140px; font-size: 20px">제목</span>
                                <input name="title" type="text" style="width: 700px; height: 40px; " required>
                            </div>
                            <div style="height: 350px; display: flex">
                                <span style="width:140px ;font-size: 20px">문의 내용</span>
                                <textarea name="content" id="" cols="30" rows="10" style="width: 700px; height: 300px; resize: none;" required  ></textarea>
                            </div>
                            <div  style="height: 300px; display: flex; flex-wrap: nowrap;">
                                <span style="width: 140px; font-size: 20px" >사진 첨부</span>
                                <div style="border: 1px solid rgb(133, 133, 133); width: 200px; height: 200px; margin-right: 50px; border-radius: 1px;">
                                    <img id="contentImg1" width="100%" height="100%">
                                </div>
                                <div style="border: 1px solid rgb(133, 133, 133); width: 200px; height: 200px; margin-right: 50px; border-radius: 1px;">
                                    <img id="contentImg2" width="100%" height="100%">
                                </div>
                                <div style="border: 1px solid rgb(133, 133, 133); width: 200px; height: 200px; margin-right: 50px; border-radius: 1px;">
                                    <img id="contentImg3" width="100%" height="100%">
                                </div>
                            </div>

                            <div class="file-area">
                                <input type="file" id="file1" name="file1" onchange="loadImg(this, 1);"> 
                                <input type="file" id="file2" name="file2" onchange="loadImg(this, 2);">
                                <input type="file" id="file3" name="file3" onchange="loadImg(this, 3);">
                            </div>
                            <div style="height: 300px; display: flex ; justify-content: center;">
                                <button type="submit" style="width: 265px; height: 60px; background-color: black; color: white; font-size: 25px; font-weight: 900;">등록하기</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!-- 사진 넣기 구문 -->
        <script>
            $(function(){
                $(".file-area").hide(); 

                $("#contentImg1").click(function() {
                    $("#file1").click();
                });

                $("#contentImg2").click(function() {
                    $("#file2").click();
                });

                $("#contentImg3").click(function() {
                    $("#file3").click();
                });

            });

            function loadImg(inputFile, num) {

                if(inputFile.files.length == 1) { 
                    
                    let reader = new FileReader();

                    reader.readAsDataURL(inputFile.files[0]);
                    
                    reader.onload = function(e) {

                        switch(num) {
                            case 1: $("#contentImg1").attr("src", e.target.result); break;
                            case 2: $("#contentImg2").attr("src", e.target.result); break;
                            case 3: $("#contentImg3").attr("src", e.target.result); break;
                        }
                    };
                } else { 

                    switch(num) {
                        case 1: $("#contentImg1").attr("src", null); break;
                        case 2: $("#contentImg2").attr("src", null); break;
                        case 3: $("#contentImg3").attr("src", null); break;
                    }
                }
            }
        </script>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <%@ include file="../common/footer.jsp"%>
    </body>
</html>