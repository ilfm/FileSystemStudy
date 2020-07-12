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

<!-- 파일 업로드 송수진  -->
<!--  * Send.jsp -->
<!--  * Recieve.jsp-->

<div>
	<h1>파일 시스템 및 파일 업로드</h1>
	<hr />
</div>

<div>
	<!--『enctype="multipart/form-data』  -->
	<!-- 파일을 물리적으로 업로드하기 위한 필수 속성 -->
	<!-- <form action="Receive.jsp" method="post" enctype="multipart/form-data"> -->
	<form action="Receive.jsp" method="post" enctype="multipart/form-data">
		이름 : <input type="text" name="name" />
		
		<!-- 『type="file"』속성 지정 -->
		파일 : <input type="file" name="upload"/>	
		
			<button type="submit">전송</button>
	</form>

</div>

<!-- 『Send.jsp』의 form 엘리먼트 enctype 속성을  -->
<!-- 『enctype="multipart/form-data』와같이 구성할 경우 -->
<!-- 이름 : null -->
<!-- 파일 : null -->
<!-- 인 것을 확인 할 수 있다 -->
<!-- ==> 바이너리 값을 『getParameter()』를 통해 수신할 수 없다는 의미이다.	 -->




</body>
</html>