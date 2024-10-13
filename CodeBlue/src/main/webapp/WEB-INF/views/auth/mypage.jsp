<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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

.container {
	width: 90%;
	display: flex;
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
	
	.title {
	    font-size: 25px;
	    font-weight: bold;
	    margin-top: 30px;
	    margin-bottom: 10px; 
	
	
	}
	
	.header {
	    margin: 50px 0; 
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

        . .order-status {
        	margin: 100px 100px 100px 500px;

        }
        .order-status .search {
 			font-size: 18px;
            font-weight: bold;
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
        }
        .status-box span {
            font-size: 12px;
            color: #666;
        }
        .status-complete {
            color: green;
        }
        
        .interest{
       		margin-top :70px;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width:800px;
   			border-bottom: 1px solid black;
        }
         .interest .inter {
            font-size: 18px;
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

	<jsp:include page="/common/header.jsp" />
	<div class="container">
		<div class="left-align">
			<button class="btn left-align-button font-weight-bold" style="font-size: 30px;" onclick="location.href='/mypage';">마이페이지</button>
			<h4 class="fw-medium">마이쇼핑</h4>
			<button class="btn left-align-button" onclick="location.href='주문배송조회.jsp';">주문/배송 조회</button>
			<h4 class="fw-medium">나의 정보</h4>
			<button class="btn left-align-button" onclick="location.href='/infofix';">회원정보 수정</button>
			<h4 class="fw-medium">고객센터</h4>
			<button class="btn left-align-button" onclick="location.href='/faq';">FAQ</button>
			<br>
		</div>



		<div class="main-content">
			<p class="title">마이페이지</p>


			<!-- 상단 사용자 정보 -->
			<div class="header">
				<div class="top">
					<img src="${pageContext.request.contextPath}/resources/images/qfqf.jpg" alt="| " style="border-radius: 50%; width: 40px; height: 40px;"> <span class="fw-bold">[Family] 회원 ${sessionScope.memberVO.membername}님 반갑습니다.</span>
				</div>
				<div class="bottom">
					<span>포인트 &nbsp; <strong class="custom-success">&nbsp; 0 &nbsp;</strong> P &nbsp; &nbsp;
					</span> <span>쿠폰 &nbsp; <strong class="custom-success">&nbsp; 0 &nbsp;</strong> 개 &nbsp; &nbsp;
					</span> <span>예치금 &nbsp; <strong class="custom-success">&nbsp; 0 &nbsp;</strong> 원
					</span>
				</div>
			</div>
			<br>
			<!-- 주문/배송 조회 -->
			<div class="order-status">
				<div class="search">주문/배송 조회</div>
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
				<div class="underline"></div>
			</div>
		</div>
	</div>

	<jsp:include page="/common/footer.jsp" />
</body>
</html>
