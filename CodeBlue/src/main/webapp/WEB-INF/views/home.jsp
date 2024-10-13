<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리틀포레스트 메인 홈</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gasoek+One&family=Jua&family=Noto+Sans+KR:wght@900&display=swap"
	rel="stylesheet">
<style>
.card-title {
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-weight: <weight>;
	font-style: normal;
	font-size: 18px;
}

.card-text {
	color: gray;
	font-size: 14px;
}

.custom-row {
	margin-left: -2px;
	margin-right: -2px;
}

.custom-col {
	padding-left: 2px;
	padding-right: 2px;
}

/* 카드 호버 시 효과 */
.card:hover {
	transform: scale(1.05); /* 카드가 살짝 커지도록 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 추가 */
	transition: transform 0.2s, box-shadow 0.2s; /* 부드러운 전환 */
}

/* 카드 간 기본 스타일 */
.card {
	transition: transform 0.2s, box-shadow 0.2s; /* 기본 전환 효과 */
}

.btn-group .btn {
	border-radius: 50px !important; /* 둥글게 설정 */
	border: 1px solid transparent; /* 기본 외곽선 */
	transition: border-color 0.3s; /* 부드러운 전환 효과 */
}

.btn-group .btn:hover {
	background-color: rgb(65, 194, 65); /* 마우스 오버 시 외곽선 색상 변경 */
	color: white;
}

.carousel-item img {
	height: auto; /* 높이를 자동으로 설정하여 비율 유지 */
	max-height: 550px; /* 최대 높이 설정 */
	width: 1300px; /* 너비는 자동으로 설정 */
	margin: auto; /* 중앙 정렬 */
	display: block; /* 블록 요소로 설정 */
	border-radius: 20px;
}

.carousel-item img {
	filter: brightness(1.1); /* 밝기 조정 */
	filter: contrast(1.2); /* 대비 조정 */
}

body {
	overflow-y: scroll; /* 세로 스크롤 유지 */
}

.container {
	overflow: hidden; /* 내부 요소에서의 스크롤 방지 */
}

.card {
	display: flex;
	flex-direction: column;
	justify-content: space-between; /* 카드 내용이 고르게 배치되도록 설정 */
	height: 300px; /* 카드 높이를 고정합니다. */
}

/* 상단으로 이동하는 버튼 스타일 */
#scrollToTop {
	position: fixed;
	bottom: 20px;
	right: 20px;
	display: none; /* 기본적으로 숨김 */
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 50%;
	width: 40px;
	height: 40px;
	font-size: 20px;
	cursor: pointer;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

#scrollToTop:hover {
	background-color: #0056b3;
}
</style>

