<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ 결제/환불</title>
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
			[Little Forest] 결제/환불 <i class="bi bi-key"></i>
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
						<i class="bi bi-quora"></i>. 결제 내역은 어디에서 확인할 수 있나요?
					</button>
				</h2>
				<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						결제 내역은 '내 계정' 페이지의 '구매 내역' 섹션에서 확인할 수 있습니다.<br> 여기서는 결제 날짜, 금액, 사용한 결제 수단 등 세부 정보를 모두 확인할 수 있으며, 필요 시 해당 내역을 다운로드하거나 출력할 수 있습니다.<br> 결제 내역에 이상이 있을 경우, 고객센터에 문의하여 정확한 정보를 확인하는 것이 좋습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingTwo">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
						<i class="bi bi-quora"></i>. 환불 요청을 하고 싶은데 어떻게 해야 하나요?
					</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						환불 요청은 '내 계정' 페이지에서 해당 주문 내역을 선택한 후, '환불 요청' 버튼을 통해 가능합니다.<br> 환불이 가능한 기간 및 조건을 확인한 후 신청해야 하며, 환불 처리에는 일반적으로 5~7일 정도가 소요됩니다.<br> 환불 정책은 구매한 상품이나 서비스에 따라 달라질 수 있으니, 자세한 사항은 고객센터를 통해 확인하는 것이 좋습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingThree">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
						<i class="bi bi-quora"></i>. 구매한 상품에서 일부분만 환불이 가능한가요?
					</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						일부 상품에 한해서는 부분 환불이 가능합니다.<br> 다만, 디지털 콘텐츠나 개인화된 상품의 경우, 부분 환불이 불가할 수 있으니 환불 가능 여부를 미리 확인하는 것이 중요합니다.<br> 부분 환불 신청은 '내 계정'의 주문 내역에서 처리할 수 있으며, 고객센터에 문의하여 추가적인 정보를 얻을 수 있습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingFour">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
						<i class="bi bi-quora"></i>. 환불 요청 후 얼마의 시간이 소요되나요?
					</button>
				</h2>
				<div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						환불 요청이 접수된 후, 처리까지 약 5~7일이 소요됩니다.<br> 결제 수단에 따라 다소 차이가 있을 수 있으며, 카드 결제의 경우 카드사에서의 확인 절차로 인해 추가 시간이 소요될 수 있습니다.<br> 환불이 지연되는 경우에는 고객센터에 문의하여 정확한 상황을 확인하는 것이 좋습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingFive">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
						<i class="bi bi-quora"></i>. 환불 받은 금액이 내 계좌에 입금되지 않았어요. 어떻게 해야 하나요?
					</button>
				</h2>
				<div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						환불 금액이 계좌에 입금되지 않았다면, 먼저 결제 수단과 은행 정보를 확인해보세요.<br> 카드사나 은행의 처리 시간이 지연될 수 있으며, 보통 7일 내에 처리됩니다.<br> 만약 7일이 지났음에도 금액이 입금되지 않으면, 고객센터에 문의하여 추가적인 확인 절차를 진행할 수 있습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingSix">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">
						<i class="bi bi-quora"></i>. 구매 후 환불 가능한 기간은 얼마나 되나요?
					</button>
				</h2>
				<div id="flush-collapseSix" class="accordion-collapse collapse" aria-labelledby="flush-headingSix" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						환불 가능한 기간은 구매한 상품에 따라 다르지만, 일반적으로는 7일 이내에 환불을 요청할 수 있습니다.<br> 디지털 콘텐츠나 특정 상품의 경우 환불이 제한될 수 있으며, 이러한 상품들은 구매 전에 환불 정책을 확인하는 것이 좋습니다.<br> 환불 정책에 대한 자세한 내용은 '내 계정'에서 확인할 수 있으며, 추가적인 정보는 고객센터를 통해 안내받을 수 있습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingSeven">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven" aria-expanded="false" aria-controls="flush-collapseSeven">
						<i class="bi bi-quora"></i>. 결제 오류가 발생했는데 어떻게 해야 하나요?
					</button>
				</h2>
				<div id="flush-collapseSeven" class="accordion-collapse collapse" aria-labelledby="flush-headingSeven" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						결제 오류가 발생한 경우, 먼저 결제 수단의 잔액이나 카드 유효성 등을 확인하세요.<br> 문제가 지속될 경우에는 고객센터에 문의하여 결제 내역을 확인하고, 필요한 경우 결제 정보를 수정하거나 새로운 결제 수단을 사용할 수 있습니다.<br> 추가적인 도움이 필요하면 고객센터에서 지원받을 수 있습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingEight">
					<button id="q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseEight" aria-expanded="false" aria-controls="flush-collapseEight">
						<i class="bi bi-quora"></i>. 결제가 완료되었는데 구매한 상품을 받지 못했습니다. 어떻게 해야 하나요?
					</button>
				</h2>
				<div id="flush-collapseEight" class="accordion-collapse collapse" aria-labelledby="flush-headingEight" data-bs-parent="#accordionFlushExample">
					<div id="q-body" class="accordion-body">
						결제가 완료되었지만 상품을 받지 못한 경우, '내 계정'에서 주문 상태를 먼저 확인하세요.<br> 상품 배송이 지연될 수 있으며, 일부 서비스의 경우 디지털 콘텐츠의 다운로드 링크가 이메일을 통해 발송될 수 있습니다.<br> 문제가 지속될 경우 고객센터에 문의하여 상황을 확인하고 필요한 조치를 받을 수 있습니다.
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/common/footer.jsp" />
</body>
</html>
