<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ Page</title>
<!-- 부트스트랩 CSS 링크 -->
<script type="text/javascript" defer="defer">
document.addEventListener('DOMContentLoaded', function() {
    const buttons = document.querySelectorAll('.hashtag-button');

    buttons.forEach(button => {
        button.addEventListener('click', function() {
            // 모든 버튼의 active 클래스를 제거
            buttons.forEach(btn => btn.classList.remove('active'));
            // 클릭된 버튼에 active 클래스 추가
            this.classList.add('active');
        });
    });
});
function fn_search() {
	document.listForm.pageIndex.value=1;
	document.listForm.action="/faqlogin";
	document.listForm.submit();
}
function fn_MovetoMail() {
	document.mailForm.action="/faqemail";
	document.mailForm.submit();
}
function fn_MovetoLogin() {
	document.directForm.action="/faqlogin";
	document.directForm.submit();
}
function fn_search() {
	document.listForm.pageIndex.value = 1;
	document.listForm.action = "/faq/faqlogin";
	document.listForm.submit();
}
function fnMovetoLogin() {
	document.oneLineHelp.action="/faqlogin?searchKeyword=비밀";
	document.oneLineHelp.submit();
}
function fnMovetouselimited() {
	document.oneLineHelp.action="/faquselimited";
	document.oneLineHelp.submit();
}
function fnMovetobuy() {
	document.oneLineHelp.action="/faqbuy";
	document.oneLineHelp.submit();
}
function fnMovetoright() {
	document.oneLineHelp.action="/faqright";
	document.oneLineHelp.submit();
}
</script>
<style>
.banner-box {
	display: flex;
	justify-content: center;
	align-items: center;
}

.bannerimage {
	/* 	width: 100%;
	height: auto; */
	object-fit: cover;
	justify-content: center;
	align-items: center;
}

.bannertitle {
	top: 34%;
	left: 20%;
	color: rgb(103, 216, 103);
	font-size: 75px;
	font-weight: bold;
	text-align: center;
}

.secondtitle {
	top: 58%;
	left: 20%;
	color: black;
	font-size: 30px;
	font-weight: bold;
	text-align: center;
}

.search_box { /* 검색창 */
	justify-content: center;
	margin-top: 30px;
}

.search_bar {
	width: 45%;
	height: 60px;
	margin-left: 30%;
}

.search_text {
	background-color: rgb(187, 255, 187);
	font-size: 20px;
}

.search_glass { /* 검색 돋보기 */
	height: 45px;
	margin: 6px auto;
}

.page-line1 {
	margin: 56px 0 30px 20%;
	width: 60%;
}

[class^="key"] { /* 키워드 */
	flex-wrap: wrap; /* 키워드가 공간에 따라 자동으로 다음 줄로 넘어가도록 설정 */
	background-color: rgb(226, 226, 224);
	height: 25px;
	width: auto;
	color: black;
	text-align: center;
	font-size: 12px;
	display: flex;
	padding: 5px;
	margin-top: 20px
}

.grid-container {
	display: grid;
	grid-template-columns: repeat(4, 1fr); /* 4개의 열 */
	grid-gap: 35px; /* 카드 사이의 간격 */
	width: 1000px;
	margin: 0 auto; /* 가운데 정렬 */
	padding: 20px;
}

.card {
	width: 200px;
	height: 110px;
	background-color: #f8f9fa;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	display: flex;
	flex-direction: column;
}
/* 버튼 */
#card_button {
	width: 83px;
	height: auto;
	font-size: 11px;
	margin: -10px 0 20px 35px
}

#card_button-2 {
	width: 83px;
	height: auto;
	font-size: 11px;
	margin: -10px 0 20px 35px
}

#card_button_2 {
	width: 83px;
	height: auto;
	font-size: 11px;
	margin: -50.4px 0 20px 130px;
}

#last-card-button {
	width: auto;
	height: auto;
	font-size: 11px;
	margin: 5px 40px 0px 0px;
}

#mail-button {
	position: absolute;
	width: 115px;
	height: auto;
	font-size: 13px;
	margin: 0px 60px 0 0;
}

