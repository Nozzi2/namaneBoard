<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<style type="text/css">
div {
	color: red;
	font-size: 12px;
}
</style>
</head>
<body>
<form name="MemberLoginForm" id="MemberLoginForm" method="post" action="/namaneBoard/member/memberLogin.do">
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<td align="center">아이디</td>
			<td>
				<input type="text" name="id_login" id="id_login" placeholder="아이디 입력">
				<div id="idDiv_login"></div>
	   		</td>
		</tr>
		
		<tr>
			<td align="center">비밀번호</td>
			<td>
				<input type="password" name="pwd_login" id="pwd_login">
				<div id="pwdDiv_login"></div>
	   		</td>
		</tr>
		
		<tr>
			<td colspan ="2" align = "center">
				<input type="button" value="로그인" onclick="checkLogin()">
				<input type="button" value="아이디/비밀번호 찾기" onclick="location.href='/namaneBoard/member/memberFindIdForm.do'">
			</td>
		</tr>
	</table>
</form>
	
<br><br><input type="button" value="시작 페이지" onclick="location.href='/namaneBoard/index.jsp'">
	
<script type="text/javascript" src="/namaneBoard/script/member.js"></script>
</body>
</html>