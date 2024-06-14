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
	<div class="main">
		<div class="signcontainer">
			<div class="text-box">
				<div>Sign In</div>
			</div>
			<div class="maincontainer">
				<form>
					<div class="Text-Field">
						<label for="id">아이디</label>
						<div class="input-box">
							<input type="text" placeholder="아이디를 입력해주세요" class="id" id="id"
								name="user_id">
						</div>
					</div>
					<div class="Text-Field">
						<label for="password">비밀번호</label>
						<div class="input-box password">
							<input type="password" placeholder="비밀번호를 입력해주세요"
								class="password" id="password" name="user_pw"> <span
								class="password-toggle-icon far fa-eye"></span>
						</div>
					</div>
					<div class="member_footer">
						<div class="find">
							<a href="${cpath }/findId">Forgot Id or Password?</a>
						</div>
						<div class="find">
							<a href="${cpath }/join">Sign Up</a>
						</div>
					</div>
					<div class="sep"></div>
					<div class="button">
						<input type="button" class="loginFunction" value="Sign In"></input>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
	<script>
		$(".loginFunction")
				.on(
						"click",
						function() {
							var data = {
								user_id : $("#id").val(),
								user_pw : $("#password").val()
							};

							$
									.ajax({
										url : "${cpath}/rest/member/login?targetUrl="
												+ encodeURIComponent(getParameterByName('targetUrl')),
										type : "POST",
										contentType : "application/json",
										data : JSON.stringify(data),
										success : function(response) {
											var resultText = response.resultCode === 200 ? "성공"
													: "실패";
											alert("로그인에 " + resultText
													+ " 하셨습니다.");
											if (response.resultCode === 200) {
												location.href = response.targetUrl;
											} else {
												location.reload();
											}
										},
										error : function() {
											alert("로그인 중 오류가 발생했습니다.");
										}
									});
						});

		// URL 파라미터 값을 가져오는 함수
		function getParameterByName(name) {
			name = name.replace(/[\[\]]/g, "\\$&");
			var url = window.location.href;
			var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"), results = regex
					.exec(url);
			if (!results)
				return null;
			if (!results[2])
				return '';
			return decodeURIComponent(results[2].replace(/\+/g, " "));
		}
	</script>
	<script src="${cpath}/resources/js/index.js" type="text/javascript"></script>
</body>
</html>
