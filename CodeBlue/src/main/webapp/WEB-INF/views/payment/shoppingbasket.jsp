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
            color: #000;
        }
        .container {
            margin-top: 20px;
        }
        .card {
            border: 1px solid #ccc;
        }
        .total {
            font-weight: bold;
            font-size: 1.2em;
        }
        .btn-orange {
            background-color: #ff5722;
            border: none;
            color: #fff;
        }
        .btn-orange:hover {
            background-color: #e64a19;
        }
        .summary {
            background-color: #f8f8f8;
            padding: 20px;
            border-radius: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse; 
        }
        th, td { 
            padding: 10px; 
            border: 1px solid #ccc; 
        }
        .mm {background: skyblue;}
    </style>
    
    <script>
        function toggleSelectAll(source) {
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(checkbox => {
                if (checkbox !== source) {
                    checkbox.checked = source.checked;
                }
            });
        }
    </script>
    
    
 

   <div class="container">
       <h1 class="text-center">장바구니</h1>
       <div class="card">
           <div class="card-body">
               <h5>
                   <input type="checkbox" id="select-all" onclick="toggleSelectAll(this)"> 전체 선택
               </h5>
               <table>
                   <thead>
                       <tr class="mm">
                           <th>선택</th>
                           <th>게임 이미지</th>
                           <th>게임명</th>
                           <th>가격</th>
                           <th>상품 금액</th>
                           <th>할인 금액</th>
                           <th>쿠폰 할인</th>
                           <th>주문 금액</th>
                       </tr>
                   </thead>
                   <tbody>
                       <tr>
                           <td><input type="checkbox" class="form-check-input" id="item1" checked></td>
                           <td><img src="game1.jpg" alt="게임_1 이미지" width="100"></td>
                           <td>게임명 1</td>
                           <td>₩</td>
                           <td>₩</td>
                           <td>₩</td>
                           <td>₩</td>
                           <td class="total">₩</td>
                       </tr>
                       <tr>
                           <td><input type="checkbox" class="form-check-input" id="item2"></td>
                           <td><img src="game2.jpg" alt="게임_2 이미지" width="100"></td>
                           <td>게임명 2</td>
                           <td>₩</td>
                           <td>₩</td>
                           <td>₩</td>
                           <td>₩</td>
                           <td class="total">₩</td>
                       </tr>
                   </tbody>
               </table>
               <div class="summary">
                   <p>총 상품 금액: ₩</p>
                   <p>총 할인 금액: ₩</p>
                   <p>쿠폰 할인: ₩</p>
                   <p class="total">총 주문 금액: ₩</p>
               </div>
               <div class="button-group">
                   <button class="btn btn-primary btn-block mt-2" onclick="location.href='/paymentpage'">상품 구매하기</button>
                   <button class="btn btn-secondary btn-block mt-2" onclick="location.href='/'" >쇼핑 계속하기</button>
               </div>
           </div>
       </div>
   </div>

   <jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>