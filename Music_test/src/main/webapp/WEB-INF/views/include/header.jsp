<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="utf-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>음악추천정보시스템</title>
<link rel="stylesheet" href="${cpath}/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<div class="header">
		<a href="" class="hamburger-button"> <span></span> <span></span> <span></span>
			<span></span>
		</a>
		<div class="overlay">
			<nav class="menu">
				<ul>
					<li><a href="${cpath}/main">홈</a></li>
					<li><a href="${cpath}/chartList">차트</a></li>
					<li><a href="${cpath}/musiccow">뮤직카우</a></li>
					<li><a href="${cpath}/news">뉴스</a></li>
				</ul>
			</nav>
		</div>
		<div class="logo">
			<a href="${cpath }/main">SongCredit</a>

		</div>
		<div class="search">
			<img src="${cpath}/resources/img/search.png"> <input
				type="text" placeholder="Search...">
		</div>
		<div class="mypage-icon">
			<a href="#"> <img src="${cpath}/resources/img/my.png" alt="">
			</a>
		</div>
		<div class="mypage">
			<c:choose>
				<c:when test="${empty sessionScope.loginMember}">
					<ul>
						<li><a href="${cpath}/login?targetUrl=${targetUrl}">로그인</a></li>
						<li><a href="${cpath}/join?targetUrl=${targetUrl}">회원가입</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul>
						<li>${sessionScope.loginMember.user_nick}님환영합니다</li>
						<li><a href="${cpath}/Logout.do">로그아웃</a></li>
						<li><a href="${cpath}/mypage?${targetUrl}">회원정보</a></li>
						<li><a href="${cpath}/LikeList">찜목록</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<script>
		document.querySelector(".mypage-icon").addEventListener("click",
				function() {
					const mypage = document.querySelector(".mypage");

					if (mypage.style.display === "flex") {
						mypage.style.display = "none";
					} else {
						mypage.style.display = "flex";
					}
				});
	</script>
</body>
</html>