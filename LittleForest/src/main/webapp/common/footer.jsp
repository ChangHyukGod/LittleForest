<%--
  Created by IntelliJ IDEA.
  User: GGG
  Date: 2024-03-13
  Time: 오후 5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer Example</title>
    <!-- 부트스트랩 CSS 링크 -->
    <style>
        .footer {
            background-color: #f8f9fa; /* 연한 회색 배경 */
            padding: 40px 0;
            font-size: 14px;
            color: #6c757d;
        }
        .footer a {
            color: #6c757d;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        .social-icons a {
            margin-right: 15px;
        }
    </style>
</head>
<body>

    <!-- 푸터 시작 -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <!-- 상호명 및 사업자 정보 -->
                <div class="col-lg-6 mb-3">
                    <strong>상호명:</strong> 코드블루 주식회사 <br>
                    <strong>사업자등록번호:</strong> 105-87-64746<br>
                    <strong>주소:</strong> 서울특별시 구로구 디지털로26길 38 (구로동) G-TOWER<br>
                    <strong>고객센터:</strong> 1670-2451 (평일 10시~18시) | <strong>이메일:</strong> stores@netmarble.com
                </div>
                <!-- 고객지원 링크 -->
                <div class="col-lg-6 mb-3" text-end>
                    <a href="#">개인정보처리방침</a> | 
                    <a href="#">이용약관</a> | 
                    <a href="#">고객센터</a> | 
                    <a href="#">공지사항</a> <br>
                    <a href="#">회원가입</a> | 
                    <a href="#">마이페이지</a> | 
                    <a href="#">장바구니</a> | 
                    <a href="#">위시리스트</a>
                </div>
            </div>
            <div class="row">
                <!-- 소셜 아이콘 -->
                <div class="col-lg-6 social-icons">
                    <a href="#"><img src="path_to_facebook_icon.png" alt="Facebook"></a>
                    <a href="#"><img src="path_to_instagram_icon.png" alt="Instagram"></a>
                    <a href="#"><img src="path_to_youtube_icon.png" alt="YouTube"></a>
                </div>
                <!-- 저작권 정보 -->
                <div class="col-lg-6 text-end">
                    <p>&copy; 2021. Netmarble Corp. All Rights Reserved.</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- 부트스트랩 JS 링크 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>