<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chart Detail</title>
    <link rel="stylesheet" href="${cpath}/resources/css/style.css">
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
                <div class="wordcount chartFn" onclick="updateChart('Word Count')">Word Count</div>
                <div class="emotion chartFn" onclick="updateCharts('감정분석')">감정분석</div>
            </div>
            <div class="myChart">
                <canvas id="myChart"></canvas>
            </div>
        </div>
        <div class="relatedlist">
            <table class="newslist"></table>
            <table class="musiclist"></table>
        </div>
    </div>
    <div class="footer">
        <div class="logo">Logo</div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- 사용자 정의 스크립트 -->
    <script>
        $(document).ready(function() {
            // 페이지가 로드될 때 music 함수 호출
            fetchAllData();
        });

        function fetchAllData() {
			$.when(a("${cpath}/chartDetail", "json", "get")).done(
					function(chartDetailData) {
						callback(chartDetailData[0]);
					}).fail(function() {
				alert("데이터를 가져오는데 실패했습니다.");
				console.error("Failed to fetch data");
			});
		}

        function calback(chartDetailData) {
            let musiclist = "";  // 음악 리스트를 담을 변수

            $.each(chartDetailData, function(index, music) {
                musiclist += "<input type='checkbox'>";
                musiclist += "<div class='chart-music'>";
                musiclist += "<div class='music-img'>";
                musiclist += "<img src='" + music.album_img + "' width='40px' height='40px'>";
                musiclist += "</div>";
                musiclist += "<div class='music-info'>";
                musiclist += "<div class='music-name'>" + music.music_title + "</div>";
                musiclist += "<div class='music-name'>" + music.artist + "</div>";
                musiclist += "</div>";
                musiclist += "</div>";
            });

            // music_list 요소에 생성된 HTML을 삽입
            $("#music-list").html(musiclist);
        }

        function updateCharts(data) {
            // 차트 업데이트 로직
        }
    </script>
    <script src="${cpath}/resources/js/index.js"></script>
</body>
</html>
