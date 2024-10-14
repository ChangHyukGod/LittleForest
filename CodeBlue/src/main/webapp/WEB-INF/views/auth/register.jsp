<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script type="text/javascript">
function all_check(event) {
    event.preventDefault(); // 폼 제출 기본 동작 방지

 	// 이름 입력값
    var membername = document.getElementById("membername").value.trim();
    
    // 이름 필드 체크
    if (!membername) {
        alert("이름을 입력해주세요.");
        document.getElementById("membername").focus(); // 포커스 이동
        return false; 
    }
    
 	// 나이 입력값
    var age = document.getElementById("age").value.trim();
    
    // 나이 필드 체크
    if (!age) {
        alert("나이를 입력해주세요.");
        document.getElementById("age").focus(); // 포커스 이동
        return false; 
    }

    // 전화번호 입력값
    var phonePart1 = document.getElementById("phone_part1").value.trim();
    var phonePart2 = document.getElementById("phone_part2").value.trim();
    var phonePart3 = document.getElementById("phone_part3").value.trim();
    
    if (phonePart2.length !== 4) {
        alert("전화번호 두 번째 필드는 반드시 4자리로 입력해야 합니다.");
        document.getElementById("phone_part2").focus(); // 포커스 이동
        return false; 
    }
    
    if (phonePart3.length !== 4) {
        alert("전화번호 세 번째 필드는 반드시 4자리로 입력해야 합니다.");
        document.getElementById("phone_part3").focus(); // 포커스 이동
        return false; 
    }

    // 전화번호 필드 체크
    if (!phonePart1 || !phonePart2 || !phonePart3) {
        alert("모든 전화번호 필드를 입력해주세요.");
        document.getElementById("phone_part1").focus(); // 포커스 이동
        return false; 
    }

    if (!/^\d+$/.test(phonePart1) || !/^\d+$/.test(phonePart2) || !/^\d+$/.test(phonePart3)) {
        alert("전화번호는 숫자만 입력할 수 있습니다.");
        document.getElementById("phone_part1").focus(); // 포커스 이동
        return false; 
    }

    var fullPhoneNumber = phonePart1 + "-" + phonePart2 + "-" + phonePart3;
    document.getElementById("phonenumber").value = fullPhoneNumber;

    var checkbox1 = document.getElementById("checkbox1").checked; 
    var checkbox2 = document.getElementById("checkbox2").checked; 
    var checkbox3 = document.getElementById("checkbox3").checked; 

    // 체크박스 체크 상태 체크
    if (!checkbox1 && (!checkbox2 || !checkbox3)) {
        alert("회원가입을 위해 두 개의 필수 체크박스를 모두 체크하거나\n전체 동의 체크박스를 체크해야 합니다.");
        document.getElementById("checkbox1").focus(); // 포커스 이동
        return false; 
    }

    // 모든 검사를 통과하면 폼 제출
    document.getElementById("listForm").submit();
}


