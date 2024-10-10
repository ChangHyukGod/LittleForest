<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ 추가 페이지</title>
<style>
.form-label { /* 질문 */
	color: rgb(170, 233, 170);
	font-size: xx-large;
	font-weight: bolder;
	padding: 10px;
}

.container { /* 전체 박스 */
	margin: 70px 600px 70px 600px;
}

.title { /* 타이틀 */
	color: rgb(103, 216, 103);
	font-size: 41px; font-weight : bold; text-align : center;
	margin: 50px;
	font-weight: bold;
	text-align: center;
}

.t-b-box {
	width: 70%;
	justify-content: center;
	text-align: center;
	margin-left: 15.3%;
}

.btn-outline-success {
	margin-left: 15.3%;
}

.error-message {
	color: red;
	font-weight: bold;
	margin-top: 5px;
}
</style>
<script type="text/javascript">
	function fn_save() {
		document.addForm.action = "/faq/add";
		document.addForm.submit();
	}
	function fn_moveToFaqList() {
		location.href = "/faqlogin";
	}

	function toggleButtonState() {
		const questionValue = document.getElementById("question").value.trim();
		const answerValue = document.getElementById("answer").value.trim();
		const submitButton = document.getElementById("submitButton");
		if (questionValue && answerValue) {
			submitButton.disabled = false; // 입력값이 있는 경우 버튼 활성화
		} else {
			submitButton.disabled = true; // 입력값이 없는 경우 버튼 비활성화
		}
	}

	window.onload = function() {
		// 페이지 로딩 시 버튼을 비활성화 상태로 설정
		toggleButtonState();
	};
</script>
</head>
<body>
	<jsp:include page="/common/header.jsp" />
	<div class="title">
		[Little Forest] FAQ 추가 페이지 <i class="bi bi-key"></i>
	</div>
	<div class="container">
		<!-- form 태그 시작 -->
		<form id="addForm" name="addForm" method="post" action="/faq/add">
			<div class="mb-3 t-b-box">
				<label for="question" class="form-label">Question</label> <input class="form-control" id="question" name="question" placeholder="질문 입력" oninput="toggleButtonState()" />
			</div>
			<div class="mb-3 t-b-box">
				<label for="answer" class="form-label">Answer</label>
				<textarea class="form-control" id="answer" name="answer" rows="5" placeholder="답변 입력" oninput="toggleButtonState()"></textarea>
			</div>
			<!-- 저장 버튼과 페이지 이동 버튼 두 개로 분리 -->
			<button type="button" class="btn btn-outline-success" id="submitButton" onclick="fn_save()" disabled>저장</button>
			<button type="button" class="btn btn-outline-info" id="moveButton" onclick="fn_moveToFaqList()">목록으로 이동</button>
		</form>
		<!-- form 태그 끝 -->
	</div>
	<jsp:include page="/common/footer.jsp" />
</body>
</html>
