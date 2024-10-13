<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ 이용제한</title>
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
	font-size: 24px;
	font-weight: bolder;
	margin-left: 30px;
}

#Q-title {
	font-size: 13px;
}

#Q-body {
	font-size: 11px;
}
</style>
<body>
	<jsp:include page="/common/header.jsp" />
	<div class="title-box">
		<div class="title">
			[Little Forest] 이용 제한 <i class="bi bi-key"></i>
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
						<i class="bi bi-quora"></i>. 이용 제한 사유는 어떻게 확인할 수 있나요?
					</button>
				</h2>
				<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						이용 제한이 발생한 경우, 그 사유는 이메일 또는 알림을 통해 안내받을 수 있습니다.<br> 또한, '내 계정' 페이지에 접속하여 이용 제한 사유와 관련된 상세 정보를 확인할 수 있습니다.<br> 안내된 정보를 통해 문제가 되는 활동이나 콘텐츠를 파악하고, 조치 방법을 검토할 수 있습니다.<br> 필요시 고객센터에 문의하여 추가적인 정보를 요청할 수도 있습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingTwo">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
						<i class="bi bi-quora"></i>. 이용 제한 해제는 어떻게 요청하나요?
					</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						이용 제한 해제 요청은 '고객센터'를 통해 가능합니다.<br> 먼저 이용 제한 사유를 확인한 후, 이를 해결하기 위한 증빙 서류나 추가 정보를 제출해야 합니다.<br> 고객센터에 관련된 서류를 제출한 후, 검토 절차를 거쳐 이용 제한 해제 여부가 결정됩니다.<br> 이 과정은 몇일이 소요될 수 있으니, 진행 상황을 고객센터를 통해 확인하는 것이 좋습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingThree">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
						<i class="bi bi-quora"></i>. 비정상적인 활동으로 계정이 제한됐어요. 어떻게 해결하나요?
					</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						계정이 비정상적인 활동으로 인해 제한된 경우, 본인 인증을 통해 계정 잠금을 해제할 수 있습니다.<br> 비정상적인 활동이란 계정 도용이나 스팸 활동이 포함될 수 있습니다.<br> 이 경우 고객센터에 문의하여 추가 조치를 요청하거나, 보안 강화를 위해 비밀번호를 변경하는 것이 권장됩니다.<br> 2단계 인증을 설정하면 앞으로의 계정 보안을 더욱 강화할 수 있습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingFour">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
						<i class="bi bi-quora"></i>. 부적절한 게시물로 인해 이용 제한을 받았습니다. 어떻게 해결하나요?
					</button>
				</h2>
				<div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						부적절한 게시물로 인해 이용 제한을 받았을 경우, 해당 게시물을 수정하거나 삭제해야 합니다.<br> 커뮤니티 가이드라인을 위반했을 때 발생할 수 있으며, 이를 해결하기 위해서는 문제가 된 콘텐츠를 반드시 수정해야 합니다.<br> 수정된 후에는 고객센터에 재심사를 요청할 수 있으며, 이를 통해 제한이 해제될 수 있습니다.<br> 향후 유사한 문제가 발생하지 않도록 가이드라인을 준수하는 것이 중요합니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingFive">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
						<i class="bi bi-quora"></i>. 다른 사람이 내 계정을 이용하여 제한됐습니다. 어떻게 해야 하나요?
					</button>
				</h2>
				<div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						다른 사람이 내 계정을 사용해 제한을 받았다면, 즉시 고객센터에 신고하고 비밀번호를 변경하세요.<br> 계정 도용이 의심될 경우, 비밀번호만 변경하는 것보다 2단계 인증 설정을 통해 보안을 강화하는 것이 좋습니다.<br> 고객센터에 관련 증빙 자료를 제출하고, 계정 보안 절차를 거쳐 제한 해제를 요청할 수 있습니다.<br> 조치가 완료되면 앞으로의 보안을 위해 정기적으로 계정 활동을 점검하는 것이 중요합니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingSix">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">
						<i class="bi bi-quora"></i>. 이용 제한이 장기적으로 지속되면 어떻게 되나요?
					</button>
				</h2>
				<div id="flush-collapseSix" class="accordion-collapse collapse" aria-labelledby="flush-headingSix" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						이용 제한이 장기적으로 지속되면 계정은 비활성화될 수 있습니다.<br> 이용 제한이 장기간 해제되지 않으면, 시스템에서 계정 비활성화 절차를 진행할 수 있으며, 이 경우 더 이상의 계정 복구가 불가능할 수 있습니다.<br> 따라서 이용 제한 사유를 신속히 해결하는 것이 중요하며, 고객센터에 문의하여 조치 방안을 논의하는 것이 필요합니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingSeven">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven" aria-expanded="false" aria-controls="flush-collapseSeven">
						<i class="bi bi-quora"></i>. 계정 복구를 위한 추가 서류가 필요한 경우 어떻게 제출하나요?
					</button>
				</h2>
				<div id="flush-collapseSeven" class="accordion-collapse collapse" aria-labelledby="flush-headingSeven" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						계정 복구를 위해 추가 서류 제출이 요구되는 경우, 고객센터에 제출 방법을 문의할 수 있습니다.<br> 일반적으로는 신분증 사본이나 이메일 인증 등이 요구되며, 관련된 서류는 고객센터의 전용 이메일을 통해 제출 가능합니다.<br> 서류가 검토된 후 계정 복구 절차가 진행되며, 복구 완료까지는 몇일이 소요될 수 있습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingEight">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseEight" aria-expanded="false" aria-controls="flush-collapseEight">
						<i class="bi bi-quora"></i>. 이용 제한 중에도 내 계정 정보를 확인할 수 있나요?
					</button>
				</h2>
				<div id="flush-collapseEight" class="accordion-collapse collapse" aria-labelledby="flush-headingEight" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						이용 제한 상태에서도 '내 계정' 페이지에 접속하여 일부 계정 정보는 확인할 수 있습니다.<br> 다만, 제한된 활동이나 콘텐츠는

					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/common/footer.jsp" />
</body>
</html>
