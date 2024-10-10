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
    <title>장바구니 결제 페이지</title>
    <script type="text/javascript" defer="defer">
        document.addEventListener('DOMContentLoaded', function() {
            // 모든 가격 요소를 선택하고 숫자로 변환하여 배열로 만듭니다.
            const prices = Array.from(document.querySelectorAll('.item-price')).map(priceElem => 
                parseInt(priceElem.textContent.replace(/[^0-9]/g, ''), 10)
            );

            // 배열에 있는 모든 가격의 합을 계산합니다.
            const total = prices.reduce((acc, price) => acc + price, 0);

            // 총 가격을 화면에 표시합니다. (천 단위 구분 기호 추가)
            document.getElementById('totalPrice').textContent = total.toLocaleString() + '원';

            // 전체 동의 체크박스 및 개별 체크박스 요소를 선택합니다.
            const checkAll = document.getElementById('checkAll');
            const checkItems = document.querySelectorAll('.checkItem');

            // 전체 동의 체크박스의 상태가 변경될 때
            checkAll.addEventListener('change', function() {
                // 전체 체크박스가 체크되면 모든 개별 체크박스를 체크하고, 그렇지 않으면 해제합니다.
                checkItems.forEach(item => item.checked = checkAll.checked);
            });

            // 각 개별 체크박스에 대해
            checkItems.forEach(item => {
                // 체크박스의 상태가 변경될 때
                item.addEventListener('change', function() {
                    // 만약 체크가 해제되면 전체 동의 체크박스도 해제합니다.
                    if (!item.checked) {
                        checkAll.checked = false;
                    } 
                    // 모든 개별 체크박스가 체크되어 있다면 전체 동의 체크박스를 체크합니다.
                    else if (Array.from(checkItems).every(i => i.checked)) {
                        checkAll.checked = true;
                    }
                });
            });

            // 현금영수증 체크박스 이벤트 추가
            const receiptCheck = document.getElementById('flexCheckDefault');
            const receiptPhoneRow = document.getElementById('receiptPhoneRow');

            // 현금영수증 체크박스의 상태가 변경될 때
            receiptCheck.addEventListener('change', function() {
                // 체크박스가 체크되면 전화번호 입력란을 보이고, 그렇지 않으면 숨깁니다.
                receiptPhoneRow.style.display = this.checked ? 'table-row' : 'none';
            });

            // 결제 방법 라디오 버튼 요소 선택
            const paymentMethods = document.querySelectorAll('input[name="flexRadioDefault"]');
            const bankRow = document.querySelector('.form-select').parentElement.parentElement; // 은행 선택
            const depositorRow = document.getElementById('floatingInput').parentElement.parentElement; // 예금주명 입력란

            // 결제 방법 변경 시 입력란 표시 여부 제어
            paymentMethods.forEach(method => {
                method.addEventListener('change', function() {
                    if (this.id === 'flexRadioDefault1' || this.id === 'flexRadioDefault2') {
                        bankRow.style.display = 'table-row'; // 입력란 보이기
                        depositorRow.style.display = 'table-row'; // 예금주명 보이기
                    } else {
                        bankRow.style.display = 'none'; // 입력란 숨기기
                        depositorRow.style.display = 'none'; // 예금주명 숨기기
                    }
                });
            });
        });

        // 결제하기 버튼 클릭
        function func_buy() {
            // 로그인 상태 확인
            var isLoggedIn = ${sessionScope.memberVO != null}; // 로그인 상태를 JSP에서 확인
            if (!isLoggedIn) {
                alert("로그인 후 결제를 진행해주세요.");
                window.location.href = '/login'; // 로그인 페이지로 리다이렉트
                return; // 함수 종료
            }
            
            const checkAll = document.getElementById('checkAll');
            const paymentMethod = document.querySelector('input[name="flexRadioDefault"]:checked');
            const bankSelect = document.querySelector('.form-select');
            const depositorName = document.getElementById('floatingInput').value.trim();
            const receiptCheck = document.getElementById('flexCheckDefault');
            const phoneNumber = document.getElementById('receiptPhoneNumber').value.trim();

            // 전체 동의 체크 여부 확인
            if (!checkAll.checked) {
                alert("전체 동의를 체크해주세요.");
                return; // 체크하지 않으면 함수 종료
            }

            // 결제 방법 선택 여부 확인
            if (!paymentMethod) {
                alert("결제 방법을 선택해주세요.");
                return; // 체크하지 않으면 함수 종료
            }

            // 은행 선택 여부 확인
            if ((paymentMethod.id === 'flexRadioDefault1' || paymentMethod.id === 'flexRadioDefault2') && bankSelect.selectedIndex === 0) {
                alert("은행을 선택해주세요.");
                return; // 체크하지 않으면 함수 종료
            }

            // 예금주명 입력 여부 확인
            if ((paymentMethod.id === 'flexRadioDefault1' || paymentMethod.id === 'flexRadioDefault2') && depositorName === "") {
                alert("예금주명을 입력해주세요.");
                return; // 체크하지 않으면 함수 종료
            }

            // 현금영수증 신청 체크 시 전화번호 입력 여부 확인
            if (receiptCheck.checked) {
                const phonePattern = /^010\d{8}$/; // 010으로 시작하는 11자리 패턴
                if (!phonePattern.test(phoneNumber)) {
                    alert("전화번호는 '010'으로 시작하는 11자리 숫자를 입력해야 합니다.");
                    return; // 체크하지 않으면 함수 종료
                }
            }

            // 모든 조건을 만족하면 결제 진행
            alert("결제하시겠습니까?");
            // 추가적인 결제 로직을 여기에 작성할 수 있습니다.
        }
        
        /* // 사이드바 하단 위치 고정
        window.addEventListener('scroll', function() {
            var sidebar = document.getElementById('sidebar');
            var footer = document.getElementById('footer');

            // 윈도우 높이와 스크롤 값 계산
            var windowHeight = window.innerHeight;
            var footerTop = footer.getBoundingClientRect().top + window.pageYOffset;
            var scrollTop = window.pageYOffset || document.documentElement.scrollTop;

            // footer와 사이드바가 겹치지 않도록 하는 조건
            if (scrollTop + windowHeight >= footerTop) {
                sidebar.style.position = 'absolute';
                sidebar.style.top = (footerTop - sidebar.offsetHeight) + 'px';
            } else {
                sidebar.style.position = 'fixed';
                sidebar.style.top = 'auto';  // 스크롤 상단에서는 기본 fixed로 유지
            }
        }); */
    </script>
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 122vh; /* 전체 화면 높이 */
        }

        .container {
            flex: 1; /* 남은 공간을 채우기 */
        }
    </style>