.card-title {
	text-decoration: none;
	color: black;
	transition: color 0.3s, text-decoration 0.3s; /* 애니메이션 효과 */
}

.card-title:hover {
	text-decoration: underline;
	color: rgb(84, 192, 255);
}

.body-title, .last-body-title {
	font-size: 26px;
	font-weight: bolder;
	margin: 1.5% 0 1.1% 26%;
	max-width: auto;
}

.small-title {
	/* 	display: flex;
	justify-content: flex-end;
	background-color: gray;
	width: 38%; */
	
}

.grid-container2 {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	grid-gap: 35px;
	width: 1000px;
	margin: 0 auto;
	padding: 20px;
}

#last-card {
	width: 300px;
	height: 180px;
	background-color: #f8f9fa;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	display: flex;
	flex-direction: column;
	margin-bottom: 20px;
}

#category {
	margin: 5px 0 5px 485px;
}

.help-title {
	font-size: 22px;
	font-weight: bold;
	position: absolute;
	margin: 1.5% 0 1.1% 25%;
}

[class^="hashtag-button"] {
	margin: 0 5px;
	padding: 10px 20px;
	background-color: #rgb(190, 228, 250);
	color: black;
	border: none;
	border-radius: 20px;
	cursor: pointer;
}

.hashtag-button.active {
	background-color: rgb(47, 175, 79); /* 선택된 버튼의 배경색 */
	color: white; /* 선택된 버튼의 글자 색 */
}

.bi-chat-dots, .bi-robot, .bi-chat-left-dots, .bi-mailbox-flag {
	color: green;
	font-size: 30px;
	margin-left: 5px;
}

.bi-chat-dots {
	margin-left: 19px;
}

.modal-answer-box {
	background-color: rgb(170, 233, 170);
	border: solid 2px rgb(0, 109, 0);
	border-radius: 10px;
	padding: 10px;
	margin: 10px;
	color: black;
}

.modal-title {
	margin: 5px;
}

#last-card-title {
	font-size: 18px;
	font-weight: bolder;;
}

.last-card-body {
	margin: 16px 8px 8px 8px;
}

.last-card-body-2 {
	margin: 11px 8px 8px 8px;
}

