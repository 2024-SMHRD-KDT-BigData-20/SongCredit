<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>찜목록</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>

<body>
	<div class="header">
		<a href="#" class="hamburger-button"> <span></span> <span></span>
			<span></span> <span></span>
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
			<img src="../resources/img/search.png"> <input type="text"
				placeholder="Search...">
		</div>
		<div class="mypage-icon">
			<a href="#"> <img src="../resources/img/my.png" alt="">
			</a>
		</div>
		<div class="mypage">
			<ul>
				<li><a href="logout.java">로그아웃</a></li>
				<li><a href="sign.html">회원정보</a></li>
				<li><a href="">찜목록</a>
					<table>
						<tr>
							<th>사용자 아이디</th>
							<th>관심 아이디</th>
							<th>음악 아이디</th>
							<th>생성일자</th>
						</tr>
					</table></li>

			</ul>
		</div>
	</div>
	<div class="main">
		<table>
			<tr>
				<th>사용자 아이디</th>
				<th>관심 아이디</th>
				<th>음악 아이디</th>
				<th>생성일자</th>
			</tr>
			<c:forEach var="item" items="${LikeList}" >
	${item}
			<tr>
				<td>${item}</td>
				<td>${item.userId}</td>
				<td>music01</td>
				<td>2024-06-01</td>
			</tr>
			</c:forEach>

		</table>
		<table class="newsMainlist">
			<thead>
				<tr>
					<th>찜목록${rrr}</th>
				</tr>
				<tr>
					<td>제목</td>
					<td>가수</td>
					<td>저작권료</td>
					<td>현재가</td>
					<td>전일비</td>
				</tr>
			</thead>
			<tbody class="tbody">
			</tbody>
		</table>
		<div class="pagination"></div>
	</div>
	<div class="footer">
		<div class="logo">Logo</div>
	</div>
	<script> function generateData(page) {
        tbody.innerHTML = "";
        const start = (page - 1) * itemsPerPage + 1;
        const end = page * itemsPerPage;
        for (let i = start; i <= end; i++) {
          let newsTr = document.createElement("tr");
          newsTr.innerHTML = `
            <input type="checkbox">
            <td>앨범</td>
            <td>제목</td>
            <td>가수</td>
            <td>저작권료</td>
            <td>현재가</td>
            <td>전일비</td>
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
    </script>
	<script src="../resources/js/index.js"></script>
</body>

</html>