<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script type="text/javascript">
	window.onload = function() {
		var userPhone = "${sessionScope.memberVO.phonenumber}"; // "010-1234-5678"

		if (userPhone) {
			// 전화번호를 '-' 기준으로 분리합니다.
			var phoneParts = userPhone.split("-");

			// 각 input 필드에 값을 나누어 넣습니다.
			document.getElementById('phonePart2').value = phoneParts[1]; // phonePart2는 중간 부분
			document.getElementById('phonePart3').value = phoneParts[2]; // phonePart3는 마지막 부분
		}

		validatePassword();
	};

	function goHome() {
		window.location.href = "/"; // 로고 클릭시 홈화면으로 페이지를 새로 고침
	}

	function fn_save() {
	    var phonePart1 = document.getElementById('phonePart1').value; // 첫 번째 부분 (예: 010)
	    var phonePart2 = document.getElementById('phonePart2').value; // 중간 부분 (예: 1234)
	    var phonePart3 = document.getElementById('phonePart3').value; // 마지막 부분 (예: 5678)

	    // 중간 번호와 마지막 번호가 각각 4자리인지 검사
	    if (phonePart2.length !== 4 || phonePart3.length !== 4) {
	        alert("중간 번호와 마지막 번호는 각각 4자리여야 합니다.");
	        return; // 함수 종료
	    }

	    // 전체 전화번호를 결합
	    var fullPhoneNumber = phonePart1 + "-" + phonePart2 + "-" + phonePart3;

	    // 숨겨진 필드에 결합된 전화번호 값을 설정
	    document.getElementById("phonenumber").value = fullPhoneNumber;

	    // 1) action 속성 : "/basic/dept/edit"
	    document.detailForm.action = "/infofix";
	    // 2) submit() 실행
	    document.detailForm.submit();
	}


	function validatePassword() {
		const passwordInput = document.getElementById('password');
		const confirmPasswordInput = document.getElementById('confirmPassword');
		const saveButton = document.getElementById('saveButton');
		const passwordError = document.getElementById('passwordError');

		function checkPasswordValidity() {
			const password = passwordInput.value;
			const confirmPassword = confirmPasswordInput.value;
			const regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).{8,16}$/;

			if (!regex.test(password)) {
				// 비밀번호가 조건을 만족하지 않으면
				saveButton.disabled = true; // 버튼 비활성화
				passwordError.style.display = 'block'; // 오류 메시지 표시
				passwordError.textContent = '비밀번호는 8~16자, 대／소문자, 숫자 및 특수문자를 포함해야 합니다.';
			} else {
				// 모든 조건을 만족하면
				if (password === confirmPassword) {
					saveButton.disabled = false; // 버튼 활성화
					passwordError.style.display = 'none'; // 오류 메시지 숨김
				} else {
					saveButton.disabled = true; // 버튼 비활성화
					passwordError.style.display = 'block'; // 오류 메시지 표시
					passwordError.textContent = '비밀번호가 일치하지 않습니다.';
				}
			}
		}

		passwordInput.addEventListener('input', checkPasswordValidity);
		confirmPasswordInput.addEventListener('input', checkPasswordValidity);
	}
</script>

<style>
<
style>.container {
	width: 90%;
	display: flex;
}

.main-content {
	flex-grow: 1;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-left: -80px;
	padding-left: 100px;
}

.left-align {
	position: fixed;
	top: 120px;
	left: 20px;
	z-index: 100;
	padding: 50px;
	width: 100%;
	max-width: 300px;
	align-self: flex-start;
}

.left-align h4 {
	margin-top: 50px;
	margin-bottom: 20px;
}

.left-align p {
	margin-bottom: 10px;
}

.left-align-button {
	background-color: #4CAF50;
	border: none;
	text-align: center;
	text-decoration: none; /
	display: block;
	margin: 5px 0;
	cursor: pointer;
	transition: background-color 0.3s;
	margin-left: -12px;
	outline: none;
	box-shadow: none;
}

.left-align-button:focus {
	outline: none;
	box-shadow: none;
}

.left-align-button:active {
	outline: none;
	box-shadow: none;
}

.left-align-button:hover {
	background-color: #45a049;
	color: yellow;
	outline: none;
}

.card-body {
	width: 800px;
	padding: 10px; /* 내부 여백 조정 */
	margin: 0;
}

.title {
	font-size: 25px;
	font-weight: bold;
	margin-top: 30px;
	margin-bottom: 10px; /* 여백 조정 */
}

