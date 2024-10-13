<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
   <title>gameinfo</title>
   <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gasoek+One&family=Jua&family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">
   <script type="text/javascript" defer="defer">
      function fn_buy(uuid, event) {
    	  event.preventDefault(); // 기본 동작 방지 => 구매하기 버튼 클릭시, 페이지 상단으로 강제이동 되는것 방지.
    	  
	   	  // 로그인 상태 확인
	      var isLoggedIn = ${sessionScope.memberVO != null}; // 로그인 상태를 JSP에서 확인
	      if (!isLoggedIn) {
	          alert("로그인 후 결제를 진행해주세요.");
	          return; // 함수 종료
	      }
        
          document.detailForm.uuid.value = uuid;
          document.detailForm.action = "/main/buy";
          document.detailForm.submit();
      }
      
     // 실시간 장바구니에 데이터 수 계산
     function updateCartCount() {
         const cartCountElement = document.getElementById('cartCount');
         const currentCount = parseInt(cartCountElement.innerText) || 0; // 현재 카운트를 가져옵니다.   
         cartCountElement.innerText = currentCount + 1; // 카운트를 1 증가시킵니다.
     }
        
    // 장바구니에 추가 => /main/addToCart
    function fn_cart(uuid, event) {
       event.preventDefault(); // 기본 동작 방지 => 장비구니에 추가 버튼 클릭시, 페이지 상단으로 강제이동 되는것 방지.
       
    	
       const xhr = new XMLHttpRequest();
       
       xhr.open("POST", "/main/addToCart", true);
       xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
       xhr.setRequestHeader("Accept-Charset", "utf-8");
   
       xhr.onload = function () {
           if (xhr.status === 200) {
               const responseMessage = xhr.responseText; // 서버에서 받은 메시지
               alert(responseMessage); // 메시지를 알림으로 표시
   
               // 장바구니 카운트 업데이트
               if (responseMessage === "장바구니에 추가되었습니다!") {
                   updateCartCount(); // (*) 카운트 실시간 업데이트
               }
           }
       };
   
       xhr.send("uuid=" + uuid);
   }
    </script>
    
        <style>
		.card-title {
	  		font-family: "Noto Sans KR", sans-serif;
	  		font-optical-sizing: auto;
	  		font-weight: <weight>;
	  		font-style: normal;
	  		font-size: 18px;
			}
		</style>

</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>

<div class="container">
  <form action="detailForm" name="detailForm" method="get">
     <!-- uuid 전송(***) -->
   <input type="hidden" name="uuid">
   
<!-- 전체 세로정렬 -->
<div class="container" style="display:flex-direction:row; gap:20px;">

<!-- (1) 게임이미지 + 정보테이블 + 버튼 -->
<div class="container" style="display:flex; gap:80px; margin-top:20px;">

<!-- 게임동영상 -->
<div style="width:800px; height:400px">
  <video class="embed-responsive" controls Autoplay>
    <source src="<c:out value="${detail.video}"/>" type="video/mp4">
  </video>
</div>

   <!-- 사이드바 1 : 이미지, 게임정보 및 장바구니, 구매하기 -->
   <div class="card" style="width:30rem;">
   <!-- 게임이미지 -->
   <img src="/resources/images/${detail.fileTitle}.jpg" class="card-img-left" style="width: auto; height: 155px;">
      <div class="card-body">
         <h5 class="card-title">${detail.fileTitle}</h5>
         <p class="card-text" style="font-weight: bold;">\ <c:out value="${detail.price}"/></p>
      </div>
      <!-- 게임정보 테이블 : 장르, 배급사, 이용등급, 출시일, => 중앙/우측 정렬 -->
      <table class="table mb-3">
    <thead style="color: ;">
        <tr>
            <th scope="col" style="width: 30%;">항목</th>
            <th scope="col">내용</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">장르</th>
            <td>${detail.genre}</td>
        </tr>
        <tr>
            <th scope="row">배급사</th>
            <td>${detail.company}</td>
        </tr>
        <tr>
            <th scope="row">이용등급</th>
            <td>${detail.rank}</td>
        </tr>
        <tr>
            <th scope="row">출시일</th>
            <td>${detail.nalzza}</td>
        </tr>
    </tbody>
