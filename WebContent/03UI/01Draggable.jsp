<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01Draggable.jsp</title>
<link rel="stylesheet" href="../common/bootstrap4.5.3/css/bootstrap.css" />
<script src="../common/jquery/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<style>
#draggable { width: 150px; height: 150px; padding: 0.5em; }
</style>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
  $( "#draggable" ).draggable();
  
  $('#layerPopClose').click(function(){
	 $('#draggable').css('display', 'none'); 
  });
  
  $('$todayClose').click(function(){
	 if($("input:checkbox[id='todayClose']").is(":checked")==true){
		 alert("JSP의 쿠키예제를 활용하세요");
	 } 
  });
});
</script>
<style>
    #draggable { width: 250px; padding: 0.5em; background-color:yellowgreen;}
    #draggable>p{text-align: center;} 
</style>
</head>
<body>
	<h2>드래그 가능한 레이어팝업창</h2>
	<h2>드래그 가능한 레이어팝업창</h2>
	<h2>드래그 가능한 레이어팝업창</h2>
	<h2>드래그 가능한 레이어팝업창</h2>
	<h2>드래그 가능한 레이어팝업창</h2>
	<h2>드래그 가능한 레이어팝업창</h2>
	
	<div id="draggable" class="ui-widget-content">
	  <p>드래그 해보세요. 해당 팝업창은 이동할 수 있습니다.</p>
	  <div style="text-align:right">
	  	<input type="checkbox" id="todayClose" />
	  	오늘하루열지않음
	  	<button id="layerPopClose">닫기</button>
	  </div>
	</div>
</body>
</html>