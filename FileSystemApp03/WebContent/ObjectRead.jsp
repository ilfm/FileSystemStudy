<%@page import="java.util.Enumeration"%>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.Hashtable"%>
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

	// 1. 파일 객체 생성
	File newFile = new File(appRoot,"objData/data.ser");
	
	// 2. 파일이 존재하는지 검사	
	if(newFile.exists())
	{
				
		// 3-1. 파일을 읽어오기 위해 FileInputStream 객체 생성
		
		FileInputStream fis = new FileInputStream(newFile);
		
		// 3-2. 파일에서 객체(object)를 읽어오기 위해 ObjectInputStream 객체 생성
		ObjectInputStream ois = new ObjectInputStream(fis);
		
		// 4 ObjectInputStream 을 이용하여 파일로부터 Object 를 읽어온다.

		Hashtable<String,String> h = new Hashtable<String, String>();
		h =(Hashtable<String, String>)ois.readObject();
		
		
		//data.ser 를 읽어들여온다.
		
		// 5-1. ObjectInputStream 리소스 반남
		ois.close();
		
		// 5-2. FileInputStream 리소스 반납
		fis.close();
		
		// 6-1 key 에 순차적으로 접근하여 내용 확인 → Enumertaion 으로 처리
		Enumeration<String> em = h.keys();	//해쉬테이블에 keys를 반납할때 Enumeration 으로 반납한다.

		
		// 6-2 반복문을 통해 요소 여부 확인
		while(em.hasMoreElements())
		{
			// 6-3 반복문 내에서 얻어낸 key 와 value 출력
			String key = em.nextElement().toString();
			String value = h.get(key);
			/* out.println(key + " : "+ value +"<br>");		 */	
		
		%>
		
			<h2><%=key %>의 값은 <%=value %>입니다.</h2>
		<% 
			
			
		}
	
	}else
	{
		out.println("해당 파일이 존재하지 않습니다.");		
		
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type ="text/css" href="css/main.css">

</head>
<body>


</body>
</html>