document.addEventListener('DOMContentLoaded', function() {
    // 중복 확인 버튼이 클릭되었는지를 저장할 변수
    let usernameChecked = false;
    let emailChecked = false;

    function fn_check(event) {
        var username = document.getElementById('username').value.trim();
        if (!username) {
            alert('아이디를 입력하세요.');
            return;
        }

        fetch('/auth/check-username?username=' + encodeURIComponent(username))
        .then(response => {
            return response.text().then(text => {
                if (response.ok) {
                    alert(text); // 사용 가능한 아이디
                    usernameChecked = true; // 중복 확인 완료
                } else {
                    alert(text); // "중복된 아이디입니다." 메시지
                }
            });
        })
        .catch(error => {
            alert('아이디 중복 확인에 실패했습니다.');
        });
    }

    function fn_checkEmail(event) {
        var email = document.getElementById('email').value;
        if (!email) {
            alert('이메일을 입력하세요.');
            return;
        }

        fetch('/auth/check-email?email=' + encodeURIComponent(email))
        .then(response => {
            return response.text().then(text => {
                if (response.ok) {
                    alert(text); // 사용 가능한 이메일
                    emailChecked = true; // 중복 확인 완료
                } else {
                    alert(text); // "중복된 이메일입니다." 메시지
                }
            });
        })
        .catch(error => {
            alert('이메일 중복 확인에 실패했습니다.');
        });
    }

    const checkUsernameButton = document.getElementById('checkUsernameButton');
    if (checkUsernameButton) {
        checkUsernameButton.addEventListener('click', fn_check);
    }

    const checkEmailButton = document.getElementById('checkEmailButton');
    if (checkEmailButton) {
        checkEmailButton.addEventListener('click', fn_checkEmail);
    }

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

    function showMessage(message) {
        var messageDiv = document.getElementById('emailCheckMessage');
        messageDiv.innerText = message; 
        messageDiv.style.display = 'block'; 
    }
    
    function validateUsername() {
        const usernameInput = document.getElementById('username');
        const usernameErrorMessage = document.getElementById('username-error-message');
        const pattern = /^[a-z0-9]{4,16}$/;

        if (!pattern.test(usernameInput.value)) {
            usernameErrorMessage.style.display = 'block';
        } else {
            usernameErrorMessage.style.display = 'none';
        }
        toggleSubmitButton();
    }

    function validatePassword() {
        const passwordInput = document.getElementById('password');
        const errorMessage = document.getElementById('error-message');
        const pattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).{8,16}$/;

        if (!pattern.test(passwordInput.value)) {
            errorMessage.style.display = 'block';
        } else {
            errorMessage.style.display = 'none';
        }
        toggleSubmitButton();
    }

    function validateEmail() {
        const emailInput = document.getElementById('email');
        const emailError = document.getElementById('emailError');
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (emailPattern.test(emailInput.value)) {
            emailError.style.display = 'none';
        } else {
            emailError.style.display = 'block';
        }
        toggleSubmitButton();
    }

    function toggleSubmitButton() {
        const usernameValid = /^[a-z0-9]{4,16}$/.test(document.getElementById('username').value);
        const passwordValid = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).{8,16}$/.test(document.getElementById('password').value);
        const emailValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(document.getElementById('email').value);
        
        const submitButton = document.getElementById('submit-button');
        submitButton.disabled = !(usernameValid && passwordValid && emailValid);
    }

    // 각 입력 필드에 이벤트 리스너 추가
    document.getElementById('username').addEventListener('input', validateUsername);
    document.getElementById('password').addEventListener('input', validatePassword);
    document.getElementById('email').addEventListener('input', validateEmail);

    // 제출 버튼 클릭 이벤트 추가
    document.getElementById('submit-button').addEventListener('click', function(event) {
        if (!usernameChecked || !emailChecked) {
            alert("아이디와 이메일 중복 확인을 모두 진행해주세요.");
            event.preventDefault(); // 폼 제출 방지
        }
    });
});

    </script>


