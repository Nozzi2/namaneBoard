<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<style type="text/css">
div {
	color: red;
	font-size: 12px;
}
</style>
</head>
<body>
<form name="MemberSignUpForm" id="MemberSignUpForm" method="post" action="/namaneBoard/member/memberSignUp.do">
	<table border="1" cellpadding="5" cellspacing="0">
	
		<tr>
			<td align="center">아이디 *</td>
			<td>
				<input type="text" name="id_signup" id="id_signup" placeholder="아이디 입력">
				<input type="text" name="checkedId_signup" id="checkedId_signup" style="display:none;" readonly>
				<!-- <input type="button" value="중복체크" onclick="checkId()"> -->
				<div id="idDiv_signup"></div>
	   		</td>
		</tr>
		
		<tr>
			<td align="center">비밀번호 *</td>
			<td>
				<input type="password" name="pwd_signup" id="pwd_signup" placeholder="비밀번호 입력">
				<div id="pwdDiv_signup"></div>
	   		</td>
		</tr>
		
		<tr>
			<td align="center">비밀번호 재확인 *</td>
			<td>
				<input type="password" name="repwd_signup" id="repwd_signup" placeholder="재확인">
				<div id="pwdDiv_signup"></div>
	   		</td>
		</tr>
		
		<tr>
			<td align="center">이름 *</td>
			<td>
				<input type="text" name="name_signup" id="name_signup" placeholder="이름 입력">
				<div id="nameDiv_signup"></div>
	   		</td>
		</tr>
		
		<tr>
			<td align="center">이메일 *</td>
			<td>
				<input type="text" name="email_signup" id="email_signup" placeholder="abc@gamil.com">
				<div id="emailDiv_signup"></div>
	   		</td>
		</tr>
		
		<tr>
			<td align="center">전화번호</td>
			<td>
				<input type="text" name="tel_signup" id="tel_signup" placeholder="010-1234-5678">
				<div id="telDiv_signup"></div>
	   		</td>
		</tr>
		
		<tr>
			<td colspan ="2" align = "right">
				* : 필수입력
			</td>
		</tr>
		
		<tr>
			<td colspan ="2" align = "center">
				<input type="button" value="회원가입" onclick="checkSignUp()">
				<input type="reset" value="다시작성">
			</td>
			
		</tr>
		
	</table>
	
	<br><br><input type="button" value="시작 페이지" onclick="location.href='/namaneBoard/index.jsp'">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/namaneBoard/script/member.js"></script>
<script type="text/javascript">
$('#id_signup').focusout(function(){
	if($('#id_signup').val() == ''){
		$('#idDiv_signup').html("먼저 아이디 입력");
		$('#idDiv_signup').css('color', 'red');
		$('#idDiv_signup').css('font-size', '8pt');
		$('#idDiv_signup').css('font-weight', 'bold');
	} else {
		$('#idDiv_signup').html('');
		$.ajax({
			url: '/namaneBoard/member/memberCheckId.do',
			type: 'post',
			data: {
				'id' : $('#id_signup').val()
			},
			dataType: 'text',
			success: function(data){
				data = data.trim();
				if(data != 'fail'){
					$('#idDiv_signup').html("중복된 아이디입니다.");
					$('#idDiv_signup').css('color', 'red');
					$('#idDiv_signup').css('font-size', '8pt');
					$('#idDiv_signup').css('font-weight', 'bold');
				} else {
					$('input[name="checkedId_signup"]').val($('#id_signup').val());
					
					$('#idDiv_signup').html("사용 가능합니다.");
					$('#idDiv_signup').css('color', 'blue');
					$('#idDiv_signup').css('font-size', '8pt');
					$('#idDiv_signup').css('font-weight', 'bold');
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});

</script>
</body>
</html>