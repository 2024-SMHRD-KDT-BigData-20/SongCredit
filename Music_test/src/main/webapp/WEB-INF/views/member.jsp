<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="utf-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사용자 관리</title>
<link rel="stylesheet" href="${cpath}/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.container {
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	<!-- 로그인 컨테이너 -->
	<div class="signcontainer container">
		<div class="text-box">
			<div>Sign In</div>
		</div>
		<div class="Text-Field">
			<label for="">아이디</label>
			<div class="input-box">
				<input type="text" placeholder="아이디를 입력해주세요" class="id" name="user_id">
			</div>
		</div>
		<div class="Text-Field">
			<label for="">비밀번호</label>
			<div class="input-box password">
				<input type="password" placeholder="비밀번호를 입력해주세요" class="password" name="user_pw"> '
				<span class="password-toggle-icon">
					<i class="fas fa-eye"></i>
				</span>
			</div>
		</div>
		<div class="find">
			<a href="#;" >Forgot Password?</a>
		</div>
		<div class="sep"></div>
		<div class="link">
			<a href="#;" >go to the Sign Up</a>
		</div>
		<div class="button">
			<input type="button" class="loginFunction" value="Sign In"></input>
		</div>
	</div>

	<!-- 회원가입 컨테이너 -->
	<div class="joincontainer container">
		<div class="text-box">
			<div>Sign Up</div>
		</div>
		<form action="${cpath}/Join.do" id="Form" method="post">
			<div class="Text-Field">
				<label for="">아이디</label>
				<div class="input-box">
					<input type="text" placeholder="아이디를 입력해주세요" class="id"
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
						name="user_pw" > <span
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
	<div class="FindIdcontainer container">
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
				<input type="button" value="Forgot Password?" onclick="showFindPw()">
				<input type="submit" value="Find">
			</div>
		</form>
	</div>

	<!-- 비밀번호찾기 -->
	<div class="FindPwcontainer container">
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
				<label for="">이메일</label>
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
		<jsp:include page="include/footer.jsp" />
	</div>
	<script>
	
	$(".loginFunction").on( "click", function() {
		commonAjax( 
			"${ctx }/member/rest/login", 
			{ id : $("#id").val(), pass : $("#password").val() }, 
			post, 
			0, 
			function callback( response ) {
				var resultText = response.resultCode == 0 ? "성공" : "실패";
				
				alert("로그인에 " + resultText + " 하셨습니다.");
				if( response.resultCode == 0 ) {
					location.href = "${ctx }" + response.resultUrl;
				} else {
					location.reload();
				}
			}
		);
	});
	
	</script>
</body>
</html>
