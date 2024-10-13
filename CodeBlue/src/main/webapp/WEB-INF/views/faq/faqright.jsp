<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ 권리보호</title>
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
			[Little Forest] 권리 보호 <i class="bi bi-key"></i>
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
						<i class="bi bi-quora"></i>. 저작권 침해는 어디에 신고할 수 있나요?
					</button>
				</h2>
				<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						저작권 침해는 해당 콘텐츠의 플랫폼 내 신고 기능을 통해 신고할 수 있습니다.<br> 또한, 법적 조치를 위해 저작권 보호 기관이나 관련 기관에 직접 신고할 수 있습니다.<br> 신고 시에는 저작권을 침해한 콘텐츠의 구체적인 증거를 제출해야 하며, 이를 바탕으로 플랫폼이나 기관이 적절한 조치를 취하게 됩니다.<br> 이 과정에서 추가적인 정보가 필요할 수 있으니, 준비된 자료와 함께 문의하는 것이 좋습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingTwo">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
						<i class="bi bi-quora"></i>. 저작권 보호 요청은 어떻게 하나요?
					</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						저작권 보호 요청은 저작권 보호 기관이나 해당 플랫폼의 고객센터를 통해 가능합니다.<br> 저작권을 보호하기 위한 요청 시, 저작권자의 신원 정보와 저작물이 포함된 자료를 제출해야 합니다.<br> 저작권 보호 요청이 접수되면, 플랫폼이나 관련 기관이 해당 콘텐츠의 무단 사용 여부를 확인하고, 필요 시 삭제 조치를 취할 수 있습니다.<br> 요청이 처리되는 동안 진행 상황은 요청한 경로를 통해 확인할 수 있습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingThree">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
						<i class="bi bi-quora"></i>. 불법 콘텐츠 신고 절차는 어떻게 진행되나요?
					</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						불법 콘텐츠를 신고하기 위해서는 먼저 해당 콘텐츠가 제공된 플랫폼 내에서 신고 양식을 작성해야 합니다.<br> 신고 양식에는 불법 콘텐츠에 대한 구체적인 설명과 증거 자료가 포함되어야 하며, 플랫폼은 이를 검토하여 적절한 조치를 취합니다.<br> 또한, 법적 대응이 필요한 경우, 관련 기관에 정식으로 신고하여 추가적인 법적 절차를 밟을 수 있습니다.<br> 이러한 절차는 시간이 소요될 수 있으며, 처리 과정 중 추가 자료를 요구받을 수 있습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingFour">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
						<i class="bi bi-quora"></i>. 내 콘텐츠가 무단으로 사용되었을 때 어떻게 대응할 수 있나요?
					</button>
				</h2>
				<div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						내 콘텐츠가 무단으로 사용되었을 경우, 먼저 해당 콘텐츠가 제공된 플랫폼에 신고하는 것이 첫 번째 조치입니다.<br> 또한, 저작권 침해 경고를 무단 사용자에게 보내거나, 법적 조치를 취하는 방법도 있습니다.<br> 법적 조치를 위해서는 저작권 침해 증거를 수집하고, 관련 기관이나 법률 자문을 통해 정식으로 대응하는 것이 좋습니다.<br> 이러한 대응은 시간이 걸릴 수 있으므로, 신속히 시작하는 것이 중요합니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingFive">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
						<i class="bi bi-quora"></i>. 저작물 사용 허락을 받으려면 어떻게 해야 하나요?
					</button>
				</h2>
				<div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						저작물을 사용하기 위해서는 먼저 저작권자에게 직접 연락하여 사용 허락을 받아야 합니다.<br> 사용 목적, 범위, 기간 등을 명시한 계약을 체결하는 것이 일반적이며, 필요에 따라 저작권료를 지불해야 할 수도 있습니다.<br> 저작권자와 직접 협의가 어려운 경우, 저작권 관리 기관이나 대리인을 통해 허락을 받을 수 있습니다.<br> 사용 허락을 받은 후에는 정해진 조건을 엄격히 준수해야 하며, 허락 받은 범위를 넘는 사용은 새로운 저작권 침해로 간주될 수 있습니다.
					</div>
				</div>
			</div>
		</div>

	</div>

	<jsp:include page="/common/footer.jsp" />
</body>
</html>
