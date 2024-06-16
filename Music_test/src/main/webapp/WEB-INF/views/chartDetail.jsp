<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chart Detail</title>
<link rel="stylesheet" href="${cpath}/resources/css/style.css">

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
				<div class="wordcount chartFn" onclick="updateChart('Word Count')">Word Count</div>
				<div class="emotion chartFn" onclick="updateCharts('감정분석')">감정분석</div>
			</div>
			<div class="myChart">
				<canvas id="myChart"></canvas>
			</div>
		</div>
		<div class="relatedlist">
			<table class="newslist">
			</table>
			<table class="musiclist"></table>
		</div>
	</div>
	<div class="footer">
		<div class="logo">Logo</div>
	</div>
	<script>
		var cpath = "${cpath}"
	</script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="${cpath}/resources/js/chartDetail.js"></script>
	<script>
		$(document).ready(function() {
			// 페이지가 로드될 때 music 함수 호출
			music();
		});

		function music() {
			$.ajax({
				url : "${cpath}/chartDetail",
				method : 'GET',
				dataType : 'json',
				success : function(data) {
					console.log("가져오기 성공");
					updatemusic(data);
				},
				error : function(error) {
					console.error('Error fetching chart data', error);
				}
			});
		}

		function updatemusic(data) {
			let musicChart = document.getElementById("music-list");
			let musiclist = "";

			$
					.each(
							data,
							function(index, music) {
								musiclist += "<input type='checkbox'>";
								musiclist += "<div class='chart-music'>";
								musiclist += "<div class='music-img'>";
								musiclist += "<img src='" + ${cpath} + "/resources/img/img" + music.music_idx + ".jpg' alt='" + music.music_name + "' width='40px' height='40px'>";
								musiclist += "</div>";
								musiclist += "<div class='music-info'>";
								musiclist += "<div class='music-name'>"
										+ music.music_name + "</div>";
								musiclist += "<div class='music-name'>"
										+ music.music_singer + "</div>";
								musiclist += "</div>";
								musiclist += "</div>";
							});

			// jQuery를 사용하는 경우
			$(musicChart).html(musiclist);
		}
		function updateCharts(data) {
			
		}
	</script>
</body>
</html>
