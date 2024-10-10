<%-- 
  Created by IntelliJ IDEA.
  User: GGG
  Date: 2024-03-13
  Time: 오후 5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

.text-end {
	float: right;
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
					<strong>상호명:</strong> 코드블루 <br> <strong>사업자등록번호:</strong> 000-00-00000<br> <strong>주소:</strong> 부산광역시 <br> <strong>고객센터:</strong> 0000-0000 (평일 10시~18시) | <strong>이메일:</strong> abc123@codeblue.com
				</div>
				<!-- 고객지원 링크 -->
				<div class="col-lg-6 mb-3 text-end">
				    <a href="/faq">고객센터</a> | 
				    <c:choose>
				        <c:when test="${sessionScope.memberVO == null}">
				            <a href="/register">회원가입</a>
				        </c:when>
				    </c:choose>
				    <c:if test="${sessionScope.memberVO == null}">
				        |
				    </c:if>
				    <a href="/main/cart">장바구니</a>
				</div>
			</div>
			<div class="row">
				<!-- 저작권 정보 -->
				<div class="col-lg-12 d-flex justify-content-end">
					<p>&copy; 2024. Codeblue Corp. All Rights Reserved.</p>
				</div>
			</div>
		</div>
	</footer>

	<!-- 부트스트랩 JS 링크 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
