<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>나마네 게시판<br></h1>
<c:if test="${sessionScope.memberDTO == null }">
	<input  type="button" value="로그인"
			onclick="location.href='/namaneBoard/member/memberLoginForm.do'">
	<br>
	<input  type="button" value="회원가입"
			onclick="location.href='/namaneBoard/member/memberSignUpForm.do'">
</c:if>

<c:if test="${sessionScope.memberDTO != null }">
	${sessionScope.memberDTO.name } 님 안녕하세요.<br>
	<input  type="button" value="로그아웃"
			onclick="location.href='/namaneBoard/member/memberLogout.do'">
	<br>
	<input  type="button" value="회원정보 수정"
			onclick="location.href='/namaneBoard/member/memberUpdateForm.do'">
</c:if>
<br>
<input  type="button" value="게시판"
			onclick="location.href='/namaneBoard/board/boardList.do?pg=1'">

</body>
</html>