<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style type="text/css">
div {
	color: red;
	font-size: 12px;
}
</style>
</head>
<body>

<input type="button" value="아이디 찾기" onclick="location.href='/namaneBoard/member/memberFindIdForm.do'">
<input type="button" value="비밀번호 찾기" onclick="location.href='/namaneBoard/member/memberFindPwdForm.do'">
<br><br>
<form name="MemberFindPwdForm" id="MemberFindPwdForm" method="post" action="/namaneBoard/member/memberFindPwd.do">
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<td align="center">아이디</td>
			<td>
				<input type="text" name="id_findpwd" pwd="id_findpwd" placeholder="아이디 입력">
				<div pwd="idDiv_findpwd"></div>
	   		</td>
		</tr>
		
		<tr>
			<td align="center">이메일</td>
			<td>
				<input type="text" name="email_findpwd" pwd="email_findpwd" placeholder="이메일 입력">
				<div pwd="emailDiv_findpwd"></div>
	   		</td>
		</tr>
		
		<tr>
			<td colspan ="2" align = "center">
				<input type="button" value="비밀번호 찾기" onclick="findPwd()">
			</td>
		</tr>
	</table>
</form>

<br><br><input type="button" value="시작 페이지" onclick="location.href='/namaneBoard/index.jsp'">

<script type="text/javascript">
	function findPwd() {
		//경고메세지 지우기
		//document.getElementById("idDiv_findpwd").innerText = "";
		//document.getElementById("emailDiv_findpwd").innerText = "";
		
		//입력되지 않은 값에 경고 출력
		if(document.MemberFindPwdForm.id_findpwd.value == "")
			document.getElementById("idDiv_findpwd").innerText = "아이디 입력하세요";
		else if(document.MemberFindPwdForm.email_findpwd.value == "")
			document.getElementById("emailDiv_findpwd").innerText = "이메일을 입력하세요";
		else 	
			document.MemberFindPwdForm.submit();	
	}
	
	function findId() {
		//경고메세지 지우기
		document.getElementById("nameDiv_findid").innerText = "";
		document.getElementById("emailDiv_findid").innerText = "";
		
		//입력되지 않은 값에 경고 출력
		if(document.MemberFindIdForm.name_findid.value == "")
			document.getElementById("nameDiv_findid").innerText = "아이디를 입력하세요";
		else if(document.MemberFindIdForm.email_findid.value == "")
			document.getElementById("emailDiv_findid").innerText = "이메일을 입력하세요";
		else 	
			document.MemberFindIdForm.submit();	
	}
</script>
</body>
</html>