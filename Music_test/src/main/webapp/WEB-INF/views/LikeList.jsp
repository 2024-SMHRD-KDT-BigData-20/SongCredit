<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>찜목록</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>

<body>
	<script src="${cpath}/resources/js/header.js"></script>
	<div class="main">
		<table>
			<tr>
				<th>사용자 아이디</th>
				<th>관심 아이디</th>
				<th>음악 아이디</th>
				<th>생성일자</th>
			</tr>
			<c:forEach var="item" items="${LikeList}" >
			<tr>
				<td>${item.user_id}</td>
				<td>${item.music_idx}</td>
				<td>${item.interest_idx}</td>
				<td>${item.created_at}</td>
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