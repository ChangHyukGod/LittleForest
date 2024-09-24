<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리틀포레스트 메인 홈</title>
    <style>
        /* 그리드 간격을 더욱 좁게 조정하기 위한 커스텀 클래스 */
        .custom-row {
            margin-left: -2px;
            margin-right: -2px;
        }

        .custom-col {
            padding-left: 2px;
            padding-right: 2px;
        }

        /* 카드 호버 시 효과 */
        .card:hover {
            transform: scale(1.05); /* 카드가 살짝 커지도록 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 추가 */
            transition: transform 0.2s, box-shadow 0.2s; /* 부드러운 전환 */
        }

        /* 카드 간 기본 스타일 */
        .card {
            transition: transform 0.2s, box-shadow 0.2s; /* 기본 전환 효과 */
        }

        /* 검색 버튼 간격 조정 (선택 사항) */
        .input-group .btn {
            margin-left: 5px;
        }
    </style>
    
    <script type="text/javascript" defer="defer">
        function fn_select(uuid) {
            document.listForm.uuid.value = uuid;
            document.listForm.action = "/main/edition";
            document.listForm.submit();
        }

        function fn_buy() {
            document.listForm.action = "/main/buy";
            document.listForm.submit();
        }
    </script>
</head>
<body>
    <jsp:include page="/common/header.jsp"></jsp:include>

    <%-- 본문 --%>
    <div class="container">
        <form action="listForm" name="listForm" method="get">
            <input type="hidden" name="uuid">
            <!-- 검색어 입력양식 -->
            <div class="input-group mb-3 mt-3">
                <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="제목을 입력하세요.">
                <button class="btn btn-primary" type="button">검색</button>
            </div>

            <!-- 부트스트랩 1행 -->
            <div class="row custom-row">
                <!-- 부트스트랩 1열: 3칸 => 열 반복 -->
                <c:forEach var="data" items="${main}">
                    <div class="col-3 custom-col">
                        <%-- 카드 --%>
                        <div class="card mb-3" style="width: 100%;"> <!-- width:100%로 변경하여 유연하게 대응 -->
                            <a href="javascript:fn_select('<c:out value="${data.uuid}"></c:out>')">
                                <img src="<c:out value="${data.fileUrl}"/>" class="card-img-top" alt="이미지" style="width:100%; height:200px;">
                            </a>
                            <div class="card-body">
                                <h5 class="card-title"><c:out value="${data.fileTitle}" /></h5>
                                <p class="card-text"><c:out value="${data.fileContent}" /></p>
                                <button class="btn btn-primary" type="button" onclick="fn_buy()">구매하기</button>
                                <button class="btn btn-dark" type="button">장바구니</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </form>
    </div>

    <jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>