.underline {
	border: 1px solid black;
	width: 100%;
	margin: 10px 0; /* 여백 조정 */
}

.header {
	margin: 50px 0; /* 좌우 마진을 auto로 설정하여 중앙 정렬 */
	padding: 0;
	background-color: #bae4ae;
	color: white;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 800px;
	border: 1px solid brown;
	border-radius: 5px;
}

.top {
	width: 100%;
	text-align: center;
	padding: 10px;
	background-color: rgba(255, 255, 255, 0.2);
	border-bottom: 1px solid brown;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

.bottom {
	width: 100%;
	text-align: center;
	padding: 10px;
	background-color: white;
	color: black;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}

.header .welcome {
	font-size: 20px;
}

.header .info {
	font-size: 18px;
}

.header .info span {
	margin-left: 24px;
}

.custom-success {
	color: #bae4ae;
}

.form-check {
	margin-bottom: 15px;
}

.basic {
	margin-top: 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
}

.ba {
	font-weight: bold;
}

.sic {
	font-size: 12px;
}

.form-group {
	/* 여백 조정 */
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
}
</style>
</head>
<body>
	<jsp:include page="/common/header.jsp" />

	<div class="main-content">
		<p class="title">회원 정보 수정</p>
		<!-- 상단 사용자 정보 -->
		<div class="header">
			<div class="top">

				<span class="fw-bold">${sessionScope.memberVO.membername}님
					반갑습니다.</span>
			</div>

		</div>
		<br>
		<div class="card-body">
			<form id="detailForm" name="detailForm" method="POST">
		<div class="card-body">
				<!-- 기본 정보 -->
				<div class="basic">
					<div class="ba">
						<span>기본정보</span>
					</div>

					<div class="sic">
						<span><b class="text-danger"> *</b>필수입력사항</span>
					</div>
				</div>

				<hr class="underline">
				<!-- 아이디 -->
				<div class="form-group" style="margin: -20px 0 10px 0;">
					<label for="username"></label>
					<div class="flex-grow-3"
						style="display: flex; align-items: center; margin: 0;">
						<p class="input-label" style="margin: 0;">
							아이디<b class="text-danger"> *</b>
						</p>
						<div
							style="margin-left: 10px; display: flex; align-items: center;">
							<input class="form-control" id="username" name="username"
								type="text"
								value="<c:out value="${sessionScope.memberVO.username}"/>"
								aria-label="readonly input example" readonly>
							<p
								style="margin: 0 0 0 15px; font-size: 12px; white-space: nowrap;">(영문소문자/숫자,
								4~16자)</p>
						</div>
					</div>
				</div>

				<!-- 실선 추가 -->
				<hr
					style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 0 0;">

				<!-- 비밀번호 -->
				<div class="form-group" style="margin: -10px 0 10px 0;">
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
								style="background-color: #F6F6F6; color: #333;" value="">
							<p
								style="margin: 0 0 0 15px; font-size: 12px; white-space: nowrap;">(8~16자의
								영문 대/소문자, 숫자, 특수문자)</p>
						</div>
					</div>
				</div>
				<!-- 실선 추가 -->
				<hr style="border: 1px solid #BDBDBD; width: 100%; margin: 0;">

				<!-- 비밀번호 확인 -->
				<div class="form-group" style="margin: -10px 0 10px 0;">
					<label for="passwordConfirm"></label>
					<div class="flex-grow-3"
						style="display: flex; align-items: center; margin: 0;">
						<p class="input-label" style="margin: 0;">
							비밀번호 확인<b class="text-danger"> *</b>
						</p>
						<div
							style="margin-left: 10px; display: flex; align-items: center;">
							<input type="password" id="confirmPassword"
								name="confirmPassword" class="form-control" placeholder=""
								required style="background-color: #F6F6F6; color: #333;">
						</div>
					</div>
				</div>
				<p id="passwordError" style="color: red; display: none;">비밀번호가
					일치하지 않습니다.</p>
				<!-- 실선 추가 -->
				<hr
					style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 0 0;">

				<!-- 이름 -->
				<div class="form-group" style="margin: -10px 0 10px 0;">
					<label for="membername"></label>
					<div class="flex-grow-3"
						style="display: flex; align-items: center; margin: 0;">
						<p class="input-label" style="margin: 0;">
							이름<b class="text-danger"> *</b>
						</p>
						<div
							style="margin-left: 10px; display: flex; align-items: center;">
							<input class="form-control" id="membername" name="membername"
								type="text" value="${sessionScope.memberVO.membername}"
								aria-label="readonly input example" readonly>
						</div>
					</div>
				</div>
				<!-- 실선 추가 -->
				<hr
					style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 0 0;">
				<!-- 나이 -->
				<div class="form-group" style="margin: -10px 0 10px 0;">
					<label for="age"></label>
					<div class="flex-grow-3"
						style="display: flex; align-items: center; margin: 0;">
						<p class="input-label" style="margin: 0;">
							나이<b class="text-danger"> *</b>
						</p>
						<div
							style="margin-left: 10px; display: flex; align-items: center;">
							<input class="form-control" id="age" name="age" type="text"
								value="${sessionScope.memberVO.age}"
								aria-label="readonly input example" readonly>
						</div>
					</div>
				</div>
				<!-- 실선 추가 -->
				<hr
					style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 0 0;">

				<!-- 휴대전화 -->
				<div class="form-group" style="margin: -10px 0 10px 0;">
				    <label for="phone"></label>
				    <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;">
				        <p class="input-label" style="margin: 0;">휴대전화<b class="text-danger"> *</b></p>
				        <div style="margin-left: 10px; display: flex; align-items: center;">
				            <input class="form-control form-control-sm" id="phonePart1" name="phonePart1" type="text"
				                aria-label="번호 선택" style="width: 100px; margin-right: 5px;" value="010" readonly>
				            <span style="margin: 0 5px;">-</span>
				            <input class="form-control form-control-sm" id="phonePart2" name="phonePart2" type="text"
				                aria-label="번호 입력" style="width: 100px; margin: 0;" maxlength="4" value="">
				            <span style="margin: 0 5px;">-</span>
				            <input class="form-control form-control-sm" id="phonePart3" name="phonePart3" type="text"
				                aria-label="번호 입력" style="width: 100px; margin: 0;" maxlength="4" value="">
				        </div>
				    </div>
				</div>
				<input type="hidden" id="phonenumber" name="phonenumber">

				<!-- 실선 추가 -->
				<hr
					style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 0 0;">
				<div class="flex-grow-3"
					style="display: flex; align-items: center; margin-bottom: 15px; margin-top: 10px;">
					<p style="color: black; margin: 0; width: 150px;">
						SMS 수신여부<b class="text-danger"> *</b>
					</p>
					<div style="margin-left: 10px; display: flex; align-items: center;">
						<div style="margin-right: 20px;">
							<input class="form-check-input" type="radio" name="authType1"
								id="emailAuth1" checked> <label class="form-check-label"
								for="emailAuth">수신함</label>
						</div>
						<div>
							<input class="form-check-input" type="radio" name="authType1"
								id="phoneAuth1"> <label class="form-check-label"
								for="phoneAuth">수신안함</label>
						</div>
					</div>
				</div>
				<!-- 실선 추가 -->
				<hr style="border: 1px solid #BDBDBD; width: 100%; margin: 0;">


				<!-- 이메일 -->
				<div class="form-group" style="margin: -10px 0 10px 0;">
					<label for="email"></label>
					<div class="flex-grow-3"
						style="display: flex; align-items: center; margin: 0;">
						<p class="input-label" style="margin: 0;">
							이메일<b class="text-danger"> *</b>
						</p>
						<div
							style="margin-left: 10px; display: flex; align-items: center;">
							<input class="form-control" id="email" name="email" type="text"
								value="${sessionScope.memberVO.email}"
								aria-label="readonly input example" readonly>
						</div>
					</div>
				</div>
				<!-- 실선 추가 -->
				<hr style="border: 1px solid #BDBDBD; width: 100%; margin: 0;">
				<br> <br>

				<div class="text-center">
					<button type="button" id="saveButton" class="btn btn-success"
						onclick="fn_save()"
						style="padding: 10px 40px; font-size: 14px; width: 180px; margin-bottom: 50px; margin-right: 5px;"
						disabled>회원정보 수정</button>

					<button type="submit" class="btn btn-outline-success"
						style="padding: 10px 40px; font-size: 14px; width: 180px; margin-bottom: 50px; margin-left: 5px;"
						onclick="goHome()">취소</button>
				</div>
				</div>
			</form>
			
		</div>
		
	</div>


	<jsp:include page="/common/footer.jsp" />
</body>
</html>