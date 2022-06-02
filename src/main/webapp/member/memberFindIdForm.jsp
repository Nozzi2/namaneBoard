<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
<form name="MemberFindIdForm" id="MemberFindIdForm" method="post" action="/namaneBoard/member/memberFindId.do">
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<td align="center">이름</td>
			<td>
				<input type="text" name="name_findid" id="name_findid" placeholder="아이디 입력">
				<div id="nameDiv_findid"></div>
	   		</td>
		</tr>
		
		<tr>
			<td align="center">이메일</td>
			<td>
				<input type="text" name="email_findid" id="email_findid" placeholder="이메일 입력">
				<div id="emailDiv_findid"></div>
	   		</td>
		</tr>
		
		<tr>
			<td colspan ="2" align = "center">
				<input type="button" value="아이디 찾기" onclick="findId()">
			</td>
		</tr>
	</table>
</form>

<br><br><input type="button" value="시작 페이지" onclick="location.href='/namaneBoard/index.jsp'">

<script type="text/javascript">
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