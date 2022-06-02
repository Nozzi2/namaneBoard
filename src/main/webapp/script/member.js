function checkSignUp() {
	//경고메세지 지우기
	document.getElementById("nameDiv_signup").innerText = "";
	document.getElementById("idDiv_signup").innerText = "";
	document.getElementById("pwdDiv_signup").innerText = "";
	document.getElementById("emailDiv_signup").innerText = "";
	
	//입력되지 않은 값에 경고 출력
	if(document.MemberSignUpForm.id_signup.value == "")
		document.getElementById("idDiv_signup").innerText = "아이디 입력하세요.";
	else if(document.MemberSignUpForm.id_signup.value != document.MemberSignUpForm.checkedId_signup.value)
		document.getElementById("idDiv_signup").innerText = "다시 중복확인 해주세요.";
	else if(document.MemberSignUpForm.pwd_signup.value == "")
		document.getElementById("pwdDiv_signup").innerText = "비밀번호 입력하세요.";
	else if(document.MemberSignUpForm.pwd_signup.value != document.MemberSignUpForm.repwd_signup.value)
		document.getElementById("pwdDiv_signup").innerText = "비밀번호가 일치하지 않습니다.";
	else if(document.MemberSignUpForm.name_signup.value == "")
		document.getElementById("nameDiv_signup").innerText = "이름 입력하세요.";
	else if(document.MemberSignUpForm.email_signup.value == "")
		document.getElementById("emailDiv_signup").innerText = "이메일 입력하세요.";
	else 
		document.MemberSignUpForm.submit();	
}


//회원정보 수정 체크
function checkUpdate() {
	alert('회원정보 수정 안되니??');
	//경고메세지 지우기
	document.getElementById("idDiv_update").innerText = "";
	document.getElementById("pwdDiv_update").innerText = "";
	document.getElementById("emailDiv_update").innerText = "";
	
	//입력되지 않은 값에 경고 출력
	if(document.MemberUpdateForm.pwd_update.value == "")
		document.getElementById("pwdDiv_update").innerText = "비밀번호 입력하세요.";
	else if(document.MemberUpdateForm.pwd_update.value != document.MemberUpdateForm.repwd_update.value)
		document.getElementById("pwdDiv_update").innerText = "비밀번호가 일치하지 않습니다.";
	else if(document.MemberUpdateForm.name_update.value == "")
		document.getElementById("nameDiv_update").innerText = "이름 입력하세요.";
	else if(document.MemberUpdateForm.email_update.value == "")
		document.getElementById("emailDiv_update").innerText = "이메일 입력하세요.";
	else  {
		alert('서브밋 날리기');
		document.MemberUpdateForm.submit();	
	}
		
}

//중복체크
function checkId(){
	console.log("중복체크 실행 되니?");
	document.getElementById("idDiv_signup").innerText = "";
	
	var sId = document.MemberSignUpForm.id_signup.value;
	if(sId == "")
		document.getElementById("idDiv_signup").innerText = "먼저 아이디 입력";
	else
		window.open("/namaneBoard/member/memberCheckId.do?id="+sId, "memberCheckId", "width=450 height=150");
}

//중복체크 팝업
function checkIdPopup(){
	document.getElementById("idDiv_popup").innerText = "";
	if(document.MemberCheckIdPopup.id.value == "")
		document.getElementById("idDiv_popup").innerText = "먼저 아이디 입력";
	else
		document.MemberCheckIdPopup.submit();	
}


function checkLogin() {
	//경고메세지 지우기
	document.getElementById("idDiv_login").innerText = "";
	document.getElementById("pwdDiv_login").innerText = "";
	
	//입력되지 않은 값에 경고 출력
	if(document.MemberLoginForm.id_login.value == "")
		document.getElementById("idDiv_login").innerText = "아이디 입력";
	else if(document.MemberLoginForm.pwd_login.value == "")
		document.getElementById("pwdDiv_login").innerText = "비밀번호 입력";
	else 	
		document.MemberLoginForm.submit();	
	
}