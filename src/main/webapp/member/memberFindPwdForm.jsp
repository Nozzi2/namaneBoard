<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
<form name="MemberFindPwdForm" id="MemberFindPwdForm" method="post" action="/namaneBoard/member/memberFindPwd.do">
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<td align="center">아이디</td>
			<td>
				<input type="text" name="id_findpwd" id="id_findpwd" placeholder="아이디 입력">
				<div id="idDiv_findpwd"></div>
	   		</td>
		</tr>
		
		<tr>
			<td align="center">이메일</td>
			<td>
				<input type="text" name="email_findpwd" id="email_findpwd" placeholder="이메일 입력">
				<div id="emailDiv_findpwd"></div>
	   		</td>
		</tr>
		
		<tr>
			<td colspan ="2" align = "center">
				<input type="button" id="findPwdBtn" value="비밀번호 찾기"> <!-- onclick="findPwd()" -->
			</td>
		</tr>
	</table>
</form>
<br>
<div id="resultDiv_findpwd"></div>
<input type="button" value="로그인" id="toLoginBtn_findpwd" style="display: none;" onclick="location.href='/namaneBoard/member/memberLoginForm.do'">

<br><br><input type="button" value="시작 페이지" onclick="location.href='/namaneBoard/index.jsp'">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$('#findPwdBtn').click(function(){
	$('#idDiv_findpwd').html("");
	$('#emailDiv_findpwd').html("");
	$('#resultDiv_findpwd').html("");
	$("#toLoginBtn_findpwd").hide();
	
	if($('#id_findpwd').val() == ''){
		$('#idDiv_findpwd').html("아이디를 입력하세요.");
		$('#idDiv_findpwd').css('color', 'red');
		$('#idDiv_findpwd').css('font-size', '8pt');
		$('#idDiv_findpwd').css('font-weight', 'bold');
	} else if($('#email_findpwd').val() == ''){
		$('#emailDiv_findpwd').html("이메일을 입력하세요.");
		$('#emailDiv_findpwd').css('color', 'red');
		$('#emailDiv_findpwd').css('font-size', '8pt');
		$('#emailDiv_findpwd').css('font-weight', 'bold');
	} else {
		$.ajax({
			url: '/namaneBoard/member/memberFindPwd.do',
			type: 'post',
			data: {
				'id' : $('#id_findpwd').val(),
				'email' : $('#email_findpwd').val()
			},
			dataType: 'text',
			success: function(data){
				data = data.trim();
				if(data == 'fail'){
					$('#resultDiv_findpwd').html("입력하신 정보와 일치하는 계정이 없습니다.");
					$('#resultDiv_findpwd').css('color', 'red');
					$('#resultDiv_findpwd').css('font-size', '8pt');
					$('#resultDiv_findpwd').css('font-weight', 'bold');
				} else {
					$('#resultDiv_findpwd').html("입력하신 이메일로 비밀번호를 보내드렸습니다.");
					$('#resultDiv_findpwd').css('color', 'blue');
					$('#resultDiv_findpwd').css('font-size', '10pt');
					$('#resultDiv_findpwd').css('font-weight', 'bold');
					//로그인 버튼 활성화
					$("#toLoginBtn_findpwd").show();
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