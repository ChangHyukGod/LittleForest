<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의 게시판</title>
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

.banner-title {
	font-size: 3rem;
	color: #28a745;
	text-align: center;
}
</style>
<body>
	<jsp:include page="/common/header.jsp" />
	<div class="title-box">
		<div class="title">
			[Little Forest] 문의 게시판 <i class="bi bi-headset"></i>
		</div>
		<div class="title">무엇을 도와드릴까요?</div>
	</div>
	<!-- <hr class="line"> -->
	<div class="container">
		<form id="listForm" name="listForm" method="get">
			<!-- 테이블 -->
			<table class="table">
				<thead>
					<tr>
						<th scope="col">DNO</th>
						<th scope="col">DNAME</th>
						<th scope="col">LOC</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="data" items="${depts}">
						<tr>
							<td><a href="javascript:fn_select(<c:out value="${data.dno}" />)"><c:out value="${data.dno}" /></a></td>
							<td><c:out value="${data.dname}" /></td>
							<td><c:out value="${data.loc}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="paging" class="text-center">
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
				<input type="hidden" id="pageIndex" name="pageIndex" />
			</div>
		</form>
	</div>
	<jsp:include page="/common/footer.jsp" />
</body>
</html>
