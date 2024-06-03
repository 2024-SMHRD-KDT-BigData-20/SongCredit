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
<link rel="stylesheet" href="${cpath }/resources/css/style.css">
</head>

<body>
	<script>
		$(document).ready(function() {
			// 게시글 목록 가져오는 함수 실행
			boardList();

		});
		function boardList() {
			$.ajax({
				url : "${cpath}/main",
				type : "get",
				// 불러오기
				dataType : "json",
				success : callBack,//ajax에서 함수를 부르는 경우 () 적지 않음
				error : function() {
					alert("메인문가져오기 실패");
				}

			});
	        function createItem(imageSrc, title, artist, sales, price) {
	            return `
	                <div class="cList">
	                    <img src="${imageSrc}" alt="${title}">
	                    <h4>${title}</h4>
	                    <h5>${artist}</h5>
	                    <p>판매량: ${sales}</p>
	                    <p>현재가: ${price}</p>
	                </div>
	            `;
	        }

	        function callback(data) {
	            const container = document.getElementById('gridContainer');
	            let itemsHTML = '';

	            data.forEach(item => {
	                itemsHTML += createItem(item.imageSrc, item.title, item.artist, item.sales, item.price);
	            });

	            container.innerHTML = itemsHTML;
	        }

	        // 예시 데이터
	        const data = [];
	        for (let i = 1; i <= 6; i++) {
	            data.push({
	                imageSrc: `img/img${i}.jpg`,
	                title: `제목${i}`,
	                artist: `가수${i}`,
	                sales: `판매량 + 0.3%`,
	                price: `10,000`
	            });
	        }

		}
	</script>
	ㅉ
	<div class="header">
		<a href="" class="hamburger-button"> <span></span> <span></span> <span></span>
			<span></span>
		</a>
		<div class="overlay">
			<nav class="menu">
				<ul>
					<li><a href="main.jsp">홈</a></li>
					<li><a href="chart.jsp">차트</a></li>
					<li><a href="news.jsp">뉴스</a></li>
				</ul>
			</nav>
		</div>
		<div class="logo">
			<a href="main.html">Logo</a>
		</div>
		<div class="search">
			<img src="img/search.png"> <input type="text"
				placeholder="Search...">
		</div>
		<div class="mypage-icon">
			<a href="#"> <img src="img/my.png" alt="">
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
						<li><a href="">찜목록</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>

	</div>
	<div class="main">
		<!-- 메인 컨테이너 -->
		<div class="maincontainer">
			<div>
				<i>Top 추천곡 리스트</i>
			</div>
			<div class=""></div>
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
		function showSignIn() {
			document.querySelector('.signcontainer').style.display = 'block';
			document.querySelector('.joincontainer').style.display = "none";
			document.querySelector(".FindPwcontainer").style.display = 'none';
			document.querySelector(".FindIdcontainer").style.display = 'none';

		}
		function showJoinIn() {
			document.querySelector('.joincontainer').style.display = "block";
			document.querySelector('.signcontainer').style.display = "none";
			document.querySelector(".FindPwcontainer").style.display = 'none';
			document.querySelector(".FindIdcontainer").style.display = 'none';
		}
		function showFindPw() {
			document.querySelector(".FindIdcontainer").style.display = 'none';
			document.querySelector(".FindPwcontainer").style.display = 'block';
		}
		function showFindId() {
			document.querySelector('.signcontainer').style.display = "none";
			document.querySelector('.joincontainer').style.display = "none";
			document.querySelector(".FindIdcontainer").style.display = 'block';
			document.querySelector(".FindPwcontainer").style.display = 'none';
		}
	</script>
	<script src="${cpath }/resources/js/index.js" type="text/javascript"></script>
</body>

</html>