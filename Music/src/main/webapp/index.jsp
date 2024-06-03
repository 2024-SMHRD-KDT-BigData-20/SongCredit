<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 페이지내에서 jstl을 사용해서 변수로 프로젝트 ContextPath 저장 --%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- jstl로 요청을 보내면 항상 프로젝트내에서 찾게 만듦
	 cpath를 쌍다옴표안에 안적어도 된다.
	 이제 더이상 jsp로 바로 이동할 수 없음
	 항상 Controller지나서 controller가 가지고 있는 메소드를 통해 jsp를 실행할 수 있음 --%>
<c:redirect url="mainList.do"/>
</body>
</html>