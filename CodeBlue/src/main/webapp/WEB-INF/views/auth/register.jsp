<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script type="text/javascript">
//  function fn_check(event){
// 		document.listForm.method = "get";
// 		document.listForm.action = "/test";
// 		document.listForm.submit();

//  }
</script>

<style>
  <style>
body {
            font-size: 12px !important;
            display: flex;
            justify-content: center; 
            align-items: center; 
            height: 100vh; 
            margin: 0; 
        }

.container {
    display: flex;
    flex-direction: column;
    align-items: center; 
    margin: 0 auto; 
    width: 90%; 
    max-width: 1500px; 
}
.container h4 {
    margin-top: 80px;
    margin-bottom : 50px;
}
.card-body {
    width: 100%; 
}
        .row {
            display: flex;
            flex-direction: column; 
            justify-content: center; 
            align-items: center; 
            width: 100%; 
        }
  .underline {
    border: 1px solid black;
    width: 100%;
    margin: 20px 0; 
  }
  
  .form-check {
    margin-bottom: 15px; 
  }
  
  .basic {
    margin-top: 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid black;
    width: 100%; 
  }

  .ba {
    font-weight: bold;
  }

  .sic {
    font-size: 12px;
  }

  .form-group {
    margin-bottom: 15px; 
    width: 100%; 
  }
  
  .form-control {
    height: 30px;
    width: 100%; 
    max-width: 200px; 
  }

  .input-label {
    color: black; 
    margin-top: 10px; 
    width: 150px; 
    white-space: nowrap;
  }
  
  .custom-checkbox {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
    width: 100%;
  }

  .custom-checkbox input[type="checkbox"] {
    display: none;
  }

  .custom-checkbox label {
    width: 24px;
    height: 24px;
    border: 2px solid #ccc;
    border-radius: 50%; 
    display: inline-block;
    position: relative;
    cursor: pointer;
    background-color: #fff; 
    transition: background-color 0.3s, border-color 0.3s;
  }

  .custom-checkbox input[type="checkbox"]:checked + label {
    border-color: #4CAF50; 
  }

  .custom-checkbox label::before {
    content: ''; 
    position: absolute;
    top: 50%;
    left: 27%; 
    width: 12px;
    height: 18px;
    border: solid green;
    border-width: 0 3px 3px 0;
    transform: rotate(45deg) translate(-50%, -50%);
    display: none; 
  }

  .custom-checkbox input[type="checkbox"]:checked + label::before {
    display: block; 
  }

  .custom-checkbox span {
    font-size: 16px;
    color: #333; 
  }


  .more {
    font-weight: bold;
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
  }

  .more .mo {
    font-size: 20px;
  }

  .more .re {
    font-size: 14px;
  }

  .agree {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
  }
  
  .agree .agr {
    font-size: 28px;
  }

  .agree .ee {
    font-size: 14px;
  }

  .ee {
    margin-left: auto; 
    
  
    
</style>
</head>
<body>
   <jsp:include page="/common/header.jsp"></jsp:include>
   <div class="container">
	<div class="row justify-content-center">
		<div class="col-xl-6 col-lg-6 col-md-10">
			<div class="border-0">
 				<div class="card-body">
    				<h4 class="text-center mb-6 fw-bold fs-2">회원가입</h4>
    				<hr class="underline">
						<div class="flex-grow-3" style="display: flex; align-items: center; margin-bottom: 15px;">
			   				 <p style="color: black; margin: 0; width: 150px;">회원구분<b class="text-danger"> *</b></p>
			  			<div style="margin-left: 10px;">
			        <input class="form-check-input" type="radio" name="memberType" id="flexRadioDefault1">
			        <label class="form-check-label" for="flexRadioDefault1">개인회원</label>
			    </div>
			</div>
						<!-- 실선 추가 -->
	<hr style="border: 1px solid #BDBDBD;; width: 100%; margin-top: 2px ;">
			
				<div class="flex-grow-3" style="display: flex; align-items: center; margin-bottom: 15px;">
	    <p style="color: black; margin: 0; width: 150px;">회원인증<b class="text-danger"> *</b></p>
	    <div style="margin-left: 10px; display: flex; align-items: center;">
	        <div style="margin-right: 20px;">
	            <input class="form-check-input" type="radio" name="authType" id="emailAuth">
	            <label class="form-check-label" for="emailAuth">이메일 인증</label>
	        </div>
	        <div>
	            <input class="form-check-input" type="radio" name="authType" id="phoneAuth">
	            <label class="form-check-label" for="phoneAuth">휴대폰 인증</label>
			</div>
			</div>
			</div>
					<!-- 실선 추가 -->
	<hr style="border: 1px solid #BDBDBD;; width: 100%; margin-top: 2px ;">
			 <div class="basic">
	        <div class="ba">
	            <span>기본정보</span>
	        </div>
	        <div class="sic">
	            <span><b class="text-danger"> *</b>필수입력사항</span>
	        </div>
	        </div>

<!-- 아이디 -->
	<form id="listForm" name="listForm" action="/register/addition" method="post">
        <!-- 아이디 입력란 -->
        <div class="form-group" style="margin: 10px 0 10px 0;">  
            <label for="username"></label>
            <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;"> 
                <p class="input-label" style="margin: 0;">아이디<b class="text-danger"> *</b></p>
                <div style="margin-left: 10px; display: flex; align-items: center;">
                    <input type="text" 
                        id="username"
                        name="username" 
                        class="form-control" 
                        placeholder="" 
                        required 
                        style="margin: 0;">
                        <button type="button" style="margin-left: 10px;" class="btn btn-primary" onclick="fn_check(event)">중복 확인</button>
                    	<p id="idCheckMessage" style="margin: 0 0 0 15px; font-size: 10px; color: red; display: none;"></p>
                    <p style="margin: 0 0 0 15px; font-size: 12px; white-space: nowrap;">(영문소문자/숫자, 4~16자)</p>
                </div>
            </div>
        </div>
    	
        <!-- 실선 추가 -->
        <hr style="border: 1px solid #BDBDBD; width: 100%; margin: 0;"> 

        <!-- 비밀번호 입력란 -->
        <div class="form-group" style="margin: 10px 0 10px 0;">  
            <label for="password"></label>
            <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;"> 
                <p class="input-label" style="margin: 0;">비밀번호<b class="text-danger"> *</b></p>
                <div style="margin-left: 10px; display: flex; align-items: center;">
                    <input type="password" 
                        id="password" 
                        name="password" 
                        class="form-control" 
                        placeholder="" 
                        required 
                        style="margin: 0;">
                    <p style="margin: 0 0 0 15px; font-size: 12px; white-space: nowrap;">(8~16자의 영문 대/소문자, 숫자, 특수문자)</p>
                </div>
            </div>
        </div>

        <!-- 실선 추가 -->
        <hr style="border: 1px solid #BDBDBD; width: 100%; margin:10px 0 10px 0;"> 

        <!-- 비밀번호 확인 입력란 -->
        <div class="form-group" style="margin: 0;"> 
            <label for="confirmPassword"></label>
            <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;"> 
                <p class="input-label" style="margin: 0;">비밀번호 확인<b class="text-danger"> *</b></p>
                <div style="margin-left: 10px; display: flex; align-items: center;">
                    <input type="password" 
                        id="confirmPassword" 
                        name="confirmPassword" 
                        class="form-control" 
                        placeholder="" 
                        required 
                        style="margin: 0;"> 
                </div>
            </div>
        </div>

        <p id="passwordError" style="color: red; display: none;">비밀번호가 일치하지 않습니다.</p>
        
        <script>
            const passwordInput = document.getElementById('password');
            const confirmPasswordInput = document.getElementById('confirmPassword');
            const passwordError = document.getElementById('passwordError');
            
            confirmPasswordInput.addEventListener('input', function() {
                if (passwordInput.value !== confirmPasswordInput.value) {
                    passwordError.style.display = 'block';
                } else {
                    passwordError.style.display = 'none';
                }
            });
        </script>
    
<!-- 실선 추가 -->
<hr style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 10px 0;">

<!-- 이름 -->
<div class="form-group" style="margin: 0;">  
    <label for="username"></label>
    <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;"> 
        <p class="input-label" style="margin: 0;">이름<b class="text-danger"> *</b></p>
        <div style="margin-left: 10px; display: flex; align-items: center;">
            <input type="text" 
            id="membername" 
            name="membername" class="form-control" placeholder="" required style="margin: 0;"> 
        </div>
    </div>
</div>

<!-- 실선 추가 -->
<hr style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 10px 0;">

<div class="form-group" style="margin: 0;">  
    <label for="username"></label>
    <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;"> 
        <p class="input-label" style="margin: 0;">나이<b class="text-danger"> *</b></p>
        <div style="margin-left: 10px; display: flex; align-items: center;">
            <input type="text" 
            id="age" 
            name="age" class="form-control" placeholder="" required style="margin: 0;"> 
        </div>
    </div>
</div>

<!-- 실선 추가 -->
<hr style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 10px 0;">

<!-- 휴대전화 -->
<div class="form-group" style="margin: 0;">  
    <label for="phone"></label>
    <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;"> 
        <p class="input-label" style="margin: 0;">휴대전화 (선택)</p>
        <div style="margin-left: 10px; display: flex; align-items: center;">
            <select class="form-select form-select-sm" aria-label="번호 선택" style="width: 100px; margin-right: 5px; margin: 0;">
                <option value="010" selected>010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
            </select>
            <span style="margin: 0 5px;">-</span>
            <input class="form-control form-control-sm" type="text" placeholder="" aria-label="번호 입력" style="width: 100px; margin: 0;">
            <span style="margin: 0 5px;">-</span>
            <input class="form-control form-control-sm" type="text" placeholder="" aria-label="번호 입력" style="width: 100px; margin: 0;">
        </div>
    </div>
</div>

<!-- 실선 추가 -->
<hr style="border: 1px solid #BDBDBD; width: 100%; margin: 5px 0 5px 0;">

<!-- 이메일 -->
<div class="form-group" style="margin:10px 0 10px 0;">  
    <label for="username"></label>
    <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;"> 
        <p class="input-label" style="margin: 0;">이메일<b class="text-danger"> *</b></p>
        <div style="margin-left: 10px; display: flex; align-items: center;">
<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com" style="margin: 0;">
        </div>
    </div>
</div>


					<!-- 실선 추가 -->
	<hr style="border: 1px solid #BDBDBD;; width: 100%; margin-top:0px ;">

	
	<!-- 추가정보 -->
	<div class="basic">
	        <div class="ba">
	            <span>추가정보</span>
	        </div>
	        </div>
	
<div class="flex-grow-3" style="display: flex; align-items: center; margin-bottom: 15px; margin-top:10px;">
    <p style="color: black; margin: 0; width: auto; white-space: nowrap;">만 14세 이상입니다.<b class="text-danger"> *</b></p>
    <div style="margin-left: 10px; display: flex; align-items: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input class="form-check-input" type="radio" name="memberType" id="flexRadioDefault1">
        <label class="form-check-label" for="flexRadioDefault1" style="margin-left: 5px;">네</label>
    </div>
</div>

			<!-- 실선 추가 -->
	<hr style="border: 1px solid #BDBDBD;; width: 100%; margin: 2px 0 60px 0;">


			
			<h4 class="text-center mb-3">약관 동의</h4>
    				<hr class="underline">

		
  <div class="custom-checkbox">
        <input type="checkbox" id="checkbox1">
        <label for="checkbox1"></label>
        <div class="more">
     	   <div class="mo">
            <span class="fs-5">  &nbsp;전체 동의합니다.</span>
      	  </div>
      	  <div class="re">
           	 <span> ∨ </span>
        	</div>
        </div>
    </div>
    			<!-- 실선 추가 -->
	<hr style="border: 1px solid #BDBDBD;; width: 100%; margin: 2px 0 15px 0;">

    <div class="custom-checkbox">
        <input type="checkbox" id="checkbox2">
        <label for="checkbox2"></label>
        <div class="agree">
     	   <div class="agr">
            <span> &nbsp; [필수] 이용약관 동의</span>
      	  </div>
      	  <div class="ee">
           	 <span><b> ∨ </b></span>
        </div>
    </div>
    </div>



    <div class="custom-checkbox">
        <input type="checkbox" id="checkbox3">
        <label for="checkbox3"></label>
        <div class="agree">
     	   <div class="agr">
            <span> &nbsp; [필수] 개인정보 수집 및 이용 동의 </span>
      	  </div>
      	  <div class="ee">
           	 <span><b> ∨ </b></span>
        	</div>
        </div>
    </div>

    <div class="custom-checkbox">
        <input type="checkbox" id="checkbox4">
        <label for="checkbox4"></label>
        <div class="agree">
     	   <div class="agr">
            <span> &nbsp; [선택] 개인정보 수집 및 이용 동의 </span>
      	  </div>
      	  <div class="ee">
           	 <span><b> ∨ </b></span>
        	</div>
        </div>
    </div>


    <div class="custom-checkbox">
        <input type="checkbox" id="checkbox5">
        <label for="checkbox5"></label>
        <div class="agree">
     	   <div class="agr">
            <span> &nbsp; [선택] 광고·마케팅 수신 동의(SMS) </span>
      	  </div>
      	  <div class="ee">
           	 <span><b> ∨ </b></span>
        	</div>
        </div>
    </div>


    <div class="custom-checkbox">
        <input type="checkbox" id="checkbox6">
        <label for="checkbox6"></label>
        <div class="agree">
     	   <div class="agr">
            <span> &nbsp; [선택] 광고·마케팅 수신 동의(이메일)</span>
      	  </div>
      	  <div class="ee">
           	 <span><b> ∨ </b></span>
        	</div>
        </div>
    </div>
    			<!-- 실선 추가 -->
	<hr style="border: 1px solid #BDBDBD;; width: 100%; margin: 2px 0 60px 0;">
		
		
		<div class="text-center">
		<button type="submit" class="btn btn-success btn-block" style="padding: 10px 40px; font-size: 16px; margin-bottom: 25px;" onclick="location.href='/basic/register'">회원가입</button>
		</div>
</form>
		</div>
		
	</div>
	
	</div>
	
</div>
</div>





      <jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>