<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//필터 쓰기 전까지 사용하기
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test.jsp</title>
<link rel="stylesheet" type ="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>파일 업로드</h1>
	<hr />
</div>

<div>
	<!-- 요청하는 페이지가  ok 페이지 이다 2. enctype -->
	<form action="Test_ok.jsp" method="post" enctype="multipart/form-data">
		작성자 : <input type="text" name="user" />
		제목   : <input type="text"name="title" />
		파일명 : <input type="file" name="uploadFile1" />
		파일명 : <input type="file" name="uploadFile2" />
		<!-- 파일 2개 올릴수있다.  -->
		<input type="submit" value="파일올리기" /><br />	
	</form>
</div>

</body>
</html>