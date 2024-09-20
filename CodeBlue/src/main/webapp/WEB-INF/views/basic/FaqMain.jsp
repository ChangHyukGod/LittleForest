<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%-- <%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%> --%>
<html>
<head>
<title>FAQ_MAIN</title>

</head>
<body>
	<style>
.sidebar {
	width: 200px;
	padding: 20px;
	background-color: rgb(247, 247, 255);
	height: 100vh; /* 전체 높이 */
}

.accordion-button::after {
	margin-left: auto;
}

.bannerimage {
	width: 100%;
	height: 350px;
	object-fit: cover;
	z-index: 5;
}

.bannertitle {
	position: absolute;
	top: 25%;
	left: 17%;
	transform: translate(-50%, -50%);
	color: white;
	font-size: 75px;
	font-weight: bold;
}

.secondtitle {
	position: absolute;
	top: 37%;
	left: 18%;
	transform: translate(-50%, -50%);
	color: white;
	font-size: 30px;
	font-weight: bold;
}

.d-flex2 {
	position: absolute;
	width: 40%;
	height: 40px;
	top: 51%;
	left: 30%;
}

.form-control {
	width: 150px;
	height: 65px;
	border-radius: 50%;
}

.btn {
	margin-top: -8%;
	margin-left: 90%;
	border-radius: 50%;
}
</style>
<body>
	<jsp:include page="/common/header.jsp" />
	<!-- 배너 -->
	<div class="banner">
		<img class="bannerimage" src="${pageContext.request.contextPath}/resources/image/banner4.png" alt="FAQ Banner" />
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
	<!-- 사이드바 시작 -->
	<div class="sidebar">
		<h5>사이드메뉴</h5>
		<div class="accordion accordion-flush" id="accordionExample">
			<!-- 첫 번째 메뉴 -->
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingOne">
					<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">카테고리 1</button>
				</h2>
				<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne">
					<div class="accordion-body">
						<ul class="list-unstyled">
							<li><a href="#">서브메뉴 1-1</a></li>
							<li><a href="#">서브메뉴 1-2</a></li>
							<li><a href="#">서브메뉴 1-3</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 두 번째 메뉴 -->
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingTwo">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">카테고리 2</button>
				</h2>
				<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo">
					<div class="accordion-body">
						<ul class="list-unstyled">
							<li><a href="#">서브메뉴 2-1</a></li>
							<li><a href="#">서브메뉴 2-2</a></li>
							<li><a href="#">서브메뉴 2-3</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 세 번째 메뉴 -->
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingThree">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">카테고리 3</button>
				</h2>
				<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree">
					<div class="accordion-body">
						<ul class="list-unstyled">
							<li><a href="#">서브메뉴 3-1</a></li>
							<li><a href="#">서브메뉴 3-2</a></li>
							<li><a href="#">서브메뉴 3-3</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 키워드 메뉴 -->
	<div class="keyword_menu"></div>

	<jsp:include page="/common/footer.jsp" />
</body>
</html>
