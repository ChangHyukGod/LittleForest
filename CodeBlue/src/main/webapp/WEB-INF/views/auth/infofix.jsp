<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
            padding: 0px; /* 양옆 여백 추가 */
        }

        .left-align {
            margin: 50px 80px 100px 60px;
            text-align: left;
            padding: 50px;
            width: 300px;
            float: left;
        }
            
        .left-align h4 {
            margin-top: 50px; 
            margin-bottom: 20px; 
        }

        .left-align p { 
            margin-bottom: 10px;
        }
        
        .card-body {
            width: 800px; 
            padding: 10px; /* 내부 여백 조정 */
            margin-left:200px;
        }
            
.title {
    font-size: 25px;
    font-weight: bold;
    margin-top: 30px;
    margin-bottom: 10px; /* 여백 조정 */

    margin-left:490px;
}

     .underline {
         border: 1px solid black;
         width: 100%;
         margin: 10px 0; /* 여백 조정 */
     }

.header {
    margin: 50px 100px 20px 200px; /* 좌우 마진을 auto로 설정하여 중앙 정렬 */
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
    border-bottom: 1px solid black;
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

    <div class="left-align">
        <h4 class="fw-medium"> 마이쇼핑 </h4>
        <p class="text-success"> 주문/배송 조회 </p>
        <p> 관심상품 </p>
        <h4 class="fw-medium"> 나의 정보 </h4>
        <p> 회원정보 수정 </p>
        <h4 class="fw-medium"> 고객센터 </h4>
        <p> 공지사항 </p>
        <p> FAQ </p>
        <p> 1:1 문의 </p>
    </div> 
    
    <div style="margin-left: 350px;">
        <p class="title">회원 정보 수정</p>
    
        <!-- 상단 사용자 정보 -->
        <div class="header">
            <div class="top">
                <img src="${pageContext.request.contextPath}/resources/images/qfqf.jpg" alt="| " style="border-radius: 50%; width: 40px; height: 40px;">
                <span class="fw-bold">[Family] 회원 ${sessionScope.memberVO.membername}님 반갑습니다.</span>
            </div>
            <div class="bottom">
                <span>포인트 &nbsp; <strong class="custom-success">&nbsp; 0 &nbsp;</strong> P &nbsp; &nbsp;</span>
                <span>쿠폰 &nbsp; <strong class="custom-success">&nbsp; 0 &nbsp;</strong> 개 &nbsp; &nbsp;</span>
                <span>예치금 &nbsp; <strong class="custom-success">&nbsp; 0 &nbsp;</strong> 원</span>
            </div>
        </div>
<br>
        <div class="card-body">
            <!-- 회원 인증 -->
            <p><b>회원 인증</b></p>
            <hr class="underline">
            <form action="/register" method="POST">
                <div class="flex-grow-3" style="display: flex; align-items: center; margin-bottom: 15px; margin-top: 10px;">
                    <p style="color: black; margin: 0; width: 150px;">인증여부</p>
                    <div style="margin-left: 10px;">
                        <b>인증됨</b>
                        <br>
                        <div style="display: inline-flex; gap: 50px; align-items: center;">
                            <div>
                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                                <label class="form-check-label" for="flexRadioDefault1">이메일 인증</label>
                            </div>
                            <div>
  <input class="form-check-input" type="radio" name="flexRadioDisabled" id="flexRadioDisabled" disabled>
                                <label class="form-check-label" for="phoneAuth" >휴대폰 인증</label>
                            </div>
                        </div>
                    </div>
                </div>

                <hr style="border: 1px solid #BDBDBD; width: 100%; margin-top: 2px;">

                <!-- 기본 정보 -->
                <div class="basic" style="margin-bottom: -13px;"> 
                    <div class="ba">
                        <span>기본정보</span>
                    </div>
                    <div class="sic">
                        <span><b class="text-danger"> *</b>필수입력사항</span>
                    </div>
                </div>

              <!-- 아이디 -->
              

<div class="form-group" style="margin: -10px 0 10px 0;">  
    <label for="username"></label>
    <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;"> 
        <p class="input-label" style="margin: 0;">아이디<b class="text-danger"> *</b></p>
        <div style="margin-left: 10px; display: flex; align-items: center;">

            <input class="form-control" type="text" value="<c:out value="${sessionScope.memberVO.username}"/>" aria-label="readonly input example" readonly>
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
        <p class="input-label" style="margin: 0;">비밀번호<b class="text-danger"> *</b></p>
        <div style="margin-left: 10px; display: flex; align-items: center;">
            <input type="password" id="password" name="password" class="form-control" placeholder="" required style="background-color: #F6F6F6; color: #333;">
            <p style="margin: 0 0 0 15px; font-size: 12px; white-space: nowrap;">(8~16자의 영문 대/소문자, 숫자, 특수문자)</p>
        </div>
    </div>
</div>
<!-- 실선 추가 -->
<hr style="border: 1px solid #BDBDBD; width: 100%; margin: 0 ;"> 

<!-- 비밀번호 확인 -->
<div class="form-group" style="margin: -10px 0 10px 0;"> 
    <label for="passwordConfirm"></label>
    <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;"> 
        <p class="input-label" style="margin: 0;">비밀번호 확인<b class="text-danger"> *</b></p>
        <div style="margin-left: 10px; display: flex; align-items: center;">
            <input type="password" id="passwordConfirm" name="passwordConfirm" class="form-control" placeholder="" required style="background-color: #F6F6F6; color: #333;">
        </div>
    </div>
</div>
<!-- 실선 추가 -->
<hr style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 0 0;"> 

<!-- 이름 -->
<div class="form-group" style="margin: -10px 0 10px 0;">  
    <label for="name"></label>
    <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;"> 
        <p class="input-label" style="margin: 0;">이름<b class="text-danger"> *</b></p>
        <div style="margin-left: 10px; display: flex; align-items: center;">
           <input class="form-control" type="text" value="${sessionScope.memberVO.membername}" aria-label="readonly input example" readonly>
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
            <select class="form-select form-select-sm" aria-label="번호 선택" style="width: 100px; margin-right: 5px; margin: 0;">
                <option value="010" selected>010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
            </select>
            <span style="margin: 0 5px;">-</span>
            <input class="form-control form-control-sm" type="text" placeholder="" aria-label="번호 입력" style="width: 100px; margin: 0;">
            <span style="margin: 0 5px;">-</span>
            <input class="form-control form-control-sm" type="text" placeholder="" aria-label="번호 입력" style="width: 100px; margin: 0;">
        </div>
    </div>
</div>
<!-- 실선 추가 -->
<hr style="border: 1px solid #BDBDBD; width: 100%; margin: 10px 0 0 0;"> 


	<div class="flex-grow-3" style="display: flex; align-items: center; margin-bottom: 15px; margin-top:10px;">
	    <p style="color: black; margin: 0; width: 150px;">SMS 수신여부<b class="text-danger"> *</b></p>
	    <div style="margin-left: 10px; display: flex; align-items: center;">
	        <div style="margin-right: 20px;">
	            <input class="form-check-input" type="radio" name="authType1" id="emailAuth1">
	            <label class="form-check-label" for="emailAuth">수신함</label>
	        </div>
	        <div>
	            <input class="form-check-input" type="radio" name="authType1" id="phoneAuth1">
	            <label class="form-check-label" for="phoneAuth">수신안함</label>
			</div>
			</div>
			</div>
			<!-- 실선 추가 -->
<hr style="border: 1px solid #BDBDBD; width: 100%; margin:0;"> 


<!-- 이메일 -->
<div class="form-group" style="margin: -10px 0 10px 0;">  
    <label for="email"></label>
    <div class="flex-grow-3" style="display: flex; align-items: center; margin: 0;"> 
        <p class="input-label" style="margin: 0;">이메일<b class="text-danger"> *</b></p>
        <div style="margin-left: 10px; display: flex; align-items: center;">
            <input class="form-control" type="text" value="${sessionScope.memberVO.email}" aria-label="readonly input example" readonly>
        </div>
    </div>
</div>
<!-- 실선 추가 -->
<hr style="border: 1px solid #BDBDBD; width: 100%; margin: 0;"> 



	<div class="flex-grow-3" style="display: flex; align-items: center; margin-bottom: 15px; margin-top:10px;">
	    <p style="color: black; margin: 0; width: 150px;">SMS 수신여부<b class="text-danger"> *</b></p>
	    <div style="margin-left: 10px; display: flex; align-items: center;">
	        <div style="margin-right: 20px;">
	            <input class="form-check-input" type="radio" name="authType2" id="emailAuth2">
	            <label class="form-check-label" for="emailAuth2">수신함</label>
	        </div>
	        <div>
	            <input class="form-check-input" type="radio" name="authType2" id="phoneAuth2">
	            <label class="form-check-label" for="phoneAuth2">수신안함</label>
			</div>
			</div>
			</div>
			
			<!-- 실선 추가 -->
<hr style="border: 1px solid #BDBDBD; width: 100%; margin: 0 0 35px 0;"> 

<!-- 추가정보 -->
	<div class="basic">
	        <div class="ba">
	            <span>추가정보</span>
	        </div>
	        </div>

<div class="flex-grow-3" style="display: flex; align-items: center; margin-bottom: 15px; margin-top:10px;">
    <p style="color: black; margin: 0; width: auto; white-space: nowrap;">만 14세 이상입니다.<b class="text-danger"> *</b></p>
    <div style="margin-left: 10px; display: flex; align-items: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input class="form-check-input" type="radio" name="memberType" id="flexRadioDefault1">
        <label class="form-check-label" for="flexRadioDefault1" style="margin-left: 5px;">네</label>
    </div>
</div>
<br>
<br>

<div class="text-center">
    <button type="submit" class="btn btn-success" style="padding: 10px 40px; font-size: 14px; width: 180px; margin-bottom: 25px; margin-right:5px;">회원정보 수정</button>
    <button type="submit" class="btn btn-outline-success" style="padding: 10px 40px; font-size: 14px; width: 180px; margin-bottom: 25px; margin-left:5px;">취소</button>
</div>


	
			</form>
			</div>
			</div>


<jsp:include page="/common/footer.jsp" />
</body>
</html>