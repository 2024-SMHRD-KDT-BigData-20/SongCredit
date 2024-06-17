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
	<!-- 비밀번호찾기 -->
	<div class="FindPwcontainer">
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
	</div>
	<script>
		$(".loginFunction").on("click", function() {
			commonAjax("${cpath }/rest/member/login", {
				id : $("#id").val(),
				pass : $("#password").val()
			}, post, 0, function callback(response) {
				var resultText = response.resultCode == 0 ? "성공" : "실패";

				alert("로그인에 " + resultText + " 하셨습니다.");
				if (response.resultCode == 0) {
					location.href = "${cpath }" + response.resultUrl;
				} else {
					location.reload();
				}
			});
		});
	</script>
</body>
</html>
