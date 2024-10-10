<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script type="text/javascript">
   window.onload = function() {
      var userPhone = "${sessionScope.memberVO.phonenumber}"; // "010-1234-5678"

      if (userPhone) {
         // 전화번호를 '-' 기준으로 분리합니다.
         var phoneParts = userPhone.split("-");

         // 각 input 필드에 값을 나누어 넣습니다.
         document.getElementById('phonePart2').value = phoneParts[1]; // phonePart2는 중간 부분
         document.getElementById('phonePart3').value = phoneParts[2]; // phonePart3는 마지막 부분
      }
   };
   function goHome() {
      window.location.href = "/"; // 로고 클릭시 홈화면으로 페이지를 새로 고침
   }
   function fn_save() {
      //      1) action 속성 : "/basic/dept/edit"
      document.detailForm.action = "/infofix";
      //      2) submit() 실행
      document.detailForm.submit();
   }
</script>
<style>
<
style>body {
   font-size: 12px !important;
   display: flex;
   flex-direction: column;
   justify-content: center;
   align-items: center;
   height: 100vh;
   margin: 0;
}

.main-content {
   flex-grow: 1;
   display: flex;
   flex-direction: column;
   align-items: center;
   margin-left: -80px;
   padding-left: 100px;
}

.left-align {
   position: fixed;
   top: 120px;
   left: 20px;
   z-index: 100;
   padding: 50px;
   width: 100%;
   max-width: 300px;
   align-self: flex-start;
}

.left-align h4 {
   margin-top: 50px;
   margin-bottom: 20px;
}

.left-align p {
   margin-bottom: 10px;
}

.left-align-button {
   background-color: #4CAF50;
   border: none;
   text-align: center;
   text-decoration: none; /
   display: block;
   margin: 5px 0;
   cursor: pointer;
   transition: background-color 0.3s;
   margin-left: -12px;
   outline: none;
   box-shadow: none;
}

.left-align-button:focus {
   outline: none;
   box-shadow: none;
}

.left-align-button:active {
   outline: none;
   box-shadow: none;
}

.left-align-button:hover {
   background-color: #45a049;
   color: yellow;
   outline: none;
}

.card-body {
   width: 800px;
   padding: 10px; /* 내부 여백 조정 */
   margin: 0;
}

.title {
   font-size: 25px;
   font-weight: bold;
   margin-top: 30px;
   margin-bottom: 10px; /* 여백 조정 */
}

.underline {
   border: 1px solid black;
   width: 100%;
   margin: 10px 0; /* 여백 조정 */
}

.header {
   margin: 50px 0; /* 좌우 마진을 auto로 설정하여 중앙 정렬 */
   padding: 0;
   background-color: #bae4ae;
   color: white;
   display: flex;
   flex-direction: column;
   justify-content: center;
   align-items: center;
   width: 800px;
   border: 1px solid brown;
   border-radius: 5px;
}

.top {
   width: 100%;
   text-align: center;
   padding: 10px;
   background-color: rgba(255, 255, 255, 0.2);
   border-bottom: 1px solid brown;
   border-top-left-radius: 5px;
   border-top-right-radius: 5px;
}

.bottom {
   width: 100%;
   text-align: center;
   padding: 10px;
   background-color: white;
   color: black;
   border-bottom-left-radius: 5px;
   border-bottom-right-radius: 5px;
}

.header .welcome {
   font-size: 20px;
}

.header .info {
   font-size: 18px;
}

.header .info span {
   margin-left: 24px;
}

.custom-success {
   color: #bae4ae;
}

.form-check {
   margin-bottom: 15px;
}

.basic {
   margin-top: 10px;
   display: flex;
   justify-content: space-between;
   align-items: center;
   width: 100%;
}

.ba {
   font-weight: bold;
}

.sic {
   font-size: 12px;
}

.form-group {
   /* 여백 조정 */
   width: 100%;
}

