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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<!-- 회원가입 컨테이너 -->
	<div class="joincontainer">
		<div class="text-box">
			<div>Join</div>
		</div>
		<form id="joinForm">
			<div class="Text-Field">
				<label for="id">아이디</label>
				<div class="input-box">
					<input type="text" placeholder="아이디를 입력해주세요" class="id" id="id"
						name="user_id">
				</div>
			</div>
			<div class="Text-Field">
				<label for="nick">닉네임</label>
				<div class="input-box">
					<input type="text" placeholder="닉네임을 입력해주세요" class="nick" id="nick"
						name="user_nick">
				</div>
			</div>
			<div class="Text-Field">
				<label for="password">비밀번호</label>
				<div class="input-box">
					<input type="password" placeholder="비밀번호를 입력해주세요" id="password"
						name="user_pw"> <span
						class="password-toggle-icon far fa-eye"></span>
				</div>
			</div>
			<div class="Text-Field">
				<label for="password_confirm">비밀번호 확인</label>
				<div class="input-box">
					<input type="password" placeholder="비밀번호를 다시 한번 입력해주세요"
						id="password_confirm" class="password"> <span
						class="password-toggle-icon far fa-eye"></span>
				</div>
			</div>
			<div class="Text-Field email">
				<label for="email">E-mail</label>
				<div class="emailbox">
					<div class="input-box">
						<input class="box" type="text" id="email" placeholder="이메일을 입력하세요">
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
				<label for="birth">생년월일</label>
				<div class="input-box">
					<input type="text" placeholder="ex)20000803" class="birth"
						id="birth" name="user_birth">
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
			<div class="member_footer">
				<div></div>
				<div class="find">
					<a href="${cpath }/login"> Sign In</a>
				</div>
			</div>
			<div class="sep"></div>
			<div class="button">
				<input type="button" class="joinFunction" value="Sign Up"></input>
			</div>
		</form>
	</div>
	<jsp:include page="../include/footer.jsp" />
	<script>
		$(".joinFunction").on("click", function() {
			var data = {
				user_id : $("#id").val(),
				user_nick : $("#nick").val(),
				user_pw : $("#password").val(),
				user_email : $("#email").val() + "@" + $("#domain-txt").val(),
				user_birth : $("#birth").val(),
				user_gender : $("input[name='user_gender']:checked").val()
			};

			$.ajax({
				url : "${cpath}/rest/member/join",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(data),
				success : function(response) {
					var resultText = response.resultCode === 200 ? "성공" : "실패";
					alert("회원가입에 " + resultText + " 하셨습니다.");
					if (response.resultCode === 200) {
						location.href = response.targetUrl;
					} else {
						location.reload();
					}
				},
				error : function() {
					alert("회원가입 중 오류가 발생했습니다.");
				}
			});
		});
	</script>
	<script type="text/javascript" src="${cpath }/resources/js/index.js"></script>
</body>
</html>
