<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!
   //메소드 정의
   public String getParam(HttpServletRequest request, String paramName)
   {
      if(request.getParameter(paramName) != null)
      {
         return request.getParameter(paramName);
      }
      else
      {
         return "";
      }
   }
%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
   int fileCounter = 0;
   if (request.getParameter("addcnt") != null)
   {
      fileCounter = Integer.parseInt(request.getParameter("addcnt"));
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test.jsp</title>

<style type="text/css">
   .tbl
   {
      width: 450px;
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

<script type="text/javascript">
   
   function inputValue(form1, param, form2, idx)
   {
      var paramValue = form1.elements[idx].value;
      form2.elements[idx].value = paramValue;
      return;
   }
   
   function addFile(formName)
   {
      if(formName.addcnt.value == "")
      {
         alert(" 입력할 파일 개수를 입력하고 확인버튼을 눌러주세요.");
         formName.addcnt.focus();
         return;
      }
      
      formName.submit();
   }
   
   function elementCheck(formName)
   {
      paramIndex = 1;
      for(idx=0; idx<formName.elements.length; idx++)
      {
         if(formName.elements[idx].type == "file")
         {
            if(formName.elements[idx].value == "")
            {
               var message = paramIndex + " 번째 파일 정보가 누락되었습니다. \n업로드할 파일을 선택해주세요.";
               
               alert(message);
               
               formName.elements[idx].focus();
               
               return;
            }
            
            paramIndex++;
         }   
      }//end for
      
      formName.action = "Test_ok.jsp";
      formName.submit();
      
   }
   
</script>

</head>
<body>

<div>
   <h1>다중 파일 업로드</h1>
   <p class="notice">
      여러 개의 파일 업로드를 위하여<br>
      <span style="color : red;">파일 개수 입력 후</span>
       확인 버튼을 눌러주세요.<br>
      입력이 완료되면 <span style="color: red;">파일 업로드</span> 버튼을 눌러주세요.
   </p>
   <hr>
</div>

<br>

<div align="center">

   <!-- 『action』 속성값 미지정 → 자신 페이지에 전달 및 수신 -->
   <form name="frmName1" method="post">
      <table class="tbl">
         <tr>
            <th style="width: 100px;">
               <div align="right">작성자</div>
            </th>
            <td>
               <input type="text" name="user"
               onkeyup="inputValue(this.form, user, frmName2, 0)"
               value="<%=getParam(request, "user") %>">
            </td>
            <th style="width: 100px">
               <div align="right">제목</div>
            </th>
            <td>
               <input type="text" name="title"
               onkeyup="inputValue(this.form,title,frmName2,1)"
               value="<%=getParam(request, "title")%>">
            </td>
         </tr>
         
         <tr>
            <th style="width: 20%;">
               <div align="right">내용</div>
            </th>
            <td colspan="3" style="width: 50%;"><textarea name="content"
             rows="" cols="40" style="width: 98%;"
             onkeyup="inputValue(this.form, content, frmName2, 2)"
             ><%=getParam(request, "content") %></textarea>
            </td>
         </tr>
         
         <tr>
            <th colspan="4">
               <div align="center">
                  추가할 파일 수 입력
                  <input type="text" name="addcnt">
                  <input type="button" value="확인" 
                  onclick="addFile(this.form)">
               </div>
            </th>
         </tr>
         
      </table>
   </form>
   
   <form name="frmName2" method="post" enctype="multipart/form-data">
      <table class="tbl">
         <tr>
            <td style="width: 40%;">
               <input type="hidden" name="txtUser" value="<%=getParam(request, "user")%>">
               <input type="hidden" name="txtTitle" value="<%=getParam(request,"title")%>">
               <input type="hidden" name="txtContent" value="<%=getParam(request,"content")%>">
               <%
               for(int i=0;i<fileCounter;i++)
               {
               %>
                  <input type="file" size="50" name="selectFile<%=i %>"><br>
               <%
               }
               %>
            </td>
            <td>
               <input type="button" value="파일 업로드"
               onclick="elementCheck(this.form)">
            </td>
         </tr>
      </table> 
   </form>
   
</div>

</body>
</html>
               
               

















