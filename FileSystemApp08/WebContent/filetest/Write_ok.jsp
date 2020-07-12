<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
   //  Write_ok.jsp
   
   String root = pageContext.getServletContext().getRealPath("/");
   String savePath = root + File.separator + "pds" + File.separator + "saveFile";
   //-- File.separator : 경로 구성 과정에서의 구분자
   
   // 파일 객체 생성( 설정한 경로 구성 )
   File dir = new File(savePath);
   
   // 경로 상 폴더(디렉터리)가 존재하지 않으면 생성할 수 있도록 처리
   if(!dir.exists())
      dir.mkdirs();
   
   // encType = "UTF-8" : 인코딩 방식을 지정하기 위한 준비
   String encType = "UTF-8";
   
   // maxFileSize = 5 * 1024 * 1024 : 최대 파일 업로드 크기를 지정하기 위한 준비
   int maxFileSize = 5 * 1024* 1024;
   
   // enctype = "multipart/form-data"를 통해 수신한
   // 바이너리 데이터를 온전히 처리하기 위한 객체 구성 → MultipartRequest
   MultipartRequest req = null;
   
   String urlFile = "";
   
   try
   {   
      // MultipartRequest 의 매개변수 구성
      // → request, 파일을 저장할 경로, 최대 크기, 인코딩, 중복파일명 보호여부
      req = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());
   
      out.println("작성자 : " + req.getParameter("userName") + "<br>");
      out.println("제목 : " + req.getParameter("subject") + "<br>");
      out.println("서버에 저장된 파일명 : " + req.getFilesystemName("uploadFile") + "<br>");
      out.println("업로드한 실제 파일명 : " + req.getOriginalFileName("uploadFile") + "<br>");
      out.println("파일 타입 : " + req.getContentType("uploadFile") + "<br>");
      
      File f = req.getFile("uploadFile");
      if(f != null)
      {
         out.println("파일 크기 : " + f.length() + "Bytes. <br>");
      }
      
      urlFile = "Download.jsp?saveFileName=" + req.getFilesystemName("uploadFile");
      urlFile += "&originalFileName=" + req.getOriginalFileName("uploadFile");
      
      
   }
   catch(Exception e)
   {
      System.out.println(e.toString());
   }
         
%>
<br><%=root %>
<br><a href="<%=urlFile%>">파일 다운로드</a>