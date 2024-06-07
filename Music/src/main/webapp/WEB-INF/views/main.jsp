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
		<div class="maincontainer">
			<div class="TopMusicChart">
				<i>Top 추천곡 리스트</i>
				<button id="prevBtn">이전</button>
				<div class="slider" id="gridContainer"></div>
				<button id="nextBtn">다음</button>
			</div>
			<div class="TopMusicCowList"></div>
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
    $(document).ready(function() {
        // 게시글 목록 가져오는 함수 실행
        chartList();

        $('#prevBtn').click(function() {
            slide(-1);
        });

        $('#nextBtn').click(function() {
            slide(1);
        });
    });

    let currentSlide = 0;
    const itemsPerPage = 6;

    function chartList() {
        $.ajax({
            url: "${cpath}/chart", // 서버 URL에 ${cpath} 사용
            type: "get",
            dataType: "json",
            success: callback,
            error: function() {
                alert("데이터를 가져오는데 실패했습니다.");
            }
        });
    }
	
    function a (String url, String type, String dataType){
    	return $.ajax({
    		url: url,
    		type: type,
    		dataType: dataType
    	})
    }
    
    function callback(data) {
        const container = $('#gridContainer');
        let bList = '';

        $.each(data, function(index, item) {
            bList += "<div class='cList'>";
            bList += "<img src='img/img" + item.music_idx + ".jpg' alt='" + item.music_name + "'>";
            bList += "<h4>" + item.music_name + "</h4>";
            bList += "<h5>" + item.music_singer + "</h5>";
            bList += "<p>판매량: " + item.chart_sl + "</p>";
            bList += "<p>현재가: " + item.chart_now + "</p>";
            bList += "</div>";
        });

        container.html(bList);
        updateSlider();
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