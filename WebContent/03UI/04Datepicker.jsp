<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04Datepicker.jsp</title>
<link rel="stylesheet" href="../common/bootstrap4.5.3/css/bootstrap.css" />
<script src="../common/jquery/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
$( function() {
	//datepicker의 설정옵션은 JSON으로 부여한다.
   $( "#datepicker1" ).datepicker({
	   "dateFormat" : "yy-mm-dd" //날짜형식
   });
	
   $( "#datepicker2" ).datepicker({
	   "dateFormat" : "yy-mm-dd", //날짜형식
	   "showAnim" : "bounce" // 애니메이션
	   /*
		<select id="anim">
			<option value="show">Show (default)</option>
			<option value="slideDown">Slide down</option>
			<option value="fadeIn">Fade in</option>
			<option value="blind">Blind (UI Effect)</option>
			<option value="bounce">Bounce (UI Effect)</option>
			<option value="clip">Clip (UI Effect)</option>
			<option value="drop">Drop (UI Effect)</option>
			<option value="fold">Fold (UI Effect)</option>
			<option value="slide">Slide (UI Effect)</option>
			<option value>None</option>
		</select>
	   */
   });
   
   $("#datepicker3").datepicker({
       "dateFormat" : "yy-mm-dd",
       showOtherMonths: true, //다른월의 날짜 보임
       selectOtherMonths: true //다른월의 날짜 선택
   });
   
   $("#datepicker4").datepicker({
       "dateFormat" : "yy-mm-dd",
       changeMonth: true,
       changeYear: true,
       numberOfMonths: 3,
       showButtonPanel: true
   });
   
   $("#datepicker5").datepicker({
       "dateFormat" : "yy-mm-dd", //날짜형식
       showOn: "button",//달력 선택 옵션(button / both)
       buttonImage: "../images/pick.jpg",//아이콘 경로
       buttonImageOnly: true, //false선택시 css적용안됨
       buttonText: "날짜를 선택하세요"
   });
   //아이콘 CSS적용
   $('img.ui-datepicker-trigger')
   .css({'cursor':'pointer', 'position':'relative', 
	   'top':'-3px', 'width':'31px'});  //아이콘(icon) 위치

   $("#datepicker6").datepicker({
       "dateFormat" : "yy-mm-dd", //날짜형식
       monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],        
       monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],        
       dayNames : ['일', '월', '화', '수', '목', '금', '토'],        
       dayNamesShort : ['일', '월', '화', '수', '목', '금', '토'],        
       dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],       
       showMonthAfterYear : true, //년/월 순서변경 
       yearSuffix : '년',
       isRTL : false, //true선택시 날짜 정렬 뒤집어짐        
   });
	   
   var dateFormat = "yy/mm/dd",
   from = $("#date_from")
       .datepicker({
           defaultDate: "+1w",
           changeMonth: true,
           numberOfMonths: 3
       })
       .on("change", function () {
           to.datepicker("option", "minDate", getDate(this));
       }),
   	to = $("#date_to")
       .datepicker({
           defaultDate: "+1w",
           changeMonth: true,
           numberOfMonths: 3
       })
       .on("change", function () {
           from.datepicker("option", "maxDate", getDate(this));
       });

	function getDate(element) {
	   var date;
	   try {
	       date = $.datepicker.parseDate(dateFormat, element.value);
	   } catch (error) {
	       date = null;
	   }
	
	   return date;
	}
 } );
</script>
</head>
<body>
<div class="container">
	<p>
		기본형식 : <input type="text" id="datepicker1" size="30">
	</p>
	<p>
        애니메이션 및 버튼 : <input type="text" id="datepicker2" size="30">
    </p>
    <p>
        기본월 이외의 날짜 : <input type="text" id="datepicker3" size="30">
    </p>
    <p>
        년/월(Multi)선택메뉴 : <input type="text" id="datepicker4" size="30">
    </p>
    <p>
        아이콘 : <input type="text" id="datepicker5" size="30">
    </p>
    <p>
        한글화 : <input type="text" id="datepicker6" size="30">
    </p>
    <p>
        날짜 선택 범위 설정: <input type="text" id="date_from" size="10">
            ~ <input type="text" id="date_to" size="10">
    </p>
	
</div>
</body>
</html>