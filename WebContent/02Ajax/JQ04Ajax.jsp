<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ04Ajax.jsp</title>
<link rel="stylesheet" href="../common/bootstrap4.5.3/css/bootstrap.css" />
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script>
/*
	$.ajax()
		: jQuery에서 사용되는 AJAX관련 메소드로 load(), get(), past()메소드의
		기능을 모두 가지고 있다. 그러므로 가장 활용빈도가 높다.
		별도의 인자가 존재하지 않고 JSON형태의 인자 하나만 사용한다.
	인자의 속성
		url : 요청할 서버의 경로
		type : 요청 시 사용할 전송방식. get, post
		dataType : 콜백 데이터의 형식. json, xml, script, text, html 등
		success : 요청에 성공했을 때 콜백메소드
		error : 요청에 실패했을 때 콜백메소드
		contentType : 전송 시 사용할 컨텐츠 타입(get과 post가 다름)
		data : 서버로 전송할 파라미터. JSON형식
*/
$(function(){
	/*
	해당 메소드는 문서의 로드가 끝난 직후 js파일을 현재 문서에 로드한다.
	즉, .load()메소드와 동일한 역할을 하고 있다.
	*/
	$.ajax({
		url : './common/04JsData.js',
		type : 'get',
		dataType : "script",
		//요청 성공 시 콜백메소드 : 무기명함수 형태로 정의됨
		success : function(resData){
			MyAlert("Hello", "AJAX");
		},
		//요청 실패 시 콜백메소드 : 외부함수형태로 정의됨
		error : errFunc //호출 시 함수명만 명시한다.
	});
	
	$('#ajaxBtn').click(function(){
		$.ajax({
			//요청할 서버의 경로 url
			url : './common/02PrintToday.jsp',
			//요청 시 전송방식
			type : 'get',
			//콜백데이터 타입
			dataType : "html",
			//전송방식에 따른 컨텐츠타입
			contentType : "text/html;charset:utf-8",
			//파라미터. JSON형식
			data : {
				msg : $(this).text(),
				varStr : "$.ajax()메소드 좋아요"
			},
			//성공, 실패 시 콜백메소드. sucFunc(매개변수)형태로 사용하지 않는다.
			success : sucFunc,
			error : errFunc
		});
	});
});

function errFunc(){
	alert("에러발생. 디버깅하세요");
}
/*
	요청 성공 시 호출할 콜백메소드로 jQuery외부에 정의되었다.
	함수명만으로 지정하더라도 콜백데이터는 파라미터로 전달 받을 수 있다.
*/
function sucFunc(resData){
	alert("$.ajax()메소드 요청 성공")
	$('#ajaxDisplay').html(resData);
}
</script>
</head>
<body>
	<h2>$.ajax() 메소드 사용하기</h2>
	
	<button id="ajaxBtn">ajax()메소드실행하기</button>
	
	<div id="ajaxDisplay">
		ajax결과를 여기에 디스플레이
	</div>
</body>
</html>