<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
</head>
<body>
<c:if test="${requestScope.memberDTO != null }">
	아이디는 [ ${requestScope.memberDTO.id } ] 입니다.<br>
	<input type="button" value="로그인" onclick="location.href='/namaneBoard/memberLoginForm.do'">
</c:if>
<c:if test="${requestScope.memberDTO == null }">
	입력하신 정보와 일치하는 아이디가 없습니다.<br>
	<input type="button" value="아이디 찾기" onclick="location.href='/namaneBoard/memberFindIdForm.do'">
</c:if>
<br><br><input type="button" value="시작 페이지" onclick="location.href='/namaneBoard/index.jsp'">

</body>
</html>