<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String params = request.getParameter("params");
if(params.equals("good")){
%>
	<h3 style="color:red;'">Good, 오늘은 좋은 날</h3>
<%
}else if(params.equals("bad")){
%>
	<h3 style="color:red;'">Bad! 운수 나쁜 날</h3>
<%
}
%>