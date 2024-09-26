<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment page</title>
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>
<div class="container">
<form>
<!-- 결제 상품 정보 : 상품 이미지, 상품명, 수량, 가격 -->
<!-- 주문자 정보 : 성명, 전화번호, (기타) 가입 이메일 -->
<!-- 쿠폰 / 포인트 : 쿠폰적용 버튼, 쿠폰 드롭다운, 
						   쿠폰번호 입력란, 번호확인 버튼 -->
						   
<!-- 사이드바 -->
<!-- 최종 결제금액 : 상품가격, 쿠폰 할인내역, 총 결제금액 -->
<!-- 결제 방법 : 신용카드, 무통장 입금 => 탭기능(+라이오버튼 디자인), 드롭다운 메뉴
					1) 신용카드 : 은행선택, 할부선택
					2) 무통장입금 : [농협은행 : 0000-000-000 예금주명] 선택, 입금자명 입력란,
										 00일 00시까지 입금확인 시 구매확정 안내문구 -->
<!-- 구매조건 확인 및 결제진행 동의 : 체크박스 + 결제하기 버튼 -->

<!-- (1), (2) div박스 가로정렬 -->
<div class="container" style="display:flex; gap:20px;">

<!-- (1) 메인 -->
<div class="container" style="display:flex-direction:row; gap:20px; margin-top:10px;">
<!-- 1) 결제 상품 정보 -->
<div class="card" style="width:50rem; padding:10px 0px 0px 20px; margin-top:10px;">
	<table class="table table-borderless" style="border:0;">
		<thead>
			<tr>
				<!-- style="padding:위 오른쪽 아래쪽 왼쪽;" -->
				<th style="border:0;" colspan="2">결제 상품 정보</th>
			</tr>
		</thead>			
		
		<tbody>
			<tr>
				<th rowspan="4" style="border:0;">
					<img src="resources/resources/images/스타듀밸리.jpg" style="width:20rem;">
				</th>
			</tr>
			<tr>
				<td style="padding-right:250px;">스타듀밸리</td>
			</tr>
			<tr>
				<td style="padding-right:250px;">수량 : 1개</td>
			</tr>
			<tr>
				<td style="padding-right:250px;">\16,000</td>
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
				<!-- 수정버튼 클릭 시, 페이지 이동 없이 화면 안에서 수정될 수 있게 구현 -->
				<th>
					<button type="button" class="btn btn-light">수정</button>
				</th>
			</tr>
		</thead>			
		
		<tbody>
			<tr>
				<th>주문자 성명</th>
			</tr>
			<tr>
				<th>주문자 전화번호</th>
			</tr>
			<tr>
				<th>주문자 이메일 주소</th>
			</tr>
		</tbody>
	</table>
</div>

<!-- 3) 배송 정보 -->
<div class="card" style="width:50rem; padding:20px 0px 0px 20px; margin-top:10px;">
	<table class="table table-borderless" style="border-collapse: collapse;">
		<thead>
			<tr style="display:flex; gap:570px;">
				<th>배송 정보</th>
				<!-- 수정버튼 클릭 시, 페이지 이동 없이 화면 안에서 수정될 수 있게 구현 -->
				<th>
					<button type="button" class="btn btn-light">변경</button>
				</th>
			</tr>
		</thead>			
		
		<tbody>
			<tr>
				<th>주문자 성명</th>
			</tr>
			<tr>
				<th>주문자 전화번호</th>
			</tr>
			<tr>
				<th>주문자 배송지 주소</th>
			</tr>
			<tr>
				<th>주문자 (우편번호)</th>
			</tr>
			<tr><th>
				<select class="form-select form-select-sm" aria-label=".form-select-sm example">
				  <option selected>배송 메모를 선택해 주세요.</option>
				  <option value="1">현관 앞에 놔둬주세요.</option>
				  <option value="2">경비실에 맡겨주세요.</option>
				  <option value="3">택배보관함에 넣어주세요.</option>
				</select>
			</th></tr>
		</tbody>
	</table>
</div>

<!-- 4) 쿠폰/할인 정보 -->
<div class="card" style="width:50rem; padding:20px 0px 0px 20px; margin-top:10px; margin-bottom:10px;">
	<table class="table table-borderless" style="border-collapse: collapse;">
		<thead>
			<tr>
				<th>쿠폰/할인내역</th>
			</tr>
		</thead>			
		
		<tbody>
			<tr>
				<th>
					<select class="form-select form-select-sm" aria-label=".form-select-sm example">
					  <option selected>쿠폰 선택</option>
					  <option value="1">신규가입 1,500원 할인쿠폰</option>
					  <option value="2">기프티콘/상품권 할인</option>
					</select>
				</th>
				<td>
					<button type="button" class="btn btn-primary">쿠폰적용</button>
				</td>
			</tr>
			<tr>
				<th>
					<label for="floatingInput">할인 금액</label>
					<input type="email" class="form-control" id="floatingInput">
				</th>
			</tr>
		</tbody>
	</table>
</div>

</div>  <!-- 결제상품, 주문자 정보, 배송, 쿠폰 세로정렬 -->

<!-- (2) 사이드바 -->
<div class="container" style="display:flex-direction:row; gap:20px; margin-top:20px;">
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
				<td style="text-align: right;">16,000원</td>
			</tr>
			<tr>
				<th style="text-align: left;">할인금액</th>
				<td style="text-align: right;">-1,500원</td>
			</tr>
			<tr style="border-top: 1px solid black;">
				<th style="text-align: left;">총 결제 금액</th>
				<td style="text-align: right;">14,500원</td>
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
					<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
					<label class="form-check-label" for="flexRadioDefault1">무통장 입금</label>
				</th>
			</tr>
			<tr>
				<th>
					<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
					<label class="form-check-label" for="flexRadioDefault1">네이버페이</label>
				</th>
				<th>
					<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
					<label class="form-check-label" for="flexRadioDefault1">카카오페이</label>
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
	<div class="form-check">
		<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
		<label class="form-check-label" for="flexCheckDefault">전체 동의</label>
	</div>
	<div class="form-check" style="padding-left:50px;">
		<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
		<label class="form-check-label" for="flexCheckChecked">구매조건 확인 및 결제진행 동의</label>
	</div>
	<div class="form-check" style="padding-bottom:20px; padding-left:50px;">
		<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
		<label class="form-check-label" for="flexCheckChecked">개인정보 이용동의</label>
	</div>
	<div class="d-grid gap-2 col-6 mx-auto" style="padding-bottom:20px;">
		<button type="button" class="btn btn-primary">결제하기</button>
	</div>
</div>

</div>  <!-- 사이드바 세로정렬 -->

</div>  <!-- (1), (2) div박스 가로정렬 -->

</form>
</div>

<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>