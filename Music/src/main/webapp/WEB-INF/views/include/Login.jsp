<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="logincontainer">
		<div class="text-box">
			<div>Sign In</div>
		</div>
		<form action="${cpath}Login" method="post">
			<div class="Text-Field">
				<label for="">아이디</label>
				<div class="input-box">
					<input type="id" placeholder="아이디를 입력해주세요" class="id">
				</div>
			</div>
			<div class="Text-Field">
				<label for="">비밀번호</label>
				<div class="input-box password">
					<input type="password" placeholder="비밀번호를 입력해주세요" class="password">
					<span class="password-toggle-icon"><i class="fas fa-eye"></i></span>
				</div>
			</div>
			<div class="find">
				<a href="find.html">Forgot Password?</a>
			</div>

			<div class="sep"></div>
			<div class="link">
				<a href="join.html">go to Sign Up</a>
			</div>
			<div class="button">
				<input type="submit" value="Sign In"></input>
			</div>
		</form>

	</div>
</body>
</html>