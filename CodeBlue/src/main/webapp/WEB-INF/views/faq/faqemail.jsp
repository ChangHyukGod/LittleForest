<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ Page</title>
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

#big-box {
	display: grid;
	place-items: center; /* 수평, 수직 중앙 정렬 */
	height: auto;
	width: 140%;
	margin-top: 70px;
	margin-bottom: 70px;
	margin-top: 70px;
}

.bi-envelope-at {
	color: rgb(34, 238, 34);
}
</style>
<body>
	<jsp:include page="/common/header.jsp" />
	<div class="title-box">
		<div class="title">
			[Little Forest] 메일 양식 <i class="bi bi-envelope-at"></i>
		</div>
	</div>
	<div class="container mt-5" id="big-box">
		<form>
			<div class="mb-3">
				<label for="inquiryType" class="form-label">문의 분류 *</label> <select id="inquiryType" class="form-select">
					<option selected>로그인, 비밀번호, 탈퇴 문의</option>
					<option>계정 정지, 타인 도용 의심 문의</option>
					<option>결제 오류, 환불 문의</option>
					<option>저작권 침해, 불법적인 게시글 신고 문의</option>
				</select>
			</div>
			<div class="mb-3">
				<label for="email" class="form-label">이메일 주소 *</label>
				<div class="input-group">
					<input type="text" class="form-control" placeholder="입력해주세요" id="email"> <span class="input-group-text">@</span> <label for="contactMethod" class="form-label"></label> <select id="contactMethod" class="form-select">
						<option selected>선택하세요</option>
						<option>gmail.com</option>
						<option>naver.com</option>
						<option>daum.net</option>
						<option>kakao.com</option>
						<option>nate.com</option>
					</select>
				</div>
				<!-- <div class="col-md-6"></div> -->
			</div>
			<div class="mb-3">
				<label for="phone" class="form-label">휴대폰 번호 *</label>
				<div class="input-group">
					<span class="input-group-text">+82</span> <input type="text" class="form-control" id="phone" placeholder="01012345678">
				</div>
			</div>
			<div class="mb-3">
				<label for="inquiryTitle" class="form-label">문의 제목 *</label> <input type="text" class="form-control" id="inquiryTitle" placeholder="제목을 입력해주세요. (20자 이내)">
			</div>
			<div class="mb-3">
				<label for="inquiryContent" class="form-label">문의 내용 *</label>
				<textarea class="form-control" id="inquiryContent" rows="5" placeholder="1. 신고 정보:
- 신고대상 URL 확인이 가능할 경우 URL 기재
- 신고대상 URL 확인이 어려운 경우 서비스 내 '신고하기'를 통해 신고 접수 후, 신고자 연락처와 신고 일시 기재

2. 피해 내용
- 피해내용을 구체적으로 기재해 주시고, 대화 내용 캡쳐 등의 피해 증빙자료를 첨부파일로 제출해주세요."></textarea>
				<small class="form-text text-muted">최대 3000자</small>
			</div>
			<div class="mb-3">
				<label for="fileUpload" class="form-label">파일 첨부</label> <input class="form-control" type="file" id="fileUpload"> <small class="form-text text-muted">첨부파일은 최대 5개, 30MB까지 등록 가능합니다.</small>
			</div>
			<button type="submit" class="btn btn-primary">제출</button>
		</form>
	</div>
	<jsp:include page="/common/footer.jsp" />
</body>
</html>