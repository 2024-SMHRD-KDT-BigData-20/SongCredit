<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
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
	<jsp:include page="include/header.jsp" />
	<div class="main">
		<table class="newsMainlist">
			<thead>
				<tr>
					<th>뉴스목록</th>
				</tr>
				<tr>
					<td>썸네일</td>
					<td>번호</td>
					<td>제목</td>
					<td>본문</td>
					<td>날짜</td>
					<td>언론사</td>
				</tr>
			</thead>
			<tbody class="newtbody">
				<c:forEach var="item" items="${NewsList}">
					<a href="">
						<tr>
							<td>썸네일</td>
							<td>${item.news_idx}</td>
							<td>${item.news_title}</td>
							<td>${item.news_content}</td>
							<td>${item.pressed_at}</td>
							<td>${item.news_maker}</td>
						</tr>
					</a>
				</c:forEach>
			</tbody>
		</table>

		<div class="pagination">
			<c:if test="${pagination.page != 1}">
				<a href="${cpath}/news?searchText=${searchText}&page=1">first
					page<i class="far fa-chevron-double-left"></i>
				</a>
				<a
					href="${cpath}/news?searchText=${searchText}&page=${pagination.page - 1}">before
					page<i class="far fa-chevron-left"></i>
				</a>
			</c:if>
			<c:forEach begin="${pagination.startPage}"
				end="${pagination.endPage}" var="num">
				<c:choose>
					<c:when test="${pagination.page == num}">
						<span class="on">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="${cpath}/news?searchText=${searchText}&page=${num}">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pagination.page != pagination.tempEndPage }">
				<a
					href="${cpath}/news?searchText=${searchText}&page=${pagination.page + 1}">next
					page<i class="far fa-chevron-right"></i>
				</a>
				<a
					href="${cpath}/news?searchText=${searchText}&page=${pagination.endPage}">final
					page<i class="far fa-chevron-double-right"></i>
				</a>
			</c:if>
		</div>
	</div>
	<jsp:include page="include/footer.jsp"></jsp:include>
	<script src="${cpath }/resources/js/index.js"></script>
</body>
</html>
