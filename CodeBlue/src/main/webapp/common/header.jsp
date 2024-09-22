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
    <style>
        .navbar-nav .nav-link {
            margin-right: 15px;
        }
        .navbar-brand img {
            width: 70px; /* 로고 크기 조정 */
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
    </style>
</head>
<body>

    <!-- 헤더 시작 -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <!-- 로고 -->
            <a class="navbar-brand" href="/">
                <img src="" alt="LittleForest Store Logo">
            </a>
<%--  메뉴 시작  --%>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <%--            부서  #1 --%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        BEST
                    </a>
                    <%--                   소메뉴 --%>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/basic/gameinfo">gameinfo</a></li>
                        <li><a class="dropdown-item" href="/basic/dept/addition">Add Dept</a></li>
                    </ul>
                </li>

                <%--            Emp(사원) #2 --%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        NEW
                    </a>
                    <%--                   소메뉴 --%>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/basic/emp">Emp</a></li>
                        <li><a class="dropdown-item" href="/basic/emp/addition">Add Emp</a></li>
                    </ul>
                </li>

                <%--            Faq #3 --%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        카테고리
                    </a>
                    <%--                   소메뉴 --%>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/basic/FaqMain">Faq</a></li>
                        <li><a class="dropdown-item" href="/basic/faq/addition">Add Faq</a></li>
                    </ul>
                </li>

                <%--            FileDb #4 --%>
<!--                 <li class="nav-item dropdown"> -->
<!--                     <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" -->
<!--                        aria-expanded="false"> -->
<!--                         FileDb -->
<!--                     </a> -->
<%--                                       소메뉴 --%>
<!--                     <ul class="dropdown-menu"> -->
<!--                         <li><a class="dropdown-item" href="/advanced/fileDb">FileDb</a></li> -->
<!--                         <li><a class="dropdown-item" href="/advanced/fileDb/addition">Add FileDb</a></li> -->
<!--                     </ul> -->
<!--                 </li> -->

<%--                            Gallery #5 --%>
<!--                 <li class="nav-item dropdown"> -->
<!--                     <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" -->
<!--                        aria-expanded="false"> -->
<!--                         Gallery -->
<!--                     </a> -->
<%--                                       소메뉴 --%>
<!--                     <ul class="dropdown-menu"> -->
<!--                         <li><a class="dropdown-item" href="/advanced/gallery">Gallery</a></li> -->
<!--                         <li><a class="dropdown-item" href="/advanced/gallery/addition">Add Gallery</a></li> -->
<!--                     </ul> -->
<!--                 </li> -->
            </ul>
                <!-- 우측 아이콘 -->
                <div class="d-flex">
                    <a href="/basic/login" class="nav-link">Language | 한국어</a>
                    <a href="/basic/mypage" class="nav-link icon">
                        <i class="bi bi-person"></i> <!-- 사용자 아이콘 -->
                    </a>
                    
                    <a href="#" class="nav-link icon">
                        <i class="bi bi-cart"></i> <!-- 장바구니 아이콘 -->
                        <span class="icon-badge">0</span> <!-- 장바구니 배지 -->
                    </a>
                    
                    <a href="#" class="nav-link icon">
                        <i class="bi bi-search"></i> <!-- 검색 아이콘 -->
                    </a>
                    
                </div>
            </div>
        </div>
    </nav>

    <!-- 부트스트랩 JS 링크 -->
    <!-- 부트스트랩 아이콘 링크 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</body>
</html>

