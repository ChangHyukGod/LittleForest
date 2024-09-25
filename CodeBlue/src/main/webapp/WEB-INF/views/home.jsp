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
          width: auto; /* 너비는 자동으로 설정 */
          margin: auto; /* 중앙 정렬 */
          display: block; /* 블록 요소로 설정 */
      }
      
      .carousel-control-prev-icon,
      .carousel-control-next-icon {
          background-color: rgba(0, 0, 0, 0.5); /* 배경색 추가 (선택사항) */
          border-radius: 50%; /* 둥글게 설정 (선택사항) */
          height: 40px; /* 높이 조정 */
          width: 40px; /* 너비 조정 */
      }
      
   
            
    </style>
    
    <script type="text/javascript" defer="defer">
        function fn_select(uuid) {
            document.listForm.uuid.value = uuid;
            document.listForm.action = "/main/edition";
            document.listForm.submit();
        }

        function fn_buy(uuid) {
            document.listForm.uuid.value = uuid;
            document.listForm.action = "/main/buy";
            document.listForm.submit();
         }
        
        function fn_genre_ALL() {
            // 현재 스크롤 위치를 세션 스토리지에 저장
            sessionStorage.setItem("scrollPosition", window.scrollY);

            document.listForm.searchKeyword.value = ""; 
            document.listForm.action = "/";
            document.listForm.submit();
        }
        
        function fn_genre_RPG() {
            sessionStorage.setItem("scrollPosition", window.scrollY);
           
           document.listForm.searchKeyword.value = "RPG"; // 검색어를 비워 전체 목록을 요청함
         document.listForm.action = "/";
         document.listForm.submit(); // 서버로 전송
      }
        
        function fn_genre_INDY() {
           sessionStorage.setItem("scrollPosition", window.scrollY);
           
           document.listForm.searchKeyword.value = "INDY"; // 검색어를 비워 전체 목록을 요청함
         document.listForm.action = "/";
         document.listForm.submit(); // 서버로 전송
      }
        
        function fn_genre_SHOOTING() {
           sessionStorage.setItem("scrollPosition", window.scrollY);
           
           document.listForm.searchKeyword.value = "SHOOTING"; // 검색어를 비워 전체 목록을 요청함
         document.listForm.action = "/";
         document.listForm.submit(); // 서버로 전송
      }
        
        function fn_genre_JEONRYAK() {
           sessionStorage.setItem("scrollPosition", window.scrollY);
           
           document.listForm.searchKeyword.value = "JEONRYAK"; // 검색어를 비워 전체 목록을 요청함
         document.listForm.action = "/";
         document.listForm.submit(); // 서버로 전송
      }
        
        function fn_genre_ACTION() {
           sessionStorage.setItem("scrollPosition", window.scrollY);
           
           document.listForm.searchKeyword.value = "ACTION"; // 검색어를 비워 전체 목록을 요청함
         document.listForm.action = "/"; 
         document.listForm.submit(); // 서버로 전송
      }
        
        function fn_genre_SPORT() {
           sessionStorage.setItem("scrollPosition", window.scrollY);
           
           document.listForm.searchKeyword.value = "SPORT"; // 검색어를 비워 전체 목록을 요청함
         document.listForm.action = "/";
         document.listForm.submit(); // 서버로 전송
      }
        
        window.onload = function() {
            var scrollPosition = sessionStorage.getItem("scrollPosition");
            if (scrollPosition) {
                window.scrollTo(0, scrollPosition);
                sessionStorage.removeItem("scrollPosition"); // 한 번 스크롤한 후에는 삭제
            }
        }
    </script>
</head>
<body>
    <jsp:include page="/common/header.jsp"></jsp:include>
    
    <%-- 본문 --%>
    <div class="container">
        <form action="listForm" name="listForm" method="get">
        
         <!-- uuid전송 (절대 삭제x) -->
         <input type="hidden" name="uuid">
         <!-- searchKeyword 전송 (절대 삭제x) -->
        <input type="hidden" name="searchKeyword">
     
         <!-- 배너 -->
      <div id="carouselExampleIndicators" class="carousel slide mt-5 mb-3" data-bs-ride="true">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        
        <div class="carousel-inner" style="height: 400px;">
          <div class="carousel-item active">
            <img src="/resources/images/건담.jpg" class="d-block w-100" style="height: 100%; object-fit: contain;">
          </div>
          <div class="carousel-item">
            <img src="/resources/images/엘든링.jpg" class="d-block w-100" style="height: 100%; object-fit: contain;">
          </div>
          <div class="carousel-item">
            <img src="/resources/images/얼티밋 치킨.jpg" class="d-block w-100" style="height: 100%; object-fit: contain;">
          </div>
        </div>
        
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

      
                
        <!-- 조회 버튼 그룹 -->
         <div class="btn-group mb-3 gap-3" role="group" aria-label="Button group with links">
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
            <div class="row custom-row">
                <!-- 부트스트랩 1열: 3칸 => 열 반복 -->
                <c:forEach var="data" items="${main}">
                    <div class="col-3 custom-col">
                        <%-- 카드 --%>
                        <div class="card mb-3" style="width: 100%;"> <!-- width:100%로 변경하여 유연하게 대응 -->
                            <a href="javascript:fn_select('<c:out value="${data.uuid}"></c:out>')">
                                <img src="<c:out value="${data.fileUrl}"/>" class="card-img-top" alt="이미지" style="width:100%; height:200px;">
                            </a>
                            <div class="card-body">
                                <h5 class="card-title"><c:out value="${data.fileTitle}" /></h5>
                                <p class="card-text"><c:out value="${data.genre}" /></p>
                                <button class="btn btn-primary" type="button" onclick="fn_buy('<c:out value="${data.uuid}"></c:out>')">구매하기</button>
                                <button class="btn btn-dark" type="button">장바구니</button>
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
