<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="header">
        <a href="#" class="hamburger-button">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </a>
        <div class="overlay">
            <nav class="menu">
                <ul>
                    <li><a href="main.html">홈</a></li>
                    <li><a href="chart.html">차트</a></li>
                    <li><a href="news.html">뉴스</a></li>
                </ul>
            </nav>
        </div>
        <div class="logo">
            <a href="main.html">Logo</a>
        </div>
        <div class="search">
            <img src="img/search.png">
            <input type="text" placeholder="Search...">
        </div>
        <div class="mypage-icon">
            <a href="#">
                <img src="img/my.png" alt="">
            </a>
        </div>
        <div class="mypage">
            <ul>
                <li><a href="logout.java">로그아웃</a></li>
                <li><a href="sign.html">회원정보</a></li>
                <li><a href="">찜목록</a></li>
            </ul>
        </div>
    </div>
    <div class="main">
            <table class="newsMainlist">
                <thead>
                    <tr>
                        <th>뉴스목록</th>
                    </tr>
                    <tr>
                        <!-- <td>썸네일</td> -->
                        <td>제목</td>
                        <td>날짜</td>
                    </tr>
                </thead>
                <tbody class="newtbody">
                </tbody>
            </table>
            <div class="pagination"></div>
    </div>
    <div class="footer">
        <div class="logo">
            Logo
        </div>
    </div>
    <script>document.addEventListener("DOMContentLoaded", function () {
        const tbody = document.querySelector(".newtbody");
        const pagination = document.querySelector(".pagination");
        const totalItems = 100;
        const itemsPerPage = 10;
        const totalPages = Math.ceil(totalItems / itemsPerPage);
      
        // 데이터 생성 함수
        function generateData(page) {
          tbody.innerHTML = "";
          const start = (page - 1) * itemsPerPage + 1;
          const end = page * itemsPerPage;
          for (let i = start; i <= end; i++) {
            let newsTr = document.createElement("tr");
            newsTr.innerHTML = `
            <!-- <td>썸네일</td> -->
            <td>제목</td>
            <td>날짜</td>
            `;
            tbody.appendChild(newsTr);
          }
        }
      
        // 페이징 버튼 생성 함수
        function generatePagination() {
          pagination.innerHTML = "";
          for (let i = 1; i <= totalPages; i++) {
            let pageButton = document.createElement("button");
            pageButton.innerText = i;
            pageButton.addEventListener("click", function () {
              generateData(i);
            });
            pagination.appendChild(pageButton);
          }
        }
      
        // 초기 데이터 및 페이징 생성
        generateData(1);
        generatePagination();
      });</script>
    <script src="js/index.js"></script>
</body>
</html>