<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ 검색 결과</title>
</head>
<body>
	<jsp:include page="/common/header.jsp" />
	<h1>검색 결과</h1>

	<div class="accordion" id="accordionExample">
		<c:forEach var="faq" items="${faqList}">
			<div class="accordion-item">
				<h2 class="accordion-header" id="heading${faq.id}">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${faq.id}" aria-expanded="false" aria-controls="collapse${faq.id}">
						<i class="bi bi-quora"></i> ${faq.question}
					</button>
				</h2>
				<div id="collapse${faq.id}" class="accordion-collapse collapse" aria-labelledby="heading${faq.id}" data-bs-parent="#accordionExample">
					<div class="accordion-body">${faq.answer}</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<a href="/faqlogin">FAQ 메인으로 돌아가기</a>
	<jsp:include page="/common/footer.jsp" />
</body>
</html>
