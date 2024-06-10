<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chart Detail</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
	<script>
		var cpath = "${pageContext.request.contextPath}";
	</script>
	<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
	<script>
		loadHeader(cpath);
	</script>
    <div class="main">
        <div class="chart-music">
            <div class="music-img">
                <img src="${pageContext.request.contextPath}/resources/img/img-icon.png" alt="" width="40px" height="40px">
            </div>
            <div class="music-info">
                <div class="music-name">노래제목(YYYY,MM,DD)</div>
                <div class="music-name">가수</div>
            </div>
        </div>
        <div class="chart-graph">
            <div class="chart-nav">
                <div class="price" onclick="updateChart('시세')">시세</div>
                <div class="views" onclick="updateChart('조회수')">조회수</div>
                <div class="like" onclick="updateChart('좋아요수')">좋아요수</div>
                <div class="streaming" onclick="updateChart('스트리밍수')">스트리밍수</div>
                <div class="keyword" onclick="updateChart('키워드')">키워드</div>
                <div class="volume" onclick="updateChart('거래량')">거래량</div>
                <div class="emotion" onclick="updateChart('감정분석')">감정분석</div>
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
        <div class="logo">
            Logo
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/chartDetail.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
</body>
</html>
