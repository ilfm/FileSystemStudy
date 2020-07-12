<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//필터 쓰기 전까지 사용하기
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<%
	String appRoot ="/";
	appRoot = pageContext.getServletContext().getRealPath(appRoot);
	
	// 1. 파일을 읽어들이기 위해 file 객체를 생성
	File newFile = new File(appRoot,"data/test.txt");
	//-- 물리적인 파일이 이시점에서 만들어지는 것이 절대 아님 ~!! check~!!
	
	// 2. 파일 존재하는지 검사(확인)
	if(newFile.exists())
	{
		// 3-1. 파일을 읽기 위한 객체(FileReader 객체)생성
		FileReader fr = new FileReader(newFile);
		
		// 3-2. File Reader 를 보다 효율적으로 편하게 사용할 수 있도록 
		//  	BufferedReader 로 감싸기
		BufferedReader br = new BufferedReader(fr);
		//Reader타입이면 된다.
		
		// 4. 실질적으로 이 파일을 읽어내는 처리 과정
		String readData;
		while(( readData= br.readLine() ) != null)
		{
			out.println(readData +"<br>");
			
		}
		// 5-1. BufferedReader 리소스 반납(닫기)
		br.close();
		
		// 5-2. FileReader 리소스 반납 하기
		fr.close();
		
		
	}




%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileReader</title>
<link rel="stylesheet" type ="text/css" href="css/main.css">

</head>
<body>


</body>
</html>