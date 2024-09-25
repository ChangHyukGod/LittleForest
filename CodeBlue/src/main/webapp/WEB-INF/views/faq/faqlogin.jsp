<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ 계정관리</title>
</head>
<style>
.title-box {
	margin-top: 70px;
}

.title {
	text-align: center;
	font-size: 34px;
	font-weight: bolder;
}

.line {
	margin: 20px 0 20px 0;
}

.body-box {
	margin: 70px 400px 70px 400px;
}

.body-title {
	text-align: left;
	font-size: 28px;
	font-weight: bolder;
	margin-left: 30px;
}

.accordion-button {
	font-size: 40px;
}

#q-title {
	font-size: 21px;
}

#q-body {
	font-size: 16px;
}

.bi-quora {
	color: rgb(170, 233, 170);
}
</style>
<body>
	<jsp:include page="/common/header.jsp" />
	<div class="title-box">
		<div class="title">
			[Little Forest] 계정 관리 <i class="bi bi-key"></i>
		</div>
		<div class="title">무엇을 도와드릴까요?</div>
	</div>

	<!-- <hr class="line"> -->

	<div class="body-box">
		<h1 class="body-title">자주 묻는 질문</h1>
		<hr class="line">
		<div class="accordion accordion-flush" id="accordionFlushExample">
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingOne">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
						<i class="bi bi-quora"></i>. 비밀번호를 잊었을 때 어떻게 복구하나요?
					</button>
				</h2>
				<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						비밀번호를 잊으셨다면, 로그인 페이지에서 '비밀번호 찾기' 버튼을 클릭하세요.<br> 해당 버튼을 누르면, 등록된 이메일 또는 전화번호로 비밀번호 재설정 링크가 발송됩니다.<br> 그 링크를 통해 새로운 비밀번호를 설정하고, 이후 해당 비밀번호로 로그인을 시도하면 됩니다.<br> 만약 이메일이나 전화번호를 잃어버렸다면 고객센터에 문의하여 계정 복구를 요청해야 합니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingTwo">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
						<i class="bi bi-quora"></i>. 계정이 잠겼을 때 어떻게 해제하나요?
					</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						계정이 잠긴 경우, 보안 문제로 인해 잠긴 것일 수 있습니다.<br> 계정 복구 절차를 통해 본인 인증을 완료하면 잠금을 해제할 수 있습니다.<br> '계정 복구' 페이지에 접속하여 본인 확인을 진행하고, 이를 통해 계정 잠금을 해제할 수 있습니다.<br> 인증이 완료되면 즉시 계정 사용이 가능해지며, 이후에는 비밀번호 변경이나 보안 설정 강화를 권장드립니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingThree">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
						<i class="bi bi-quora"></i>. 회원 정보는 어디서 수정하나요?
					</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						회원 정보는 '내 계정' 페이지에서 수정할 수 있습니다.<br> 페이지에 접속하면 이메일, 비밀번호, 연락처와 같은 개인정보를 수정할 수 있는 메뉴가 있습니다.<br> 만약 중요한 정보가 변경되었다면, 이메일 인증이나 본인 확인 절차를 추가로 요구할 수 있습니다.<br> 정보 변경 후에는 꼭 저장을 클릭하여 수정 사항이 반영되었는지 확인하세요.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingFour">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
						<i class="bi bi-quora"></i>. 계정을 탈퇴하면 데이터는 어떻게 되나요?
					</button>
				</h2>
				<div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						계정을 탈퇴하면, 사용자의 모든 데이터는 일정 기간이 지난 후 완전히 삭제됩니다.<br> 단, 법적으로 보관해야 할 데이터는 별도의 보관 기간 동안 안전하게 유지됩니다.<br> 이 기간이 지나면, 삭제된 데이터는 복구가 불가능하니 중요한 정보는 탈퇴 전에 꼭 백업해 두세요.<br> 또한, 탈퇴 전에는 미사용 포인트나 혜택이 있는지 확인하는 것이 좋습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingFive">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
						<i class="bi bi-quora"></i>. 계정 탈퇴 후 복구가 가능한가요?
					</button>
				</h2>
				<div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						계정 탈퇴 후에는 복구가 불가능합니다.<br> 탈퇴 시 모든 데이터가 삭제되기 때문에, 이후에 복구 요청을 하더라도 복구할 수 없습니다.<br> 계정을 다시 사용하려면, 새로운 계정을 생성해야 하며, 기존 정보와 혜택은 이전할 수 없습니다.<br> 따라서 중요한 데이터나 혜택은 탈퇴 전에 꼭 확인하고 백업하세요.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingSix">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">
						<i class="bi bi-quora"></i>. 계정 도용이 의심될 때 어떻게 해야 하나요?
					</button>
				</h2>
				<div id="flush-collapseSix" class="accordion-collapse collapse" aria-labelledby="flush-headingSix" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						계정 도용이 의심된다면 즉시 비밀번호를 변경하는 것이 첫 번째 조치입니다.<br> 또한, 2단계 인증을 설정하여 계정 보안을 강화하는 것이 좋습니다.<br> '내 계정' 페이지에서 최근 로그인 기록을 확인하고, 의심스러운 활동이 있는지 점검하세요.<br> 만약 도용이 의심되는 기록이 발견되면, 즉시 고객센터에 문의하여 추가 보안 조치를 받으세요.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingSeven">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven" aria-expanded="false" aria-controls="flush-collapseSeven">
						<i class="bi bi-quora"></i>. 로그인 2단계 인증은 어떻게 설정하나요?
					</button>
				</h2>
				<div id="flush-collapseSeven" class="accordion-collapse collapse" aria-labelledby="flush-headingSeven" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						로그인 2단계 인증 설정은 '내 계정' 페이지의 보안 설정에서 가능합니다.<br> 이메일 또는 인증 앱을 사용하여 추가적인 인증 단계를 설정할 수 있으며, 이를 통해 계정의 보안을 한층 강화할 수 있습니다.<br> 설정이 완료되면, 로그인 시마다 추가적인 인증 절차를 거치게 되어, 계정 도용 방지에 효과적입니다.<br> 이를 통해 더 안전하게 계정을 보호할 수 있습니다.
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/common/footer.jsp" />
</body>
</html>
