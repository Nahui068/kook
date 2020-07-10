// 회원 등록 페이지에서 사용하는 스크립트파일
// 작성자 : 전민기

	// 페이지 열릴 때, 곧바로 input text에 커서 생성
function begin(){
	    document.register.id.focus();
}

// 페이지 열릴 때, 곧바로 input text에 커서 생성
function beginLogin(){
	    document.login.id.focus();
}

// 아이디 중복 여부를 판단
function openConfirmid(register) {  	
			// url과 사용자 입력 id를 조합합니다.
		url = "registerConfirmId.jsp?id="+register.id.value;
			// 새로운 윈도우를 엽니다.
        open(url, "confirm",  "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500, height=200");
}

	// 비밀번호 확인 (회원등록 페이지)
function registerCheckIt() {
		var register = eval("document.register");
		if(register.pw.value != register.pw_ck.value)             	
		{
				alert("Please enter the same password");
				return false;
		}	        
}

	// 비밀번호 확인 (회원정보수정 페이지)
function modifyCheckIt(){
	var memberinfo = eval("document.memberinfo");
	
	if(!memberinfo.pw.value){
			alert("비밀번호를 입력하세요");
			return false;
	}
	if(memberinfo.pw.value != memberinfo.pw_ck.value){
			alert("비밀번호를 동일하게 입력하세요");
			return false;
	}
	if(!memberinfo.name.value){
			alert("사용자 이름을 입력하세요");
			return false;
	}
}
