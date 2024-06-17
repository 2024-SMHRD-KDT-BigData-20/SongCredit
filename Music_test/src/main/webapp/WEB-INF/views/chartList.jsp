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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="include/header.jsp" />
	<div class="main">
		<div>
			<input type="button">
		</div>
		<table class="newsMainlist">
			<thead>
				<tr>
					<td></td>
					<td>노래제목</td>
					<td>가수</td>
				</tr>
			</thead>
			<tbody class="newtbody">
				<c:forEach var="item" items="${mcList}">
					<tr>
						<td><input type="checkbox"></td>
						<td><img src="${item.album_img }"></td>
						<td>${item.music_title}</td>
						<td>${item.artist}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pagination">
			<c:if test="${pagination.page != 1}">
				<a href="${cpath}/musiccow?searchText=${searchText}&page=1"><i
					class="fas fa-chevron-double-left"></i> </a>
				<a
					href="${cpath}/musiccow?searchText=${searchText}&page=${pagination.page - 1}"><i
					class="fas fa-chevron-left"></i> </a>
			</c:if>
			<c:forEach begin="${pagination.startPage}"
				end="${pagination.endPage}" var="num">
				<c:choose>
					<c:when test="${pagination.page == num}">
						<span class="on">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="${cpath}/musiccow?searchText=${searchText}&page=${num}">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pagination.page != pagination.tempEndPage }">
				<a
					href="${cpath}/musiccow?searchText=${searchText}&page=${pagination.page + 1}"><i
					class="fas fa-chevron-right"></i> </a>
				<a
					href="${cpath}/musiccow?searchText=${searchText}&page=${pagination.endPage}"><i
					class="fas fa-chevron-double-right"></i> </a>
			</c:if>
		</div>
	</div>
	<jsp:include page="include/footer.jsp" />
	<script src="${cpath }/resources/js/index.js"></script>
</body>
</html>