<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>장바구니</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            margin-bottom: 20px; /* 제목과 전체 체크박스 간격 */
        }
        .card-container {
            display: flex;
            flex-direction: column; /* 카드들을 세로로 정렬 */
            align-items: flex-start; /* 왼쪽 정렬 */
        }
        .card {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            margin: 5px 0; /* 카드 간격을 좁힘 */
            max-width: 400px; /* 카드 가로 사이즈 줄임 */
            display: flex; /* 플렉스 박스 사용 */
            transition: box-shadow 0.3s;
            width: 100%;
            align-items: center; /* 수직 중앙 정렬 */
        }
        .card:hover {
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .card img {
            width: 150px; /* 이미지 가로 길이 설정 */
            height: auto; /* 비율 유지 */
            margin-right: 20px; /* 이미지와 텍스트 간 간격 조정 */
        }
        .card-info {
            display: flex;
            flex-direction: column; /* 세로 정렬 */
            flex-grow: 1; /* 남은 공간 차지 */
            text-align: left; /* 텍스트 왼쪽 정렬 */
        }
        .card h5 {
            margin: 0 0 10px;
        }
        .card p {
            margin: 5px 0;
        }
        .button-group {
            margin-top: 10px;
            display: flex;
            gap: 10px; /* 버튼 간 간격 */
        }
        .btn {
            flex: 1; /* 버튼 크기 조정 */
            white-space: nowrap; /* 텍스트가 한 줄로 유지되도록 설정 */
        }
    </style>
    
    <script>
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
        // 장바구니에서 게임삭제
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
    </script>
</head>
<body>
   <jsp:include page="/common/header.jsp"></jsp:include>
   
    <h1>${sessionScope.memberVO.membername} 님의 장바구니</h1> <!-- 제목을 가장 상단에 위치시킴 -->
    
    <c:if test="${not empty cartItems}">
        <div class="card-container">
            <input type="checkbox" id="select-all" onclick="toggleCheckboxes(this.checked)" style="margin-bottom: 10px;"> 전체 선택<br> <!-- 전체 체크박스와 카드 간격 좁힘 -->
            <c:forEach var="item" items="${cartItems}">
                <div class="card">
                    <div style="flex-basis: 100%; display: flex; align-items: center;">
                        <input type="checkbox" class="item-checkbox" value="${item.uuid}" style="margin-right: 10px;"> <!-- 체크박스 추가 -->
                        <img src="<c:out value="${item.fileUrl}"/>" alt="게임 이미지">
                        <div class="card-info">
                            <h5>게임명: <c:out value="${item.fileTitle}"/></h5>
                            <p>장르: <c:out value="${item.genre}"/></p>
                            <p>가격: <c:out value="${item.price}"/></p>
                            <div class="button-group">
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
        </div>
    </c:if>
    
    <c:if test="${empty cartItems}">
        <p>장바구니가 비어 있습니다.</p>
    </c:if>
    
    <a href="/">홈으로 이동</a>
    
    <jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>