.form-control {
   height: 30px;
   width: 100%;
   max-width: 200px;
}

.input-label {
   color: black;
   margin-top: 10px;
   width: 150px;
   white-space: nowrap;
}
</style>
</head>
<body>
   <jsp:include page="/common/header.jsp" />
   <div class="container">
<!--       <div class="left-align">
         <h4 class="fw-medium">마이쇼핑</h4>

         <button class="btn left-align-button" onclick="location.href='/main/cart';">장바구니</button>
         <h4 class="fw-medium">고객센터</h4>
         <button class="btn left-align-button" onclick="location.href='/faq';">FAQ</button>
         <br>
      </div>
 -->

      <div class="main-content">
         <p class="title">회원 정보 수정</p>
         <!-- 상단 사용자 정보 -->
         <div class="header">
            <div class="top">
               <img src="${pageContext.request.contextPath}/resources/images/qfqf.jpg" alt="| " style="border-radius: 50%; width: 40px; height: 40px;"> <span class="fw-bold">${sessionScope.memberVO.membername}님 반갑습니다.</span>
            </div>
            <div class="bottom">
               <span>포인트 &nbsp; <strong class="custom-success">&nbsp; 0 &nbsp;</strong> P &nbsp; &nbsp;
               </span> <span>쿠폰 &nbsp; <strong class="custom-success">&nbsp; 0 &nbsp;</strong> 개 &nbsp; &nbsp;
               </span>
               <!--            <span>예치금 &nbsp; <strong class="custom-success">&nbsp; 0 &nbsp;</strong> 원</span> -->
            </div>
         </div>
         <br>
         <div class="card-body">
            <!-- 회원 인증 -->
            <p>
               <b>회원 인증</b>
            </p>
            <hr class="underline">
            <form id="detailForm" name="detailForm" method="POST">
               <div class="flex-grow-3" style="display: flex; align-items: center; margin-bottom: 15px; margin-top: 10px;">
                  <p style="color: black; margin: 0; width: 150px;">인증여부</p>
                  <div style="margin-left: 10px;">
                     <b>인증됨</b> <br>
                     <div style="display: inline-flex; gap: 50px; align-items: center; margin-top: 7px;">
                        <div>
                           <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked> <label class="form-check-label" for="flexRadioDefault1">이메일 인증</label>
                        </div>
                        <div>
                           <input class="form-check-input" type="radio" name="flexRadioDisabled" id="flexRadioDisabled" disabled> <label class="form-check-label" for="phoneAuth">휴대폰 인증</label>
                        </div>
                     </div>
                  </div>
               </div>

               <hr style="border: 1px solid #BDBDBD; width: 100%; margin-top: 2px; margin-bottom: 55px;">

               <!-- 기본 정보 -->
               <div class="basic">
                  <div class="ba">
                     <span>기본정보</span>
                  </div>

                  <div class="sic">
                     <span><b class="text-danger"> *</b>필수입력사항</span>
                  </div>
               </div>

               <hr class="underline">
               <!-- 아이디 -->
               <div class="form-group" style="margin: -20px 0 10px 0;">
                  <label for="username"></label>
                  <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;">
                     <p class="input-label" style="margin: 0;">
                        아이디<b class="text-danger"> *</b>
                     </p>
                     <div style="margin-left: 10px; display: flex; align-items: center;">
                        <input class="form-control" id="username" name="username" type="text" value="<c:out value="${sessionScope.memberVO.username}"/>" aria-label="readonly input example" readonly>
                        <p style="margin: 0 0 0 15px; font-size: 12px; white-space: nowrap;">(영문소문자/숫자, 4~16자)</p>
                     </div>
                  </div>
               </div>

               <!-- 실선 추가 -->
               <hr style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 0 0;">

               <!-- 비밀번호 -->
               <div class="form-group" style="margin: -10px 0 10px 0;">
                  <label for="password"></label>
                  <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;">
                     <p class="input-label" style="margin: 0;">
                        비밀번호<b class="text-danger"> *</b>
                     </p>
                     <div style="margin-left: 10px; display: flex; align-items: center;">
                        <input type="password" id="password" name="password" class="form-control" placeholder="" required style="background-color: #F6F6F6; color: #333;" value="">
                        <p style="margin: 0 0 0 15px; font-size: 12px; white-space: nowrap;">(8~16자의 영문 대/소문자, 숫자, 특수문자)</p>
                     </div>
                  </div>
               </div>
               <!-- 실선 추가 -->
               <hr style="border: 1px solid #BDBDBD; width: 100%; margin: 0;">

               <!-- 비밀번호 확인 -->
               <div class="form-group" style="margin: -10px 0 10px 0;">
                  <label for="passwordConfirm"></label>
                  <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;">
                     <p class="input-label" style="margin: 0;">
                        비밀번호 확인<b class="text-danger"> *</b>
                     </p>
                     <div style="margin-left: 10px; display: flex; align-items: center;">
                        <input type="password" id="passwordConfirm" name="passwordConfirm" class="form-control" placeholder="" required style="background-color: #F6F6F6; color: #333;">
                     </div>
                  </div>
               </div>
               <!-- 실선 추가 -->
               <hr style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 0 0;">

               <!-- 이름 -->
               <div class="form-group" style="margin: -10px 0 10px 0;">
                  <label for="membername"></label>
                  <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;">
                     <p class="input-label" style="margin: 0;">
                        이름<b class="text-danger"> *</b>
                     </p>
                     <div style="margin-left: 10px; display: flex; align-items: center;">
                        <input class="form-control" id="membername" name="membername" type="text" value="${sessionScope.memberVO.membername}" aria-label="readonly input example" readonly>
                     </div>
                  </div>
               </div>
               <!-- 실선 추가 -->
               <hr style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 0 0;">
               <!-- 나이 -->
               <div class="form-group" style="margin: -10px 0 10px 0;">
                  <label for="age"></label>
                  <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;">
                     <p class="input-label" style="margin: 0;">
                        나이<b class="text-danger"> *</b>
                     </p>
                     <div style="margin-left: 10px; display: flex; align-items: center;">
                        <input class="form-control" id="age" name="age" type="text" value="${sessionScope.memberVO.age}" aria-label="readonly input example" readonly>
                     </div>
                  </div>
               </div>
               <!-- 실선 추가 -->
               <hr style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 0 0;">

               <!-- 휴대전화 -->
               <div class="form-group" style="margin: -10px 0 10px 0;">
                  <label for="phone"></label>
                  <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;">
                     <p class="input-label" style="margin: 0;">휴대전화 (선택)</p>
                     <div style="margin-left: 10px; display: flex; align-items: center;">
                        <select class="form-select form-select-sm" id="phonePart1" name="phonePart1" aria-label="번호 선택" style="width: 100px; margin-right: 5px; margin: 0;">
                           <option value="010" selected>010</option>
                           <option value="011">011</option>
                           <option value="016">016</option>
                           <option value="017">017</option>
                           <option value="018">018</option>
                           <option value="019">019</option>
                        </select> <span style="margin: 0 5px;">-</span> <input class="form-control form-control-sm" id="phonePart2" name="phonePart2" type="text" aria-label="번호 입력" style="width: 100px; margin: 0;" maxlength="4" value=""> <span style="margin: 0 5px;">-</span> <input class="form-control form-control-sm" id="phonePart3" name="phonePart3" type="text" aria-label="번호 입력" style="width: 100px; margin: 0;" maxlength="4" value="">
                     </div>
                  </div>
               </div>
               <!-- 실선 추가 -->
               <hr style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 0 0;">
               <div class="flex-grow-3" style="display: flex; align-items: center; margin-bottom: 15px; margin-top: 10px;">
                  <p style="color: black; margin: 0; width: 150px;">
                     SMS 수신여부<b class="text-danger"> *</b>
                  </p>
                  <div style="margin-left: 10px; display: flex; align-items: center;">
                     <div style="margin-right: 20px;">
                        <input class="form-check-input" type="radio" name="authType1" id="emailAuth1" checked> <label class="form-check-label" for="emailAuth">수신함</label>
                     </div>
                     <div>
                        <input class="form-check-input" type="radio" name="authType1" id="phoneAuth1"> <label class="form-check-label" for="phoneAuth">수신안함</label>
                     </div>
                  </div>
               </div>
               <!-- 실선 추가 -->
               <hr style="border: 1px solid #BDBDBD; width: 100%; margin: 0;">


               <!-- 이메일 -->
               <div class="form-group" style="margin: -10px 0 10px 0;">
                  <label for="email"></label>
                  <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;">
                     <p class="input-label" style="margin: 0;">
                        이메일<b class="text-danger"> *</b>
                     </p>
                     <div style="margin-left: 10px; display: flex; align-items: center;">
                        <input class="form-control" type="text" value="${sessionScope.memberVO.email}" aria-label="readonly input example" readonly>
                     </div>
                  </div>
               </div>
               <!-- 실선 추가 -->
               <hr style="border: 1px solid #BDBDBD; width: 100%; margin: 0;">



               <!--    <div class="flex-grow-3" style="display: flex; align-items: center; margin-bottom: 15px; margin-top:10px;"> -->
               <!--        <p style="color: black; margin: 0; width: 150px;">SMS 수신여부<b class="text-danger"> *</b></p> -->
               <!--        <div style="margin-left: 10px; display: flex; align-items: center;"> -->
               <!--            <div style="margin-right: 20px;"> -->
               <!--                <input class="form-check-input" type="radio" name="authType2" id="emailAuth2"> -->
               <!--                <label class="form-check-label" for="emailAuth2">수신함</label> -->
               <!--            </div> -->
               <!--            <div> -->
               <!--                <input class="form-check-input" type="radio" name="authType2" id="phoneAuth2"> -->
               <!--                <label class="form-check-label" for="phoneAuth2">수신안함</label> -->
               <!--          </div> -->
               <!--          </div> -->
               <!--          </div> -->

               <!-- 실선 추가 -->
               <!-- <hr style="border: 1px solid #BDBDBD; width: 100%; margin: 0 0 35px 0;">  -->

               <!-- 추가정보 -->
               <!--    <div class="basic"> -->
               <!--            <div class="ba"> -->
               <!--                <span>추가정보</span> -->
               <!--            </div> -->
               <!--            </div> -->
               <!--            <hr class="underline"> -->

               <!-- <div class="flex-grow-3" style="display: flex; align-items: center; margin-bottom: 15px; margin-top:10px;"> -->
               <!--     <p style="color: black; margin: 0; width: auto; white-space: nowrap;">만 14세 이상입니다.<b class="text-danger"> *</b></p> -->
               <!--     <div style="margin-left: 10px; display: flex; align-items: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
               <!--         <input class="form-check-input" type="radio" name="memberType" id="flexRadioDefault1"> -->
               <!--         <label class="form-check-label" for="flexRadioDefault1" style="margin-left: 5px;">네</label> -->
               <!--     </div> -->
               <!-- </div> -->

               <br> <br>

               <div class="text-center">
                  <button type="submit" class="btn btn-success" style="padding: 10px 40px; font-size: 14px; width: 180px; margin-bottom: 50px; margin-right: 5px;" onclick="fn_save()">회원정보 수정</button>

                  <button type="submit" class="btn btn-outline-success" style="padding: 10px 40px; font-size: 14px; width: 180px; margin-bottom: 50px; margin-left: 5px;" onclick="goHome();">취소</button>
               </div>
            </form>
         </div>


      </div>

   </div>



   <jsp:include page="/common/footer.jsp" />
</body>
</html>