<style>
	body {
		font-size: 12px !important;
		/*    display: flex; */
		/*    justify-content: center; */
		/*    align-items: center; */
		/*    height: 100vh; */
		/*    margin: 0; */
	}
	
	#container {
		display: flex;
		flex-direction: column;
		align-items: center;
		margin: 0 auto;
		width: 90%;
		max-width: 1500px;
	}
	
	#container h4 {
		margin-top: 80px;
		margin-bottom: 50px;
	}
	
	.card-body {
		width: 100%;
	}
	
	.ro1 {
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
	
	.custom-checkbox input[type="checkbox"]:checked+label {
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
	
	.custom-checkbox input[type="checkbox"]:checked+label::before {
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
	}
</style>
</head>
<body>

	<jsp:include page="/common/header.jsp"></jsp:include>
	<div id="container">
		<div class="ro1">
			<div class="col-xl-6 col-lg-6 col-md-10">
				<div class="border-0">
					<div class="card-body">
						<h4 class="text-center mb-6 fw-bold fs-2">회원가입</h4>
						<div class="basic">
							<div class="ba">
								<span>기본정보</span>
							</div>
							<div class="sic">
								<span><b class="text-danger"> *</b>필수입력사항</span>
							</div>
						</div>

						<!-- 회원가입 form -->
						<form id="listForm" name="listForm" action="/register/addition"
							method="post" onsubmit="all_check(event)">
							
							<!-- 아이디 입력란 -->
							<div class="form-group" style="margin: 10px 0 10px 0;">
								<label for="username"></label>
								<div class="flex-grow-3"
									style="display: flex; align-items: center; margin: 0;">
									<p class="input-label" style="margin: 0;">
										아이디<b class="text-danger"> *</b>
									</p>
									<div
										style="margin-left: 10px; display: flex; align-items: center;">
										<input type="text" id="username" name="username"
											class="form-control" placeholder="" required
											style="margin: 0;" oninput="validateUsername()">
										<button type="button" id="checkUsernameButton"
											style="margin-left: 10px; font-size: 12px;"
											class="btn btn-success" onclick="fn_check(event)">중복
											확인</button>
										<div class="tooltip">
											<span class="tooltiptext" id="idCheckMessage"
												style="display: none;"></span>
										</div>
										<p
											style="margin: 0 0 0 15px; font-size: 12px; white-space: nowrap;">
											(영문소문자/숫자, 4~16자)</p>
									</div>
								</div>
								<p id="username-error-message"
									style="color: red; font-size: 12px; display: none;">아이디는 영문
									소문자와 숫자로 4~16자여야 합니다.</p>
							</div>

							<!-- 실선 추가 -->
							<hr style="border: 1px solid #BDBDBD; width: 100%; margin: 0;">

							<!-- 비밀번호 입력란 -->
							<div class="form-group" style="margin: 10px 0 10px 0;">
								<label for="password"></label>
								<div class="flex-grow-3"
									style="display: flex; align-items: center; margin: 0;">
									<p class="input-label" style="margin: 0;">
										비밀번호<b class="text-danger"> *</b>
									</p>
									<div
										style="margin-left: 10px; display: flex; align-items: center;">
										<input type="password" id="password" name="password"
											class="form-control" placeholder="" required
											style="margin: 0;" maxlength="16"
											oninput="validatePassword()">
										<p
											style="margin: 0 0 0 15px; font-size: 12px; white-space: nowrap;">
											(8~16자의 영문 대/소문자, 숫자, 특수문자)</p>
									</div>
								</div>
								<p id="error-message"
									style="color: red; font-size: 12px; display: none;">비밀번호는
									8~16자의 영문 대/소문자, 숫자, 특수문자를 포함해야 합니다.</p>
							</div>

							<!-- 실선 추가 -->
							<hr
								style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 10px 0;">

							<!-- 비밀번호 확인 입력란 -->
							<div class="form-group" style="margin: 0;">
								<label for="confirmPassword"></label>
								<div class="flex-grow-3"
									style="display: flex; align-items: center; margin: 0;">
									<p class="input-label" style="margin: 0;">
										비밀번호 확인<b class="text-danger"> *</b>
									</p>
									<div
										style="margin-left: 10px; display: flex; align-items: center;">
										<input type="password" id="confirmPassword"
											name="confirmPassword" class="form-control" placeholder=""
											required style="margin: 0;" maxlength="16">
									</div>
								</div>
							</div>

							<p id="passwordError" style="color: red; display: none;">비밀번호가
								일치하지 않습니다.</p>
							<!-- 실선 추가 -->
							<hr
								style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 10px 0;">

							<!-- 이름 -->
							<div class="form-group" style="margin: 0;">
								<label for="membername"></label>
								<div class="flex-grow-3"
									style="display: flex; align-items: center; margin: 0;">
									<p class="input-label" style="margin: 0;">
										이름<b class="text-danger"> *</b>
									</p>
									<div
										style="margin-left: 10px; display: flex; align-items: center;">
										<input type="text" id="membername" name="membername"
											class="form-control" placeholder=""
											style="margin: 0;" required>
									</div>
								</div>
							</div>

							<!-- 나이 -->
							<hr
								style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 10px 0;">

							<div class="form-group" style="margin: 0;">
								<label for="age"></label>
								<div class="flex-grow-3"
									style="display: flex; align-items: center; margin: 0;">
									<p class="input-label" style="margin: 0;">
										나이<b class="text-danger"> *</b>
									</p>
									<div
										style="margin-left: 10px; display: flex; align-items: center;">
										<input type="text" id="age" name="age" class="form-control"
											placeholder="" style="margin: 0;" required>
									</div>
								</div>
							</div>

							<!-- 실선 추가 -->
							<hr
								style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 10px 0;">

							<!-- 휴대전화 -->
							<div class="form-group" style="margin: 0;">
							    <label for="phone"></label>
							    <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;">
							        <p class="input-label" style="margin: 0;">
							            휴대전화<b class="text-danger"> *</b>
							        </p>
							        <div style="margin-left: 10px; display: flex; align-items: center;">
							            <input type="text" id="phone_part1" name="phone_part1" class="form-control form-control-sm" value="010" maxlength="3" style="width: 100px; margin-right: 5px; margin: 0;" readonly>
							            <span style="margin: 0 5px;">-</span>
							            <input class="form-control form-control-sm" name="phone_part2" id="phone_part2" type="text" placeholder="숫자 입력" aria-label="번호 입력" style="width: 100px; margin: 0;" maxlength="4" required>
							            <span style="margin: 0 5px;">-</span>
							            <input class="form-control form-control-sm" name="phone_part3" id="phone_part3" type="text" placeholder="숫자 입력" aria-label="번호 입력" style="width: 100px; margin: 0;" maxlength="4" required>
							        </div>
							    </div>
							</div>

							<input type="hidden" id="phonenumber" name="phonenumber">

							<!-- 실선 추가 -->
							<hr
								style="border: 1px solid #BDBDBD; width: 100%; margin: 5px 0 5px 0;">

							<!-- 이메일 -->
							<div class="form-group" style="margin: 10px 0 10px 0;">
							    <label for="email"></label>
							    <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;">
							        <p class="input-label" style="margin: 0;">
							            이메일<b class="text-danger"> *</b>
							        </p>
							        <div style="margin-left: 10px; display: flex; align-items: center;">
							            <input type="email" class="form-control" id="email"
							                name="email" placeholder="name@example.com"
							                style="margin: 0;" oninput="validateEmail()">
							            <button type="button" id="checkEmailButton"
							                style="margin-left: 10px; font-size: 12px;"
							                class="btn btn-success" onclick="fn_checkEmail(event)">중복 확인</button>
							            <div class="tooltip">
							                <span class="tooltiptext" id="emailCheckMessage"
							                    style="display: none;"></span>
							            </div>
							        </div>
							    </div>
							    <div id="emailError" style="color: red; display: none;">유효한 이메일 주소를 입력하세요.</div>
							</div>



							<!-- 실선 추가 -->
							<hr
								style="border: 1px solid #BDBDBD;; width: 100%; margin-top: 0px;">

							<h4 class="text-center mb-3">약관 동의</h4>
							<hr class="underline">


							<div class="custom-checkbox">
								<input type="checkbox" id="checkbox1"> <label
									for="checkbox1"></label>
								<div class="more">
									<div class="mo">
										<span class="fs-5"> &nbsp;전체 동의합니다.</span>
									</div>
									<div class="re">
										<span> ∨ </span>
									</div>
								</div>
							</div>
							<!-- 실선 추가 -->
							<hr
								style="border: 1px solid #BDBDBD;; width: 100%; margin: 2px 0 15px 0;">

							<div class="custom-checkbox">
								<input type="checkbox" id="checkbox2"> <label
									for="checkbox2"></label>
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
								<input type="checkbox" id="checkbox3"> <label
									for="checkbox3"></label>
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
								<input type="checkbox" id="checkbox4"> <label
									for="checkbox4"></label>
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
								<input type="checkbox" id="checkbox5"> <label
									for="checkbox5"></label>
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
								<input type="checkbox" id="checkbox6"> <label
									for="checkbox6"></label>
								<div class="agree">
									<div class="agr">
										<span> &nbsp; [선택] 광고·마케팅 수신 동의(이메일)</span>
									</div>
									<div class="ee">
										<span><b> ∨ </b></span>
									</div>
								</div>
							</div>
							<script>
							// 전체 동의 체크박스(checkbox1)에 이벤트 리스너 추가
							document.getElementById('checkbox1').addEventListener('change', function() {
							    // 모든 체크박스를 선택 (전체 동의 체크박스를 제외한)
							    let checkboxes = document.querySelectorAll('.custom-checkbox input[type="checkbox"]');

							    // 체크박스가 변경될 때마다
							    for (let i = 1; i < checkboxes.length; i++) {
							        // 전체 동의 체크박스의 상태에 따라 나머지 체크박스의 상태를 설정
							        checkboxes[i].checked = this.checked; // 전체 동의 체크박스가 체크되면 나머지 체크박스도 체크, 아니면 해제
							    }
							});

							// 개별 체크박스들을 선택 (전체 동의 체크박스를 제외한)
							let individualCheckboxes = document.querySelectorAll('.custom-checkbox input[type="checkbox"]:not(#checkbox1)');

							// 각 개별 체크박스에 이벤트 리스너 추가
							individualCheckboxes.forEach(function(checkbox) {
							    checkbox.addEventListener('change', function() {
							        // 모든 개별 체크박스가 체크되어 있는지 확인
							        let allChecked = Array.from(individualCheckboxes).every(c => c.checked);

							        // 개별 체크박스가 모두 체크되면 전체 동의 체크박스를 체크
							        document.getElementById('checkbox1').checked = allChecked;
							    });
							});
         					</script>
							<!-- 실선 추가 -->
							<hr
								style="border: 1px solid #BDBDBD;; width: 100%; margin: 2px 0 60px 0;">

							<c:if test="${not empty errorMessage}">
								<div class="alert alert-danger" role="alert">
									${errorMessage}</div>
							</c:if>
							<button id="submit-button" type="submit"
								class="btn btn-success btn-block"
								style="padding: 10px 40px; font-size: 16px; margin-bottom: 25px;"
								disabled onclick="signup()">회원가입
							</button>
						</form>
					</div>

				</div>

			</div>

		</div>
	</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>