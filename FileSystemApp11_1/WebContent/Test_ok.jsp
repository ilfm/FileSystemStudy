<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>

<%
   String realFolder = "";
   String saveFolder = "fileSave";
   String encType = "UTF-8";
   int maxSize = 10*1024*1024;  //--10M
   
   ServletContext context = getServletContext();
   realFolder = context.getRealPath(saveFolder);
   ArrayList<String> saveFiles = new ArrayList<String>();
   ArrayList<String> originFiles = new ArrayList<String>();
   
   String paramUser = "";
   String paramTitle = "";
   String paramContent = "";
   
   MultipartRequest multi = null;
   
   try
   {
      multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
      
      paramUser = multi.getParameter("txtUser");
      paramTitle = multi.getParameter("txtTitle");
      paramContent = multi.getParameter("txtContent");
      
      Enumeration<?> files = multi.getFileNames();
      while(files.hasMoreElements())
      {
         String name = (String)files.nextElement();
         saveFiles.add(multi.getFilesystemName(name));
         originFiles.add(multi.getOriginalFileName(name));
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
   .tbl
   {
      width: 600px;
      border: 1px solid gray;
      align-content: center;
      padding: 1px;
      margin: 1px;
   }
   
   .notice
   {
      color: #334433;
      font-size: 6pt;
   }

</style>
</head>
<body>

<div>
   <h1>다중 파일 업로드 수신 확인</h1>
   <hr>
</div>

<div>
   <table class="tbl">
      <tr>
         <td style="width: 200px;">
            <div align="right"><strong>작성자</strong></div>   
         </td>
         <td style="width: 200px;">
            <!-- 홍길동  -->
            <%=paramUser %>
         </td>
         <td style="width: 200px;">
            <div align="right"><strong><!-- 제목 --><%=paramTitle %></strong></div> 
         </td>
         <td style="width: 200px;">
            업로드 테스트
         </td>
      </tr>
      
      <tr>
         <td>
            <div align="right"><strong>내용</strong></div>
         </td>
         <td colspan="3">
            <%-- <textarea rows="5" cols="50" disabled="disabled"
            ><%=paramContent %>파일 업로드 과정 확인</textarea> --%>
            <textarea rows="5" cols="50" disabled="disabled"
            ><%=paramContent %></textarea>
            
         </td>
      </tr>
      <tr>
         <td colspan="4">
            &nbsp;
         </td>
      </tr>
      <tr>
         <td colspan="4">
            <div><strong>업로드된 파일</strong></div>
         </td>
      </tr>
         
      <!--
      <tr>
         <td colspan="4">
            <span>back05.jpg</span>
         </td>
      </tr>
      
      <tr>
         <td colspan="4">
            <span>back06.jpg</span>
         </td>
      </tr>
      
      <tr>
         <td colspan="4">
            <span>back07.jpg</span>
         </td>
      </tr> 
      -->
      
      <%
      /* for(int i=0; i<saveFiles.size();i++) */
      for(int i=saveFiles.size()-1; i>=0 ;i--)
      {
      %>
      <tr>
         <td colspan="4">
            <a href="<%=saveFolder + "/" + saveFiles.get(i)%>"><span><%=originFiles.get(i) %></span></a>
         </td>
      </tr>
      <%
      }
      %>
   
   </table>
</div>
         
</body>
</html>         
         
         
         
         
         
         
         
         
         
   
   
   
   
   
   
   
   
   
   
   
   
         


         
         
         
         
      






















































