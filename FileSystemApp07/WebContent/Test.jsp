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
<title>Insert title here</title>
<link rel="stylesheet" type ="text/css" href="css/main.css">

</head>
<body>
<!-- 단일 파일 업로드 실습  -->
<!-- * Test.jsp -->
<!-- * Test_ok.jsp -->

<div>
	<h1>파일 업로드 - 단일 파일 업로드</h1>
	<hr />
</div>

<div>
	<form action="Test_ok.jsp" method="post" enctype="multipart/form-data">
		작성자 : <input type="text" name="userName" /><br />
		제목 : <input type="text" name="subject" /><br />
		파일 : <input type="file" name="uploadFile" /><br />
		<input type="submit" value="파일 올리기" /><br />
	
	
	</form>

</div>



</body>
</html>