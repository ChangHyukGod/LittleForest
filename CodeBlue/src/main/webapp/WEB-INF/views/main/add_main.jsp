<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
   <script type="text/javascript" defer="defer">
      function fn_save() {
         document.addForm.action = "/main/add";
         
            document.addForm.submit();
      }
   </script>
</head>
<body>
   <jsp:include page="/common/header.jsp" />

   <div class="container">
      <form id="addForm" name="addForm" method="post" enctype="multipart/form-data">
      
         <div class="mb-3">
               <%-- 제목 입력양식 --%>
               <label for="fileTitle" class="form-label">게임명</label>
               <input class="form-control" id="fileTitle" name="fileTitle" placeholder="제목" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="fileContent" class="form-label">게임내용</label>
               <input class="form-control" id="fileContent" name="fileContent" placeholder="내용입력" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="price" class="form-label">게임가격</label>
               <input class="form-control" id="price" name="price" placeholder="가격입력" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="genre" class="form-label">게임장르</label>
               <input class="form-control" id="genre" name="genre" placeholder="장르입력" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="company" class="form-label">게임배급사</label>
               <input class="form-control" id="company" name="company" placeholder="배급사입력" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="rank" class="form-label">게임이용가</label>
               <input class="form-control" id="rank" name="rank" placeholder="이용가입력" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="nalzza" class="form-label">출시일</label>
               <input class="form-control" id="nalzza" name="nalzza" placeholder="출시일입력" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="info" class="form-label">게임상세정보</label>
               <input class="form-control" id="info" name="info" placeholder="상세내용입력" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="video" class="form-label">동영상주소</label>
               <input class="form-control" id="video" name="video" placeholder="동영상 링크" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="winOperation" class="form-label">win 운영체제</label>
               <input class="form-control" id="winOperation" name="winOperation" placeholder="win 운영체제" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="winProcess" class="form-label">win 프로세스</label>
               <input class="form-control" id="winProcess" name="winProcess" placeholder="win 프로세스" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="winMemory" class="form-label">win 메모리</label>
               <input class="form-control" id="winMemory" name="winMemory" placeholder="win 메모리" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="winGraphic" class="form-label">win 그래픽</label>
               <input class="form-control" id="winGraphic" name="winGraphic" placeholder="win 그래픽" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="winDirectX" class="form-label">win DirectX</label>
               <input class="form-control" id="winDirectX" name="winDirectX" placeholder="win DirectX" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="winStorage" class="form-label">win 저장공간</label>
               <input class="form-control" id="winStorage" name="winStorage" placeholder="win 저장공간" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="macOperation" class="form-label">mac 운영체제</label>
               <input class="form-control" id="macOperation" name="macOperation" placeholder="mac 운영체제" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="macProcess" class="form-label">mac 프로세스</label>
               <input class="form-control" id="macProcess" name="macProcess" placeholder="mac 프로세스" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="macMemory" class="form-label">mac 메모리</label>
               <input class="form-control" id="macMemory" name="macMemory" placeholder="mac 메모리" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="macGraphic" class="form-label">mac 그래픽</label>
               <input class="form-control" id="macGraphic" name="macGraphic" placeholder="mac 그래픽" />
           </div>
           
           <div class="mb-3">
               <%-- 내용 입력양식 --%>
               <label for="macStorage" class="form-label">mac 저장공간</label>
               <input class="form-control" id="macStorage" name="macStorage" placeholder="mac 저장공간" />
           </div>
           
           
           <div class="input-group">
            <input type="file" class="form-control" id="image" name="image">
             <button class="btn btn-primary" type="button" onclick="fn_save()">저장</button>
         </div>
         
      </form>
   </div>
   
   <jsp:include page="/common/footer.jsp" />
</body>
</html>