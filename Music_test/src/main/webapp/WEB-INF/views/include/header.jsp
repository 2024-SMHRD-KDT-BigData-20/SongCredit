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
			<a href="javascript:void(0);"> <img
				src="${cpath}/resources/img/my.png" alt="">
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
	document.querySelector(".mypage-icon a").addEventListener("click", function(event) {
		event.preventDefault(); // 기본 동작 방지
		const mypage = document.querySelector(".mypage");

		if (mypage.classList.contains("show")) {
			// 요소가 보여지고 있을 때
			mypage.classList.remove("show");
			// display를 없애기 위해 일정 시간이 지난 후 'none'으로 변경
			setTimeout(() => {
				mypage.style.display = "none";
			}, 10); // 트랜지션 시간과 동일하게 설정
		} else {
			// 요소가 숨겨져 있을 때
			mypage.style.display = "flex"; // display를 먼저 설정
			// 브라우저가 display 설정을 인식할 수 있도록 약간의 지연 시간 설정
			setTimeout(() => {
				mypage.classList.add("show");
			}, 10);
		}
	});
	</script>
</body>
</html>