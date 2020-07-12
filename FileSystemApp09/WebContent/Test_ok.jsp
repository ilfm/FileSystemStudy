<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//필터 쓰기 전까지 사용하기
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<%

	//Test_ok.jsp
	
	String root = pageContext.getServletContext().getRealPath("/");
	String savePath = root + "pds\\saveData";
	
	File dir = new File(savePath);
	
	if(!dir.exists())
		dir.mkdirs();
	
	String encType = "UTF-8";
	int maxSize = 5*1024*1024;
	
	MultipartRequest multi = null;
	
	try
	{
		multi = new MultipartRequest(request, savePath,maxSize,encType, new DefaultFileRenamePolicy());
		out.println("작성자 :" + multi.getParameter("user")+"<br>");
		out.println("제목 :" + multi.getParameter("title")+"<br>");
		out.println("*******************************************<br>");
		
		out.println("업로드 된 파일 : <br>");
		
		// check~!!
		// MultipartRequest 객체의 『getFileNames()』
		// → 요청으로 넘어온 파일들의 이름을 Enumertaion 타입으로 반환
		Enumeration files = multi.getFileNames();
		while(files.hasMoreElements())
		{
			String name = (String)files.nextElement();
			if(multi.getFilesystemName(name) != null)
			{
				out.println("서버에 저장된 파일명 : " + multi.getFilesystemName(name));
				out.println(", 업로드한 파일명 : " + multi.getOriginalFileName(name));
				
				File file = multi.getFile(name);
				if(file != null)
				{
					out.println(", 업로드된 파일 크기 : " + file.length() + "Bytes");
					out.println("<br>");
					
				}
				
			}
			
		}
		
		
	}catch(IOException e1)
	{
		
	}catch(Exception e2)
	{
		
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