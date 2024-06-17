<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chart Detail</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ include file="include/header.jsp"%>
	<div class="main">
		<div class="chart-music">
			<div id="music-list"></div>
		</div>
		<div class="chart-graph">
			<div class="chart-nav">
				<div class="volume chartFn" onclick="updateChart('거래량')">거래량</div>
				<div class="like chartFn" onclick="updateChart('좋아요수')">좋아요수</div>
				<div class="price chartFn" onclick="updateChart('가격')">가격</div>
				<div class="wordcount chartFn" onclick="updateChart('Word Count')">Word
					Count</div>
				<div class="emotion chartFn" onclick="updateCharts('감정분석')">감정분석</div>
			</div>
			<div class="myChart">
				<canvas id="myChart"></canvas>
			</div>
		</div>
		<div class="relatedlist">
			<table class="newslist">
				<thead>
					<tr>
						<th colspan="3">관련뉴스</th>
					</tr>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>일자</td>
					</tr>
				</thead>
				<tbody class="initalizenews" id="initalizenews">
				</tbody>
			</table>
			<table class="musiclist"></table>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<!-- 사용자 정의 스크립트 -->
	<script>
		$(document).ready(function() {
			const musicIdx = getParameterByName('item');
			if (musicIdx) {
				fetchChartData(musicIdx);
			} else {
				console.error("음악 인덱스가 제공되지 않았습니다.");
			}
		});

		function getParameterByName(name) {
			const url = new URL(window.location.href);
			const paramValue = url.searchParams.get(name);
			return paramValue ? paramValue : null;
		}

		function fetchChartData(musicIdx) {
			$.ajax({
				url : `${cpath}/getChart?music_idx=${musicIdx}`,
				type : "GET",
				dataType : "json",
				success : function(data) {
					displayChartData(data);
				},
				error : function() {
					alert("차트 데이터를 가져오는데 실패했습니다.");
					console.error("Failed to fetch chart data");
				}
			});
		}

		function displayChartData(chartData) {
			let mslist = "";
			mslist += "<img src='" + chartData.album_img + "' width='100px' height='100px'>";
			mslist += "<div>" + chartData.music_title + "</div>";
			mslist += "<div>" + chartData.artist + "</div>";
			$("#music-list").html(mslist);
		}
	</script>
	<script src="${cpath}/resources/js/index.js"></script>
</body>
</html>
