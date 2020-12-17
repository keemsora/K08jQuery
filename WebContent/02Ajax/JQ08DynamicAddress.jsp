<%@page import="java.util.ArrayList"%>
<%@page import="controller.ZipcodeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
ZipcodeDAO dao = new ZipcodeDAO();
//zipcode테이블에서 sido를 중복 제거하여 가져온다.
ArrayList<String> sidoList = dao.getSido();
//페이지영역에서 sido리스트를 저장한다.
pageContext.setAttribute("sidoList", sidoList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../common/bootstrap4.5.3/css/bootstrap.css" />
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#sido').change(function(){
		//alert($('#sido').val() + " 선택됨"));
		$.ajax({
			url : "./common/08GugunOption.jsp",
			type : "get",
			contentType : "text/html;charset:utf-8;",
			data : {
				//select에서 선택한 시도를 파라미터로 전송
				sido : $('#sido option:selected').val()
			},
			dataType : "json",
			success:function(d){
				console.log("콜백데이터", d);
				/*
				위 url로 요청을 하면 아래와 같은 결과가 콜백된다.
				JSON배열이므로 요소의 갯수만큼 반복하는 파싱작업이 필요하다.
				
				["횡성군","화천군","홍천군","평창군","태백시","춘천시",
				"철원군","정선군","인제군","원주시","영월군","양양군",
				"양구군","속초시","삼척시","동해시","고성군","강릉시"] 
				*/
				var optionStr = "";
				optionStr += "<option value=''>";
				optionStr += "-구군을 선택하세요-";
				optionStr += "</option>";
				//$.each()를 통해 반복되는 요소의 인덱스와 요소값을 매개변수로 받을 수 있다.
				$.each(d, function(index, data){
					console.log(index, data);
					optionStr += '<option value="'+data+'">';
					optionStr += data;
					optionStr += '</option>';
				});
				$('#gugun').html(optionStr);
			},
			error:function(e){
				alert("오류발생:"+e.status+":"+e.statusText);
			}
		});
	});
});
</script>
</head>
<body>
<div class="container">
	<div class="row">
		<h2>우편번호DB를 이용한 시도/구군 동적셀렉트 구현</h2>
	</div>
	<form id="zipFrm">
	<div class="row">		
		<div class="col-4">
			시/도:
			<select id="sido" class="form-control">
				<option value="">-시/도선택하삼-</option>
				<c:forEach items="${sidoList }" var="sidoStr">
					<option value="${sidoStr }">${sidoStr }</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-8">
			구/군:
			<select id="gugun" class="form-control">
				<option value="">-구/군선택하삼-</option>
			</select>
		</div>		
	</div>
	</form>
</div>

</body>
</html>