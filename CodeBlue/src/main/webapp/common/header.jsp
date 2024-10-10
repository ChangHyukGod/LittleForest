<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Header Example</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<style>
body {
	background-color: #ffffff; /* 배경색을 흰색으로 설정 */
}

.navbar {
	display: flex;
	justify-content: space-between; /* 좌우 아이콘 배치 */
	align-items: center;
	position: relative;
	height: 150px; /* 배너 높이를 키움 */
}

.menu-icon {
	margin-left: 10px;
}

.navbar-brand {
	/* position: absolute; */
	/* left: 50%; */
	/* 로고를 정확히 가운데 배치 */
	margin-left: 44.5%;
}

.navbar-brand img {
	width: 200px; /* 로고 크기 조정 */
	object-fit: cover;
}

.d-flex {
	margin-right: 10px;
}

.nav-link i {
	font-size: 25px;
	margin-right: 7px;
}

.icon-badge {
	position: absolute;
	top: -12px;
	right: -20px;
	font-size: 12px;
	background-color: red;
	color: white;
	border-radius: 50%;
	padding: 2px 6px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.navbar-nav .nav-link {
	margin-right: 15px;
}

.dropdown-toggle::after {
	display: none;
}

.icon-dropdown-menu {
	min-width: 100px;
	padding: 5px;
	position: absolute;
	z-index: 1000;
}

.dropdown-item {
	font-size: 14px; /* 드롭다운 글자 크기를 조금 작게 조정 */
}

.navbar-brand {
	cursor: pointer; /* 마우스 커서를 손가락 모양으로 변경 */
}

.dropdown {
	float: right;
}
</style>

<script type="text/javascript" defer="defer">
	function goHome() {
		window.location.href = "/"; // 로고 클릭시 홈화면으로 페이지를 새로 고침
	}
</script>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-white">
		<div class="container-fluid">
			<!-- 메뉴 아이콘 드롭다운 -->
			<div class="dropdown" hidden>
				<!-- 메뉴 아이콘 -->
				<a href="/faq" class="nav-link dropdown-toggle menu-icon" role="button" data-bs-toggle="dropdown" aria-expanded="false"> <i class="bi bi-list"></i>
				</a>
				<ul class="dropdown-menu icon-dropdown-menu">
					<li><a class="dropdown-item" href="/game1">야채부락리</a></li>
					<li><a class="dropdown-item" href="/game2">아스달</a></li>
					<li><a class="dropdown-item" href="/game3">나혼자레벨업</a></li>
					<li><a class="dropdown-item" href="/game4">모두의마블</a></li>
				</ul>
			</div>

			<!-- 로고 (정중앙) -->
			<a class="navbar-brand" onclick="goHome();" style="display: inline-block;"> <img src="/resources/images/logo1.png" alt="로고">
			</a>

			<!-- 우측 아이콘 -->
			<div class="d-flex">

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<c:choose>
							<c:when test="${sessionScope.memberVO != null}">
								<c:if test="${sessionScope.memberVO.admin == 1}">
									<li class="nav-item"><a href="/main/addition" class="nav-link">MAIN_ADD</a></li>
								</c:if>
							</c:when>
						</c:choose>
							<!-- 고객센터 아이콘 -->
							<a href="/faq" class="nav-link dropdown-toggle"> <i class="bi bi-headset"></i>
							</a>
						<div class="dropdown">
							<!-- 사용자 아이콘 -->
							<a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false"> <i class="bi bi-person"></i>
							</a>
							<ul class="dropdown-menu icon-dropdown-menu">
								<c:choose>
									<c:when test="${sessionScope.memberVO == null}">
										<li><a class="dropdown-item" href="/login">로그인</a></li>
									</c:when>
									<c:otherwise>
										<li class="dropdown-item"><strong>${sessionScope.memberVO.membername} 님<br> 안녕하세요
										</strong></li>
										<li class="nav-item"><a href="/logout" class="dropdown-item">로그아웃</a></li>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${sessionScope.memberVO == null}">
										<li><a class="dropdown-item" href="/register">회원가입</a></li>
									</c:when>
									<c:otherwise>
										<li class="nav-item"><a href="/passwordCheck" class="dropdown-item">정보수정</a></li>
									</c:otherwise>
								</c:choose>
<!-- 								<li><a class="dropdown-item" href="#">주문조회</a></li> -->
							</ul>
						</div>

						<a href="/main/cart" class="nav-link icon"> <i class="bi bi-cart"></i> <span id="cartCount">${cartCount}</span> <!-- cartCount 사용 -->
						</a>

				</div>
			</div>
	</nav>
</body>
</html>