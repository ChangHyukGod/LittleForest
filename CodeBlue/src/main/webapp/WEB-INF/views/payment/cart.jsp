<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>

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
	
//	장바구니 구매하기 버튼 -> cart_pay_page 페이지 이동
	function fn_buy2() {
	   document.listForm.action = "/main/buy2";
	   document.listForm.submit();
	}
	
//	쇼핑 계속하기 버튼 -> home 페이지 이동
	function fn_home() {
	   document.listForm.action = "/";
	   document.listForm.submit();
	}
	
</script>

</head>
<body>

<jsp:include page="/common/header.jsp"></jsp:include>
<div class="container">
<form action="listForm" name="listForm" method="get">

<input type="hidden" name="uuid" value="${cart.uuid}">

<div><h2 style="margin-top: 20px;">장바구니</h2></div>
<label><input type="checkbox" id="checkAll"> 전체선택</label>

<!-- 전체박스 가로정렬 -->
<div style="display: flex; gap:30px;">
<!-- (1) 우측 박스 -->
<div style="display: flex-direction:row;">
	<!-- 1) 상품 목록 카드 -->
	<div class="card" style="width:50rem; padding:10px 0px 0px 20px; margin-top:10px;">
	<label><input type="checkbox" class="checkItem"></label>
		<table class="table table-borderless" style="vertical-align : middle;">
	      <tbody>
	         <tr>
	            <th rowspan="3" style="border:0;">
	               <img src="<c:out value="${cart.fileUrl}"/>" style="width:20rem;">
	            </th>
	         </tr>
	         <tr>
	            <td style="font-size:18px; padding-right:250px;">상품명 : ${cart.fileTitle}</td>
	         </tr>
	         <tr>
	            <td style="font-size:18px; padding-right:250px;">상품 가격 : ${cart.price} 원</td>
	         </tr>
	      </tbody>
	   </table>
	</div>

	<!-- 2) 버튼 -->
	<div style="display:flex; gap:20px; margin-top:10px; margin-bottom:10px;">
		<button type="button" class="btn btn-light">모든 상품 제거</button>
		<button type="button" class="btn btn-light">선택 상품 제거</button>
	</div>
</div> <!-- 상품목록 + 버튼 닫는태그 -->

<!-- (2) 좌측 박스 -->
<div style="display: flex-direction:row;">
	<!-- 3) 결제 예상 금액 -->
	<div class="card" style="width:15rem; padding:20px 0px 0px 20px; margin-top:10px;">
		<div><h5>결제 예상 금액</h5></div>
		<div style="display: flex-direction:row;">
			<h5 style="text-size:16px;">\16,000원</h5>
		</div>
	</div>
	<!-- 4) 버튼 -->
		<div style="display:float-right; gap:10px; margin-top:10px; margin-bottom:10px;">
			<button type="button" class="btn btn-primary" onclick="fn_buy2()">구매하기</button>
			<button type="button" class="btn btn-success" onclick="fn_home()">쇼핑 계속하기</button>
		</div>
</div>  <!-- 결제예상금액 + 버튼 -->

</div>  <!-- 전체박스 가로정렬 -->

</form>
</div>
<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>