<script type="text/javascript" defer="defer">
	 //이미지 클릭 시 상세조회
	 function fn_select(uuid) {
	     document.listForm.uuid.value = uuid;
	     document.listForm.action = "/main/edition";
	     document.listForm.submit();
	 }
	
	 // 구매하기
	 function fn_buy(uuid) {
	     document.listForm.uuid.value = uuid;
	     document.listForm.action = "/main/buy";
	     document.listForm.submit();
	 }

 	  // 장르 선택시 스크롤 위치가 유지
      function submitForm(url, keyword) {
          const xhr = new XMLHttpRequest();
          xhr.open("GET", url + "?searchKeyword=" + keyword, true);
          xhr.onload = function () {
              if (xhr.status === 200) {
                  const tempDiv = document.createElement('div');
                  tempDiv.innerHTML = xhr.responseText;

                  // 새로운 콘텐츠만 업데이트
                  const newContent = tempDiv.querySelector('.container').innerHTML;
                  document.querySelector('.container').innerHTML = newContent;

                  // 스크롤 위치 유지
                  // 현재 스크롤 위치를 가져옵니다.
                  const currentScrollY = window.scrollY;
                  window.scrollTo(0, currentScrollY); // 원래 위치로 돌아갑니다.
              }
          };
          xhr.send();
      }
     // 장르 선택 함수
     function fn_genre_ALL() { submitForm("/", ""); }
     function fn_genre_RPG() { submitForm("/", "RPG"); }
     function fn_genre_INDY() { submitForm("/", "인디"); }
     function fn_genre_SHOOTING() { submitForm("/", "슈팅"); }
     function fn_genre_JEONRYAK() { submitForm("/", "전략"); }
     function fn_genre_ACTION() { submitForm("/", "액션"); }
     function fn_genre_SPORT() { submitForm("/", "스포츠"); }
        
     // 실시간 장바구니에 데이터 수 계산
     function updateCartCount() {
         const cartCountElement = document.getElementById('cartCount');
//   설명:
         // 이 부분에서 document.getElementById 메서드는 웹 페이지 내에서 특정 ID를 가진 요소를 선택합니다.
       	 // 여기서 cartCount는 장바구니 아이콘 옆에 표시된 카운트를 나타내는 <span> 요소의 ID입니다.
   		 // 1) 이제 cartCountElement는 id가 cartCount인 <span> 요소를 참조하게 됩니다. 그래서 이 요소의 텍스트 내용에 접근할 수 있게 되는 거죠.
         const currentCount = parseInt(cartCountElement.innerText) || 0; // 현재 카운트를 가져옵니다.
         // 2) cartCountElement.innerText를 사용하면, 현재 <span> 안에 있는 텍스트(즉, 카운트된 값)를 가져올 수 있습니다.
         cartCountElement.innerText = currentCount + 1; // 카운트를 1 증가시킵니다.
         // 3) cartCountElement.innerText = <span> 안에 있는 텍스트(즉, 카운트된 값) + 1
         
       // 처음에는 ${cartCount} 값이 <span> 안에 들어가고, 이후 JavaScript에서 이 값을 읽어와서 증가시킵니다.
       // cartCountElement.innerText를 업데이트하는 과정에서 실제 HTML의 텍스트가 바뀌게 됩니다.
       // 즉, JavaScript의 로직에 따라 카운트가 실시간으로 변경되며, 페이지를 새로 고치지 않고도 변경된 값을 화면에 표시할 수 있습니다.
       
       // 클라이언트 측의 변화는 서버의 실제 데이터와 동기화되지 않기 때문에 새로 고침 시 서버의 데이터가 우선적으로 적용됩니다.
       // 그렇기 때문에 updateCartCount 함수로 임의로 증가시켜서 나타내는 cartCount값과 페이지를 새로고침해서 나오는 정확한 데이터의 수가 일치해야함
      
       // updateCartCount()로 증가시킨 카운트는 화면에만 표시되는 값이고, 서버의 실제 데이터는 변하지 않습니다.
       // 페이지를 새로 고침하면, 클라이언트는 서버에서 현재 저장된 데이터를 다시 불러오게 되므로, 그 값이 화면에 표시됩니다.
       // 따라서, 클라이언트에서 UI를 업데이트하는 것은 사용자 경험을 개선하기 위한 방법이고, 실제 데이터는 서버에 저장된 값을 기준으로 표시되기 때문에, 새로 고침 시에는 서버의 상태가 우선적으로 반영됩니다.
      
       // updateCartCount()로 증가시킨 값은 화면에만 영향을 미치고, 서버와의 동기화가 이루어지지 않기 때문에 실제 데이터와는 따로 관리된다고 생각하시면 됩니다.
      
       // 따라서, 웹 페이지가 로드될 때마다 cartCount는 항상 현재 세션에 저장된 장바구니 아이템의 개수를 기반으로 업데이트되며, 사용자에게 정확한 정보를 제공합니다.
       // UI에서의 카운트 증가(예: updateCartCount()로 증가시킨 값)는 사용자 경험을 향상시키기 위한 임시적인 변경이며, 페이지를 새로 고침하면 항상 이 서버에서 가져온 정한 값으로 돌아갑니다.
       // cartCountElement.innerText = currentCount + 1; 에 currentCount + 2; 를 해보면 바로 알수있음.
     }
        
    // 장바구니에 추가 => /main/addToCart
    function fn_cart(uuid) {
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
	               // updateCartCount() 함수는 장바구니에 아이템이 실제로 추가된 후에 호출되어야 합니다.
	               // 서버의 응답 메시지를 통해 성공 여부를 확인하고, 그에 따라 카운트를 업데이트하는 방식으로 흐름을 개선해야 합니다.
                   updateCartButton(uuid); // 아이콘 업데이트
               }
           }
       };
   
       xhr.send("uuid=" + uuid);
		//  fn_cart 함수는 클라이언트 측에서 UUID를 서버로 보내는 역할을 하며, 서버의 addToCart 메서드는 이 UUID를 세션의 장바구니 리스트에 추가하는 역할을 합니다.
		//  따라서, 이 과정에서 세션에 UUID 값이 저장됩니다.
   }
    
 	// 페이지 스크롤에 따른 버튼 표시
    window.onscroll = function() {
       const scrollToTopButton = document.getElementById('scrollToTop');
       if (document.body.scrollTop > 100
             || document.documentElement.scrollTop > 100) {
          scrollToTopButton.style.display = "block";
       } else {
          scrollToTopButton.style.display = "none";
       }
    };

    // 버튼 클릭 시 상단으로 스크롤
    document.addEventListener('DOMContentLoaded', function() {
       document.getElementById('scrollToTop').onclick = function() {
          window.scrollTo({
             top : 0,
             behavior : 'smooth'
          });
       };
    });
	
   // 장바구니에 추가시, 장바구니 아이콘 변경: bi bi-bag-check-fill
   function updateCartButton(uuid) {
	    const buttons = document.querySelectorAll('button[onclick]');
	    buttons.forEach(button => {
	        if (button.getAttribute('onclick').includes(uuid)) {
	            button.innerHTML = '<i class="bi bi-bag-check-fill" style="position: relative; top: -10px;"></i>';
	        }
	    });
	}
    </script>
