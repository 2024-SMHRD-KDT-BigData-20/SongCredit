<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="utf-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SongCredic</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ include file="./include/header.jsp" %>
	<div class="main">
		<!-- 메인 컨테이너 -->
		<div class="maincontainer" id="maincontainer">
			<div class="TopMusicChart">
				<h3>Top 추천곡 리스트</h3>
				<div class="slider-container">
					<button id="prevBtn" class="slider-button">＜</button>
					<div class="slider" id="gridContainer"></div>
					<button id="nextBtn" class="slider-button">＞</button>
				</div>
			</div>
			<div class="sep"></div>
			<h3>Top 뮤직카우 리스트</h3>
			<div class="TopmusicCow">
				<table>
					<thead>
						<tr>
							<th colspan="5">상한가</th>
						</tr>
						<tr>
							<td>제목</td>
							<td>가수</td>
							<td>상한가</td>
							<td>하양가</td>
							<td>전일비</td>
						</tr>
					</thead>
					<tbody class="musiccowupper" id="musiccowupper"></tbody>
				</table>
				<table>
					<thead>
						<tr>
							<th colspan="5">하한가</th>
						</tr>
						<tr>
							<td>제목</td>
							<td>가수</td>
							<td>상한가</td>
							<td>하양가</td>
							<td>전일비</td>
						</tr>
					</thead>
					<tbody class="musiccower" id="musiccowunder"></tbody>
				</table>
			</div>

			<div class="sep"></div>
			<div class="topnewsList">
				<h3>뉴스 정보 리스트</h3>
				<table>
					<thead>
						<tr>
							<th colspan="2">뉴스목록</th>
						</tr>
						<tr>
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
					a("${cpath}/topnewsList", "json", "get"),
					a("${cpath}/topmusiccow", "json", "get"),
					a("${cpath}/undermusiccow", "json", "get")).done(
					function(chartData, newsData, upperData, underData) {
						console.log("Data fetched successfully");
						callback(chartData[0], newsData[0], upperData[0],
								underData[0]);
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

		function callback(chartData, newsData, upperData, underData) {
			updateChartList(chartData);
			updatenewsList(newsData);
			updateMusicCowList(upperData, 'musiccowupper');
			updateMusicCowList(underData, 'musiccowunder');
		}

		function updateChartList(chartData) {
			const container = $('#gridContainer');
			let bList = '';

			$
					.each(
							chartData,
							function(index, item) {
								bList += "<div class='cList'>";
								bList += "<a href='"
										+ "${cpath}/chartDetail?music_idx="
										+ item.music_idx + "'>";
								bList += "<img src='" + item.album_img + "' width='100px' height='100px'>";
								bList += "<h4>" + item.music_title + "</h4>";
								bList += "<h5>" + item.artist + "</h5>";
								bList += "<h5>" + item.music_genre + "</h5>";
								bList += "<p>판매량: " + item.upper_limit + "</p>";
								bList += "<p>현재가: " + item.under_limit + "</p>";
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

		function updateMusicCowList(data, elementId) {
			let element = $('#' + elementId);
			let content = '';
			$.each(data, function(index, item) {
				content += "<tr>";
				content += "<td>" + item.music_title + "</td>";
				content += "<td>" + item.artist + "</td>";
				content += "<td>" + item.upper_limit + "</td>";
				content += "<td>" + item.under_limit + "</td>";
				content += "<td>" + item.net_change + "</td>";
				content += "</tr>";
			});
			element.html(content);
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
