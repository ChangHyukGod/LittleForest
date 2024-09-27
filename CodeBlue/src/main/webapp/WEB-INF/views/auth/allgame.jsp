<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전체 게임 목록</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans', sans-serif;
            background-color: #FFFFFF;
            color: #000000;
            margin: 20px;
            padding-bottom: 100px;
        }

        #all {
            display: flex;
            flex-wrap: wrap;
            margin-top: 50px;
            border: 1px solid #dcdcdc; /* 옅은 회색 테두리 추가 */
            padding: 20px; /* 여백 추가 */
            border-radius: 20px; /* 모서리 둥글게 */
        }

        .category {
            flex: 1 1 200px;
            margin-right: 20px;
        }

        .category h2 {
            font-family: 'Roboto', sans-serif; 
            font-size: 1.5em; /* 카테고리 제목 크기 조정 */
            color: #2c3e50; /* 진한 색깔 */
            font-weight: bold; /* 진한 글꼴 */
            padding-bottom: 5px; /* 선 제거 */
        }

        .games {
            list-style-type: none;
        }

        .games li {
            font-size: 0.9em;
            padding: 10px;
            margin: 10px;
        }

        .games li a {
            text-decoration: none;
            color: #7f7f7f; /* 옅은 회색으로 변경 */
            transition: color 0.3s; /* 색상 변화에 애니메이션 추가 */
        }

        .games li a:hover {
            color: #007BFF; /* 마우스 오버 시 색상 변화 */
        }
        h2 {
        	margin-left : 30px;
        }
    </style>
</head>
<body>
<%-- 머리말 --%>
<jsp:include page="/common/header.jsp" />

    <div class="container" id="all">
        <div class="category">
            <h2>A~Z</h2>
            <ul class="games">
                <li><a href="#">FC 모바일</a></li>
                <li><a href="#">메이플스토리</a></li>
                <li><a href="#">카트라이더</a></li>
            </ul>
        </div>
        <div class="category">
            <h2>ㄱ</h2>
            <ul class="games">
                <li><a href="#">게임A</a></li>
                <li><a href="#">게임B</a></li>
                <li><a href="#">게임C</a></li>
            </ul>
        </div>
        <div class="category">
            <h2>ㄴ</h2>
            <ul class="games">
                <li><a href="#">게임D</a></li>
                <li><a href="#">게임E</a></li>
                <li><a href="#">게임F</a></li>
            </ul>
        </div>
        <div class="category">
            <h2>ㄷ</h2>
            <ul class="games">
                <li><a href="#">FC 모바일</a></li>
                <li><a href="#">메이플스토리</a></li>
                <li><a href="#">카트라이더</a></li>
            </ul>
        </div>
        <div class="category">
            <h2>ㄹ</h2>
            <ul class="games">
                <li><a href="#">FC 모바일</a></li>
                <li><a href="#">메이플스토리</a></li>
                <li><a href="#">카트라이더</a></li>
            </ul>
        </div>
        <div class="category">
            <h2>ㅁ</h2>
            <ul class="games">
                <li><a href="#">FC 모바일</a></li>
                <li><a href="#">메이플스토리</a></li>
                <li><a href="#">카트라이더</a></li>
            </ul>
        </div>
        <div class="category">
            <h2>ㅂ</h2>
            <ul class="games">
                <li><a href="#">FC 모바일</a></li>
                <li><a href="#">메이플스토리</a></li>
                <li><a href="#">카트라이더</a></li>
            </ul>
        </div>
        <div class="category">
            <h2>ㅅ</h2>
            <ul class="games">
                <li><a href="#">FC 모바일</a></li>
                <li><a href="#">메이플스토리</a></li>
                <li><a href="#">카트라이더</a></li>
            </ul>
        </div>
        <div class="category">
            <h2>ㅇ</h2>
            <ul class="games">
                <li><a href="#">FC 모바일</a></li>
                <li><a href="#">메이플스토리</a></li>
                <li><a href="#">카트라이더</a></li>
            </ul>
        </div>
        <div class="category">
            <h2>ㅈ</h2>
            <ul class="games">
                <li><a href="#">FC 모바일</a></li>
                <li><a href="#">메이플스토리</a></li>
                <li><a href="#">카트라이더</a></li>
            </ul>
        </div>
        <div class="category">
            <h2>ㅊ</h2>
            <ul class="games">
                <li><a href="#">FC 모바일</a></li>
                <li><a href="#">메이플스토리</a></li>
                <li><a href="#">카트라이더</a></li>
            </ul>
        </div>
        <div class="category">
            <h2>ㅋ</h2>
            <ul class="games">
                <li><a href="#">FC 모바일</a></li>
                <li><a href="#">메이플스토리</a></li>
                <li><a href="#">카트라이더</a></li>
            </ul>
        </div>
        <div class="category">
            <h2>ㅌ</h2>
            <ul class="games">
                <li><a href="#">FC 모바일</a></li>
                <li><a href="#">메이플스토리</a></li>
                <li><a href="#">카트라이더</a></li>
            </ul>
        </div>
        <div class="category">
            <h2>ㅍ</h2>
            <ul class="games">
                <li><a href="#">FC 모바일</a></li>
                <li><a href="#">메이플스토리</a></li>
                <li><a href="#">카트라이더</a></li>
            </ul>
        </div>
        <div class="category">
            <h2>ㅎ</h2>
            <ul class="games">
                <li><a href="#">FC 모바일</a></li>
                <li><a href="#">메이플스토리</a></li>
                <li><a href="#">카트라이더</a></li>
            </ul>
        </div>
    </div>

<jsp:include page="/common/footer.jsp" />
</body>
</html>

