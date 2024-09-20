<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>

<div class="container">

<form>

<!-- (1) 게임이미지 + 정보테이블 + 버튼 -->
<div class="container" style="display:flex; gap:130px; margin-top:20px;">

<!-- 게임동영상 -->
<div style="width:800px; height:400px">
  <video class="embed-responsive" controls>
    <source src="https://video.akamai.steamstatic.com/store_trailers/256660296/movie480.webm?t=1454099186" type="video/mp4">
  </video>
</div>

	<!-- 사이드바 1 : 이미지, 게임정보 및 장바구니, 구매하기 -->
	<div class="card" style="width:25rem;">
	<!-- 게임이미지 -->
	<img src="/resources/images/stardewvalley.jpg" class="card-img-left">
		<div class="card-body">
			<h5 class="card-title">스타듀밸리</h5>
			<p class="card-text">\16,000</p>
		</div>
		<!-- 게임정보 테이블 : 장르, 배급사, 이용등급, 출시일, => 중앙/우측 정렬 -->
		<table class="table">
		  <thead>
		    <tr>
		      <th>장르</th>
		      <td>인디게임</td>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th>배급사</th>
		      <td>ConcernedApe</td>
		    </tr>
		    <tr>
		      <th>이용등급</th>
		      <td>전체이용가</td>
		    </tr>
		    <tr>
		      <th>출시일</th>
		      <td>2016년 2월 27일</td>
		    </tr>
		  </tbody>
		</table>
		<!-- 장바구니, 구매하기 버튼 -->
		<div class="card-body" style="margin-left:100px;">
			<a href="#" class="btn btn-primary">장바구니</a>
			<a href="#" class="btn btn-success">구매하기</a>
		</div>
	</div>
</div>


<!-- (2) 게임 소개글 + 시스템 요구사양 -->
<div class="container" style="display:flex; gap:10px; margin-top:20px;">
	<!-- 게임 소개글 : 좌측정렬 -->
	<div class="card float-left" style="width: 50rem; height: 20rem;">
	  <div class="card-body">
	    스타듀밸리 소개글
	  </div>
	</div>
	
	<!-- 사이드바 2 : 시스템 요구사항, 우측정렬 -->
	<div class="card float-right" style="width: 30rem;">
		<table class="table">
		
			<thead>
		<nav class="navbar navbar-expand-lg bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">요구사항</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link active" href="#">Windows</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">macOS</a>
					</li>
				</ul>
			</div>
			</div>
		</nav>
			</thead>
			
			<tbody>
			<tr>
				<th>운영체제</th>
				<td>Windows Vista or greater</td>
			</tr>
			<tr>
				<th>프로세서</th>
				<td>2 Ghz</td>
			</tr>
			<tr>
				<th>메모리</th>
				<td>2 GB RAM</td>
			</tr>
			<tr>
				<th>그래픽</th>
				<td>256 mb video memory, shader model 3.0+</td>
			</tr>
			<tr>
				<th>DirectX</th>
				<td>버전 10</td>
			</tr>
			<tr>
				<th>저장공간</th>
				<td>500 MB 사용 가능 공간</td>
			</tr>
			</tbody>
		</table>
	</div>
</div>

</form>

<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>