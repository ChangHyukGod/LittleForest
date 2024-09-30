<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리틀포레스트 메인 홈</title>
    <style>
    
        /* 그리드 간격을 더욱 좁게 조정하기 위한 커스텀 클래스 */
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
        border-radius: 50px !important ; /* 둥글게 설정 */
        border: 1px solid transparent; /* 기본 외곽선 */
        transition: border-color 0.3s; /* 부드러운 전환 효과 */
       }
   
       .btn-group .btn:hover {
           border-color: black; /* 마우스 오버 시 외곽선 색상 변경 */
       }
       
       .carousel-item img {
          height: auto; /* 높이를 자동으로 설정하여 비율 유지 */
          max-height: 400px; /* 최대 높이 설정 */
          width: 100%; /* 너비는 자동으로 설정 */
          margin: auto; /* 중앙 정렬 */
          display: block; /* 블록 요소로 설정 */
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
    </style>
    
    <script type="text/javascript" defer="defer">
        // 이미지 클릭 시 상세조회
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
        // 장바구니
        function fn_cart(uuid) {
           document.listForm.uuid.value = uuid;
           document.listForm.action = "/main/cart";
           document.listForm.submit();
        }
        
        function fn_genre_ALL() {
            submitForm("/", "");
        }

        function fn_genre_RPG() {
            submitForm("/", "RPG");
        }

        function fn_genre_INDY() {
            submitForm("/", "INDY");
        }

        function fn_genre_SHOOTING() {
            submitForm("/", "SHOOTING");
        }

        function fn_genre_JEONRYAK() {
            submitForm("/", "JEONRYAK");
        }

        function fn_genre_ACTION() {
            submitForm("/", "ACTION");
        }

        function fn_genre_SPORT() {
            submitForm("/main", "SPORT");
        }

     // 페이지 로드 시 스크롤 위치 복구
        window.onload = function() {
            var scrollPosition = sessionStorage.getItem("scrollPosition");
            if (scrollPosition) {
                window.scrollTo({
                    top: scrollPosition,
                    behavior: 'smooth' // 부드러운 스크롤 이동
                });
            }
        };

        // AJAX로 폼 전송하기
        function submitForm(url, keyword) {
            // 스크롤 위치 저장
            sessionStorage.setItem("scrollPosition", window.scrollY);

            // AJAX 요청
            const xhr = new XMLHttpRequest();
            xhr.open("GET", url + "?searchKeyword=" + keyword, true);
            xhr.onload = function () {
                if (xhr.status === 200) {
                    // 서버에서 받은 HTML을 페이지에 적용
                    document.body.innerHTML = xhr.responseText;

                    // 스크롤 위치 복구
                    var scrollPosition = sessionStorage.getItem("scrollPosition");
                    if (scrollPosition) {
                        window.scrollTo({
                            top: scrollPosition,
                            behavior: 'smooth' // 부드러운 스크롤 이동
                        });
                    }
                }
            };
            xhr.send();
        }
        
        window.addEventListener('load', function() {
            if (performance.navigation.type === performance.navigation.TYPE_RELOAD) {
                // 새로고침된 경우 최상단으로 이동
                window.scrollTo(0, 0);
            }
        });
        
     // 장바구니에 추가
    function fn_cart(uuid) {
	    const xhr = new XMLHttpRequest();
	    xhr.open("POST", "/main/addToCart", true);
	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    xhr.setRequestHeader("Accept-Charset", "utf-8"); // 추가된 부분
	
	    xhr.onload = function () {
	        if (xhr.status === 200) {
	            const responseMessage = xhr.responseText; // 서버에서 받은 메시지
	            alert(responseMessage); // 메시지를 알림으로 표시
	        }
	    };
	    
	    xhr.send("uuid=" + uuid);
	}


    </script>
</head>
<body>
    <jsp:include page="/common/header.jsp"></jsp:include>
    
    
    <!-- 배너 -->
   <div id="carouselExampleIndicators" class="carousel slide mb-3" data-bs-ride="true" style="width: 100%; margin: 0 auto;">
       <div class="carousel-indicators">
           <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
           <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
           <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
           <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 3"></button>
           <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 3"></button>
       </div>
   
       <div class="carousel-inner" style="height: 400px;">
           <div class="carousel-item active">
               <img src="/resources/images/팰월드.jpg" class="d-block" alt="건담">
           </div>
           <div class="carousel-item">
               <img src="/resources/images/엘든링.jpg" class="d-block" alt="엘든링">
           </div>
           <div class="carousel-item">
               <img src="/resources/images/얼티밋 치킨.jpg" class="d-block" alt="얼티밋 치킨">
           </div><div class="carousel-item">
               <img src="/resources/images/파티애니멀.jpg" class="d-block" alt="얼티밋 치킨">
           </div>
           <div class="carousel-item">
               <img src="/resources/images/스컬.jpg" class="d-block" alt="얼티밋 치킨">
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
   <div style="display:flex; gap:50px;">
      <!-- 좌측 : 추천게임 -->
      <div>
         <h2 style="font-weight: bold; margin-bottom: 20px; margin-left: -13px;">추천게임</h2>
         <!-- 비어있는 카드 4개 추가 -->
         <div class="row mb-3" style="display:flex; gap:10px;">
             <!-- 카드 1 -->
                <div class="card mb-3" style="width: 200px; height: 250px;">
                      <img src="path/to/your/empty-image.jpg" class="card-img-top" alt="빈 이미지" style="height: 150px; object-fit: cover;">
                      <div class="card-body">
                          <h5 class="card-title">비어있는 카드 1</h5>
                          <p class="card-text">내용 없음</p>
                      </div>
                  </div>
             <!-- 카드 2 -->
                <div class="card mb-3" style="width: 200px; height: 250px;">
                    <!-- 빈 이미지 추가 -->
                    <img src="path/to/your/empty-image.jpg" class="card-img-top" alt="빈 이미지" style="height: 150px; object-fit: cover;">
                    <div class="card-body">
                        <h5 class="card-title">비어있는 카드 3</h5>
                        <p class="card-text">내용 없음</p>
                    </div>
                </div>
             <!-- 카드 3 -->
                <div class="card mb-3" style="width: 200px; height: 250px;">
                    <!-- 빈 이미지 추가 -->
                    <img src="path/to/your/empty-image.jpg" class="card-img-top" alt="빈 이미지" style="height: 150px; object-fit: cover;">
                    <div class="card-body">
                        <h5 class="card-title">비어있는 카드 3</h5>
                        <p class="card-text">내용 없음</p>
                    </div>
                </div>
             <!-- 카드 4 -->
                <div class="card mb-3" style="width: 200px; height: 250px;">
                    <!-- 빈 이미지 추가 -->
                    <img src="path/to/your/empty-image.jpg" class="card-img-top" alt="빈 이미지" style="height: 150px; object-fit: cover;">
                    <div class="card-body">
                        <h5 class="card-title">비어있는 카드 3</h5>
                        <p class="card-text">내용 없음</p>
                    </div>
                </div>
         </div>
      </div>  <!-- 좌측 : 추천게임 닫는 태그 -->

      <!-- 우측 : 신작게임 -->
      <div>
         <h2 style="font-weight: bold; margin-bottom: 20px;">신작게임</h2>
          <!-- 카드 5 -->
            <div class="card mb-3" style="width: 440px; height: 250px;">
              <!-- 빈 이미지 추가 -->
              <img src="path/to/your/empty-image.jpg" class="card-img-top" alt="빈 이미지" style="height: 150px; object-fit: cover;">
              <div class="card-body">
                  <h5 class="card-title">비어있는 카드 3</h5>
                  <p class="card-text">내용 없음</p>
              </div>
          </div>
      </div>  <!-- 우측 : 신작게임 닫는 태그 -->
   </div>  <!-- 추천/신작게임 가로정렬 닫는태그 -->
          
      <!-- 전체게임 -->
        <div class="text-left mt-4" style="margin-bottom: 20px">
            <h2 style="font-weight: bold;">전체게임</h2>
        </div> 
        
        <!-- 조회 버튼 그룹 -->
         <div class="btn-group mb-3 gap-3" style="margin-bottom: 20px;" role="group" aria-label="Button group with links">
             <a href="#" class="btn btn-light" onclick="fn_genre_ALL()">#전체</a>
             <a href="#" class="btn btn-light" onclick="fn_genre_RPG()">#RPG</a>
             <a href="#" class="btn btn-light" onclick="fn_genre_INDY()">#인디</a>
             <a href="#" class="btn btn-light" onclick="fn_genre_SHOOTING()">#슈팅</a>
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
                        <div class="card mb-3" style="width: 100%;"> <!-- width:100%로 변경하여 유연하게 대응 -->
                            <a href="javascript:fn_select('<c:out value="${data.uuid}"></c:out>')">
                                <img src="<c:out value="${data.fileUrl}"/>" class="card-img-top" alt="이미지" style="width:100%; height:200px;">
                            </a>
                            <div class="card-body">
                                <h5 class="card-title"><c:out value="${data.fileTitle}" /></h5>
                                <p class="card-text"><c:out value="${data.genre}" /></p>
                                <button class="btn btn-primary" type="button" onclick="fn_buy('<c:out value="${data.uuid}"></c:out>')">구매하기</button>
                                <button class="btn btn-dark" type="button" onclick="fn_cart('<c:out value="${data.uuid}"></c:out>')">장바구니에 추가</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </form>
    </div>
    

    
    <jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>