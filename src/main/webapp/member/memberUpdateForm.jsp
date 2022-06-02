<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style type="text/css">
div {
	color: red;
	font-size: 12px;
}
</style>
</head>
<body>
<form name="MemberUpdateForm" id="MemberUpdateForm" method="post" action="/namaneBoard/member/memberUpdate.do">
	<table border="1" cellpadding="5" cellspacing="0">
	
		<tr>
			<td align="center">아이디 *</td>
			<td>
				<input type="text" name="id_update" id="id_update" value="${sessionScope.memberDTO.id }" placeholder="아이디 입력" readonly>
				<div id="idDiv_update"></div>
	   		</td>
		</tr>
		
		<tr>
			<td align="center">비밀번호 *</td>
			<td>
				<input type="password" name="pwd_update" id="pwd_update" value="${sessionScope.memberDTO.pwd }" placeholder="비밀번호 입력">
				<div id="pwdDiv_update"></div>
	   		</td>
		</tr>
		
		<tr>
			<td align="center">비밀번호 재확인 *</td>
			<td>
				<input type="password" name="repwd_update" id="repwd_update" value="${sessionScope.memberDTO.pwd }" placeholder="재확인">
				<div id="pwdDiv_update"></div>
	   		</td>
		</tr>
		
		<tr>
			<td align="center">이름 *</td>
			<td>
				<input type="text" name="name_update" id="name_update" value="${sessionScope.memberDTO.name }" placeholder="이름 입력">
				<div id="nameDiv_update"></div>
	   		</td>
		</tr>
		
		<tr>
			<td align="center">이메일 *</td>
			<td>
				<input type="text" name="email_update" id="email_update" value="${sessionScope.memberDTO.email }" placeholder="abc@gamil.com">
				<div id="emailDiv_update"></div>
	   		</td>
		</tr>
		
		<tr>
			<td align="center">전화번호</td>
			<td>
				<input type="text" name="tel_update" id="tel_update" value="${sessionScope.memberDTO.tel }" placeholder="010-1234-5678">
				<div id="telDiv_update"></div>
	   		</td>
		</tr>
		
		<tr>
			<td colspan ="2" align = "right">
				* : 필수입력
			</td>
		</tr>
		
		<tr>
			<td colspan ="2" align = "center">
				<input type="button" value="회원정보 수정" onclick="checkUpdate()">
				<input type="reset" value="다시작성">
			</td>
			
		</tr>
		
	</table>
	
	<br><br><input type="button" value="시작 페이지" onclick="location.href='/namaneBoard/index.jsp'">
<script type="text/javascript" src="/namaneBoard/script/member.js"></script>
</body>
</html>