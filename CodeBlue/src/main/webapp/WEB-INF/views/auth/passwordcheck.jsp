<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>로그인 페이지</title>
    <!-- 부트스트랩 CSS 링크 필요 -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
    function go_register() {
        // 원하는 주소로 이동
        document.location.href = "/register"; // 변경하고자 하는 URL로 수정
    }
    </script>
    <style>

 	body {
       	 font-size: 18px; /* 기본 폰트 크기 */
  	  }

  .login-container {
	        margin-top: 100px; 
	        margin-bottom: 200px;
	    } 
	    



       .btn {
        font-size: 18px; /* 버튼 폰트 크기 */
        height : 50px;
    }
    
      .btn + .btn { 
            margin-top: 2px; /* 버튼 간의 여백 */
		}


    
    
    </style>
</head>
<body>
    <%--    머리말--%>
    <jsp:include page="/common/header.jsp" />
    
     <div class="container">
     <div class="login-container">
        <div class="row justify-content-center">
            <div class="col-xl-4 col-lg-5 col-md-6">
                 <div class="border-0">
                    <div class="card-body">
                        <h4 class=" text-center mb-6 fw-bold fs-1">비밀 번호 확인</h4>
                        <p class="text-center mt-5 mb-5">회원 정보를 수정하기 위해 비밀번호를 입력해주세요.</p>
                        
                        <!-- Login Form -->
                        <form action="/passwordChecking" method="POST">
						    <div class="form-group">
						        <label for="passwordcheck"></label>
						        <input type="password" id="password" name="password" class="form-control" placeholder="" 
						               value="" required style="height: 50px; background-color: #F6F6F6; color: #333;">
						    </div>
						    <c:if test="${not empty errorMessage}">
						        <div class="alert alert-danger" role="alert">
						            ${errorMessage}
						        </div>
						    </c:if>
						    <button type="submit" class="btn btn-success btn-block">확인</button>
						</form>
                       </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--    꼬리말--%>
    <jsp:include page="/common/footer.jsp" />

    <!-- 부트스트랩 JS 링크 필요 -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
