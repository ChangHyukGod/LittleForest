<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.List"%>
<%@ page import="com.simplecoding.repositoryexam.vo.basic.MainVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <title>장바구니</title>
    <script>
        // 장바구니에서 게임 삭제
        function confirmDelete(uuid) {
           // 사용자에게 삭제 확인 대화 상자 표시
           if (confirm("정말로 삭제하시겠습니까?")) {
               // 서버에 삭제 요청 보내기
               fetch('/main/removeFromCart', {
                   method: 'POST', // HTTP POST 메서드 사용
                   headers: {
                       'Content-Type': 'application/x-www-form-urlencoded', // 요청 데이터 형식
                   },
                   body: 'uuid=' + encodeURIComponent(uuid), // UUID를 URL 인코딩하여 전송
               })
               .then(response => response.text()) // 서버 응답을 텍스트로 변환
               .then(data => {
                   alert(data); // 서버에서 받은 메시지 알림.  장바구니에서 삭제되었습니다! or 장바구니에 해당 아이템이 없습니다.
                   window.location.href = '/main/cart'; // 장바구니 화면으로 새로고침
               })
               .catch(error => console.error('Error:', error)); // 오류 발생 시 콘솔에 출력
               return false; // 기본 폼 제출 동작 방지
           }
           return false; // 사용자가 "취소"를 선택한 경우
//            form 태그의 영향
//            전체 함수 시작 부분: function confirmDelete(uuid) { 부터 시작하여 return false;까지는 모두 이 함수가 form 태그의 onsubmit 이벤트에 의해 호출됩니다.
//            if (confirm("정말로 삭제하시겠습니까?")) {: 사용자의 확인을 요구하는 부분입니다. 이는 사용자가 폼 제출을 시도할 때 실행됩니다.
   
//            서버로 값을 전달하는 input 태그의 영향
//            fetch('/main/removeFromCart', { 부터 body: 'uuid=' + encodeURIComponent(uuid),까지:
//            이 부분은 서버에 요청을 보내는 코드로, 폼의 submit 이벤트가 발생했을 때 실행됩니다.
//            uuid는 input 태그에서 전달된 값을 가지고 있으며, encodeURIComponent(uuid)를 통해 URL 인코딩 되어 서버로 전송됩니다.

//            <요약>
//            form 태그: 사용자가 삭제 버튼을 클릭했을 때 이 함수가 호출되고, 확인 대화 상자가 표시되는 등 폼의 제출을 제어합니다.
//            input 태그: 서버로 실제로 전달되는 UUID 값을 담고 있으며, 이 값이 confirmDelete 함수의 매개변수로 사용됩니다.

//          만약, confirmDelete에서 UUID를 받지 않으면, 사용자가 확인한 후에 어떤 UUID를 삭제해야 할지 알 수 없게 됩니다.
       }
       
       // 체크박스에서 체크된 항목들의 가격을 합산하기 위한 변수
        let totalPrice = 0;

        // 체크된 항목의 가격을 합산하고 총합을 업데이트하는 함수
        function updateTotalPrice() {
            // 체크된 체크박스를 모두 선택
            const checkboxes = document.querySelectorAll('.item-checkbox:checked');
            totalPrice = 0; // 총 가격 초기화

            // 각 체크된 체크박스에 대해 반복
            checkboxes.forEach(checkbox => {
                // 체크박스가 속한 카드에서 가격 요소 찾기
                const priceElement = checkbox.closest('.card').querySelector('.item-price');
                // 가격 값을 정수로 변환하여 더함
                const price = parseInt(priceElement.dataset.price);
                totalPrice += price; // 총 가격에 더함
            });

            // 총 가격을 화면에 표시 (한글 포맷으로)
            document.getElementById('total-price').innerText = totalPrice.toLocaleString('ko-KR') + '원';
            
            // 전체 선택 체크박스의 상태 업데이트
            updateSelectAllCheckbox();
        }

        // 전체 선택 체크박스의 상태를 업데이트하는 함수
        function updateSelectAllCheckbox() {
            // 모든 체크박스 선택
            const allCheckboxes = document.querySelectorAll('.item-checkbox');
            const selectAllCheckbox = document.getElementById('select-all');
            // 모든 체크박스가 체크된 상태인지 확인
            selectAllCheckbox.checked = Array.from(allCheckboxes).every(checkbox => checkbox.checked);
        }

        // 전체 선택 체크박스의 체크 상태에 따라 개별 체크박스의 체크 상태를 토글하는 함수
        function toggleCheckboxes(checked) {
            const checkboxes = document.querySelectorAll('.item-checkbox');
            checkboxes.forEach(checkbox => {
                checkbox.checked = checked; // 전체 선택 체크박스의 상태에 따라 개별 체크박스의 상태 변경
            });
            updateTotalPrice(); // 변경 후 총 가격 업데이트
        }

        // 페이지 로드 시 초기 가격 합산 및 전체 선택 체크박스 상태 초기화
        function initializeTotalPrice() {
            const checkboxes = document.querySelectorAll('.item-checkbox');
            
            // 각 체크박스에 대해 반복
            checkboxes.forEach(checkbox => {
                // 체크된 체크박스의 가격 합산
                if (checkbox.checked) {
                    const priceElement = checkbox.closest('.card').querySelector('.item-price');
                    const price = parseInt(priceElement.dataset.price);
                    totalPrice += price; // 총 가격에 더함
                }
            });

            // 초기 총 가격을 화면에 표시
            document.getElementById('total-price').innerText = totalPrice.toLocaleString('ko-KR') + '원';

            // 전체 선택 체크박스의 상태 업데이트
            updateSelectAllCheckbox();
        }

        // 페이지 로드 시 초기 설정 실행
        window.onload = initializeTotalPrice;
        
