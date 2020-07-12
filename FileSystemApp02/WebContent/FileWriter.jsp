<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//필터 쓰기 전까지 사용하기
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<%

	String appRoot = "/";
	appRoot = pageContext.getServletContext().getRealPath(appRoot);
	
	// 1.파일을 쓰기 위해 File 객체를 생성
	File newFile = new File(appRoot,"data/test.txt");
	//-- FIle 객체가 해당 경로 속성을 갖고 생성될뿐
	//   이 구문으로 실제 물리적인 파일이 생성되는 것은 아니다.
	
	// 2. 파일이 존재할 디렉터리가 존재하지 않는 경우
	//   파일이 위치할 경로까지 디렉터리를 생성
	if(!newFile.getParentFile().exists())	//-- 경로 존재여부 확인
	{
		newFile.getParentFile().mkdirs();	//-- 실제로 생성
		// newFile 에 지정해 놓은 부모파일에 디렉터리를 만들어라
		
	}

	// 3 - 1. 파일을 쓰기위한 FileWriter를 생성
	FileWriter fw = new FileWriter(newFile);
	//감싸서 이용
	
	// 3 - 2. FileWriter 를 좀 더 편하게 사용할 수있도록
	//        PrintWriter 로 감싸서 처리
	PrintWriter pw = new PrintWriter(fw);
	
	// 4 . 실직적으로 파일에 내용을 기록
	pw.println("테스트중...");
	pw.println("확인해보자...");
	
	
	// 5-1. PrintWriter 리소스 반납(닫기)
	pw.close();
	
	// 5-2 .FileWriter 리소스 반납(닫기)
	fw.close();
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileWriter</title>
<link rel="stylesheet" type ="text/css" href="css/main.css">

</head>
<body>
<div>
	<h1>관찰</h1>
	<hr />
</div>


<div>
	<h2>웹 어플리케이션루트 : <%=appRoot %></h2>
	<h2>생성할 파일의 위치 : <%=newFile %></h2>	
</div>

</body>
</html>