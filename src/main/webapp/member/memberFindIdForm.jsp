<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
<form name="MemberFindIdForm" id="MemberFindIdForm" method="post" action="/namaneBoard/member/memberFindId.do">
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<td align="center">이름</td>
			<td>
				<input type="text" name="name_findid" id="name_findid" placeholder="이름 입력">
				<div id="nameDiv_findid"></div>
	   		</td>
		</tr>
		
		<tr>
			<td align="center">이메일</td>
			<td>
				<input type="text" name="email_findid" id="email_findid" placeholder="이메일 입력">
				<div id="emailDiv_findid"></div>
	   		</td>
		</tr>
		
		<tr>
			<td colspan ="2" align = "center">
				<input type="button" id="findIdBtn" value="아이디 찾기">  <!-- onclick="findId()" -->
			</td>
		</tr>
	</table>
</form>
<br>
<div id="resultDiv_findid"></div><br>
<input type="button" value="로그인" id="toLoginBtn_findid" style="display: none;" onclick="location.href='/namaneBoard/member/memberLoginForm.do'">

<br><br><input type="button" value="시작 페이지" onclick="location.href='/namaneBoard/index.jsp'">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$('#findIdBtn').click(function(){
	$('#nameDiv_findid').html("");
	$('#emailDiv_findid').html("");
	$('#resultDiv_findid').html("");
	$("#toLoginBtn_findid").hide();
	
	if($('#name_findid').val() == ''){
		$('#nameDiv_findid').html("이름을 입력하세요.");
		$('#nameDiv_findid').css('color', 'red');
		$('#nameDiv_findid').css('font-size', '8pt');
		$('#nameDiv_findid').css('font-weight', 'bold');
	} else if($('#email_findid').val() == ''){
		$('#emailDiv_findid').html("이메일을 입력하세요.");
		$('#emailDiv_findid').css('color', 'red');
		$('#emailDiv_findid').css('font-size', '8pt');
		$('#emailDiv_findid').css('font-weight', 'bold');
	} else {
		$.ajax({
			url: '/namaneBoard/member/memberFindId.do',
			type: 'post',
			data: {
				'name' : $('#name_findid').val(),
				'email' : $('#email_findid').val()
			},
			dataType: 'text',
			success: function(data){
				data = data.trim();
				if(data == 'fail'){
					$('#resultDiv_findid').html("일치하는 아이디가 없습니다.");
					$('#resultDiv_findid').css('color', 'red');
					$('#resultDiv_findid').css('font-size', '8pt');
					$('#resultDiv_findid').css('font-weight', 'bold');
				} else {
					$('#resultDiv_findid').html("아이디는 [ "+data+" ] 입니다.");
					$('#resultDiv_findid').css('color', 'blue');
					$('#resultDiv_findid').css('font-size', '10pt');
					$('#resultDiv_findid').css('font-weight', 'bold');
					//로그인 버튼 활성화
					$("#toLoginBtn_findid").show();
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