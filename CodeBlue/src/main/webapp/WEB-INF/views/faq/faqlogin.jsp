<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ 계정관리</title>
</head>
<script type="text/javascript" defer="defer">
	function fn_egov_link_page(pageNo) {
		document.listForm.pageIndex.value = pageNo; // 컨트롤러로 전송됨
		document.listForm.action = "/faq/faqlogin";
		document.listForm.submit();
	}
	function fn_search() {
		document.listForm.pageIndex.value = 1;
		document.listForm.action = "/faq/faqlogin";
		document.listForm.submit();
	}
</script>
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

.pagination {
	display: flex;
	justify-content: center;
}

.pagination a {
	margin: 0 5px;
	padding: 5px 10px;
	border: 1px solid #ddd;
	text-decoration: none;
	color: black;
}

.pagination a.active {
	background-color: rgb(170, 233, 170);
	color: white;
	border-color: rgb(170, 233, 170);
}

.pagination a:hover {
	background-color: rgb(200, 255, 200);
	color: white;
	border-color: rgb(170, 233, 170);
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
</style>

<body>
	<jsp:include page="/common/header.jsp" />
	<div class="title-box">
		<div class="title">
			[Little Forest] 계정 관리 <i class="bi bi-key"></i>
		</div>
		<div class="title">무엇을 도와드릴까요?</div>
		<div class="search_box">
			<form class="d-flex search_bar" method="get" action="/faqlogin">
				<input class="form-control me-2 search_text" name="searchKeyword" type="search" placeholder="궁금한 것을 물어보세요" aria-label="Search">
				<button class="btn btn-outline-success search_glass" type="submit">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>


	</div>
	<div class="body-box">
		<h1 class="body-title">자주 묻는 질문</h1>
		<hr class="line">
		${data.id}
		<form id="listForm" name="listForm" method="get">
			<div class="accordion" id="accordionExample">
				<c:forEach var="data" items="${faqs}">
					<div class="accordion-item">
						<h2 class="accordion-header" id="heading${data.id}">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${data.id}" aria-expanded="false" aria-controls="collapse${data.id}">
								<i class="bi bi-quora"></i> . ${data.question}
							</button>
						</h2>
						<div id="collapse${data.id}" class="accordion-collapse collapse" aria-labelledby="heading${data.id}" data-bs-parent="#accordionExample">
							<div id="q-body" class="accordion-body">ㅡ ${data.answer}</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="paging" class="text-center">
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
				<input type="hidden" id="pageIndex" name="pageIndex" />
			</div>
			<a href="/faq">FAQ 메인으로 돌아가기</a>
		</form>
	</div>
	<jsp:include page="/common/footer.jsp" />
</body>
</html>