<%--
  Created by IntelliJ IDEA.
  User: GGG
  Date: 2024-03-13
  Time: 오후 5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header Example</title>
    <!-- 부트스트랩 CSS 링크 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<!--      부트스트랩 아이콘 링크 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
    	.nav-link {
            position: relative; /* 배지를 아이콘에 절대적으로 위치시키기 위해 설정 */
        }
    	.nav-link i {
            font-size: 25px; /* 아이콘 크기 */
            margin-right: 7px; /* 아이콘 간격 */
        }

        .nav-link:last-child i {
            margin-right: 30px; /* 마지막 아이콘의 오른쪽 여백 제거 */
        }
        .icon-badge {
           position: absolute; /* 배지 위치를 절대적으로 설정 */
            top: -12px; /* 아이콘의 상단에 맞추기 */
            right: -20px; /* 아이콘의 오른쪽에 위치하도록 조정 */
            font-size: 12px; /* 배지 크기 조정 */
            background-color: red; /* 배지 배경색 */
            color: white; /* 배지 글자색 */
            border-radius: 50%; /* 배지 둥글게 */
            padding: 2px 6px; /* 배지 패딩 */
            display: flex; /* 배지를 중앙에 정렬 */
            justify-content: center; /* 배지 중앙 정렬 */
            align-items: center; /* 배지 중앙 정렬 */
        }
        
        .navbar-nav .nav-link {
            margin-right: 15px;
        }
		.navbar-nav {
    		margin-left: 70%; /* 화면 크기에 따라 마진이 유동적으로 조정됩니다 */
		}
        .navbar-brand img {
            width: 50px; /* 로고 크기 조정 */
        }
        .icon {
            font-size: 20px;
            margin-left: 10px;
            position: relative;
        }
        .icon-badge {
            position: absolute;
            top: -10px;
            right: -10px;
            background-color: orange;
            border-radius: 50%;
            color: white;
            padding: 2px 5px;
            font-size: 12px;
        }
        .dropdown-toggle::after {
        	display: none; /* 화살표 표시 숨기기 */
    	}
    	
    	.icon-dropdown-menu {
            min-width: 100px; /* 드롭다운 메뉴의 최소 너비 설정 */
            padding: 5px; /* 드롭다운 메뉴의 패딩 줄이기 */
            position: absolute; /* 드롭다운 메뉴의 위치를 절대적으로 설정 */
            z-index: 1000; /* 메뉴가 다른 요소 위에 표시되도록 설정 */
            
        }
    </style>
</head>
<body>
    <!-- 헤더 시작 -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <!-- 로고 -->
            <a class="navbar-brand" href="/">
                <img src="/resources/images/puppy-1920_1280.jpg" alt="">
            </a>
	 <%-- 메뉴 시작 --%>
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
                <li class="nav-item">
                    <a class="nav-link" href="#">BEST</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">NEW</a>
                </li>

                <%-- 카테고리 드롭다운 --%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        카테고리
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">1</a></li>
                        <li><a class="dropdown-item" href="#">2</a></li>
                        <li><a class="dropdown-item" href="#">3</a></li>
                        <li><a class="dropdown-item" href="#">4</a></li>
                        <li><a class="dropdown-item" href="#">5</a></li>
                    </ul>
                </li>

                <%-- 고객센터 드롭다운 --%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        고객센터
                    </a>
                    <ul class="dropdown-menu">
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
                </li>
            </ul>
                <!-- 우측 아이콘 -->
                <div class="d-flex">
                     <div class="dropdown"> <!-- 드롭다운을 위한 div 추가 -->
        				<a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            				<i class="bi bi-person"></i> <!-- 사용자 아이콘 -->
        				</a>
        					<ul class="dropdown-menu icon-dropdown-menu"> <!-- 클래스 추가 -->
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
            							<a href="#" class="dropdown-item">정보수정</a>
        							</li>
    							</c:otherwise>
							</c:choose>
            					<li><a class="dropdown-item" href="#">주문조회</a></li>
        					</ul>
    				</div>
                    <a href="/shoppingbasket" class="nav-link icon">
                        <i class="bi bi-cart"></i> <!-- 장바구니 아이콘 -->
                        <span class="icon-badge">0</span> <!-- 장바구니 배지 -->
                    </a>
                    
                    <a href="#" class="nav-link icon" data-bs-toggle="modal" data-bs-target="#searchModal">
    					<i class="bi bi-search"></i> <!-- 검색 아이콘 -->
					</a>
<!--                     검색 모달 -->
					<div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="searchModalLabel" aria-hidden="true">
					    <div class="modal-dialog">
					        <div class="modal-content">
					            <div class="modal-header">
					                <h5 class="modal-title" id="searchModalLabel">검색</h5>
					                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					            </div>
					            <div class="modal-body">
					                <form>
					                    <div class="mb-3">
					                        <label for="searchInput" class="form-label">검색어를 입력하세요</label>
					                        <input type="text" class="form-control" id="searchInput" placeholder="검색...">
					                    </div>
					                </form>
					            </div>
					            <div class="modal-footer">
					                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					                <button type="button" class="btn btn-primary">검색</button>
					            </div>
					        </div>
					    </div>
					</div>
                </div>
            </div>
        </div>
    </nav>
</body>
</html>

