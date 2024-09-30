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
	font-size: 24px;
	font-weight: bolder;
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
					<button id="Q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
						<i class="bi bi-quora"></i>. 로그인을 시도하니 이전 전화번호를 입력하라고
						 나옵니다. 이전 전화번호를 왜 확인하나요?
					</button>
				</h2>
				<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
					<div class="accordion-body" id="Q-body">이전 전화번호는 카카오계정으로 로그인했던 카<br>카오톡의 전화번호 입니다. 다른 사람이 카카오계정으로 로그인하는 것을 막기 위해, 카카오계정으로 로그인한 카카오톡과 다른 새로운 카카오톡에서 로그인하려면 이전 카카오톡의 전화번호를 입력하여야 합니다. 이전 카카오톡 가입 시 인증받았던 전화번호 를 이전 전화번호로 입력해 주세요. * 이전에 이용하던 기기에 아직 카카오톡이 설치되어 있다면, [ 카카오톡 > 친구 탭 > 내프로필 > 우측 상단 '설정' ] 에서 인증했던 전화번호를 확인하실 수 있습니다. * 나쁜 시도로부터 계정을 보호하기 위해 이전 전화번호는 5회까지 입력하실 수 있고, 입력한 이전 전화번호가 5회 이상 일치하지 않는 경우, 일정 시간 이후 다시 시도해 주세요.</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingTwo">
					<button id="Q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
						<i class="bi bi-quora" id="Q-title"></i>. 비밀번호를 여러번 틀렸는데, 그 이후로 시도횟수가 초과하였다고 나옵니다. 언제 로그인 할 수 있나요?
					</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
					<div class="accordion-body" id="Q-body">카카오계정 혹은 비밀번호가 여러 번 불일치하는 경우 사용자 보호를 위해 로그인 시도가 제한될 수 있습니다. 사용자 보호를 위해 로그인 시도 가능 횟수나 제한 시간 등 자세한 기준을 안내해 드릴 수 없습니다. 로그인 시도 시 안내되는 메시지에 따라 일정 시간이 지난 후 재시도해 보시길 바랍니다.</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingThree">
					<button id="Q-title" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
						<i class="bi bi-quora" id="Q-title"></i>. 로그인을 시도하면 '접속 정보를 확인해 주세요.' 라는 안내가 나옵니다.
					</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
					<div class="accordion-body" id="Q-body">로그인이 진행되는 동안 네트워크(IP) 정보가 변경되면 로그인에 실패할 수 있습니다. 네트워크(IP) 정보가 변경되지 않도록 아래 방법을 참고하여 다시 로그인을 시도해 주세요. 1. 모바일의 경우 네트워크(IP) 변동 가능성이 적은 WiFi로 접속하여 로그인 2. VPN으로 접속했다면 해당 설정을 끄고 로그인 3. iOS > iCloud+의 비공개 릴레이 설정을 끄고 로그인 ㄴ경로: 아이폰 > 설정 > [사용자 이름] > iCloud > 비공개 릴레이</div>
				</div>
			</div>
			
		</div>
	</div>

	<jsp:include page="/common/footer.jsp" />
</body>
</html>