//         <결론>
//         위의 코드들은 장바구니의 체크박스를 통해 사용자가 선택한 항목의 가격을 실시간으로 계산하고,
//         전체 선택 기능을 관리하는 데 필요한 모든 기능을 포함하고 있습니다.
//         사용자가 체크박스를 체크할 때마다 가격이 자동으로 업데이트되어, 사용자 경험을 개선합니다.

        // 체크된 것들만 결제 페이지로 전송
        function proceedToCheckout() {
           // 로그인 상태 확인
           var isLoggedIn = ${sessionScope.memberVO != null}; // 로그인 상태를 JSP에서 확인
           
           if (!isLoggedIn) {
               alert("로그인 후 결제를 진행해주세요.");
               window.location.href = '/login'; // 로그인 페이지로 리다이렉트
               return; // 함수 종료
           }
           
            // 체크된 체크박스에서 UUID 값을 추출하여 selectedItems 배열에 저장  
            const selectedItems = Array.from(document.querySelectorAll('.item-checkbox:checked')).map(checkbox => checkbox.value);
            
            
            // 선택된 아이템이 없을 경우 경고 메시지 출력 후 함수 종료
            if (selectedItems.length === 0) {
                alert("구매할 게임을 선택하세요.");
                return;
            }

            // 선택한 아이템의 UUID를 서버로 전송
            fetch('/main/cart/saveSelectedItems', {
                method: 'POST', // HTTP POST 메서드를 사용
                headers: {
                    'Content-Type': 'application/json' // 서버에 JSON 형식으로 데이터 전송
                },
                // selectedItems 배열을 JSON으로 변환하여 body에 포함
                body: JSON.stringify({ uuids: selectedItems }) // UUID 목록을 JSON으로 변환
            // JSON은 객체, 배열, 문자열 등 다양한 데이터를 표현할 수 있습니다. 따라서 복잡한 데이터를 쉽게 전송할 수 있습니다.
            // 예를 들어, 여러 개의 UUID 외에도 추가 정보를 함께 전송할 수 있습니다
                
            //  JSON.stringify({ uuids: selectedItems }): 이 부분은 객체를 JSON 문자열로 변환합니다.
            //  여기서 객체는 { uuids: selectedItems } 형태로 구성되는데, uuids라는 키에 selectedItems 배열이 값으로 할당됩니다.
            })
            // 서버 응답 처리
            .then(response => {
                // 응답이 정상적인 경우
                if (response.ok) {
                    // 결제 페이지로 이동
                    window.location.href = '/main/cart/buy'; // 결제 페이지로 이동
                } else {
                    // 응답이 정상적이지 않은 경우, 오류 메시지 표시
                    return response.text().then(text => {
                        alert('선택한 게임을 저장하는 데 실패했습니다: ' + text);
                    });
                }
            })
            // fetch 요청 중 오류 발생 시 콘솔에 오류 출력
            .catch(error => console.error('Error:', error));
      }
    </script>
