<%@page import="java.io.DataInputStream"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//필터 쓰기 전까지 사용하기
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<%
	String contentType = request.getContentType();
	Enumeration e = request.getHeaderNames();
	
	out.println("contextType: " + contentType + "<br>");
	out.println("전송받은 헤더 정보.<br>");
	while(e.hasMoreElements())
	{	
		String key = (String)e.nextElement();
		String value = request.getHeader(key);
		out.println(key + ":" + value +"<br>");
				
	}
	out.println("전송받은 데이터 ....<br>");
	
	DataInputStream dis = new DataInputStream(request.getInputStream());
	String str;
	
	while((str = dis.readLine()) != null)
	{
		out.println( new String (str.getBytes("ISO-8895-1"),"UTF-8") +"<br>");
		
	}
	

%>
