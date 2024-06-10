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
	<%@include file="include/header.jsp"%>
	<div class="main">
		<!-- 메인 컨테이너 -->
		<div class="maincontainer" id="maincontainer">
			<div class="TopMusicChart">
				<i>Top 추천곡 리스트</i>
				<button id="prevBtn">이전</button>
				<div class="slider" id="gridContainer"></div>
				<button id="nextBtn">다음</button>
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
		<%@include file="include/Login.jsp"%>
		<!-- 회원가입 컨테이너 -->
		<div class="joincontainer" style="display: none">
			<div class="text-box">
				<div>Sign Up</div>
			</div>
			<form action="${cpath}/Join.do" id="Form" method="post">
				<div class="Text-Field">
					<label for="">아이디</label>
					<div class="input-box">
						<input type="id" placeholder="아이디를 입력해주세요" class="id"
							name="user_id">
					</div>
				</div>
				<div class="Text-Field">
					<label for="">닉네임</label>
					<div class="input-box">
						<input type="text" placeholder="닉네임을 입력해주세요" class="nick"
							name="user_nick">
					</div>
				</div>
				<div class="Text-Field">
					<label for="">비밀번호</label>
					<div class="input-box">
						<input type="password" placeholder="비밀번호를 입력해주세요" id="password"
							name="user_pw" required=""> <span
							class="password-toggle-icon"><i class="fas fa-eye"></i></span>
					</div>

				</div>
				<div class="Text-Field">
					<label for="">비밀번호 확인</label>
					<div class="input-box">
						<input type="password" placeholder="비밀번호를 다시 한번 입력해주세요"
							class="password"> <span class="password-toggle-icon"><i
							class="fas fa-eye"></i></span>
					</div>
				</div>
				<div class="Text-Field email">
					<label for="">E-mail</label>
					<div class="emailbox">
						<div class="input-box">
							<input class="box" type="text" placeholder="이메일을 입력하세요">
						</div>
						<p>@</p>
						<div class="input-box">
							<input type="text" id="domain-txt"> <select class="box"
								name="" id="domain-list">
								<option value="text">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.com">daum.com</option>
								<option value="gmail.com">gmail.com</option>
							</select>
						</div>
					</div>
				</div>
				<input type="hidden" id="full-email" name="user_email" value="">
				<div class="Text-Field">
					<label for="">생년월일</label>
					<div class="input-box">
						<input type="text" placeholder="ex)20000803" class="birth"
							name="user_birth">
					</div>
				</div>
				<div class="Text-Field">
					<label for="user_gender">성별</label>
					<div class="check-box">
						<div>
							<input type="radio" id="male" name="user_gender" value="남자">
							<label for="male">남자</label>
						</div>
						<div>
							<input type="radio" id="female" name="user_gender" value="여자">
							<label for="female">여자</label>
						</div>
					</div>
				</div>
				<div class="sep"></div>
				<div class="link">
					<a href="javascript:void(0);" onclick="showSignIn()">go to the
						Sign In</a>
				</div>
				<div class="button">
					<input type="submit" value="Sign Up"></input>
				</div>
			</form>
		</div>
		<!-- 아이디찾기 -->
		<div class="FindIdcontainer" style="display: none">
			<div class="text-box">
				<div>Find Id</div>
			</div>
			<form action="${cpath}/FindId.do" method="post">
				<div class="Text-Field">
					<label for="">생년월일</label>
					<div class="input-box">
						<input type="text" placeholder="생년월일" class="" name="user_birth">
					</div>
				</div>
				<div class="Text-Field">
					<label for="">이메일</label>
					<div class="input-box password">
						<input type="text" placeholder="이메일을 입력하세요" class="email"
							name="user_email">
					</div>
				</div>
				<div class="button">
					<input type="button" value="Forgot Password?"
						onclick="showFindPw()"> <input type="submit" value="Find">
				</div>
			</form>
		</div>
		<!-- 비밀번호찾기 -->
		<div class="FindPwcontainer" style="display: none;">
			<div class="text-box">
				<div>Find Pw</div>
			</div>
			<form action="${cpath}/Findpw.do" method="post">
				<div class="Text-Field">
					<label for="">아이디</label>
					<div class="input-box">
						<input type="text" placeholder="아이디를 입력해주세요" class="id"
							name="user_id">
					</div>
				</div>
				<div class="Text-Field">
					<label for="">비밀번호</label>
					<div class="input-box password">
						<input type="text" placeholder="이메일을 입력해주세요" class=""
							name="user_email">
					</div>
				</div>
				<div class="button">
					<input type="button" value="Forgot Id?" onclick="showFindId()">
					<input type="submit" value="Find">
				</div>
			</form>
		</div>
	</div>
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
