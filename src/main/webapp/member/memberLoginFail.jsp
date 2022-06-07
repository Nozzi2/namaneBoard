<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.memberDTO == null }">
	fail
</c:if>
<c:if test="${sessionScope.memberDTO != null }">
	${sessionScope.memberDTO.name}
</c:if>

<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
</head>
<body>
<h3>로그인이 되었을까?</h3><br>
로그인에 실패했습니다.<br>
아이디 비밀번호를 다시 입력하세요.<br>

<input type="button" value="로그인" onclick="location.href='/namaneBoard/member/memberLoginForm.do'">

<br><br><input type="button" value="시작 페이지" onclick="location.href='/namaneBoard/index.jsp'">

</body>
</html> --%>