</head>
<body>
<div style="z-index: 1000;">
<jsp:include page="/common/header.jsp"></jsp:include>
</div>
<div class="container">
<h5 class="container" style="font: bold;">결제 내역</h5>

<div class="container" style="display:flex; gap:20px;">
<!-- (1) 상품 내역 -->
<div style="display:flex-direction:row; gap:10px; margin-bottom:10px;">
	<c:forEach var="game" items="${selectedGames}">
		<div class="card" style="width:53rem; padding:10px 0px 0px 10px; margin-top:10px;">
			<table class="table table-borderless" style="border:0;">         
	            <tbody>
	                <tr>
	                    <th rowspan="4" style="border:0;">
	                        <img src="/resources/images/${game.fileTitle}.jpg" style="width:21rem;">
	                    </th>
	                </tr>
	                <tr>
	                    <td style="padding-right:200px; vertical-align : middle; width:100%;
	                    white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
	                    <p style="margin-top:10px; padding-left: 20px;">게임명 : ${game.fileTitle}</p>
	                    <p style="margin-top:20px; padding-left: 20px;">구매수량 : 1개</p>
	                    <p class="item-price" style="margin-top:20px; padding-left: 20px;">상품가격 : ${game.price}원</p>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
		</div> 
	</c:forEach>
</div>  <!-- (1) 닫는 태그 -->

