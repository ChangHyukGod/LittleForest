<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ Page</title>
<!-- 부트스트랩 CSS 링크 -->
<script>
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
</script>
<style>
.grid-container {
	
}

.bannerimage {
	width: 100%;
	height: auto;
	object-fit: cover;
}

.bannertitle {
	position: absolute;
	top: 34%;
	left: 20%;
	transform: translate(-50%, -50%);
	color: white;
	font-size: 75px;
	font-weight: bold;
}

.secondtitle {
	position: absolute;
	top: 58%;
	left: 20%;
	transform: translate(-50%, -50%);
	color: white;
	font-size: 30px;
	font-weight: bold;
}

/* .second-banner {
	width: auto;
	height: auto;
	background-color: white;
} */
#grid2 {
	display: flex;
	justify-content: center; /* 중앙 정렬 */
	gap: 10px; /* 키워드 간의 간격 */
	margin: 60px 0 45px 150px;
	width: 1150px;
	border-radius: 5%;
	/* 	padding: 30px 250px 30px 250px; */
}

.looking { /* 무엇을 찾고 계신가요 */
	text-align: center;
	font-size: 13px;
	font-weight: bold;
	background-color: rgb(170, 233, 170);
	color: white;
	border-radius: 15%;
	padding-top: 15px;
	width: 100px;
	height: 70px;
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

.d-flex2 { /* 검색창 */
	position: absolute;
	width: 40%;
	height: 40px;
	top: 60.5%;
	left: 30%;
}

.form-control { /* 검색창 */
	width: 150px;
	height: 65px;
	border-radius: 50%;
}

.btn {
	margin-top: -16%;
	margin-left: 90%;
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

#card_button {
	width: auto;
	height: auto;
	font-size: 11px;
	margin: 22px 40px 0px 0px;
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
	margin: 10px 0 10px 300px;
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
}

#card-button-2 {
	width: auto;
	height: auto;
	font-size: 11px;
	margin: 84px 40px 0px 0px;
}

#category {
	margin: 5px 0 5px 300px;
}

.help-title {
	font-size: 22px;
	font-weight: bold;
	position: absolute;
	margin: -30px 0 5px 290px;
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
}
</style>
</head>
<body>
	<jsp:include page="/common/header.jsp" />
	<!-- 첫 번째 배너 -->
	<div class="banner position-relative">
		<img class="bannerimage" src="${pageContext.request.contextPath}/resources/image/banner4.png" alt="FAQ Banner">
		<div class="bannertitle">고객센터</div>
		<div class="secondtitle">검색을 통해 빠르게 문제를 찾아보세요</div>
	</div>
	<!-- 검색창 -->
	<form class="d-flex2">
		<input class="form-control me-2" type="search" placeholder="궁금한 것을 물어보세요" aria-label="Search">
		<button class="btn btn-outline-success" type="submit">
			<i class="bi bi-search"></i>
		</button>
	</form>
	<!-- 두 번째 배너 -->
	<div class="second-banner" id="grid2">
		<div class="looking">
			무엇을 찾고<br>계신가요?
		</div>
		<div class="key1">추천 검색어</div>
		<div class="key2">멤버십 슈퍼적립 혜택</div>
		<div class="key3">만보기 챌린지</div>
		<div class="key4">최근검색어 삭제/복구 방법</div>
		<br>
		<div class="key5">회원가입</div>
		<div class="key6">QR코드/바코드 검색 기능</div>
		<div class="key7">네이버 비밀번호 찾기</div>
	</div>
	<hr>
	<div class="body-title">자주 찾는 도움말</div>
	<!-- 한 줄 도움말 목록 -->
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		<div class="hashtag-nav" id="category">
			<button class="hashtag-button active" data-bs-target="#carouselExampleControls" data-bs-slide-to="0">계정 관리</button>
			<button class="hashtag-button" data-bs-target="#carouselExampleControls" data-bs-slide-to="1">이용 제한</button>
			<button class="hashtag-button" data-bs-target="#carouselExampleControls" data-bs-slide-to="2">결제/환불</button>
		</div>

		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="999999">
				<!-- 첫번째 페이지 -->
				<div class="grid-container">
					<!-- <h1 class="help-title">계정 관리</h1> -->
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 두번째 페이지 -->
			<div class="carousel-item" data-bs-interval="999999">
				<div class="grid-container">
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 세번째 페이지 -->
			<div class="carousel-item" data-bs-interval="999999">
				<div class="grid-container">
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">한 줄 질문</p>
							<button type="button" class="btn btn-success" id="card_button">#해시태그</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 마지막 도움창 -->
	<hr>
	<div>
		<h1 class="last-body-title">다른 도움이 필요한가요?</h1>
	</div>
	<div class="grid-container2">
		<div class="card" id="last-card">
			<div class="card-body">
				<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">마지막 한 줄 질문</p>
				<button type="button" class="btn btn-success" id="card-button-2">#해시태그</button>
			</div>
		</div>
		<div class="card" id="last-card">
			<div class="card-body">
				<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">마지막 한 줄 질문</p>
				<button type="button" class="btn btn-success" id="card-button-2">#해시태그</button>
			</div>
		</div>
		<div class="card" id="last-card">
			<div class="card-body">
				<p class="card-title" data-bs-toggle="modal" data-bs-target="#mo-1">마지막 한 줄 질문</p>
				<button type="button" class="btn btn-success" id="card-button-2">#해시태그</button>
			</div>
		</div>
	</div>


	<!-- 모달 팝업창 -->
	<div class="modal fade" id="mo-1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">대충 긴 질문글</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">조금 긴 답변글</div>
			</div>
		</div>
	</div>




	<!-- 부트스트랩 JS 및 아이콘 링크 -->
	<jsp:include page="/common/footer.jsp" />
</body>
</html>
