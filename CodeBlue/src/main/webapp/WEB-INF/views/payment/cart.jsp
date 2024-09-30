<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>    
<script>
//	체크박스 전체선택
	function toggleCheckboxes(checked) {
		const checkboxes = document.querySelectorAll('.item-checkbox');
		checkboxes.forEach(checkbox => {
		checkbox.checked = checked;
		});
	}
	
	function updateSelectAllCheckbox() {
		const checkboxes = document.querySelectorAll('.item-checkbox');
		const selectAllCheckbox = document.getElementById('select-all');
		
		selectAllCheckbox.checked = Array.from(checkboxes).every(checkbox => checkbox.checked);
	}
	
//	장바구니에서 게임삭제
	function confirmDelete(uuid) {
			if (confirm("정말로 삭제하시겠습니까?")) {
				fetch('/main/removeFromCart', {
					method: 'POST',
					headers: {
					'Content-Type': 'application/x-www-form-urlencoded',
					},
					body: 'uuid=' + encodeURIComponent(uuid),
					})
				.then(response => response.text())
					.then(data => {
					alert(data); // 삭제 메시지 표시
					window.location.href = '/main/cart'; // 장바구니 페이지로 이동
					})
				.catch(error => console.error('Error:', error));
				return false; // 기본 폼 제출 방지
			}
		return false; // 삭제 취소 시 폼 제출 방지
	}
	
	document.addEventListener('DOMContentLoaded', function() {
		const checkboxes = document.querySelectorAll('.item-checkbox');
		checkboxes.forEach(checkbox => {
		checkbox.addEventListener('change', updateSelectAllCheckbox);
		});
	});
	
//	사이드바 예시
	window.addEventListener('scroll', () => {
        const sidebar = document.getElementById('sidebar');
        const scrollY = window.scrollY;

        // 스크롤에 따라 사이드바 위치 조정
        if (scrollY > 100) {
            sidebar.style.transform = 'translateY(' + (scrollY - 100) + 'px)';
        } else {
            sidebar.style.transform = 'translateY(0)';
        }
    });

</script>
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>
<div class="container">

<%-- <form action="listForm" name="listForm" method="get">

<input type="hidden" name="uuid" value="${cart.uuid}"> --%>

<div><h2 style="margin-top: 20px;">${sessionScope.memberVO.membername} 님의 장바구니</h2></div>
<input type="checkbox" id="select-all" onclick="toggleCheckboxes(this.checked)" style="margin-bottom: 10px;"> 전체 선택<br>

<!-- 전체박스 가로정렬 -->
<div style="display: flex; gap:30px;">
<!-- (1) 우측 박스 -->
<div style="display: flex-direction:row;">
	<c:if test="${not empty cartItems}">
		<c:forEach var="item" items="${cartItems}">
		
		<!-- 1) 상품 목록 카드 -->
		<div class="card" style="width: 60rem; padding:10px 0px 0px 20px; margin-top:10px;">
			<!-- 체크박스 추가 -->
			<div><input type="checkbox" class="item-checkbox" value="${item.uuid}"></div>
			<!-- 카드 안 가로정렬 -->
			<div style="display: flex; gap:50px; padding-bottom: 20px;">
			<!-- 이미지 크기 -->
			<div><img src="<c:out value="${item.fileUrl}"/>" alt="게임 이미지" style="width: 25rem; height: 12rem;"></div>
				<div class="card-info">
					<h3><c:out value="${item.fileTitle}"/></h3>
					<p>장르: <c:out value="${item.genre}"/></p>
					<p>가격: <c:out value="${item.price}"/></p>
					<br/>
					<div class="button-group" style="display: flex; gap: 20px;">
						<a href="/main/buy?uuid=${item.uuid}" class="btn btn-primary">구매하기</a>
						<form action="/main/removeFromCart" method="post" onsubmit="return confirmDelete('${item.uuid}')">
							<input type="hidden" name="uuid" value="${item.uuid}">
							<button type="submit" class="btn btn-danger">삭제하기</button>
						</form>
					</div>
				</div>
			</div>  <!-- 카드 닫는태그 -->
			
		</div>  <!-- 상품 목록 닫는태그 -->
		</c:forEach>
	</c:if>
	
	<c:if test="${empty cartItems}">
	<p>장바구니가 비어 있습니다.</p>
	</c:if>

	<!-- 2) 버튼 -->
	<div style="display:flex; gap:20px; margin-top:10px; margin-bottom:10px;">
		<button type="button" class="btn btn-light">모든 상품 제거</button>
		<button type="button" class="btn btn-light">선택 상품 제거</button>
	</div>
</div> <!-- (1) 우측박스 닫는태그 -->

<!-- (2) 좌측 박스 -->
<%-- <div class="sidebar" style="display: flex-direction:row; position: sticky; top: 0;">
	<!-- 3) 결제 예상 금액 -->
	<div class="card" style="width:16rem; padding:20px 0px 0px 20px; margin-top:10px;">
		<div>
		<h4>결제 예상 금액</h4>
		<h5>\16,000원</h5>
		</div>
		<br/>
		<!-- 4) 버튼 -->
		<div class="button-group" style="display: flex; gap: 15px; margin-bottom:20px;">
			<a href="/main/buy?uuid=${item.uuid}" class="btn btn-primary">구매하기</a>
			<a href="/" class="btn btn-success">홈으로 이동</a>
		</div>
	</div>  <!-- 3) 닫는태그 -->
</div> --%>  <!-- (2) 좌측박스 닫는태그 -->

<!-- 사이드바 예시 -->
<div class="sidebar" id="sidebar" style="position: fixed; top: 250px; right: 100px; width: 16rem;
background-color: white; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); padding:20px 0px 0px 20px; margin-top:10px;
transition: transform 0.3s ease; z-index: 1000;">
    <h4 style="margin: 0 0 10px;">결제 예상 금액</h4>
    <h5 style="margin: 0;">\16,000원</h5>
    <br/>
    <div class="button-group" style="display: flex; gap: 15px; margin-bottom:20px;">
			<a href="/main/buy?uuid=${item.uuid}" class="btn btn-primary">구매하기</a>
			<a href="/" class="btn btn-success">홈으로 이동</a>
	</div>
</div>
<!-- 사이드바 예시 -->


</div>  <!-- 전체박스 가로정렬 -->

<!-- </form> -->
</div>
<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>