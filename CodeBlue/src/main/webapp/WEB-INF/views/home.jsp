<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 페이징 처리를 위한 태그라이브러리 -->
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <jsp:include page="/common/header.jsp"></jsp:include>

   <!-- 본문 -->
   <div class="container">
      <form>

         <div class="row row-cols-md-4 g-4 mt-4 mb-4">
            <div class="col">
               <div class="card h-100">
                  <img src="resources/images/야채부락리.jpg" class="card-img-top"
                     height="200px" width="200px">
                  <div class="card-body">
                     <h5 class="card-title">게임1 이름</h5>
                     <p class="card-text">게임1 설명</p>
                  </div>

                  <div class="container mb-3">
                     <button class="btn btn-dark" type="button" onclick="">구매하기</button>
                     <button class="btn btn-primary" type="button" onclick="">장바구니</button>
                  </div>
               </div>
            </div>

            <div class="col">
               <div class="card h-100">
                  <img src="resources/images/모두의마블.jpg" class="card-img-top"
                     height="200px" width="200px">
                  <div class="card-body">
                     <h5 class="card-title">게임2 이름</h5>
                     <p class="card-text">게임2 설명</p>
                  </div>

                  <div class="container mb-3">
                     <button class="btn btn-dark" type="button" onclick="">구매하기</button>
                     <button class="btn btn-primary" type="button" onclick="">장바구니</button>
                  </div>
               </div>
            </div>

            <div class="col">
               <div class="card h-100">
                  <img src="resources/images/나 혼자만 레벨업.jpg" class="card-img-top"
                     height="200px" width="200px">
                  <div class="card-body">
                     <h5 class="card-title">게임3 이름</h5>
                     <p class="card-text">게임3 설명</p>
                  </div>

                  <div class="container mb-3">
                     <button class="btn btn-dark" type="button" onclick="">구매하기</button>
                     <button class="btn btn-primary" type="button" onclick="">장바구니</button>
                  </div>
               </div>
            </div>

            <div class="col">
               <div class="card h-100">
                  <img src="resources/images/세븐나이츠.jpg" class="card-img-top"
                     height="200px" width="200px">
                  <div class="card-body">
                     <h5 class="card-title">게임4 이름</h5>
                     <p class="card-text">게임4 설명</p>
                  </div>

                  <div class="container mb-3">
                     <button class="btn btn-dark" type="button" onclick="">구매하기</button>
                     <button class="btn btn-primary" type="button" onclick="">장바구니</button>
                  </div>
               </div>
            </div>

            <div class="col">
               <div class="card h-100">
                  <img src="resources/images/리니지.jpg" class="card-img-top"
                     height="200px" width="200px">
                  <div class="card-body">
                     <h5 class="card-title">게임5 이름</h5>
                     <p class="card-text">게임5 설명</p>
                  </div>

                  <div class="container mb-3">
                     <button class="btn btn-dark" type="button" onclick="">구매하기</button>
                     <button class="btn btn-primary" type="button" onclick="">장바구니</button>
                  </div>
               </div>
            </div>

            <div class="col">
               <div class="card h-100">
                  <img src="resources/images/일곱개.jpg" class="card-img-top"
                     height="200px" width="200px">
                  <div class="card-body">
                     <h5 class="card-title">게임6 이름</h5>
                     <p class="card-text">게임6 설명</p>
                  </div>

                  <div class="container mb-3">
                     <button class="btn btn-dark" type="button" onclick="">구매하기</button>
                     <button class="btn btn-primary" type="button" onclick="">장바구니</button>
                  </div>
               </div>
            </div>

            <div class="col">
               <div class="card h-100">
                  <img src="resources/images/바둑.jpg" class="card-img-top"
                     height="200px" width="200px">
                  <div class="card-body">
                     <h5 class="card-title">게임7 이름</h5>
                     <p class="card-text">게임7 설명</p>
                  </div>

                  <div class="container mb-3">
                     <button class="btn btn-dark" type="button" onclick="">구매하기</button>
                     <button class="btn btn-primary" type="button" onclick="">장바구니</button>
                  </div>
               </div>
            </div>

            <div class="col">
               <div class="card h-100">
                  <img src="resources/images/아스달.jpg" class="card-img-top"
                     height="200px" width="200px">
                  <div class="card-body">
                     <h5 class="card-title">게임8 이름</h5>
                     <p class="card-text">게임8 설명</p>
                  </div>

                  <div class="container mb-3">
                     <button class="btn btn-dark" type="button" onclick="">구매하기</button>
                     <button class="btn btn-primary" type="button" onclick="">장바구니</button>
                  </div>
               </div>
            </div>
      </form>
   </div>

   <!-- 게임 추천 -->
   <div class="container mb-10">
      <p style="font-weight: bold; font-size: 20px; color: blue">요즘 핫한
         추천 게임 ▼</p>

      <a href="https://yaburi.netmarble.net/main.asp"> <img
         src="resources/images/야채부락리.jpg" class="card-img-top rounded"
         style="filter: brightness(1.1) contrast(1.1); max-width: 100%; height: 400px;">
      </a>
   </div>
   
   



      <jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>