<!-- (2) 사이드바 -->
<!-- <div class="sidebar" id="sidebar" style="position: fixed; top: auto; right: 100px;
transition: transform 0.3s ease; z-index: 500;"> -->
<!-- (2) 결제 내역 묶음 -->
<div style="display:flex-direction:row; gap:20px; margin-bottom:10px;">
	<!-- 2) 주문자정보 -->
    <div class="card" style="width:25rem; padding:10px 0px 0px 20px; margin-top:10px;">
        <table class="table table-borderless" style="border-collapse: collapse;">
            <thead>
                <tr style="display:flex; gap:10px;">
                    <th>주문자 정보</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>성명 : ${sessionScope.memberVO.membername}</td>
                </tr>
                <tr>
                    <td>주문자 전화번호 : ${sessionScope.memberVO.phonenumber}</td>
                </tr>
                <tr>
                    <td>주문자 이메일 주소 : ${sessionScope.memberVO.email}</td>
                </tr>
            </tbody>
        </table>
    </div>

	<!-- 3) 결제 금액 -->
    <div class="card" style="width:25rem; padding:20px 30px 0px 30px; margin-top:10px;">
        <table class="table table-borderless" style="border-collapse: collapse;">
            <thead>
                <tr>
                    <th>결제 정보</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th style="text-align: left;">총 구매수량</th>
                    <td style="text-align: right;">${fn:length(selectedGames)}개</td>
                </tr>
                <tr style="border-top: 1px solid black;">
                    <th style="text-align: left;">총 결제금액</th>
                    <td style="text-align: right;"><span id="totalPrice">\0</span></td>
                </tr>
            </tbody>
        </table>
    </div>

	<!-- 4) 결제 방식 -->
    <div class="card payment-method-card" style="width:25rem; padding:20px 30px 0px 30px; margin-top:10px;">
        <table class="table table-borderless" style="border-collapse: collapse;">
            <thead>
                <tr>
                    <th style="text-align: left;">결제 방법</th>
                </tr>
            </thead>         
            <tbody>
                <tr>
                    <td>
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <label class="form-check-label" for="flexRadioDefault1">신용카드</label>
                    </td>
                    <td>
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
                        <label class="form-check-label" for="flexRadioDefault2">무통장 입금</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3">
                        <label class="form-check-label" for="flexRadioDefault3">네이버페이</label>
                    </td>
                    <td>
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault4">
                        <label class="form-check-label" for="flexRadioDefault4">카카오페이</label>
                    </td>
                </tr>
                <tr style="display:none;">
                    <td colspan="2">
                        <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                            <option selected>은행 선택</option>
                            <option value="1">KB국민은행</option>
                            <option value="2">농협은행</option>
                            <option value="3">하나은행</option>
                            <option value="4">IBK기업은행</option>
                            <option value="5">카카오뱅크</option>
                        </select>
                    </td>
                </tr>
                <tr style="display:none;">
                    <th colspan="2">
                        <input type="text" class="form-control" id="floatingInput" placeholder="예금주명">
                    </th>
                </tr>
                <tr>
                    <th colspan="2" style="color:light-gray; font-size:12px;">
                    주문 후 1시간 이내 미입금시 자동 취소됩니다.</th>
                </tr>
                <tr>
                    <td style="color:light-gray; font-size:12px;">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                        <label class="form-check-label" for="flexCheckDefault">현금영수증 신청</label>
                    </td>
                </tr>
                <tr id="receiptPhoneRow" style="display:none;">
                    <td colspan="2">
                        <input type="text" class="form-control" id="receiptPhoneNumber" placeholder="전화번호 (예: 01012345678)" maxlength="11" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

	<!-- 5) 결제 동의 -->
    <div class="card" style="width:25rem; padding:20px 30px 0px 30px; margin-top:10px; margin-bottom:10px;">
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
</div>  <!-- (2) 닫는 태그 -->
<!-- </div> -->
</div>  <!-- (1), (2) -->

</div>

<div id="footer">
<jsp:include page="/common/footer.jsp"></jsp:include>
</div>
</body>
</html>