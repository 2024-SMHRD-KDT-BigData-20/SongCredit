<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 페이지내에서 jstl을 사용해서 변수로 프로젝트 ContextPath 저장 --%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${cpath }/resources/css/index.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<script type="text/javascript">
 // 이미 띄워진 basic.jsp에서 js를 통해 ajax로 데이터 가져오기 (게시글 목록 데이터)
 // baisc.jsp의 html태그가 다 만들어지면 작동 할 수 있게끔$(document).ready(function(){})
 $(document).ready(function(){
	 // 게시글 목록 가져오는 함수를 실행
	 boardList();
 });
 
 // 게시글 목록을 가져오는 ajax통신을 가진 함수 장의
 function boardList(){
	 $.ajax({
		 url : "${cpath}/board",
		 type : "get",
		 // 보내줄 데이터 없음
		 // 받아올 데이터 있음
		 dataType : "json",
		 success : callBack, // ajax에서 함수를 부른 경우는 ()를 적지않는다.
		 error : function(){
			alert("게시글 목록 가져오기 실패")	 
		 }
	 });// ajax 끝
	 
 }// boardList 함수 끝
 
 // boardList 함수가 실행되서 ajax결과를 잘 가져올 때 실행할 함수 (success) <-- 따로 만들어서 ajax에서는 불러오기만 함 (함수를 분리해서 사용한다 --> 콜백)
 function callBack(data){
	 console.log(data);
 	// bList 출력할 태그들을 담은 변수
	 var bList = "<table class='table table-hover'>";
	 bList += "<tr>";
	 bList += "<td>번호</td>";	 
	 bList += "<td>제목</td>";	 
	 bList += "<td>작성자</td>";	 
	 bList += "<td>작성일</td>";	 
	 bList += "<td>조회수</td>";	 
	 bList += "</tr>";
	 
	// 반복문을 통해서 Array에 담긴 Json 데이터 출력
	// $.each(data, function(인덱스, 요소){});
	// $.each(data, (인덱스, 요소)=>{});
	$.each(data,(index,obj)=>{   
	bList += "<tr>";
	bList += "<td>" + obj.idx +"</td>";
	// a태그를 눌렀을 때 다른 페이지, 요청으로 가는게 아니라 js 함수로 이동 (함수 실행)
	// javascript:함수이름()
	bList += "<td><a href='javascript:cview(" + obj.idx + ")'>" + obj.title +"</a></td>";
	bList += "<td>" + obj.writer +"</td>";
	bList += "<td>" + obj.indate +"</td>";
	bList += "<td id='lc" + obj.idx + "'>" + obj.count +"</td>";
	bList += "</tr>";
	 
	// 게시글 내용 보여주는 태그 출력
	// 									각 게시글마다 조정할 수 있게 c1, c2, c3,...id부여
	bList += "<tr style='display:none' id='c" + obj.idx + "'>"	
	bList += "<td>내용</td>"
	bList += "<td colspan='4'>"	
	bList += "<textarea class='form-control' row='7' id='nc" + obj.idx + "'>" + obj.content + "</textarea>"
	if(obj.writer == "${loginMember.memName}"){
	bList += "<button class='btn btn-sm btn-warning' onclick='goUpdate(" + obj.idx + ")'>수정</button>"
	bList += "<button class='btn btn-sm btn-primary' onclick='goDel(" + obj.idx + ")'>삭제</button>"
	}
	bList += "</td>"	
	bList += "</tr>"	
	}); // each 끝
	
	// 게시글 작성
	bList += "<tr>"
	bList += "<td colspan='5'><button class='btn btn-sm btn-info' onclick='goForm()'>글쓰기<button></td>"
	bList += "</tr>"
	bList += "</table>"
 	$("#List").html(bList);
 }	// callBack 함수 끝
 
 // 제목을 눌렀을 때 해당 게시글 내용을 보여주는 함수
 function cview(idx){
	 // #c1,#c2,#c3 가 display속성이 none이면 ~ table-row로 변경
	 // $.("#c"+idx).css("display")
	 if($("#c"+idx).css("display") == "none"){
		 // 게시글 내용 보여줄 때 조회수를 +1씩 증가하는 ajax 통신
		 $.ajax({
			url : "${cpath}/updateCount/"+idx,
			type : "get",
			success : function(res){
				// 해당 게시글의 내용을 가져옴 (Board vo를 가져옴)
				console.log(res.count);
				$("#lc"+idx).text(res.count);
			},
			error : function(){
				alert("조회수 올리기 실패")
			}
		 });// ajax끝
		 
		 $("#c"+idx).css("display", "table-row");
	 }else{
	 // #c1,#c2,#c3 가 display속성이 table-row이면 none으로 변경
		 $("#c"+idx).css("display", "none");
	 }
	 
	 
 }// cview함수 끝
 
 function goForm(){
	 $("#List").css("display","none");
	 $("#wform").css("display", "block")
 }// goForm함수 끝
 
 function goDel(idx){
	 var real = confirm("정말 삭제하시겠습니까?");
	 console.log(real); // true / false
	 if(real){
		 //real이 true인 경우에만 if문의 내용이 실행됨
		 // pathvariavle : url(경로)를 넘겨보낼때 변수도 있다
	 	$.ajax({
	 		url : "${cpath}/board/"+idx,
	 		type : "delete",
	 		// data : {"idx" : idx},
	 		success : boardList,
	 		error : function(){
	 			alert("글삭제 실패");
	 		}
	 		
	 	});// ajax끝
	 }// if문 끝
	 
 }// goDel함수 끝
 
 function goUpdate(idx){
	//textarea의 내용을 가져와야함
	 var newContent = $("#nc"+idx).val();
	 console.log(newContent);
 	 // 변수값을 두 개 보내야함
	 $.ajax({
		 url : "${cpath}/board",
		 type : "put",
		 // restcontroller가 json형식으로 데이터 처리
		 contentType : "application/json;charset=utf-8",
		 // json으로 변환 JSON.stringify(데이터)
		 data : JSON.stringify({"idx" : idx, "content" : newContent}),
		 success : boardList,
		 error : function(){
			 alert("수정 실패 시발")
		 }
	 }); // ajax끝 
 }// goUpdate 끝
 
 function insertFn(){
	 // form태그에 적힌 input태그 입력내용들을 가져오기
	 // form태그에 id를 부여해서 form태그 내용을 직렬화 하는 함수
	 // .serialize()
	 var fData = $("#frm").serialize();
	 console.log(fData); // title=ddd&content=ddd&writer=ddd
	 console.log(typeof(fData)); // string
	 
	 // ajax통해서 fData를 DB에 저장
	 $.ajax({
		url : "${cpath}/board",
		type : "post",
		data : fData,
		// 받아올 데이터 없음
		// ajax 통신을 성공하면 받아올 데이터는 없지만
		// 다시 게시글 목록 보여주는 함수를 실행
		// ajax에서는 함수뒤에 ()를 붙이지 않음
		success : boardList,
		error : function(){
			alert("글쓰기 실패")
		}
	 });
	 
	 // 게시글 목록은 뜨는데 css가 목록 x, 글쓰는 부분o
	 $("#List").css("display", "block")
	 $("#wform").css("display", "none")
	 
	// 다시 글쓰기 버튼을 누르면 내용이 남아있음	
	/* $("title").val("");
	$("content").val("");
	$("writer").val("");
	 */
	 // 취소 버튼을 강제로 실행하는 js코드
	 $("#reset").trigger("click");
	 
	 
 }// insertFn 함수 끝
 
 </script>
	<div class="container">
		<h2>빅데이터 20차 개발자과정</h2>
		<div class="panel panel-default">
			<%-- 로그인 안한 상태일때 form태그를 보여주고, 로그인했을때는 로그인 정보를 출력
			 jstl의 if-else문과 같은 choose-when/otherwise사용
			  --%>
			<c:choose>
				<c:when test="${empty loginMember}">
					<form class="form-inline" action="${cpath}/Login.do" method="post">
						<div class="form-group">
							<label for="memId">ID:</label> 
							<input type="text"
								class="form-control" id="memId" name="memId">
						</div>
						<div class="form-group">
							<label for="memPw">PW:</label> 
							<input type="password"
								class="form-control" id="memPw" name="memPw">
						</div>
						<button type="submit" class="btn btn-default">로그인</button>
					</form>
				</c:when>

				<c:otherwise>
					<div class="form-group">
					<label>${loginMember.memName}님 환영합니다.</label> 
					<a class="btn btn-sm btn-default" href="${cpath}/Logout.do">로그아웃</a>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="panel-heading"></div>
			<div class="panel-body" id="List" style="display: block">Panel
				Content</div>
			<div class="panel-body" id="wform" style="display: none">
				<form class="form-horizontal" id="frm">
					<div class="form-group">
						<label class="control-label col-sm-2" for="title">제목:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title" name="title"
								placeholder="제목을 입력하세요">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="content">내용:</label>
						<div class="col-sm-10">
							<textarea class="form-control" id="content" name="content"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="writer"
							placeholder="작성자를 입력하시오">작성자:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" readonly="readonly" id="writer" name="writer"
								value="${loginMember.memName}">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="btn btn-default"
								onclick="insertFn()">게시글 등록</button>
							<button type="reset" class="btn btn-default" id="reset">취소</button>
						</div>
					</div>
				</form>
			</div>
			<div class="panel-footer">개발 열심히 공부하는 최재민</div>
		</div>
	</div>

</body>
</html>
