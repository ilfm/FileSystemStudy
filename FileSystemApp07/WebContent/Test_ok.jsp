<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
   //request.getParameter("userName");    // null
   // ! 파일은 바이너리 형태로 수신하기 때문에 일반적으로..하는거랑 다르다
   
   //String root = request.getRealPath("/");    //-- 예전에 사용하던 방식
   
   String root = pageContext.getServletContext().getRealPath("/");
      
   String savePath = root + "pds" + "\\" + "saveFile";
   
   File dir = new File(savePath);
   
   if(!dir.exists())
      dir.mkdirs();
   
   String encType = "UTF-8";      //-- 인코딩 방식
   int maxFileSize = 5*1024*1024;   //-- 파일 업로드 크기(5MB)
   
   MultipartRequest multi = null;
   
   try
   {
      multi = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());//명명 정책이 있음 
      // 멀티 파트 리퀘스트가 감싸면서 모아주는 것 
      //cos.jar 에서 꺼내쓴다.
      
      // multi = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());
      //!    -------------------    --------                             ------------------------- 
      //!      갈아져서 넘어오는    갈아져서 넘어오는(바이너리 형태의)           파일의 이름을 지정하는 정책
      //!      request를 합쳐서    request → 헤더의 정보를 보고 합칠 수 있다.
      //!      정보를 얻을 수
      //!      있는 컴포넌트
      
      out.println("작성자 : " + multi.getParameter("userName") + "<br>");
      // 정보를 읽어낼수 있음 
      out.println("제목 : " + multi.getParameter("subject") + "<br>");
      out.println("서버에 저장된 파일 이름 : " + multi.getFilesystemName("uploadFile") + "<br>");
      out.println("업로드한 파일 이름 : " + multi.getOriginalFileName("uploadFile") + "<br>");
      out.println("파일 타입 : " + multi.getContentType("uploadFile") + "<br>");
      
      File file = multi.getFile("uploadFile");
      //파일 형태로 반환
      
      
      if(file != null)
      {
         out.println("파일 크기 : " + file.length() + "<br>");
      }
   }
   catch(Exception e)
   {
      System.out.println(e.toString());
   }
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">

	.photo
	{
		width:300px;
	}


</style>
</head>
<body>

<div>
   <h1>업로드 결과</h1>
   <hr>
</div>

<div>
   <a href="<%=cp%>/pds/saveFile/<%=multi.getFilesystemName("uploadFile")%>">test</a>
</div>

<div>
   <img class="photo" src="<%=cp%>/pds/saveFile/<%=multi.getFilesystemName("uploadFile")%>">
</div>

</body>
</html>