<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.List" %>
<%@ page import="com.simplecoding.repositoryexam.vo.basic.MainVO" %>
<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>    
<script>
//	장바구니에서 게임 삭제
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
            alert(data);
            window.location.href = '/main/cart'; // 장바구니 화면으로 새로고침
        })
        .catch(error => console.error('Error:', error));
        return false;
    }
    return false;
}
 
 // 체크박스에서 체크 별로 게임가격 합산 + 총합 계산
 let totalPrice = 0;

 function updateTotalPrice() {
     const checkboxes = document.querySelectorAll('.item-checkbox:checked');
     totalPrice = 0;
     checkboxes.forEach(checkbox => {
         const priceElement = checkbox.closest('.card').querySelector('.item-price');
         const price = parseInt(priceElement.dataset.price);
         totalPrice += price;
     });
     document.getElementById('total-price').innerText = totalPrice.toLocaleString('ko-KR') + '원';
     updateSelectAllCheckbox();
 }

 function updateSelectAllCheckbox() {
     const allCheckboxes = document.querySelectorAll('.item-checkbox');
     const selectAllCheckbox = document.getElementById('select-all');
     selectAllCheckbox.checked = Array.from(allCheckboxes).every(checkbox => checkbox.checked);
 }

 function toggleCheckboxes(checked) {
     const checkboxes = document.querySelectorAll('.item-checkbox');
     checkboxes.forEach(checkbox => {
         checkbox.checked = checked;
     });
     updateTotalPrice();
 }

 function initializeTotalPrice() {
     const checkboxes = document.querySelectorAll('.item-checkbox:checked');
     checkboxes.forEach(checkbox => {
         const priceElement = checkbox.closest('.card').querySelector('.item-price');
         const price = parseInt(priceElement.dataset.price);
         totalPrice += price;
     });
     document.getElementById('total-price').innerText = totalPrice.toLocaleString('ko-KR') + '원';
 }
 
 window.onload = initializeTotalPrice; // 페이지 로드 시 초기 가격 합산
	
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
    <div><h2>${sessionScope.memberVO.membername} 님의 장바구니</h2></div>
    <input type="checkbox" id="select-all" checked onclick="toggleCheckboxes(this.checked)"> 전체 선택<br>

    <div style="display: flex; gap:30px;">
        <div>
            <c:if test="${not empty cartItems}">
                <%
                    List<MainVO> cartItems = (List<MainVO>) request.getAttribute("cartItems");
                %>
                <h5>결제 예상 금액: <span id="total-price">0원</span></h5>

<input type="hidden" name="uuid" value="${cart.uuid}"> --%>

<div><h2 style="margin-top: 20px;">${sessionScope.memberVO.membername} 님의 장바구니</h2></div>
<input type="checkbox" id="select-all" onclick="toggleCheckboxes(this.checked)" style="margin-bottom: 10px;"> 전체 선택<br>

<!-- 전체박스 가로정렬 -->
<div style="display: flex; gap:30px;">
<!-- (1) 우측 박스 -->
<div style="display: flex-direction:row;">
	<c:if test="${not empty cartItems}">
		<c:forEach var="item" items="${cartItems}">
		
<% List<MainVO> cartItems = (List<MainVO>) request.getAttribute("cartItems"); %>

		
		<!-- 1) 상품 목록 카드 -->
		<div class="card" style="width: 60rem; padding:10px 0px 0px 20px; margin-top:10px;">
			<!-- 체크박스 추가 -->
			<div><input type="checkbox" class="item-checkbox" value="${item.uuid}" onchange="updateTotalPrice()" checked></div>
			<br>
			<!-- 카드 안 가로정렬 -->
			<div style="display: flex; gap:50px; padding-bottom: 20px;">
			<!-- 이미지 크기 -->
			<div><img src="<c:out value="${item.fileUrl}"/>" alt="게임 이미지" style="width: 25rem; height: 12rem;"></div>
				<div class="card-info">
					<h3><c:out value="${item.fileTitle}"/></h3>
					<p>장르: <c:out value="${item.genre}"/></p>
					<p class="item-price" data-price="${item.price.replaceAll('[^\\d]', '')}">가격: ${item.price}</p>
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
<!-- 	<div style="display:flex; gap:20px; margin-top:10px; margin-bottom:10px;">
		<button type="button" class="btn btn-light">모든 상품 제거</button>
		<button type="button" class="btn btn-light">선택 상품 제거</button>
	</div> -->
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
    <h5 style="margin: 0;"><span id="total-price">0원</span></h5>
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
