<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//필터 쓰기 전까지 사용하기
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<%
	String name = request.getParameter("name");
	String upload = request.getParameter("upload");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive.jsp</title>
<link rel="stylesheet" type ="text/css" href="css/main.css">

</head>
<body>
<div>
	<h2>이름 : <%=name %></h2>
	<h2>파일 : <%=upload %></h2>
</div>

</body>
</html>