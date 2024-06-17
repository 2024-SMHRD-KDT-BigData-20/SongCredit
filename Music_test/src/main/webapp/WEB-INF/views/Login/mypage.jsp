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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
</style>
</head>

<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="joincontainer">
		<div class="text-box">
			<div>My Page</div>
		</div>
		<div class="maincontainre">
			<form action="${cpath}/Join.do" id="Form" method="post">
				<div class="Text-Field">
					<label for="">아이디</label>
					<div class="input-box">
						<input type="text" value="${sessionScope.loginMember.user_id }"
							class="id" name="user_id" readonly="readonly">
					</div>
				</div>
				<div class="Text-Field">
					<label for="">닉네임</label>
					<div class="input-box">
						<input type="text" value="${sessionScope.loginMember.user_nick }"
							class="nick" name="user_nick">
					</div>
				</div>
				<div class="Text-Field email">
					<label for="">E-mail</label>
					<div class="emailbox">
						<div class="input-box">
							<input class="box" type="text"
								value="${sessionScope.loginMember.user_email }">
						</div>
					</div>
				</div>
				<div class="Text-Field">
					<label for="">생년월일</label>
					<div class="input-box">
						<input type="text" class="birth" readonly="readonly"
							name="user_birth" value="${sessionScope.loginMember.user_birth }">
					</div>
				</div>
				<div class="Text-Field">
					<label>성별</label>
					<div class="input-box">
						<input type="text" readonly="readonly"
							value="${sessionScope.loginMember.user_gender }">
					</div>
				</div>
				<div class="Text-Field">
					<label for="">비밀번호</label>
					<div class="input-box">
						<input type="password" placeholder="비밀번호를 입력해주세요" id="password"
							name="user_pw"> <span
							class="password-toggle-icon far fa-eye"></span>
					</div>
				</div>
				<div class="Text-Field">
					<label for="">비밀번호 확인</label>
					<div class="input-box">
						<input type="password" placeholder="비밀번호를 다시 한번 입력해주세요"
							class="password"> <span
							class="password-toggle-icon far fa-eye"></span>
					</div>
				</div>
				<div>
					<p>${sessionScope.loginMember.joined_at }</p>
				</div>
				<div class="sep"></div>
				<div class="button">
					<input type="submit" value="회원정보 변경"></input>
				</div>
				<div class="button">
					<input type="button" class="memberremove" value="회원탈퇴"></input>
				</div>
			</form>
		</div>
	</div>
	<div class="modal-background"></div>

	<div class="removeModal">
		<span>X</span>
		<h2>회원 탈퇴 하기</h2>
		<div class="ptag">
			<p>탈퇴 하기 클릭시</p>
			<p>개인 정보 및 계정에 대한 모든 정보가 사라지며,</p>
			<p>더 이상 로그인 필수 서비스를 이용할 수 없습니다.</p>
			<p>탈퇴하시겠습니까?</p>
		</div>
		<div class="button">
			<input type="button" value="회원탈퇴">
		</div>
	</div>


	<jsp:include page="../include/footer.jsp"></jsp:include>\
	<script src="${cpath}/resources/js/index.js" type="text/javascript"></script>
</body>

</html>