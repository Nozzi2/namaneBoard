<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
</head>
<body>
<h3>로그인이 되었을까?</h3>
${sessionScope.memberDTO.name }님, 로그인되었습니다.

<input type="button" value="시작 페이지" onclick="location.href='/namaneBoard/index.jsp'">


</body>
</html>