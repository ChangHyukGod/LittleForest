<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<html>
<head>
   <title>gameinfo</title>
   <script type="text/javascript" defer="defer">
      function fn_buy() {
         document.detailForm.action = "/main/buy";
         
         document.detailForm.submit();
      }
   </script>
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>

<div class="container">
  <form action="detailForm" name="detailForm" method="post">

<!-- (1) 게임이미지 + 정보테이블 + 버튼 -->
<div class="container" style="display:flex; gap:80px; margin-top:20px;">

<!-- 게임동영상 -->
<div style="width:800px; height:400px">
  <video class="embed-responsive" controls>
    <source src="<c:out value="${detail.video}"/>" type="video/mp4">
  </video>
</div>

   <!-- 사이드바 1 : 이미지, 게임정보 및 장바구니, 구매하기 -->
   <div class="card" style="width:30rem;">
   <!-- 게임이미지 -->
   <img src="<c:out value="${detail.fileUrl}"/>" class="card-img-left"
   style="width: auto; height: 155px;">
      <div class="card-body">
         <h5 class="card-title">${detail.fileTitle}</h5>
         <p class="card-text">${detail.price}</p>
      </div>
      <!-- 게임정보 테이블 : 장르, 배급사, 이용등급, 출시일, => 중앙/우측 정렬 -->
      <table class="table">
        <thead>
          <tr>
            <th>장르</th>
            <td>${detail.genre}</td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th>배급사</th>
            <td>${detail.company}</td>
          </tr>
          <tr>
            <th>이용등급</th>
            <td>${detail.rank}</td>
          </tr>
          <tr>
            <th>출시일</th>
            <td>${detail.nalzza}</td>
          </tr>
        </tbody>
      </table>
      <!-- 장바구니, 구매하기 버튼 -->
      <div class="card-body" style="margin-left:150px;">
         <a href="#" class="btn btn-primary">장바구니</a>
         <a href="#" class="btn btn-success" onclick="fn_buy()">구매하기</a>
      </div>
   </div>
</div>


<!-- (2) 게임 소개글 + 시스템 요구사양 -->
<div class="container" style="display:flex; gap:10px; margin-top:20px;">

   <!-- 게임 소개글 : 좌측정렬 -->
   <div class="card float-left" style="width: 50rem; height: 20rem;">
     <div class="card-body">
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
</form>

<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>