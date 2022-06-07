<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<style type="text/css">
div {
	color: red;
	font-size: 12px;
}
</style>
</head>
<body>
<form name="MemberLoginForm" id="MemberLoginForm" method="post" action="/namaneBoard/member/memberLogin.do">
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<td align="center">아이디</td>
			<td>
				<input type="text" name="id_login" id="id_login" placeholder="아이디 입력">
				<div id="idDiv_login"></div>
	   		</td>
		</tr>
		
		<tr>
			<td align="center">비밀번호</td>
			<td>
				<input type="password" name="pwd_login" id="pwd_login">
				<div id="pwdDiv_login"></div>
	   		</td>
		</tr>
		
		<tr>
			<td colspan ="2" align = "center">
				<input type="button"  value="로그인" id="loginBtn">  <!-- onclick="checkLogin()" -->
				<input type="button" value="아이디/비밀번호 찾기" onclick="location.href='/namaneBoard/member/memberFindIdForm.do'">
			</td>
		</tr>
	</table>
	<br>
	<div id="resultDiv_login"></div>
</form>
	
<br><br><input type="button" value="시작 페이지" onclick="location.href='/namaneBoard/index.jsp'">


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/namaneBoard/script/member.js"></script>
<script type="text/javascript">
$('#loginBtn').click(function(){
	$('#idDiv_login').html("");
	$('#pwdDiv_login').html("");
	
	if($('#id_login').val()==''){
		$('#idDiv_login').html("아이디를 입력하세요.");
		$('#idDiv_login').css('color', 'red');
		$('#idDiv_login').css('font-size', '8pt');
		$('#idDiv_login').css('font-weight', 'bold');
	} else if($('#pwd_login').val()==''){
		$('#pwdDiv_login').html("비밀번호를 입력하세요.");
		$('#pwdDiv_login').css('color', 'red');
		$('#pwdDiv_login').css('font-size', '8pt');
		$('#pwdDiv_login').css('font-weight', 'bold');
	} else {
		$('#idDiv_login').html("");
		$('#pwdDiv_login').html("");
		$.ajax({
			url: '/namaneBoard/member/memberLogin.do',
			type: 'post',
			data: {
				'id' : $('#id_login').val(),
				'pwd' : $('#pwd_login').val()
			},
			dataType: 'text',
			success: function(data){
				data = data.trim();
				if(data == 'fail'){
					$('#resultDiv_login').html("로그인 실패하였습니다.");
					$('#resultDiv_login').css('color', 'red');
					$('#resultDiv_login').css('font-size', '8pt');
					$('#resultDiv_login').css('font-weight', 'bold');
				} else {
					alert(data+"님 안녕하세요.");
					location.href='http://localhost:8080/namaneBoard/index.jsp';
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});
</script>



<a href="javascript:kakaoLogin();"><img src="./kakao_login.png" alt="카카오계정 로그인" style="height: 100px;"/></a>
<input type="button" value="카카오 로그아웃" onclick="secession()">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
window.Kakao.init('ec4af625a911df494e379ab49dde6e99');

//카카오 로그인
function kakaoLogin() {
    window.Kakao.Auth.login({
        scope: 'profile_nickname', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
        success: function(response) {
            console.log(response) // 로그인 성공하면 받아오는 데이터
            window.Kakao.API.request({ // 사용자 정보 가져오기 
                url: '/v2/user/me',
                success: (res) => {
                    const kakao_account = res.kakao_account;
                    console.log(kakao_account)
                }
            });
            window.location.href='/namaneBoard/index.jsp' //리다이렉트 되는 코드
        },
        fail: function(error) {
        	alert('에러뜨냐?');
            console.log(error);
        }
    });
}

//카카오 로그아웃
function secession() {
	Kakao.API.request({
    	url: '/v1/user/unlink',
    	success: function(response) {
    		console.log(response);
    		//callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
    		window.location.href='/namaneBoard/index.jsp'
    	},
    	fail: function(error) {
    		console.log('탈퇴 미완료')
    		console.log(error);
    	},
	});
};
</script>



</body>
</html>