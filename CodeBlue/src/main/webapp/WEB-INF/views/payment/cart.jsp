<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.List"%>
<%@ page import="com.simplecoding.repositoryexam.vo.basic.MainVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <title>장바구니</title>
    <script>
        // 장바구니에서 게임 개별 삭제
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
        
     	// 장바구니에서 게임 전체 삭제
        function removeAllFromCart() {
            if (confirm("장바구니의 모든 아이템을 삭제하시겠습니까?")) {
                fetch('/main/removeAllFromCart', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                })
                .then(response => response.text())
                .then(data => {
                    alert(data);
                    window.location.href = '/main/cart'; // 장바구니 페이지로 리다이렉트
                })
                .catch(error => console.error('Error:', error));
            }
        }


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
            const checkboxes = document.querySelectorAll('.item-checkbox');
            checkboxes.forEach(checkbox => {
                if (checkbox.checked) {
                    const priceElement = checkbox.closest('.card').querySelector('.item-price');
                    const price = parseInt(priceElement.dataset.price);
                    totalPrice += price;
                }
            });

            document.getElementById('total-price').innerText = totalPrice.toLocaleString('ko-KR') + '원';
            updateSelectAllCheckbox();
        }

        window.onload = initializeTotalPrice;

        function proceedToCheckout() {
            var isLoggedIn = ${sessionScope.memberVO != null};

            if (!isLoggedIn) {
                alert("로그인 후 결제를 진행해주세요.");
                window.location.href = '/login';
                return;
            }

            const selectedItems = Array.from(document.querySelectorAll('.item-checkbox:checked')).map(checkbox => checkbox.value);
            
            if (selectedItems.length === 0) {
                alert("구매할 게임을 선택하세요.");
                return;
            }

            fetch('/main/cart/saveSelectedItems', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ uuids: selectedItems })
            })
            .then(response => {
                if (response.ok) {
                    window.location.href = '/main/cart/buy';
                } else {
                    return response.text().then(text => {
                        alert('선택한 게임을 저장하는 데 실패했습니다: ' + text);
                    });
                }
            })
            .catch(error => console.error('Error:', error));
        }
    </script>
    
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* 전체 화면 높이 */
        }

        .container {
            flex: 1; /* 남은 공간을 채우기 */
        }
    </style>
</head>
<body>
    <jsp:include page="/common/header.jsp"></jsp:include>
    <div class="container">
        <div>
            <h2 style="margin-top: 20px; margin-bottom:20px;">${sessionScope.memberVO.membername}님의 장바구니 (현재 : ${fn:length(cartItems)}개)</h2>
        </div>
        <div style="display:flex; gap:48rem;">
        <div>
        <input type="checkbox" id="select-all" onclick="toggleCheckboxes(this.checked)" style="margin-bottom: 10px;">
        전체 선택</div>
        <button type="button" class="btn btn-danger" onclick="removeAllFromCart()">전체 삭제</button>
        </div>
   
        <div style="display: flex; gap: 30px;">
            <div style="display: flex-direction:row;">
                <c:if test="${not empty cartItems}">
                    <c:forEach var="item" items="${cartItems}">
                        <div class="card" style="width: 60rem; padding: 10px 0px 0px 20px; margin-top: 10px; margin-bottom: 10px;">
                            <div>
                                <input type="checkbox" class="item-checkbox" value="${item.uuid}" onchange="updateTotalPrice()" checked>
                            </div>
                            <br>
                            <div style="display: flex; gap: 50px; padding-bottom: 20px;">
                                <div>
                                    <img src="/resources/images/${item.fileTitle}.jpg" alt="게임 이미지" style="width: 25rem; height: 12rem;">
                                </div>
                                <div class="card-info" style="display: flex-direction:row; gap: 5px;">
                                    <h3 style="margin-bottom:20px;">
                                        <c:out value="${item.fileTitle}" />
                                    </h3>
                                    <p>장르 : <c:out value="${item.genre}" /></p>
                                    <p class="item-price" data-price="${item.price.replaceAll('[^\\d]', '')}">가격 : ${item.price}원</p>
                                    <br />
                                    <div class="button-group" style="display: flex; gap: 20px;">
                                        <a href="/main/buy?uuid=${item.uuid}" class="btn btn-success">구매하기</a>
                                        <form action="/main/removeFromCart" method="post" onsubmit="return confirmDelete('${item.uuid}')">
                                            <input type="hidden" name="uuid" value="${item.uuid}">
                                            <button type="submit" class="btn btn-outline-danger">삭제하기</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>

                <c:if test="${empty cartItems}">
                    <p style="margin: 5px 0;">장바구니가 비어 있습니다.</p>
                </c:if>
            </div>
         
         <!-- 장바구니가 비어있지 않으면(= 아이템이 하나라도 있으면) 사이드바가 보임    -->
            <c:if test="${not empty cartItems}">
                <div class="sidebar" id="sidebar" style="position: fixed; top: auto; right: 100px; width: 18rem;
                margin-top:10px; border: 1px solid lightgray; padding: 20px 10px 0px 20px; border-radius: 5px;
                transition: transform 0.3s ease; z-index: 1000;">
                    <h4 style="margin: 0 0 10px;">결제 금액</h4>
                    <h5 style="margin: 0;"><span id="total-price">0원</span></h5>
                    <br/>
                    <div class="button-group" style="display: flex; gap: 15px; margin-bottom:20px;">
                        <button type="button" class="btn btn-success"
						style="display: flex; justify-content: center; align-items: center; height: 50px;"
						onclick="proceedToCheckout()">
						<p id="checked-count" style="margin: 0;"></p></button>
						<a href="/" class="btn btn-outline-dark"
						style="display: flex; justify-content: center; align-items: center; height: 50px;">
						홈으로 이동</a>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
    <jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>