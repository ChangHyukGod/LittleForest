<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>로그인 페이지</title>
    <!-- 부트스트랩 CSS 링크 필요 -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* 화면 크기에 상관없이 세로 중앙 정렬 */
        .login-container {
            height: 80vh; 
            display: flex;
            justify-content: center;
            align-items: center;
        }
        

    </style>
</head>
<body>
    <jsp:include page="/common/header.jsp" />
     <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-4 col-lg-5 col-md-6">
                <div class="card mt-5">
                    <div class="card-body">
                        <h4 class="text-center mb-4 fw-bold">로그인</h4>
                        <p class="text-center"> Little Forest의 회원으로 로그인 하시면<br>다양한 서비스를 이용하실 수 있습니다.</p>
                        <!-- Login Form -->
                        <form action="/loginProcess" method="POST">
                            <div class="form-group">
                                <label for="email"></label>
								<input type="text" 
								id="username" 
								name="username" class="form-control" 
								placeholder="아이디" required>
                            </div>
                            <div class="form-group">
                                <label for="password"></label>
                                <input type="password" 
                                id="password" 
                                name="password" 
                                class="form-control" 
                                placeholder="비밀번호" required>
                            </div>
                             <div class="text-center mt-3" style="margin-bottom: 10px;">
								  <a href="findId.jsp" class="small" style="color: black;">아이디 찾기</a> |
								  <a href="findPassword.jsp" class="small" style="color: black;">비밀번호 찾기</a>
							</div>
                            <button type="submit" class="btn btn-success btn-block mb-0.7">로그인</button>
                        </form>
                        <div class="text-center">
                            <button type="submit"  
                            class="btn  btn-outline-success btn-block" 
                            onclick="location.href='/register'">회원가입</button>
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