</table>

      <!-- 장바구니, 구매하기 버튼 -->
        <div class="card-body" style="text-align: center; margin-top: -15px;"> <!-- 가운데 정렬을 위한 스타일 추가 -->
          <div class="d-flex justify-content-center mt-auto">
              <a href="#" class="btn btn-success btn-sm me-2" onclick="fn_buy('<c:out value="${detail.uuid}"></c:out>', event)">구매하기</a>
              <button class="btn btn-outline-dark btn-sm" onclick="fn_cart('<c:out value="${detail.uuid}"></c:out>', event)">장바구니에 추가</button>
          </div>
        </div>
   </div>
</div>


<!-- (2) 게임 소개글 + 시스템 요구사양 -->
<div class="container" style="display:flex; gap:10px; margin-top:20px;">

   <!-- 게임 소개글 : 좌측정렬 -->
   <div class="card float-left" style="width: 50rem; height: 20rem;">
     <div class="card-body" style="font-weight: bold;">
     <h3 class="card-title">게임 소개</h3>
     <br>
         ${detail.info}
     </div>
   </div>

<!-- 사이드바 2 : 시스템 요구사항, 우측정렬 -->       
   <div class="card" style="width: 30rem;">
   
   <ul class="nav nav-tabs" id="myTab" role="tablist">
     <li class="nav-item" role="presentation">
       <button class="nav-link active" id="Windows-tab" data-bs-toggle="tab" data-bs-target="#Windows-tab-pane"
       type="button" role="tab" aria-controls="Windows-tab-pane" aria-selected="true">Windows</button>
     </li>
     <li class="nav-item" role="presentation">
       <button class="nav-link" id="macOS-tab" data-bs-toggle="tab" data-bs-target="#macOS-tab-pane" 
       type="button" role="tab" aria-controls="macOS-tab-pane" aria-selected="false">macOS</button>
     </li>
   </ul>
      
      <div class="tab-content" id="myTabContent">
         <div class="tab-pane fade show active" id="Windows-tab-pane" role="tabpanel" aria-labelledby="Windows-tab" tabindex="0">
            <table class="table">            
            <tbody>
            <tr>
               <th>운영체제</th>
               <td>${detail.winOperation}</td>
            </tr>
         
            <tr>
               <th>프로세서</th>
               <td>${detail.winProcess}</td>
            </tr>
            <tr>
               <th>메모리</th>
               <td>${detail.winMemory}</td>
            </tr>
            <tr>
               <th>그래픽</th>
               <td>${detail.winGraphic}</td>
            </tr>
            <tr>
               <th>DirectX</th>
               <td>${detail.winDirectX}</td>
            </tr>
            <tr>
               <th>저장공간</th>
               <td>${detail.winStorage}</td>
            </tr>
            </tbody>
            </table>
         </div>
         
         <div class="tab-pane fade" id="macOS-tab-pane" role="tabpanel" aria-labelledby="macOS-tab" tabindex="0">
            <table class="table">            
            <tbody>
            <tr>
               <th>운영체제</th>
               <td>${detail.macOperation}</td>
            </tr>
         
            <tr>
               <th>프로세서</th>
               <td>${detail.macProcess}</td>
            </tr>
            <tr>
               <th>메모리</th>
               <td>${detail.macMemory}</td>
            </tr>
            <tr>
               <th>그래픽</th>
               <td>${detail.macGraphic}</td>
            </tr>
            <tr>
               <th>저장공간</th>
               <td>${detail.macStorage}</td>
            </tr>
            </tbody>
            </table>
         </div>
      </div>
   </div>
  </div>
  
</div>
  
</form>
</div>

<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>