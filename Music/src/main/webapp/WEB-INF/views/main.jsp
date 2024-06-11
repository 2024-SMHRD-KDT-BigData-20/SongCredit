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
		<!-- 메인 컨테이너 -->
		<div class="maincontainer" id="maincontainer">
			<div class="TopMusicChart">
				<i>Top 추천곡 리스트</i>
				<button id="prevBtn">이전</button>
				<div class="slider" id="gridContainer"></div>
				<button id="nextBtn">다음</button>
			</div>
			<div class="TopmusicCow">
				<i>Top 뮤직카우 리스트</i>

			</div>
			<div class="topnewsList">
				<i>뉴스 정보 리스트</i>
				<table>
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
					<tbody class="newtbody" id="newsbody">
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="include/footer.jsp" />
	<script>
		$(document).ready(function() {
			console.log("Document ready");
			fetchAllData();

			$('#prevBtn').click(function() {
				slide(-1);
			});

			$('#nextBtn').click(function() {
				slide(1);
			});
		});

		let currentSlide = 0;
		const itemsPerPage = 6;

		function fetchAllData() {
			console.log("Fetching all data");
			$.when(a("${cpath}/chart", "json", "get"),
					a("${cpath}/topnewsList", "json", "get")).done(
					function(chartData, newsData) {
						console.log("Data fetched successfully");
						callback(chartData[0], newsData[0]);
					}).fail(function() {
				alert("데이터를 가져오는데 실패했습니다.");
				console.error("Failed to fetch data");
			});
		}

		function a(url, dataType, type) {
			return $.ajax({
				url : url,
				type : type,
				dataType : dataType
			});
		}

		function callback(chartData, newsData) {
			updateChartList(chartData);
			updatenewsList(newsData);
		}

		function updateChartList(chartData) {
			const container = $('#gridContainer');
			let bList = '';

			$
					.each(
							chartData,
							function(index, item) {
								bList += "<div class='cList'>";
								bList += "<a href='" + "${cpath}"
										+ "/chartDetail.do?chart_indx="
										+ item.chart_indx + "'>";
								bList += "<img src='" + "${cpath}" + "/resources/img/img" + item.music_idx + ".jpg' alt='" + item.music_name + "'>";
								bList += "<h4>" + item.music_name + "</h4>";
								bList += "<h5>" + item.music_singer + "</h5>";
								bList += "<p>판매량: " + item.chart_sl + "</p>";
								bList += "<p>현재가: " + item.chart_now + "</p>";
								bList += "</a>";
								bList += "</div>";
							});
			container.html(bList);
			updateSlider();
		}

		function updatenewsList(newsData) {
			let topnewslist = $('#newsbody');
			let newsTable = '';
			const newssData = newsData.slice(0, 10);
			$.each(newssData, function(index, news) {
				newsTable += "<tr>";
				newsTable += "<td>" + news.news_title + "</td>";
				newsTable += "<td>" + news.pressed_at + "</td>";
				newsTable += "</tr>";
			});
			topnewslist.html(newsTable);
		}

		function slide(direction) {
			const totalItems = $('#gridContainer .cList').length;
			const totalPages = Math.ceil(totalItems / itemsPerPage);
			currentSlide += direction;

			if (currentSlide < 0) {
				currentSlide = totalPages - 1;
			} else if (currentSlide >= totalPages) {
				currentSlide = 0;
			}

			updateSlider();
		}

		function updateSlider() {
			const items = $('#gridContainer .cList');
			const start = currentSlide * itemsPerPage;
			const end = start + itemsPerPage;

			items.hide().slice(start, end).show();
		}
	</script>
	<script src="${cpath}/resources/js/index.js" type="text/javascript"></script>
</body>
</html>
