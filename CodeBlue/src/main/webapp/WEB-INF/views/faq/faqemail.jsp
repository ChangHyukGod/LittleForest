<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ 이메일</title>
</head>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #F4FFF4; /* 연한 초록색 배경 */
}

.title-box {
    margin-top: 70px;
}

.title {
    text-align: center;
    font-size: 34px;
    font-weight: bolder;
}

#big-box {
    height: auto;
    width: 50%;
    margin-top: 70px;
    margin-bottom: 70px;
    background-color: white; /* 연한 초록색 배경 */
    border: 2px solid #28A745; /* 진한 초록색 테두리 */
    border-radius: 15px;
    padding: 20px;
}

.bi-envelope-at {
    color: #28A745;
}

.form-label {
    font-weight: bold;
    color: #28A745; /* 폼 라벨 초록색 */
}

.input-group-text, .form-select, .form-control {
    border: 2px solid #28A745; /* 진한 초록색 테두리 */
}

.btn-primary {
    background-color: #28A745; /* 초록색 버튼 */
    border-color: #28A745;
}

.btn-primary:hover {
    background-color: #218838; /* 버튼 호버 시 진한 초록색 */
    border-color: #1E7E34;
}

.btn-outline-primary, .btn-outline-dark {
    color: #28A745; /* 버튼 텍스트 초록색 */
    border-color: #28A745; /* 진한 초록색 테두리 */
}

.btn-outline-primary:hover, .btn-outline-dark:hover {
    background-color: #E8FFE8; /* 버튼 호버 시 연한 초록색 */
    border-color: #28A745;
}

.form-text {
    color: #218838; /* 안내 텍스트 초록색 */
}
</style>
<script type="text/javascript">
    // 유효성 체크 함수
	function validateForm() {
        const inquiryType = document.getElementById("inquiryType").value;
        const email = document.getElementById("email").value.trim();
        const contactMethod = document.getElementById("contactMethod").value;
        const phone = document.getElementById("phone").value.trim();
        const inquiryTitle = document.getElementById("inquiryTitle").value.trim();
        const inquiryContent = document.getElementById("inquiryContent").value.trim();

        const submitButton = document.querySelector("button[type='submit']");
        
        // 모든 필드가 입력되었는지 확인
        if (inquiryType !== "" && email !== "" && contactMethod !== "선택하세요" && phone !== "" && inquiryTitle !== "" && inquiryContent !== "") {
            submitButton.disabled = false; // 모든 값이 입력되면 버튼 활성화
        } else {
            submitButton.disabled = true; // 하나라도 비어있으면 버튼 비활성화
        }
    }

    // 페이지 로드 시 버튼 비활성화
    window.onload = function() {
        const submitButton = document.querySelector("button[type='submit']");
        submitButton.disabled = true;
        // 모든 입력 필드에 이벤트 리스너 추가
        document.querySelectorAll("input, textarea, select").forEach(input => {
            input.addEventListener("input", validateForm);
            input.addEventListener("change", validateForm);
        });
    }
</script>
<body>
	<jsp:include page="/common/header.jsp" />
	<div class="title-box">
		<div class="title">
			[Little Forest] 문의 메일 양식 <i class="bi bi-envelope-at"></i>
		</div>
	</div>
	<div class="container mt-5" id="big-box">
		<form id="inquiryForm">
			<div class="mb-3">
				<label for="inquiryType" class="form-label">문의 분류 *</label> <select id="inquiryType" class="form-select">
					<option value="" selected>선택하세요</option>
					<option>로그인, 비밀번호, 탈퇴 문의</option>
					<option>계정 정지, 타인 도용 의심 문의</option>
					<option>결제 오류, 환불 문의</option>
					<option>저작권 침해, 불법적인 게시글 신고 문의</option>
				</select>
			</div>
			<div class="mb-3">
				<label for="email" class="form-label">이메일 주소 *</label>
				<div class="input-group">
					<input type="text" class="form-control" placeholder="입력해주세요" id="email"> <span class="input-group-text">@</span> <label for="contactMethod" class="form-label"></label> <select id="contactMethod" class="form-select">
						<option value="" selected>선택하세요</option>
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
				<textarea class="form-control" id="inquiryContent" rows="8" placeholder="1. 신고 정보:
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