.bi-quora {
	left: 8%;;
	color: rgb(170, 233, 170);
}
}
</style>
</head>
<body>
	<jsp:include page="/common/header.jsp" />
	<div class="all-box">
		<!-- 첫 번째 배너 -->
		<div class="banner-box">
			<div class="banner position-relative">
				<a href="/faq"><img class="bannerimage" src="${pageContext.request.contextPath}/resources/images/banner5.png" alt="FaqBanner"></a>
				<div class="bannertitle">고객센터</div>
				<div class="secondtitle">검색을 통해 빠르게 문제를 찾아보세요</div>
				<!-- 검색창 -->
				<div class="search_box">
					<form class="d-flex search_bar" method="get" action="/faqlogin">
						<input class="form-control me-2 search_text" name="searchKeyword" type="search" placeholder="궁금한 것을 물어보세요" aria-label="Search">
						<button class="btn btn-outline-success search_glass" type="submit">
							<i class="bi bi-search"></i>
						</button>
					</form>
				</div>
				<br>
			</div>
		</div>
		<!-- 두 번째 배너 -->
		<hr class="page-line1">
		<div class="one-line-box">
			<h1 class="body-title">자주 찾는 도움말</h1>
			<!-- 한 줄 도움말 목록 -->
			<form name="oneLineHelp">
				<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
					<div class="hashtag-nav" id="category">
						<button class="hashtag-button active" data-bs-target="#carouselExampleControls" data-bs-slide-to="0">계정 관리</button>
						<button class="hashtag-button" data-bs-target="#carouselExampleControls" data-bs-slide-to="1">이용 제한</button>
						<button class="hashtag-button" data-bs-target="#carouselExampleControls" data-bs-slide-to="2">결제/환불</button>
						<button class="hashtag-button" data-bs-target="#carouselExampleControls" data-bs-slide-to="3">권리 보호</button>
					</div>
					<div class="carousel-inner">
						<!-- 첫번째 페이지 -->
						<div class="carousel-item active" data-bs-interval="999999">
							<div class="grid-container">
								<!-- <h1 class="help-title">계정 관리</h1> -->
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">
											<i class="bi bi-quora"></i>. 비밀번호를 복구해야 해요.
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-2">
											<i class="bi bi-quora"></i>. 계정 잠금을 해제하고 싶어요.
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-3">
											<i class="bi bi-quora"></i>. 회원 정보 수정은 어디서 하나요?
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-4">
											<i class="bi bi-quora"></i>. 계정 탈퇴시 나의 정보는 어떻게 되나요?
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-5">
											<i class="bi bi-quora"></i>. 계정 탈퇴 후 복구 가능한가요?
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-6">
											<i class="bi bi-quora"></i>. 계정 도용이 의심돼요.
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-7">
											<i class="bi bi-quora"></i>. 로그인 2단계 인증 설정은 어디서 하나요?
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-8">
											<i class="bi bi-quora"></i>. 이메일 주소를 변경하고 싶어요.
										</p>
									</div>
								</div>
							</div>
						</div>
						<!-- 두번째 페이지 -->
						<div class="carousel-item" data-bs-interval="999999">
							<div class="grid-container">
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-2-1">
											<i class="bi bi-quora"></i>. 이용 제한 사유는 어떻게 확인할 수 있나요?
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-2-2">
											<i class="bi bi-quora"></i>. 이용 제한 해제는 어디서, 어떻게 요청하나요?
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-2-3">
											<i class="bi bi-quora"></i>. 의도하지 않은 비정상적인 활동으로 계정이 제한됐어요.
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-2-4">
											<i class="bi bi-quora"></i>. 다른 사람이 내 계정을 이용해 제한됐습니다.
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-2-5">
											<i class="bi bi-quora"></i>. 부적절한 게시물로 인해 이용 제한을 받았어요.
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-2-6">
											<i class="bi bi-quora"></i>. 이용 제한이 지속되면 계정은 어떻게 되나요?
										</p>
									</div>
								</div>

							</div>
						</div>
						<!-- 세번째 페이지 -->
						<div class="carousel-item" data-bs-interval="999999">
							<div class="grid-container">
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-3-1">
											<i class="bi bi-quora"></i>. 결제 내역은 어느 곳에서 확인할 수 있나요?
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-3-2">
											<i class="bi bi-quora"></i>. 환불 요청을 하고 싶은데 어디서 해야 하나요?
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-3-3">
											<i class="bi bi-quora"></i>. 구매 후 환불 가능한 기간은 언제까지인가요?
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-3-4">
											<i class="bi bi-quora"></i>. 환불 처리가 계속 지연되는 이유는 무엇인가요?
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-3-5">
											<i class="bi bi-quora"></i>. 구매한 상품에서 일부분만 환불이 가능한가요?
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-3-6">
											<i class="bi bi-quora"></i>. 결제 오류가 발생했는데 어떻게 해야 하나요?
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-3-7">
											<i class="bi bi-quora"></i>. 환불 받은 금액이 계좌에 입금되지 않았어요.
										</p>
									</div>
								</div>
							</div>
						</div>
						<!-- 네번째 페이지 -->
						<div class="carousel-item" data-bs-interval="999999">
							<div class="grid-container">
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-4-1">
											<i class="bi bi-quora"></i>. 저작권 침해는 어디에 신고하나요?
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-4-2">
											<i class="bi bi-quora"></i>. 저작권 보호 요청은 어떻게 하나요?
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-4-3">
											<i class="bi bi-quora"></i>. 불법 콘텐츠 신고 절차는 무엇인가요?
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-4-4">
											<i class="bi bi-quora"></i>. 합법적 이용을 위한 허락을 받으려면?
										</p>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-4-5">
											<i class="bi bi-quora"></i>. 내 콘텐츠가 무단 사용되었을 때 대응 방법은?
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<!-- 마지막 도움창 -->
		<hr class="page-line1">
		<h1 class="last-body-title">다른 도움이 필요한가요?</h1>
		<!-- 마지막 카드 -->
		<div class="grid-container2">
			<div class="card" id="last-card">
				<div class="card-body">
					<p class="null" data-bs-toggle="modal" data-bs-target="<!-- #mo-last-1 -->" id="last-card-title">
						<i class="bi bi-robot"></i> 스마트봇 문의하기
					</p>
					<p class="last-card-body">24시간 언제든지 궁금하신 모든 것들을 스마트봇이 알려드립니다.</p>
				</div>
			</div>
			<div class="card" id="last-card">
				<div class="card-body">
					<p class="null" data-bs-toggle="modal" data-bs-target="<!-- #mo-last-2 -->" id="last-card-title">
						<i class="bi bi-chat-left-dots"></i> FAQ 게시판 살펴보기
					</p>
					<p class="last-card-body-2">좀 더 상세한 답변을 FAQ 게시판에서 찾아보세요.</p>
					<form name="directForm">
						<button type="button" class="btn btn-outline-success" id="mail-button" onclick="fn_MovetoLogin()">
							<i class="bi bi-chat-text"></i> FAQ 게시판
						</button>
					</form>
				</div>
			</div>
			<div class="card" id="last-card">
				<div class="card-body">
					<p class="null" data-bs-toggle="modal" data-bs-target="<!-- #mo-last-3 -->" id="last-card-title">
						<i class="bi bi-mailbox-flag"></i> 메일을 보내 해결하기
					</p>

					<p class="last-card-body-2">직접 메일을 보내주시면 면밀히 검토해 문제를 해결해 드립니다.</p>
					<!-- 게시판 이동 버튼 -->
					<form name="mailForm">
						<button type="button" class="btn btn-outline-success" id="mail-button" onclick="fn_MovetoMail()">
							<i class="bi bi-envelope-at"></i> 메일 양식
						</button>
					</form>
				</div>
			</div>
		</div>

		<!-- 모달 팝업창 -->
		<!-- 첫번째 페이지(계정관리) 모달 -->
		<div>
			<div class="modal fade" id="mo-1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">
								<i class="bi bi-quora"></i>. 비밀번호를 복구해야 해요.
							</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<i class="bi bi-chat-dots"></i>
							<div class="modal-answer-box">계정 비밀번호를 잊으셨다면, 로그인 페이지에서 '비밀번호 찾기' 버튼을 클릭하세요. 등록된 이메일이나 전화번호를 통해 비밀번호 재설정 링크를 받으실 수 있습니다.</div>
						</div>
						<a href="/faqlogin?searchKeyword=계정관리" class="btn btn-outline-success" id="card_button">#계정관리</a>

					</div>
				</div>
			</div>
			<div class="modal fade" id="mo-2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">
								<i class="bi bi-quora"></i>. 계정 잠금을 해제하고 싶어요.
							</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<i class="bi bi-chat-dots"></i>
							<div class="modal-answer-box">보안 문제로 계정이 잠긴 경우, 계정 복구 절차를 통해 인증을 받으시면 해제 가능합니다. 계정 복구 페이지에서 본인 확인 절차를 진행해주세요.</div>
						</div>
						<a href="/faqlogin?searchKeyword=계정관리" class="btn btn-outline-success" id="card_button">#계정관리</a>
					</div>
				</div>
			</div>
			<div class="modal fade" id="mo-3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">
								<i class="bi bi-quora"></i>. 회원 정보 수정은 어디서 하나요?
							</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<i class="bi bi-chat-dots"></i>
							<div class="modal-answer-box">회원 정보 변경은 '내 계정' 페이지에서 가능합니다. 개인정보 수정 메뉴로 이동하여 이메일, 비밀번호, 연락처 등을 수정할 수 있습니다.</div>
						</div>
						<a href="/faqlogin?searchKeyword=계정관리" class="btn btn-outline-success" id="card_button">#계정관리</a>
					</div>
				</div>
			</div>
			<div class="modal fade" id="mo-4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">
								<i class="bi bi-quora"></i>. 계정 탈퇴시 나의 정보는 어떻게 되나요?
							</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<i class="bi bi-chat-dots"></i>
							<div class="modal-answer-box">계정을 탈퇴하시면 관련 데이터는 일정 기간 후 완전히 삭제됩니다. 법적으로 보관이 필요한 정보는 해당 기간 동안 안전하게 보관됩니다.</div>
						</div>
						<a href="/faqlogin?searchKeyword=계정관리" class="btn btn-outline-success" id="card_button">#계정관리</a>
					</div>
				</div>
			</div>
			<div class="modal fade" id="mo-5" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">
								<i class="bi bi-quora"></i>. 계정 탈퇴 후 복구 가능한가요?
							</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<i class="bi bi-chat-dots"></i>
							<div class="modal-answer-box">계정 탈퇴 후 복구는 불가능합니다. 탈퇴 전에 중요한 데이터를 미리 백업해두세요.</div>
						</div>
						<a href="/faqlogin?searchKeyword=계정관리" class="btn btn-outline-success" id="card_button">#계정관리</a>
					</div>
				</div>
			</div>
			<div class="modal fade" id="mo-6" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">
								<i class="bi bi-quora"></i>. 계정 도용이 의심되요.
							</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<i class="bi bi-chat-dots"></i>
							<div class="modal-answer-box">계정이 도용된 경우 즉시 비밀번호를 변경하고 2단계 인증을 설정하세요.</div>
						</div>
						<a href="/faqlogin?searchKeyword=계정관리" class="btn btn-outline-success" id="card_button">#계정관리</a> <a href="/faqlogin?searchKeyword=이용제한" class="btn btn-outline-info" id="card_button_2" onclick="fnMovetouselimited">#이용제한</a>
					</div>
				</div>
			</div>
			<div class="modal fade" id="mo-7" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">
								<i class="bi bi-quora"></i>. 로그인 2단계 인증 설정은 어디서 하나요?
							</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<i class="bi bi-chat-dots"></i>
							<div class="modal-answer-box">2단계 인증 설정은 '내 계정'의 보안 설정에서 가능합니다. 이메일이나 인증 앱을 통해 추가 인증 단계를 설정하여 보안을 강화할 수 있습니다.</div>
						</div>
						<a href="/faqlogin?searchKeyword=계정관리" class="btn btn-outline-success" id="card_button">#계정관리</a>
					</div>
				</div>
			</div>
			<div class="modal fade" id="mo-8" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">
								<i class="bi bi-quora"></i>. 이메일 주소를 변경하고 싶어요.
							</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<i class="bi bi-chat-dots"></i>
							<div class="modal-answer-box">계정의 이메일 주소 변경은 '내 계정' 페이지에서 가능합니다. 새로운 이메일 주소로 변경한 후, 인증 메일을 통해 확인 절차를 완료해 주세요.</div>
						</div>
						<a href="/faqlogin?searchKeyword=계정관리" class="btn btn-outline-success" id="card_button">#계정관리</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 두번째 페이지(이용제한) 모달 -->
		<div>
			<div>
				<div class="modal fade" id="mo-2-1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 이용 제한 사유는 어떻게 확인할 수 있나요?
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">계정이 제한된 경우, 이용 제한 사유는 이메일 또는 알림을 통해 전달됩니다. 또한, '내 계정' 페이지에서 이용 제한 상세 사유를 확인할 수 있습니다.</div>
							</div>
							<a href="/faqlogin?searchKeyword=이용제한" class="btn btn-outline-info" id="card_button-2" onclick="fnMovetouselimited">#이용제한</a>
						</div>
					</div>
				</div>
				<div class="modal fade" id="mo-2-2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 이용 제한 해제는 어떻게 요청하나요?
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">이용 제한 해제는 '고객센터'를 통해 요청할 수 있습니다. 제한 사유를 충분히 확인하고 관련 서류나 정보가 필요할 수 있습니다.</div>
							</div>
							<a href="/faqlogin?searchKeyword=이용제한" class="btn btn-outline-info" id="card_button-2" onclick="fnMovetouselimited">#이용제한</a>
						</div>
					</div>
				</div>
				<div class="modal fade" id="mo-2-3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 비정상적인 활동으로 계정이 제한됐어요.
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">비정상적인 활동으로 인해 계정이 제한된 경우, 본인 인증 절차를 거쳐 제한 해제를 요청할 수 있습니다. 이 과정에서는 추가 보안 인증이 필요할 수 있습니다.</div>
							</div>
							<a href="/faqlogin?searchKeyword=이용제한" class="btn btn-outline-info" id="card_button-2" onclick="fnMovetouselimited">#이용제한</a>
						</div>
					</div>
				</div>
				<div class="modal fade" id="mo-2-4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 다른 사람이 내 계정을 이용해 제한됐습니다.
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">다른 사람이 계정을 이용해 제한된 경우, 즉시 고객센터에 신고하고 비밀번호를 변경하세요. 추가로 2단계 인증을 설정하는 것이 좋습니다.</div>
							</div>
							<a href="/faqlogin?searchKeyword=이용제한" class="btn btn-outline-info" id="card_button-2" onclick="fnMovetouselimited">#이용제한</a>
						</div>
					</div>
				</div>
				<div class="modal fade" id="mo-2-5" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 부적절한 게시물로 인해 이용 제한을 받았어요.
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">부적절한 게시물로 인한 이용 제한은 해당 게시물의 삭제 및 커뮤니티 가이드라인 준수 여부에 따라 해제가 가능합니다. 필요 시 수정된 게시물로 재심사를 요청할 수 있습니다.</div>
							</div>
							<a href="/faqlogin?searchKeyword=이용제한" class="btn btn-outline-info" id="card_button-2" onclick="fnMovetouselimited">#이용제한</a>
						</div>
					</div>
				</div>
				<div class="modal fade" id="mo-2-6" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 이용 제한이 지속되면 계정은 어떻게 되나요?
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">이용 제한이 장기적으로 지속되면 계정은 자동으로 비활성화될 수 있습니다. 비활성화 전 경고 메시지가 발송되며, 계정 복구 절차를 안내받게 됩니다.</div>
							</div>
							<a href="/faqlogin?searchKeyword=이용제한" class="btn btn-outline-info" id="card_button-2" onclick="fnMovetouselimited">#이용제한</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 세번째 페이지(결제/환불) 모달 -->
		<div>
			<div>
				<div class="modal fade" id="mo-3-1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 결제 내역은 어디에서 확인할 수 있나요?
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">결제 내역은 '내 계정' 페이지의 '구매 내역' 섹션에서 확인 가능합니다. 결제 날짜, 금액, 결제 수단을 한눈에 볼 수 있습니다.</div>
							</div>
							<a href="/faqlogin?searchKeyword=결제/환불" class="btn btn-outline-warning" id="card_button" onclick="fnMovetobuy()">#결제/환불</a>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="modal fade" id="mo-3-2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 환불 요청은 어떻게 하나요?
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">환불 요청은 '내 계정'에서 주문 내역을 선택한 후, 환불 신청 버튼을 클릭하여 진행할 수 있습니다. 환불 처리는 약 5~7일이 소요됩니다.</div>
							</div>
							<a href="/faqlogin?searchKeyword=결제/환불" class="btn btn-outline-warning" id="card_button" onclick="fnMovetobuy()">#결제/환불</a>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="modal fade" id="mo-3-3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 구매 후 환불 가능한 기간은 언제까지인가요?
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">구매 후 환불 가능한 기간은 보통 7일 이내입니다. 단, 디지털 콘텐츠나 개인화된 상품의 경우 환불이 제한될 수 있습니다.</div>
							</div>
							<a href="/faqlogin?searchKeyword=결제/환불" class="btn btn-outline-warning" id="card_button" onclick="fnMovetobuy()">#결제/환불</a>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="modal fade" id="mo-3-4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 환불 처리가 지연되는 이유는 무엇인가요?
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">환불 처리가 지연될 수 있는 이유는 결제 수단에 따라 다릅니다. 카드사의 확인 절차가 필요하거나, 공휴일이 포함된 경우 시간이 더 걸릴 수 있습니다.</div>
							</div>
							<a href="/faqlogin?searchKeyword=결제/환불" class="btn btn-outline-warning" id="card_button" onclick="fnMovetobuy()">#결제/환불</a>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="modal fade" id="mo-3-5" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 부분 환불이 가능한가요?
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">부분 환불은 구매하신 상품 중 일부만 환불을 원하실 경우 가능합니다. 다만, 일부 상품은 부분 환불이 불가할 수 있으니 확인 후 신청 바랍니다.</div>
							</div>
							<a href="/faqlogin?searchKeyword=결제/환불" class="btn btn-outline-warning" id="card_button" onclick="fnMovetobuy()">#결제/환불</a>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="modal fade" id="mo-3-6" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 결제 오류가 발생했는데 어떻게 해야 하나요?
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">결제 오류가 발생한 경우, 먼저 결제 수단의 잔액 및 정보를 확인해보세요. 문제가 지속되면 고객센터로 문의하여 도움을 받으실 수 있습니다.</div>
							</div>
							<a href="/faqlogin?searchKeyword=결제/환불" class="btn btn-outline-warning" id="card_button" onclick="fnMovetobuy()">#결제/환불</a>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="modal fade" id="mo-3-7" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 환불 받은 금액이 계좌에 입금되지 않았어요.
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">환불 금액이 입금되지 않은 경우, 결제 수단에 따라 최대 7일까지 소요될 수 있습니다. 7일 이후에도 입금이 확인되지 않으면 고객센터에 문의해 주세요.</div>
							</div>
							<a href="/faqlogin?searchKeyword=결제/환불" class="btn btn-outline-warning" id="card_button" onclick="fnMovetobuy()">#결제/환불</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 네번째 페이지(권리보호) 모달 -->
		<div>
			<div>
				<div class="modal fade" id="mo-4-1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 저작권 침해는 어디에 신고하나요?
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">저작권 침해를 발견하면, 해당 플랫폼의 신고 기능을 통해 신고하거나, 고객센터에 접수할 수 있습니다.</div>
							</div>
							<a href="/faqlogin?searchKeyword=권리보호" class="btn btn-outline-danger" id="card_button" onclick="fnMovetoright()">#권리보호</a>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="modal fade" id="mo-4-2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 저작권 보호 요청은 어떻게 하나요?
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">저작권 보호가 필요한 경우, 관련 기관에 신청하거나 서비스 내 저작권 보호 센터에서 요청할 수 있습니다.</div>
							</div>
							<a href="/faqlogin?searchKeyword=권리보호" class="btn btn-outline-danger" id="card_button" onclick="fnMovetoright()">#권리보호</a>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="modal fade" id="mo-4-3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 불법 콘텐츠 신고 절차는 무엇인가요?
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">불법 콘텐츠가 발견되면, 고객센터에 신고 양식을 작성하고 증거를 첨부해 제출하면 됩니다.</div>
							</div>
							<a href="/faqlogin?searchKeyword=권리보호" class="btn btn-outline-danger" id="card_button" onclick="fnMovetoright()">#권리보호</a>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="modal fade" id="mo-4-4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 합법적 이용을 위한 허락을 받으려면?
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">저작물 사용 허가를 위해 저작권자에게 직접 연락하거나, 저작권 관리 기관을 통해 협의하면 됩니다.</div>
							</div>
							<a href="/faqlogin?searchKeyword=권리보호" class="btn btn-outline-danger" id="card_button" onclick="fnMovetoright()">#권리보호</a>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="modal fade" id="mo-4-5" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 내 콘텐츠가 무단 사용되었을 때 대응 방법은?
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">콘텐츠가 무단 사용되었을 경우, 상대방에게 경고를 보내거나 법적 조치를 취할 수 있습니다.</div>
							</div>
							<a href="/faqlogin?searchKeyword=권리보호" class="btn btn-outline-danger" id="card_button" onclick="fnMovetoright()">#권리보호</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 마지막 카드 모달 -->
		<div>
			<div>
				<div class="modal fade" id="mo-last-1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 스마트봇!!
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">삐빅-</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="modal fade" id="mo-last-2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 1:1 채팅
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">채팅</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="modal fade" id="mo-last-3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">
									<i class="bi bi-quora"></i>. 메일박스
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<i class="bi bi-chat-dots"></i>
								<div class="modal-answer-box">메일</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- 부트스트랩 JS 및 아이콘 링크 -->
	<jsp:include page="/common/footer.jsp" />
</body>
</html>
