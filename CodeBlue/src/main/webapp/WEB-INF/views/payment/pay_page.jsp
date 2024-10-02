<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment page</title>
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
        // 전체 동의 체크박스
        const checkAll = document.getElementById('checkAll');
        
        // 개별 동의 체크박스들
        const checkItems = document.querySelectorAll('.checkItem');
        
        // 전체 동의 체크박스 클릭 시
        checkAll.addEventListener('change', function() {
            checkItems.forEach(function(checkItem) {
                checkItem.checked = checkAll.checked;
            });
        });
        
        // 개별 체크박스 클릭 시
        checkItems.forEach(function(checkItem) {
            checkItem.addEventListener('change', function() {
                if (!checkItem.checked) {
                    checkAll.checked = false;
                } else if (Array.from(checkItems).every(item => item.checked)) {
                    checkAll.checked = true;
                }
            });
        });
    });

    // 결제하기 함수 정의
    function func_buy() {
        const checkAll = document.getElementById('checkAll');
        if (!checkAll.checked) {
            alert("전체 동의를 체크해주세요.");
        } else {
            alert("결제하시겠습니까?");
            // 추가적인 결제 로직을 여기에 작성할 수 있습니다.
        }
    }
</script>
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>
<div class="container">
<form>

<!-- (1), (2) div박스 가로정렬 -->
<div class="container" style="display:flex; gap:20px;">

<!-- (1) 메인 -->
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
               <img src="/resources/images/${buy.fileTitle}.jpg" style="width:20rem;">
            </th>
         </tr>
         <tr>
            <td class="game-title" style="padding-right:250px;">게임명 : ${buy.fileTitle}</td>
         </tr>
         <tr>
            <td style="padding-right:250px;">구매수량 : 1개</td>
         </tr>
         <tr>
            <td style="padding-right:250px;">상품가격 : ${buy.price}원</td>
         </tr>
      </tbody>
   </table>
</div>

<!-- 2) 주문자 정보 -->
<div class="card" style="width:50rem; padding:20px 0px 0px 20px; margin-top:10px;">
   <table class="table table-borderless" style="border-collapse: collapse;">
      <thead>
         <tr style="display:flex; gap:550px;">
            <th>주문자 정보</th>
            <th>
            </th>
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
</div>  <!-- 결제상품, 주문자 정보 세로정렬 -->

<!-- (2) 사이드바 -->
<div class="container" style="display:flex-direction:row; gap:20px; margin-top:10px;">
<!-- 1) 결제 정보 -->
<div class="card container" style="width:25rem; padding:20px 30px 0px 30px; margin-top:10px;">
   <table class="table table-borderless" style="border-collapse: collapse;">
      <thead>
         <tr>
            <th>결제 정보</th>
         </tr>
      </thead>         
      
      <tbody>
         <tr>
            <th style="text-align: left;">상품가격</th>
            <td style="text-align: right;">${buy.price}원</td>
         </tr>
         
         <tr style="border-top: 1px solid black;">
            <th style="text-align: left;">결제 금액</th>
            <td style="text-align: right;">${buy.price}원</td>
         </tr>
      </tbody>
   </table>
</div>

<!-- 2) 결제 방법 -->
<div class="card" style="width:25rem; padding:20px 30px 0px 30px; margin-top:10px;">
   <table class="table table-borderless" style="border-collapse: collapse;">
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

<!-- 3) 결제 동의 -->
<div class="card" style="width:25rem; padding:20px 30px 0px 30px; margin-top:10px;">
   <div>
      <label style="padding-bottom:10px;">
           <input type="checkbox" id="checkAll"> 전체 동의
       </label>
    </div>
    <!-- 개별 동의 체크박스들 -->
    <div style="padding-left:20px;">
          <label style="padding-bottom:10px;">
          <input type="checkbox" class="checkItem">구매조건 확인 및 결제진행 동의
          </label><br>
          <label style="padding-bottom:10px;">
          <input type="checkbox" class="checkItem">개인정보 이용동의
          </label><br>
    </div>
   <div class="d-grid gap-2 col-6 mx-auto" style="padding-bottom:20px;">
      <button type="button" class="btn btn-primary" onclick="func_buy()">결제하기</button>
   </div>
</div>

</div>  <!-- 사이드바 세로정렬 -->

</div>  <!-- (1), (2) div박스 가로정렬 -->

</form>
</div>

<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>
