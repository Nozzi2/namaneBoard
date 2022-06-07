<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${requestScope.memberDTO == null}">
	fail
</c:if>
<%-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
</head>
<body>

	<form name="MemberCheckIdPopup" id="MemberCheckIdPopup" method="get" action="/namaneBoard/member/memberCheckId.do">
		<c:if test="${requestScope.result == 1}">
			<h3>${requestScope.id } 는 <font color="blue">사용 가능</font>합니다.<br></h3>
			<input type="submit" value="사용하기" onclick="checkIdClose('${requestScope.id }')">
		</c:if>
		
		<c:if test="${requestScope.result == 0 }">
		<h3><font color="red">중복</font>되는 아이디입니다.<br></h3>
			<input type="text" name="id">
			<input type="button" value="중복체크" onclick="checkIdPopup()">
			<div id="idDiv_popup"></div>
		</c:if>
	</form>
	

<script type="text/javascript" src="/namaneBoard/script/member.js"></script>
<script type="text/javascript">
function checkIdClose(id){
	opener.document.MemberSignUpForm.id_signup.value = id; //데이터 전달
	opener.document.MemberSignUpForm.checkedId_signup.value = id;
	window.close(); //창닫기
	opener.document.MemberSignUpForm.pwd_signup.focus(); //포커스
}
</script>
</body>
</html>
 --%>