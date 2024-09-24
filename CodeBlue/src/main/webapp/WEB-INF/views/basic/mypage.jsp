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
       		margin: 50px 100px 100px 120px;
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
	margin: 100px 100px 0 600px;
    padding: 0px;
    background-color: #bae4ae;
    color: white;
    display: flex;
    flex-direction: column; /* 세로 방향으로 나열 */
    justify-content: center; /* 세로 중앙 정렬 */
    align-items: center; /* 수평 중앙 정렬 */
    width: 800px;
    border: 1px solid brown;
    border-radius: 5px;
    height: auto;
}

.top {
    width: 100%;
    text-align: center;
    padding: 10px;
    background-color: rgba(255, 255, 255, 0.2);
    border-bottom: 1px solid brown;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    padding :10px;
}

.bottom {
    width: 100%;
    text-align: center;
    padding: 10px;
    background-color: white;
    color: black;
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px;
    margin-top: 0; 
    padding :10px;
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
        
        .order-status {
        	margin: 80px 100px 0 600px;

        }
        .order-status .title {
			font-weight: bold;
			font-size : 18px;
        }
        
        .status-container {           
        margin-top : 20px;
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
            font-size :30px;
            font-weight: bold;

            
        }
        .status-box span {
            font-size: 15px;
            color: #666;
        }

        .next {
        font-size : 50px;
        color : #BDBDBD;
        }
        
        .interest{
        	font-weight: bold;
       		margin-top :70px;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width:800px;
   			border-bottom: 1px solid black;
        }
         .interest .inter {
            font-size: 20px;
        }
        .interest .est {
            font-size: 14px;
        }
		 .circle {
		 	margin: 100px 100px 0 320px;
            width: 150px;
		    height: 150px;
		    border: 2px solid black;
		    border-radius: 50%;
		    display: flex;
		    justify-content: center;
		    align-items: center;

        }
        .exclamation {
            font-size: 48px;
            align-items: center;

            }
            
        .text {
            font-size: 20px;
            float:center;
            margin: 43px 100px 100px 300px;
        }       
        
        .underline {
         width:800px;
   		border-bottom: 1px solid black;
   		margin-bottom:100px;
        }
       

    </style>
</head>
<body>
<%--    머리말 --%>
<jsp:include page="/common/header.jsp" />

	 <div class="left-align">
        <h2 class="fw-semibold"> 마이페이지 </h2>
        </br>
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
            <img src="${pageContext.request.contextPath}/resources/images/qfqf.jpg" alt="| " style="border-radius: 50%; width: 40px; height: 40px;">
            <span class="fw-bold">[Family] 회원 ㅇ3ㅇ님 반갑습니다.</span>
        </div>
       <div class="bottom">
	    <span>포인트 &nbsp;  <strong class="custom-success"> &nbsp; 0 &nbsp;  </strong> P &nbsp; &nbsp;</span>
	    <span>쿠폰  &nbsp; <strong class="custom-success"> &nbsp; 0 &nbsp; </strong> 개 &nbsp; &nbsp;</span>
	    <span>예치금 &nbsp;  <strong class="custom-success"> &nbsp; 0  &nbsp;</strong> 원</span>
	  </div>
    </div>

    <!-- 주문/배송 조회 -->
    <div class="order-status">
        <div class="title">주문/배송 조회</div>
        <div class="status-container">
            <div class="status-box">
                <h3>0</h3>
                <span>주문접수</span>
            </div>
            <div>
                <p class="next">></p>
            </div>
            <div class="status-box">
                <h3>0</h3>
                <span>결제완료</span>
            </div>
            <div>
                <p class="next">></p>
            </div>
            <div class="status-box">
                <h3>0</h3>
                <span>배송준비중</span>
            </div>
             <div>
                <p class="next">></p>
             </div>
            <div class="status-box">
                <h3>0</h3>
                <span>배송중</span>
            </div>
            <div>
                <p class="next">></p>
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
   		<div class="underline"></div>
    </div>
  


    </div>
<jsp:include page="/common/footer.jsp" />
</body>
</html>
