<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>
<%--파일명 : 03PostLogin.jsp --%>
<%
//폼값을 받음
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");

/* JSP에서 JSON객체 혹은 배열을 생성하기 위해 확장라이브러리를 설치한 후 
해당 객체를 생성한다. 
	JSONObject클래스 : JSON객체를 생성한다.
		key, value를 사용하는 Map컬렉션과 사용법이 동일하다.
	JSONArray클래스 : JSON배열을 생성한다.
		index를 사용하는 List컬렉션과 사용법이 동일하다.
*/
JSONObject jsonObj = new JSONObject();

if(user_id.equals("kosmo") && user_pw.equals("1234")){
	
	//JSON객체를 생성하기 위해 put()을 사용한다.
	jsonObj.put("user_id", user_id);
	jsonObj.put("user_name", "홍길동");
	jsonObj.put("user_pw", user_pw);
	jsonObj.put("result", 1);//성공 시에는 1로 생성한다.
}
else{
	//로그인 실패 시 다른 정보없이 result만 0으로 생성한다.
	jsonObj.put("result", 0);
}

//JSON객체를 String으로 변환한 후 화면에 출력한다.
String jsonTxt = jsonObj.toJSONString();
out.println(jsonTxt);
%>