</head>
<body>
	<jsp:include page="/common/header.jsp"></jsp:include>

	<!-- 배너 -->
	<div id="carouselExampleIndicators" class="carousel slide mb-3"
		data-bs-ride="true" style="width: 100%; margin: 0 auto;">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="3" aria-label="Slide 3"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="4" aria-label="Slide 3"></button>
		</div>



		<div class="carousel-inner" style="height: 550px;">
			<div class="carousel-item active">
				<a
					href="http://localhost:8000/main/edition?uuid=fd6a6d13-5280-4d5a-9d39-8f3a33328681&searchKeyword=">
					<img src="/resources/images/star.png" class="d-block"
					alt="스타듀밸리캐러셀">
				</a>
			</div>
			<div class="carousel-item">
				<a
					href="http://localhost:8000/main/edition?uuid=e44f198b-43e1-4aaf-96d4-252eed66f266&searchKeyword=">
					<img src="/resources/images/elden.jpg" class="d-block" alt="엘든링">
				</a>
			</div>
			<div class="carousel-item">
				<a
					href="http://localhost:8000/main/edition?uuid=ae88831c-aec7-44c3-b618-b4c464d0fdc4&searchKeyword=">
					<img src="/resources/images/horse.png" class="d-block" alt="얼티밋 치킨">
				</a>
			</div>
			<div class="carousel-item">
				<a
					href="http://localhost:8000/main/edition?uuid=64d83b53-ed6b-453b-a04f-ce6ec12af3a2&searchKeyword=">
					<img src="/resources/images/party.jpeg" class="d-block"
					alt="파티애니멀즈">
				</a>
			</div>
			<div class="carousel-item">
				<a
					href="http://localhost:8000/main/edition?uuid=c5297345-c176-472c-82e8-ad30a3900879&searchKeyword=">
					<img src="/resources/images/skul.webp" class="d-block" alt="스컬">
				</a>
			</div>
		</div>
	</div>

	<%-- 본문 --%>
	<div class="container">

		<form action="listForm" name="listForm" method="get">
			<!-- uuid전송 (절대 삭제x) -->
			<input type="hidden" name="uuid">
			<!-- searchKeyword 전송 (절대 삭제x) -->
			<input type="hidden" name="searchKeyword">
			<!--  방법 1: 자바스크립트로 uuid 값을 동적으로 설정해서 보내는 방식. -->
			<!--  function fn_select(uuid) {  -->
			<!--     document.listForm.uuid.value = uuid;   -->
			<!--     document.listForm.action = "/main/edition"; -->
			<!--     document.listForm.submit(); -->
			<!--  } -->
			<!--  방법 2: 미리 HTML에서 값을 설정해 두고 폼을 전송하는 방식. -->
			<!--  <input type="hidden" name="uuid" value="data.uuid"> -->
			<!--  결론적으로, 둘 다 같은 uuid 값을 서버로 전송하지만, 설정하는 방식이 다를 뿐입니다. -->
			<!--  동적으로 uuid 값을 변경해야 하거나 사용자의 선택에 따라 달라져야 하는 경우에는 방법 1이 더 적합합니다. -->
			<!--  값이 고정적이거나 미리 서버에서 설정된 값이라면 방법 2가 간단하고 효율적일 수 있습니다. -->
			<!--  따라서 상황에 따라 다르지만, 특정한 기술적인 제약이 없다면 선호도에 따라 사용할 수 있는 경우가 많습니다. -->

			<!-- 추천/신작게임 가로정렬 -->
			<div style="display: flex; gap: 50px;">
				<!-- 좌측 : 추천게임 -->
				<div>
					<h2
						style="font-weight: bold; margin-bottom: 20px; margin-left: -13px; margin-top: 30px;">추천게임</h2>
					<!-- 카드 4개 가로정렬 -->
					<div class="row mb-3" style="display: flex; gap: 10px;">
						<!-- 카드 1 -->
						<div class="card border-0 mb-3"
							style="width: 200px; height: 250px;">
							<a
								href="http://localhost:8000/main/edition?uuid=7896c7e9-68f6-43ec-88c0-11beb418029c&searchKeyword=">
								<img src="/resources/images/Overcooked! All You Can Eat.jpg"
								class="card-img-top"
								style="height: 130px; width: 200px; margin-left: -13px;">
							</a>
							<div class="card-body">
								<h5 class="card-title">Overcooked! All You Can Eat</h5>
								<span class="badge rounded-pill text-bg-danger">Hot</span>
								<p class="card-text">협동 요리 게임</p>
							</div>
						</div>
						<!-- 카드 2 -->
						<div class="card border-0 mb-3"
							style="width: 200px; height: 250px;">
							<a
								href="http://localhost:8000/main/edition?uuid=da0e2cb4-eb9e-4e23-a199-2b9ff7a48375&searchKeyword=">
								<img src="/resources/images/이터널 리턴.jpg" class="card-img-top"
								style="height: 130px; width: 200px; margin-left: -13px;">
							</a>
							<div class="card-body">
								<h5 class="card-title">이터널 리턴</h5>
								<br /> <span class="badge rounded-pill text-bg-danger">Hot</span>
								<p class="card-text">배틀로얄 게임</p>
							</div>
						</div>
						<!-- 카드 3 -->
						<div class="card border-0 mb-3"
							style="width: 200px; height: 250px;">
							<a
								href="http://localhost:8000/main/edition?uuid=43d658dc-aa86-4abf-8652-6f33da56427c&searchKeyword=">
								<img src="/resources/images/Palworld.jpg" class="card-img-top"
								style="height: 130px; width: 200px; margin-left: -13px;">
							</a>
							<div class="card-body">
								<h5 class="card-title">팰 월드</h5>
								<br /> <span class="badge rounded-pill text-bg-danger">Hot</span>
								<p class="card-text">유사 포켓몬</p>
							</div>
						</div>
						<!-- 카드 4 -->
						<div class="card border-0 mb-3"
							style="width: 200px; height: 250px;">
							<a
								href="http://localhost:8000/main/edition?uuid=00d781b9-290a-4a76-8d25-18a1eb3fdb0a&searchKeyword=">
								<img src="/resources/images/휴먼 폴 플랫.jpg" class="card-img-top"
								style="height: 130px; width: 200px; margin-left: -13px;">
							</a>
							<div class="card-body">
								<h5 class="card-title">휴먼 폴 플랫</h5>
								<br /> <span class="badge rounded-pill text-bg-danger">Hot</span>
								<p class="card-text">협동 탈출 게임</p>
							</div>
						</div>
					</div>
					<!-- 카드 4개 가로정렬 닫는태그 -->
				</div>
				<!-- 좌측 : 추천게임 닫는 태그 -->

				<!-- 우측 : 신작게임 -->
				<div>
					<h2
						style="font-weight: bold; margin-bottom: 20px; margin-top: 30px;">신작게임</h2>
					<!-- 카드 5 -->
					<div class="card border-0 mb-3"
						style="width: 440px; height: 280px;">
						<a
							href="http://localhost:8000/main/edition?uuid=64d83b53-ed6b-453b-a04f-ce6ec12af3a2&searchKeyword=">
							<img src="/resources/images/Party Animals.jpg"
							class="card-img-top" style="height: 200px; object-fit: cover;">
						</a>
						<div class="card-body">
							<h5 class="card-title">파티 애니멀즈</h5>
							<span class="badge rounded-pill text-bg-warning">New</span>
						</div>
					</div>
				</div>
				<!-- 우측 : 신작게임 닫는 태그 -->
			</div>
			<!-- 추천/신작게임 가로정렬 닫는태그 -->

			<!-- 전체게임 -->
			<div class="text-left mt-4" style="margin-bottom: 20px">
				<h2 style="font-weight: bold;">전체게임</h2>
			</div>

			<!-- 조회 버튼 그룹 -->
			<div class="btn-group mb-3 gap-3" style="margin-bottom: 20px;"
				role="group" aria-label="Button group with links">
				<a href="#" class="btn btn-light" onclick="fn_genre_ALL()">#전체</a> <a
					href="#" class="btn btn-light" onclick="fn_genre_RPG()">#RPG</a> <a
					href="#" class="btn btn-light" onclick="fn_genre_INDY()">#인디</a> <a
					href="#" class="btn btn-light" onclick="fn_genre_SHOOTING()">#슈팅</a>
				<a href="#" class="btn btn-light" onclick="fn_genre_JEONRYAK()">#전략</a>
				<a href="#" class="btn btn-light" onclick="fn_genre_ACTION()">#액션</a>
				<a href="#" class="btn btn-light" onclick="fn_genre_SPORT()">#스포츠</a>
			</div>


			<!-- 카드 -->
			<!-- 부트스트랩 1행 -->
			<div class="row custom-row mb-3">
				<!-- 부트스트랩 1열: 3칸 => 열 반복 -->
				<c:forEach var="data" items="${main}">
					<div class="col-3 custom-col" style="padding-bottom: 50px;">
						<%-- 카드 --%>
						<div class="card border-0 mb-3" style="width: 100%;">
							<!-- width:100%로 변경하여 유연하게 대응 -->
							<a
								href="javascript:fn_select('<c:out value="${data.uuid}"></c:out>')">
								<img src="/resources/images/${data.fileTitle}.jpg"
								class="card-img-top" alt="이미지"
								style="width: 100%; height: 200px;">
							</a>
							<div class="card-body">
								<h5 class="card-title" style="font-weight: bold;">
									<c:out value="${data.fileTitle}" />
								</h5>
								<p class="card-text">
									<c:out value="${data.genre}" />
								</p>
								<div class="d-flex justify-content-between mt-auto">
									<p class="card-price" style="font-weight: bold;">
										<c:choose>
											<c:when test="${data.price == '0'}">
	                                        무료
	                                    </c:when>
											<c:otherwise>
	                                        \ <c:out value="${data.price}" />
											</c:otherwise>
										</c:choose>
									</p>
									<button class="btn border-0 btn-sm" style="font-size: 20px;"
										type="button"
										onclick="fn_cart('<c:out value="${data.uuid}"/>')">
										<c:if test="${sessionScope.cart.contains(data.uuid)}">
											<i class="bi bi-bag-check-fill"
												style="position: relative; top: -10px;"></i>
										</c:if>
										<c:if test="${!sessionScope.cart.contains(data.uuid)}">
											<i class="bi bi-cart-plus"
												style="position: relative; top: -10px;"></i>
										</c:if>
										<!-- detail_main.jsp에서 장바구니 추가를 누르면, sessionScope.cart.contains(data.uuid)}" 를 통해 -->
										<!-- 세션의 cart에 이미 uuid가 들어가 있기 때문에 -->
										<!-- detail_main.jsp에서 따로 함수를 만들지 않아도 장바구니 추가 버튼을 누르면, 홈의 아이콘 변경이 적용됨 -->
									</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</form>
	</div>

	<button id="scrollToTop" title="Top" style="background-color: green;">↑</button>
	<!-- 상단으로 이동하는 버튼 추가 -->

	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>