</head>
<body>
    <jsp:include page="/common/header.jsp"></jsp:include>
    <div class="container">
        <div>
            <h2 style="margin-top: 20px;">${sessionScope.memberVO.membername}님의 장바구니 (현재 : ${fn:length(cartItems)}개)</h2>
        </div>
        <input type="checkbox" id="select-all" onclick="toggleCheckboxes(this.checked)" style="margin-bottom: 10px;">
        전체 선택<br>
   
        <!-- 전체박스 가로정렬 -->
        <div style="display: flex; gap: 30px;">
            <!-- (1) 우측 박스 -->
            <div style="display: flex-direction:row;">
                <c:if test="${not empty cartItems}">
                    <c:forEach var="item" items="${cartItems}">
                        <!-- 1) 상품 목록 카드 -->
                        <div class="card" style="width: 60rem; padding: 10px 0px 0px 20px; margin-top: 10px; margin-bottom: 10px;">
                            <!-- 체크박스 추가 -->
                            <div>
                                <input type="checkbox" class="item-checkbox" value="${item.uuid}" onchange="updateTotalPrice()" checked>
                        <!--  위와 같이 checked 속성이 설정되어 있다면, 페이지가 로드될 때 이 체크박스는 기본적으로 체크된 상태가 됩니다. -->
                                
                        <!-- 체크박스는 value 속성을 가질 수 있으며, 이 속성을 통해 특정 값을 서버로 전송합니다. 일반적으로 UUID와 같은 고유한 식별자를 체크박스의 value 속성에 할당합니다. -->
                        <!-- 예를 들어, 위와 같은 코드에서 각 체크박스의 value는 게임의 UUID로 설정되어 있습니다. -->
                        
                        <!-- 사용자가 체크박스를 클릭하여 상태를 변경합니다. -->
                        <!-- onchange 이벤트가 발생하고 updateTotalPrice() 함수가 호출됩니다. -->
                        <!-- updateTotalPrice() 함수가 실행되어 총 가격을 재계산하고 UI를 업데이트합니다. -->
                            </div>
                            <br>
                            <!-- 카드 안 가로정렬 -->
                            <div style="display: flex; gap: 50px; padding-bottom: 20px;">
                                <!-- 이미지 크기 -->
                                <div>
                                    <img src="/resources/images/${item.fileTitle}.jpg" alt="게임 이미지" style="width: 25rem; height: 12rem;">
                                </div>
                                <div class="card-info" style="display: flex-direction:row; gap: 5px;">
                                    <h3 style="margin-bottom:20px;">
                                        <c:out value="${item.fileTitle}" />
                                    </h3>
                                    <p>장르 : <c:out value="${item.genre}" /></p>
                                    <p class="item-price" data-price="${item.price.replaceAll('[^\\d]', '')}">가격 : ${item.price}원</p>
                                    <br />
                                    <div class="button-group" style="display: flex; gap: 20px;">
                                        <a href="/main/buy?uuid=${item.uuid}" class="btn btn-outline-primary">구매하기</a>
	                                    <form action="/main/removeFromCart" method="post" onsubmit="return confirmDelete('${item.uuid}')">
	                             <!-- onsubmit은 폼 제출 시 어떤 동작을 수행할지를 결정하며, 이 경우에는 사용자에게 삭제 확인 대화 상자를 보여주는 역할을 합니다. -->
	                                        <input type="hidden" name="uuid" value="${item.uuid}">
	                                        <button type="submit" class="btn btn-outline-danger">삭제하기</button>
	                                    </form>
                              <%-- ${item.uuid}의 두 용도 --%>
                              
                              <!-- <form> 태그에서: -->            
                                 <%-- onsubmit="return confirmDelete('${item.uuid}')"에서 사용돼요. --%>
                                 <!-- 사용자가 "삭제" 버튼을 클릭했을 때 어떤 항목을 삭제할지 확인하는 대화 상자에 필요한 정보예요. -->
                              
                              <!-- <input type="hidden">에서: -->   
                                 <%-- <input type="hidden" name="uuid" value="${item.uuid}">에서 사용돼요. --%>
                                 <!-- 이 부분은 실제로 서버에 전송되는 데이터예요. 삭제 요청을 처리하기 위해 서버가 필요한 정보입니다. -->
                              
                              <!-- 요약 -->
                              <!-- form 태그는 사용자가 삭제를 확인할 때 사용되고, -->
                              <!-- input 태그는 서버에 실제로 삭제할 항목을 알려주는 데이터예요. -->
                              <!-- 그래서 같은 UUID가 두 군데 사용되는 거예요! -->
                              
                              <%-- <input type="hidden" name="uuid" value="${item.uuid}">: 이 부분이 없으면 서버에 UUID를 전송할 수 없게 됩니다.
                              서버가 어떤 항목을 삭제해야 하는지 알 수 없으므로 삭제 작업이 실패하게 됩니다. --%>

                              <%-- onsubmit="return confirmDelete('${item.uuid}')" : 이 부분이 없으면 삭제 확인 대화 상자에서 어떤 항목을 삭제하는지 정보가 없게 되어,
                               사용자가 삭제 확인을 하더라도 실제로 어떤 항목이 삭제되는지 알 수 없게 됩니다. 이 또한 사용자의 경험을 나쁘게 만듭니다. --%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>

                <c:if test="${empty cartItems}">
                    <p>장바구니가 비어 있습니다.</p>
                </c:if>
            </div>
            <!-- (1) 우측박스 닫는태그 -->

            <!-- (2) 사이드바 -->
            <div class="sidebar" id="sidebar" style="position: fixed; top: 250px; right: 100px; width: 16rem;
            border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); padding:20px 0px 0px 20px; margin-top:10px;
            transition: transform 0.3s ease; z-index: 1000;">
                <h4 style="margin: 0 0 10px;">결제 금액</h4>
                <h5 style="margin: 0;"><span id="total-price">0원</span></h5>
                <br/>
                <div class="button-group" style="display: flex; gap: 15px; margin-bottom:20px;">
                    <button type="button" class="btn btn-outline-primary" onclick="proceedToCheckout()">구매하기</button>
                    <a href="/" class="btn btn-outline-success">홈으로 이동</a>
                </div>
            </div>  <!-- (2) 사이드바 닫는 태그 -->
        </div>
        <!-- 전체박스 가로정렬 -->
    </div>
    <jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>