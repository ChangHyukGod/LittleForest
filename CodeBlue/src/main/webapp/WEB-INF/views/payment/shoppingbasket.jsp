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
   
    <style>
        body {
            background-color: #ffffff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
        }
        .product {
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
            display: flex;
            align-items: center;
        }
        .product:last-child {
            border-bottom: none;
        }
        .product img {
            width: 100px;
            height: auto;
            margin-right: 10px;
        }
        .details {
            flex-grow: 1;
        }
        .title {
            font-size: 18px;
            font-weight: bold;
        }
        .price {
            color: #888;
        }
        .coupon {
        	color: #888;
        }
        .order {
        	color: black;
        }
        .btn {
            background-color: #28a745; 
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        
        .btn:hover {
            background-color: #218838; /* 더 진한 초록색 */
        }
        .total {
            font-size: 20px;
            font-weight: bold;
            margin-top: 20px;
            color: black;
        }
        .summary {
            margin-top: 20px;
            border-top: 1px solid #ccc;
            padding-top: 10px;
        }
    </style>
    
<div class="container">
    <h2>장바구니</h2>
    
    <div class="product">
        <img src="https://via.placeholder.com/100" alt="게임1">
        <div class="details">
            <div class="title">게임1</div>
            <div class="price">상품 금액: ₩</div>
            <div class="discount price">할인 금액: ₩</div>
            <div class="coupon discount">쿠폰 할인: ₩</div>
            <div class="order price">주문 금액: ₩</div>
            <button class="btn">구매하기</button>
        </div>
    </div>
    
    <div class="product">
        <img src="https://via.placeholder.com/100" alt="게임2">
        <div class="details">
            <div class="title">게임2</div>
            <div class="price">상품 금액: ₩</div>
            <div class="discount price">할인 금액: ₩</div>
            <div class="coupon discount">쿠폰 할인: ₩</div>
            <div class="order price">주문 금액: ₩</div>
            <button class="btn">구매하기</button>
        </div>
    </div>

    <div class="summary">
        <div class="total price">총 상품 금액: ₩</div>
        <div class="total discount">총 할인 금액: ₩</div>
        <div class="total coupon discount">총 쿠폰 할인: ₩</div>
        <div class="total order price">총 주문 금액: ₩</div>
    </div>

    <button class="btn">2개 상품 구매하기</button>
</div>

   <jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>