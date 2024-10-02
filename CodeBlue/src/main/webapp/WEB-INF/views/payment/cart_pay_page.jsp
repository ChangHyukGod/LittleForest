<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.List"%>
<%@ page import="com.simplecoding.repositoryexam.vo.basic.MainVO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 페이지</title>
    <style>
        .container {
            display: flex;
            flex-direction: column; /* 세로 방향으로 나열 */
            align-items: center; /* 중앙 정렬 */
            padding: 20px; /* 상하 여백 */
        }
        .card {
            width: 60rem; /* 카드의 너비 */
            margin-top: 10px; /* 카드 간의 간격 */
            padding: 20px; /* 카드 내 여백 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 카드에 그림자 추가 */
            border-radius: 5px; /* 카드 모서리 둥글게 */
        }
        .card-container {
            display: flex;
            flex-direction: column; /* 세로 방향으로 나열 */
            gap: 10px; /* 카드 간의 간격 */
            width: 100%; /* 카드 컨테이너의 너비 */
            align-items: center; /* 카드 중앙 정렬 */
        }
        .card-content {
            display: flex; /* 가로 방향으로 배치 */
            align-items: center; /* 세로 중앙 정렬 */
        }
        .game-info {
            margin-left: 20px; /* 이미지와 텍스트 사이의 간격 */
            text-align: left; /* 텍스트 정렬 */
            flex: 1; /* 남은 공간을 차지 */
        }
        .game-info p {
            margin: 0; /* 기본 여백 제거 */
        }
        .centered-info {
            display: flex;
            flex-direction: column; /* 세로 방향으로 나열 */
            justify-content: center; /* 세로 중앙 정렬 */
            align-items: center; /* 가로 중앙 정렬 */
            text-align: left; /* 텍스트 왼쪽 정렬 */
        }
        .payment-method-card {
            height: 100%; /* 높이를 다른 카드와 동일하게 맞춤 */
        }
    </style>
    <script type="text/javascript" defer="defer">
        document.addEventListener('DOMContentLoaded', function() {
            const prices = Array.from(document.querySelectorAll('.item-price')).map(priceElem => parseInt(priceElem.textContent.replace(/[^0-9]/g, ''), 10));
            const total = prices.reduce((acc, price) => acc + price, 0);
            document.getElementById('totalPrice').textContent = total.toLocaleString() + '원';

            // 전체 동의 체크박스 이벤트
            const checkAll = document.getElementById('checkAll');
            const checkItems = document.querySelectorAll('.checkItem');

            checkAll.addEventListener('change', function() {
                checkItems.forEach(item => item.checked = checkAll.checked);
            });

            checkItems.forEach(item => {
                item.addEventListener('change', function() {
                    if (!item.checked) {
                        checkAll.checked = false; // 하나라도 체크 해제하면 전체 해제
                    } else if (Array.from(checkItems).every(i => i.checked)) {
                        checkAll.checked = true; // 모두 체크되면 전체 체크
                    }
                });
            });
        });
        
        function func_buy() {
            const checkAll = document.getElementById('checkAll');
            if (checkAll.checked) {
                alert("결제하시겠습니까?");
            } else {
                alert("전체 동의를 체크해주세요.");
            }
        }
    </script>
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>
<div class="container">
    <h5 style="font: bold;">주문서</h5>

    <!-- 결제 상품 정보 -->
    <div class="card-container">
        <c:forEach var="game" items="${selectedGames}">
            <div class="card">
                <div class="card-content">
                    <img src="/resources/images/${game.fileTitle}.jpg" style="width:20rem;">
                    <div class="game-info centered-info">
                        <p>게임명 : ${game.fileTitle}</p>
                        <p>구매수량 : 1개</p>
                        <p class="item-price">상품가격 : ${game.price}원</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- 주문자 정보 -->
    <div class="card">
        <table class="table table-borderless">
            <thead>
                <tr style="display:flex; gap:550px;">
                    <th>주문자 정보</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>성명 : ${sessionScope.memberVO.membername}</th>
                </tr>
                <tr>
                    <th>주문자 전화번호 : ${sessionScope.memberVO.phonenumber}</th>
                </tr>
                <tr>
                    <th>주문자 이메일 주소 : ${sessionScope.memberVO.email}</th>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 결제 정보 -->
    <div class="card">
        <table class="table table-borderless">
            <thead>
                <tr>
                    <th>결제 정보</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th style="text-align: left;">총 구매수량</th>
                    <td style="text-align: right;">${fn:length(selectedGames)} 개</td>
                </tr>
                <tr style="border-top: 1px solid black;">
                    <th style="text-align: left;">총 결제금액</th>
                    <td style="text-align: right;"><span id="totalPrice">0원</span></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 결제 방법 -->
    <div class="card payment-method-card">
        <table class="table table-borderless">
            <thead>
                <tr>
                    <th style="text-align: left;">결제 방법</th>
                </tr>
            </thead>         
            <tbody>
                <tr>
                    <th>
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <label class="form-check-label" for="flexRadioDefault1">신용카드</label>
                    </th>
                    <th>
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
                        <label class="form-check-label" for="flexRadioDefault2">무통장 입금</label>
                    </th>
                </tr>
                <tr>
                    <th>
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3">
                        <label class="form-check-label" for="flexRadioDefault3">네이버페이</label>
                    </th>
                    <th>
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault4">
                        <label class="form-check-label" for="flexRadioDefault4">카카오페이</label>
                    </th>
                </tr>
                <tr>
                    <th colspan="2">
                        <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                            <option selected>은행 선택</option>
                            <option value="1">KB국민은행</option>
                            <option value="2">농협은행</option>
                            <option value="3">하나은행</option>
                            <option value="4">IBK기업은행</option>
                            <option value="5">카카오뱅크</option>
                        </select>
                    </th>
                </tr>
                <tr>
                    <th colspan="2">
                        <input type="email" class="form-control" id="floatingInput"
                        placeholder="예금주명(미입력시 주문자명)">
                    </th>
                </tr>
                <tr>
                    <th colspan="2" style="color:light-gray; font-size:12px;">
                    주문 후 1시간 이내 미입금시 자동 취소됩니다.</th>
                </tr>
                <tr>
                    <td style="color:light-gray; font-size:12px;">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                    <label class="form-check-label" for="flexCheckDefault">
                    현금영수증 신청</label>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 결제 동의 -->
    <div class="card">
        <div>
            <label style="padding-bottom:10px;">
                <input type="checkbox" id="checkAll"> 전체 동의
            </label>
        </div>
        <div style="padding-left:20px;">
            <label style="padding-bottom:10px;">
                <input type="checkbox" class="checkItem"> 구매조건 확인 및 결제진행 동의
            </label><br>
            <label style="padding-bottom:10px;">
                <input type="checkbox" class="checkItem"> 개인정보 이용동의
            </label><br>
        </div>
        <div class="d-grid gap-2 col-6 mx-auto" style="padding-bottom:20px;">
            <button type="button" class="btn btn-primary" onclick="func_buy()">결제하기</button>
        </div>
    </div>
</div>

<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>
