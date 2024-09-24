<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .left-align {
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
            

     .header {
    margin-left: 30px;
    background-color: #bae4ae;
    padding: 0px;
    margin :0px;
    color: white;
    display: flex;
    flex-direction: column; /* 세로 방향으로 나열 */
    justify-content: center; /* 세로 중앙 정렬 */
    align-items: center; /* 수평 중앙 정렬 */
    margin: 100px;
    width: 800px;
    border: 2px solid brown;
    border-radius: 5px;
    height: 100px; /* 원하는 높이 설정 */
}

.top, .bottom {
    width: 100%; /* 너비를 전체로 설정 */
    text-align: center; /* 텍스트 중앙 정렬 */
}

.top {
    padding: 10px; /* 여백 추가 */
    background-color: rgba(255, 255, 255, 0.2); /* 배경색 조정 */
}

.bottom {
padding : 10px; /* 여백 추가 */
    background-color: white; /* 배경색 조정 */
    color:black;
    border-bottom:2px solid black;
       border-radius: 5px;
}


        .header .welcome {
            font-size: 18px;
        }
        .header .info {
            font-size: 14px;
        }
        .header .info span {
            margin-left: 20px;
        }
        .order-status {

        }
        .order-status .title {
            font-weight: bold;
        }
        
        .status-container {
            margin:100px;
            display: flex;
            justify-content: space-around;
            padding: 20px;
            background-color: #f4f4f4;
            border-radius: 10px;
            width:800px;
        }
        .status-box {
            text-align: center;
            width: 100px;
        }
        .status-box h3 {
            margin: 10px 0;
        }
        .status-box span {
            font-size: 12px;
            color: #666;
        }
        .status-complete {
            color: green;
        }
        
        .interest{
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-left:300px;
            width:600px;
   			border-bottom: 1px solid black;
        }
         .interest .inter {
            font-size: 18px;
        }
        .interest .est {
            font-size: 14px;
        }
		 .circle {
             width: 150px;
		    height: 150px;
		    border: 2px solid black;
		    border-radius: 50%;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    margin-left:700px;
        }
        .exclamation {
            font-size: 48px;
            align-items: center;

            }
            
        .text {
            font-size: 20px;
            float:center;
            margin-left:400px;
        }       
        

    </style>
</head>
<body>
<%--    머리말 --%>
<jsp:include page="/common/header.jsp" />

	 <div class="left-align">
        <h2 class="fw-semibold"> 마이페이지 </h2>
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
    
    <div>
    <!-- 상단 사용자 정보 -->
    <div class="header">
        <div class="top">
            <img src="${pageContext.request.contextPath}/resources/images/126748728_1.jpg" alt="| " style="border-radius: 50%; width: 40px; height: 40px;">
            <span class="fw-bold">[Family] 회원 ㅇ3ㅇ님 반갑습니다.</span>
        </div>
       <div class="bottom">
	    <span>포인트 <strong class="text-black">0</strong> P</span>
	    <span>쿠폰 <strong class="text-black">0</strong> 개</span>
	    <span>예치금 <strong class="text-black">0</strong> 원</span>
	  </div>
    </div>

    <!-- 주문/배송 조회 -->
    <div class="order-status">
        <div class="title" style="margin-left:10px;">주문/배송 조회</div>
        <div class="status-container">
            <div class="status-box">
                <h3>0</h3>
                <span>주문접수</span>
            </div>
            <div>
                <h1>></h1>
            </div>
            <div class="status-box">
                <h3>0</h3>
                <span>결제완료</span>
            </div>
            <div>
                <h1>></h1>
            </div>
            <div class="status-box">
                <h3>0</h3>
                <span>배송준비중</span>
            </div>
             <div>
                <h1>></h1>
             </div>
            <div class="status-box">
                <h3>0</h3>
                <span>배송중</span>
            </div>
            <div>
                <h1>></h1>
            </div>
            <div class="status-box">
                <h3>0</h3>
                <span>배송완료</span>
            </div>
            </div>
            
            <div class="interest">
        <div class="inter">
            <span>관심상품</span>
        </div>
        <div class="est">
            <span> 더보기 > </span>
        </div>
        </div>
        <div class="circle">
        <div class="exclamation">!</div>
        </div>
   		<div class="text">관심 상품이 없습니다.</div>
    </div>
  


    </div>
<jsp:include page="/common/footer.jsp" />
</body>
</html>
