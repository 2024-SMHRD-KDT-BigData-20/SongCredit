<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 페이지내에서 jstl을 사용해서 변수로 프로젝트 ContextPath 저장 --%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="utf-8">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>음악추천정보시스템</title>
<link rel="stylesheet" href="${cpath}/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
					<td>썸네일</td>
					<td>제목</td>
					<td>본문</td>
					<td>날짜</td>
					<td>언론사</td>
					
				</tr>
				<c:forEach var="item" items="${NewsList}">
					<tr>
						<td>썸네일</td>
						<td>${item.news_title}</td>
						<td>${item.news_content}</td>
						<td>${item.pressed_at}</td>
						<td>${item.news_maker}</td>
					</tr>
				</c:forEach>
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