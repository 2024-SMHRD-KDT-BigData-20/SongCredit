<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 페이지내에서 jstl을 사용해서 변수로 프로젝트 ContextPath 저장 --%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
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
	<div class="header">
		<a href="" class="hamburger-button"> <span></span> <span></span> <span></span>
			<span></span>
		</a>
		<div class="overlay">
			<nav class="menu">
				<ul>
					<li><a href="main.jsp">홈</a></li>
					<li><a href="chartList.do">차트</a></li>
					<li><a href="news.do">뉴스</a></li>
				</ul>
			</nav>
		</div>
		<div class="logo">
			<a href="main.jsp">Logo</a>
		</div>
		<div class="search">
			<img src="../resources/img/search.png"> <input type="text"
				placeholder="Search...">
		</div>
		<div class="mypage-icon">
			<a href="#"> <img src="../resources/img/my.png" alt="">
			</a>
		</div>
		<div class="mypage">
			<c:choose>
				<c:when test="${empty loginMember}">
					<ul>
						<li><a href="javascript:void(0);" onclick="showSignIn()">로그인</a></li>
						<li><a href="javascript:void(1);" onclick="showJoinIn()">회원가입</a></li>
					</ul>
				</c:when>

				<c:otherwise>
					<ul>
						<li>${loginMember.user_nick}님환영합니다</li>
						<li><a href="${cpath}/Logout.do">로그아웃</a></li>
						<li><a href="sign.jsp">회원정보</a></li>
						<li><a href="${cpath}/LikeList.do">찜목록</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>

	</div>
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
		<!-- 로그인 컨테이너 -->
		<div class="signcontainer" style="display: none">
			<div class="text-box">
				<div>Sign In</div>
			</div>
			<form action="${cpath}/Login.do" method="post">
				<div class="Text-Field">
					<label for="">아이디</label>
					<div class="input-box">
						<input type="id" placeholder="아이디를 입력해주세요" class="id"
							name="user_id">
						<link rel="stylesheet"
							href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
							integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
							crossorigin="anonymous" referrerpolicy="no-referrer">
					</div>
				</div>
				<div class="Text-Field">
					<label for="">비밀번호</label>
					<div class="input-box password">
						<input type="password" placeholder="비밀번호를 입력해주세요" class="password"
							name="user_pw"> <span class="password-toggle-icon"><i
							class="fas fa-eye"></i></span>
					</div>
				</div>
				<div class="find">
					<a href="javascript:void(0);" onclick="showFindId()">Forgot
						Password?</a>
				</div>

				<div class="sep"></div>
				<div class="link">
					<a href="javascript:void(1);" onclick="showJoinIn()">go to the
						Sign Up</a>
				</div>
				<div class="button">
					<input type="submit" value="Sign In"></input>
				</div>
			</form>
		</div>
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
			<form action="action=" ${cpath}/FindId.do" method="post">
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
			<form action="action=" ${cpath}/Findpw.do" method="post">
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
		var cpath = "${cpath}";
	</script>
	<script src="${cpath}/resources/js/main.js"></script>
	<script src="${cpath }/resources/js/index.js" type="text/javascript"></script>
</body>

</html>