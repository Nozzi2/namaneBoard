<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 결과</title>
</head>
<body>
<h3>회원정보 수정 되었을까?</h3>
<c:if test="${requestScope.su == 1}">
	회원정보가 수정 되었습니다.
</c:if>
<input type="button" value="시작 페이지" onclick="location.href='/namaneBoard/index.jsp'">
</body>
</html>