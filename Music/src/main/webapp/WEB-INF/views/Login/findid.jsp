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
	<!-- 아이디찾기 -->
	<div class="FindIdcontainer">
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
</body>
</html>
