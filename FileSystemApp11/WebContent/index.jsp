<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//필터 쓰기 전까지 사용하기
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="<%=cp %>/data/css/style.css" />
<script type="text/javascript">
	
	function login()
	{
		
		try 
		{
			var f = document.loginForm;
			
			if(!f.userId.value)
			{
				alert("\n아이디를 입력하세요.");
				f.userId.focus();
				return;				
			}
			
			if(!f.userPwd.value)
			{
				
				alert("\n패스워드를 입력하세요.");
				f.userPwd.focus();
				return;				
			}
			
			f.action = "<%=cp %>/join/login_ok.action";
			f.submit();			
			
			
		} catch (e) {
		
			System.out.println(e.toString());
		}
		
		
	}
	

</script>


</head>
<body>

<jsp:include page="/menu/top.jsp"></jsp:include>

<br /><br />

<div align="center">
	<table style="width:800px; heigth:650px;">
		<tr style="height: 650px;">
			<td style="width:600px; vertical-align: top;">
				<span>환영합니다......!!</span>
			</td>
			<td style="width: 200px; vertical-align: top;">
			</td>
			
			<!--
				○ 세션에 설정한 Attribute 값을 EL 로 수신하여 사용하는 방법
				   → HttpSession session = request.getSession(true);
				   
				   // 사용자 아이디
				   session.setAttribute("id","honggildong");
				   //-- 위와 같이 설정해준 id 값을 jsp에서 EL/JSTL 을 활용하여
				   //   처리해야 할 경우 다음과 같이 구성 할 수 있다.
				   
				   <input type="text" name="id" value="${sessionScope.id}" />
				
			-->
			
			<c:if test="${empty sessionScope.member }">
				<form method="post" name="loginForm">
					<table style="width:200px">
						<tr>
							<td>아이디</td>
							<td>
								<input type="text" name="userId" size="15" class="boxTF"/>
							</td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td>
								<input type="text" name="userPwd" size="15" class="boxTF"/>
							</td>
						</tr>						
						<tr style="height: 30px">
							<td colspan="2" align="center">
								<input type="button" value="로그인" class="btn2" onclick="login()" />
							</td>
						</tr>				
					</table>
				
				
				</form>			
			</c:if>
			
			<c:if test="${!empty sessionScope.member }">
				${sessionScope.member.getUserName() } 님의 로그인 상태...
			</c:if>
			
		</tr>
	
	</table>


</div>

</body>
</html>