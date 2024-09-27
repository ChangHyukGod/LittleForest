<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            position: absolute;
            left: 50%;
            transform: translateX(-50%); /* 로고를 정확히 가운데 배치 */
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
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-white">
        <div class="container-fluid">
            <!-- 메뉴 아이콘 드롭다운 -->
            <div class="dropdown"> <!-- 메뉴 아이콘 -->
                <a href="#" class="nav-link dropdown-toggle menu-icon" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-list"></i>
                </a>
                <ul class="dropdown-menu icon-dropdown-menu">
                    <li><a class="dropdown-item" href="/game1">야채부락리</a></li>
                    <li><a class="dropdown-item" href="/game2">아스달</a></li>
                    <li><a class="dropdown-item" href="/game3">나혼자레벨업</a></li>
                    <li><a class="dropdown-item" href="/game4">모두의마블</a></li>
                </ul>
            </div>

            <!-- 로고 (정중앙) -->
            <a class="navbar-brand" href="/">
                <img src="/resources/images/logo1.png" alt="로고">
            </a>

            <!-- 우측 아이콘 -->
            <div class="d-flex">
            
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <c:choose>
	   			<c:when test="${sessionScope.memberVO != null}">
					<c:if test="${sessionScope.memberVO.admin == 1}">
	  					<li class="nav-item">
  							<a href="main/addition" class="nav-link">MAIN_ADD</a>
						</li>
 					</c:if>
				</c:when>
			</c:choose>
            
                <div class="dropdown"> <!-- 고객센터 아이콘 -->
                    <a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-headset"></i>
                    </a>
                    <ul class="dropdown-menu icon-dropdown-menu">
                        <li><a class="dropdown-item" href="">공지사항</a></li>
                        <li><a class="dropdown-item" href="/faq">FAQ</a></li>
                        <li><a class="dropdown-item" href="">1:1문의</a></li>
                        <c:choose>
                            <c:when test="${sessionScope.memberVO != null}">
                                <c:if test="${sessionScope.memberVO.admin == 1}">
                                    <li class="nav-item">
                                        <a href="/faqlogin" class="dropdown-item">Faq Add</a>
                                    </li>
                                </c:if>
                            </c:when>
                        </c:choose>
                    </ul>
                </div>

                <div class="dropdown"> <!-- 사용자 아이콘 -->
                    <a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-person"></i>
                    </a>
                    <ul class="dropdown-menu icon-dropdown-menu">
                        <c:choose>
                            <c:when test="${sessionScope.memberVO == null}">
                                <li><a class="dropdown-item" href="/login">로그인</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="dropdown-item">
                                    <strong>${sessionScope.memberVO.membername} 님<br> 안녕하세요</strong>
                                </li>
                                <li class="nav-item">
                                    <a href="/logout" class="dropdown-item">로그아웃</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${sessionScope.memberVO == null}">
                                <li><a class="dropdown-item" href="/register">회원가입</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item">
                                    <a href="/infofix" class="dropdown-item">정보수정</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        <li><a class="dropdown-item" href="#">주문조회</a></li>
                    </ul>
                </div>

                <a href="/shoppingbasket" class="nav-link icon">
                    <i class="bi bi-cart"></i>
                </a>
                
                <a href="#" class="nav-link icon" data-bs-toggle="modal" data-bs-target="#searchModal">
                    <i class="bi bi-search"></i>
                </a>

                <!-- 검색 모달 -->
                <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="searchModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="searchModalLabel">검색</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="mb-3" style="border: none; border-bottom: 1px solid ;">
                        <input type="text" class="form-control" id="searchInput" placeholder="검색어를 입력하세요." style="border: none; border-bottom: 2px solid black; border-radius: 0; box-shadow: none;">
				</div>

                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-bs-dismiss="modal">닫기</button>
                                <button type="button" class="btn btn-outline-success">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</body>
</html>
