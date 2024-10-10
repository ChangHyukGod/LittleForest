<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>홈 결제 페이지</title>
    <style>
        /* 게임명 줄 바꿈 방지 스타일 */
        .game-title {
            white-space: nowrap; /* 줄 바꿈 방지 */
            overflow: hidden; /* 넘치는 내용 숨김 */
            text-overflow: ellipsis; /* 넘치는 내용에 대해 '...' 표시 */
        }
    </style>
    <script type="text/javascript" defer="defer">
        document.addEventListener('DOMContentLoaded', function() {
            // 전체 동의 체크박스와 개별 체크박스 요소 선택
            const checkAll = document.getElementById('checkAll');
            const checkItems = document.querySelectorAll('.checkItem');
    
            // 전체 동의 체크박스 클릭 시
            checkAll.addEventListener('change', function() {
                checkItems.forEach(checkItem => {
                    checkItem.checked = checkAll.checked;
                });
            });
    
            // 각 개별 체크박스 클릭 시
            checkItems.forEach(checkItem => {
                checkItem.addEventListener('change', function() {
                    checkAll.checked = Array.from(checkItems).every(item => item.checked);
                });
            });
    
            // 현금영수증 체크박스 이벤트 추가
            const receiptCheck = document.getElementById('flexCheckDefault');
            const receiptPhoneRow = document.getElementById('receiptPhoneRow');
    
            receiptCheck.addEventListener('change', function() {
                receiptPhoneRow.style.display = this.checked ? 'table-row' : 'none';
            });

            // 결제 방법 라디오 버튼 요소 선택
            const paymentMethods = document.querySelectorAll('input[name="flexRadioDefault"]');
            const bankRow = document.getElementById('bankSelectRow'); // 은행 선택
            const depositorRow = document.getElementById('depositorRow'); // 예금주명 입력란

            // 결제 방법 변경 시 입력란 표시 여부 제어
            paymentMethods.forEach(method => {
                method.addEventListener('change', function() {
                    if (this.id === 'flexRadioDefault1' || this.id === 'flexRadioDefault2') {
                        bankRow.style.display = 'table-row'; // 은행 선택 보이기
                        depositorRow.style.display = 'table-row'; // 예금주명 보이기
                    } else {
                        bankRow.style.display = 'none'; // 은행 선택 숨기기
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
    
            // 전체 동의 체크박스 및 선택된 결제 방법, 은행 선택, 예금주명 및 전화번호 요소 선택
            const checkAll = document.getElementById('checkAll');
            const paymentMethod = document.querySelector('input[name="flexRadioDefault"]:checked');
            const bankSelect = document.getElementById('bankSelect'); // 수정: 은행 선택
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
    </script>
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>
<div class="container">
	<form>
		<!-- (1) + (2) 전체묶음 -->
        <div class="container" style="display:flex; gap:10px;">
        	<!-- 1 + 2 -->
            <div class="container" style="display:flex-direction:row; gap:20px; margin-top:10px;">
            	<!-- 1) 결제 상품 정보 -->
                <div class="card" style="width:50rem; padding:10px 0px 0px 20px; margin-top:10px;">
                    <table class="table table-borderless" style="border:0;">
                        <thead>
                            <tr>
                                <th style="border:0;" colspan="2">결제 상품 정보</th>
                            </tr>
                        </thead>         
                        <tbody>
                            <tr>
                                <th rowspan="4" style="border:0;">
                                    <img src="/resources/images/${buy.fileTitle}.jpg" style="width:21rem;">
                                </th>
                            </tr>
                            <tr>
                                <td class="game-title" style="padding-right:200px; vertical-align : middle;">게임명 : ${buy.fileTitle}</td>
                            </tr>
                            <tr>
                                <td align="left" style="vertical-align : middle;">구매수량 : 1개</td>
                            </tr>
                            <tr>
                                <td align="left" style="vertical-align : middle;">상품가격 : ${buy.price}원</td>
                            </tr>
                        </tbody>
                    </table>
                </div>  <!-- 1) 닫는 태그 -->
			</div>  <!-- 1 닫는태그 -->

			<!-- 2 + 3 + 4 + 5 -->
            <div class="container" style="display:flex-direction:row; gap:20px; margin-top:10px;">
				<!-- 2) 주문자 정보 -->
                <div class="card" style="width:25rem; padding:20px 0px 0px 20px; margin-top:10px;">
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
                </div>  <!-- 2) 닫는 태그 -->

				<!-- 3) 결제 방식 -->
                <div class="card" style="width:25rem; padding:20px 25px 0px 25px; margin-top:10px;">
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
                            <tr id="bankSelectRow" style="display:none;">
                                <td colspan="2">
                                    <select id="bankSelect" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                        <option selected>은행 선택</option>
                                        <option value="1">KB국민은행</option>
                                        <option value="2">농협은행</option>
                                        <option value="3">하나은행</option>
                                        <option value="4">IBK기업은행</option>
                                        <option value="5">카카오뱅크</option>
                                    </select>
                                </td>
                            </tr>
                            <tr id="depositorRow" style="display:none;">
                                <th colspan="2">
                                    <input type="text" class="form-control" id="floatingInput"
                                           placeholder="예금주명">
                                </th>
                            </tr>
                            <tr>
                                <th colspan="2" style="color:light-gray; font-size:12px;">
                                    주문 후 1시간 이내 미입금시 자동 취소됩니다.
                                </th>
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
                </div>  <!-- 3) 닫는 태그 -->

				<!-- 4) 결제 동의 -->
                <div class="card" style="width:25rem; padding:20px 30px 0px 30px; margin-top:10px; margin-bottom:10px;">
                    <div>
                        <label style="padding-bottom:10px; font-weight:bold;">
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
                </div>  <!-- 4) 닫는 태그 -->
            </div>  <!-- 2 + 3 + 4 닫는 태그 -->
        </div>  <!-- (1), (2) 닫는 태그 -->
    </form>
</div>

<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>