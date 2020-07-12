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
	String appRoot = "/";
	appRoot = pageContext.getServletContext().getRealPath(appRoot);
	
	// 1. 파일 객체 생성
	File newFile = new File(appRoot, "objData/data.ser");
	
	// 2. 파일 존재 여부 (경로 포함) 확인
	if(!newFile.getParentFile().exists())
	{
		newFile.getParentFile().mkdirs();		//생성		
	}
	
	// 3. 파일을 넣기 위한 HashTable 객체를 만들어 데이터에 삽입
	Hashtable<String,String> h = new Hashtable<String, String>();
	
	h.put("key1","데이터1");
	h.put("key2","데이터2");
	//4. 파일 출력 스트림 객체 생성
	FileOutputStream fos = new FileOutputStream(newFile);
	
	// 5. Object 를 쓰기 위해 (내부적으로 객체 직렬화 수행)
	//  ObjectOutputStream 객체 생성후
	//  FileOutputStream 감싸기
	ObjectOutputStream oos = new ObjectOutputStream(fos);
	
	// 6.ObjcetOutputStream 을 이용해 파일에 Object 를 기록
	//   → h 라는 이름의 해시테이블 객체(Object)
	oos.writeObject(h);
	
	// 7-1 ObjectOutPutStream 리소스 반납(닫기)
	oos.close();
	
	//7-2.FileOutPutStream 리소스 반납(닫기)
	fos.close();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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