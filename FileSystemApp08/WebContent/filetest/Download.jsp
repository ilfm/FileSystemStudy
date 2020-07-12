<%@page import="com.util.FileManager"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//필터 쓰기 전까지 사용하기
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<%
	//Download.jsp
	String root = pageContext.getServletContext().getRealPath("/");
	String savePath = root + File.separator + "pds" + File.separator + "saveFile";
	
	String saveFileName = request.getParameter("saveFileName");
	String originalFileName = request.getParameter("originalFileName");
	
	//check~!
	out.clear();
	// 한번 클리어 해줘야한다.
	out = pageContext.pushBody();

	/// 파일 다운로드
   boolean flag = FileManager.doFileDownload(saveFileName, originalFileName, savePath, response);
   
   out.clear();
   /*
   		※ JSP 파일에서 Download 기능을 구현하거나
   		   이와 관련한 유사한 기능을 적용하는 과정에서 자주 발생하는 에러가 있다.
   		   
   		   『java.lang.IllegalStateException : 이 응답을  getOutputStream()이 이미 호출되었습니다.』
   		   
   		   이 에러는
   		   『OutputStream os = response.getOutputStream();』
   		   구문과 관련되 예외이며,
   		   
   		   이 같은 상황 발생 시 JspWriter 인 『out.clear();』 구문을
   		   『OutputStream os = response.getOutputStream(); 』 구문에 대한 처리를
   		   수행하기 전에 먼저 처리해주면 된다.
   
   
   */


%>