
// 회원가입 
function joinCheck(){
 if(document.joinForm.email.value.length == 0) {
	 alert("이메일을 입력해주세요");
	 joinForm.email.focus();
	 return false;
 }
 
 if(document.joinForm.name.value.length ==0) {
	 alert("이름을 입력해주세요");
	 joinForm.name.focus();
	 return false;
 } 
 
 
 if(document.joinForm.pwd.value==""){
	 alert("비밀번호는 반드시 입력해야 합니다");
	 joinForm.pwd.focus();
	 return false;
 }
 
 if(document.joinForm.pwd.value != document.joinForm.pwd_check.value){
	 alert("암호가 일치하지 않습니다");
	 joinForm.pwd.focus();
	 return false;
 }
 
 return true;
}