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
                    window.location.href = '/main/cart';
                })
                .catch(error => console.error('Error:', error));
                return false;
            }
            return false;
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

                <c:forEach var="item" items="${cartItems}">
                    <div class="card" style="width: 50rem; padding:10px 0px 0px 20px; margin-top:10px;">
                        <input type="checkbox" class="item-checkbox" value="${item.uuid}" onchange="updateTotalPrice()" checked><br>
                        <div style="display: flex; gap:50px; padding-bottom: 20px;">
                            <div><img src="${item.fileUrl}" alt="게임 이미지" style="width: 25rem; height: 12rem;"></div>
                            <div class="card-info">
                                <h3>${item.fileTitle}</h3>
                                <p>장르: ${item.genre}</p>
                                <p class="item-price" data-price="${item.price.replaceAll('[^\\d]', '')}">가격: ${item.price}</p>
                                <div class="button-group" style="display: flex; gap: 20px;">
                                    <a href="/main/buy?uuid=${item.uuid}" class="btn btn-primary">구매하기</a>
                                    <form action="/main/removeFromCart" method="post" onsubmit="return confirmDelete('${item.uuid}')">
                                        <input type="hidden" name="uuid" value="${item.uuid}">
                                        <button type="submit" class="btn btn-danger">삭제하기</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            
            <c:if test="${empty cartItems}">
                <p>장바구니가 비어 있습니다.</p>
            </c:if>
        </div>
    </div>
</div>
<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>
