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
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<!-- 로그인 컨테이너 -->
	<div class="maincontainer">
		<div class="signcontainer">
			<div class="text-box">
				<div>Sign In</div>
			</div>
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
					<input type="password" placeholder="비밀번호를 입력해주세요" class="password"
						name="user_pw"> ' <span class="password-toggle-icon">
						<i class="fas fa-eye"></i>
					</span>
				</div>
			</div>
			<div class="find">
				<a href="#">Forgot Password?</a>
			</div>
			<div class="sep"></div>
			<div class="link">
				<a href="#">go to the Sign Up</a>
			</div>
			<div class="button">
				<input type="button" class="loginFunction" value="Sign In"></input>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
	<script>
		$(".loginFunction").on("click", function() {
			commonAjax("${cpath }/MemberRestController/login", {
				id : $("#id").val(),
				pass : $("#password").val()
			}, post, 0, function callback(response) {
				var resultText = response.resultCode == 0 ? "성공" : "실패";

				alert("로그인에 " + resultText + " 하셨습니다.");
				if (response.resultCode == 0) {
					location.href = "${ctx }" + response.resultUrl;
				} else {
					location.reload();
				}
			});
		});
	</script>
	<script src="${cpath}/resources/js/index.js" type="text/javascript"></script>
</body>
</html>
