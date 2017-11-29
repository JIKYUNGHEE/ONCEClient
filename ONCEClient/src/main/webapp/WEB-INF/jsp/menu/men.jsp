<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Creative - Multipurpose Mobile Template</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1  maximum-scale=1 user-scalable=no">
<meta name="mobile-web-app-capable" content="yes">
<meta name="HandheldFriendly" content="True">

<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.png">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/materialize.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick-theme.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.transitions.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lightbox.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/lightbox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.filterizr.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom-portfolio.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

<style type="text/css">
.menuSpace {
	padding: 2px;
	background-color: #e5e5e5;
}
</style>
</head>
<body>

<header>
		<div class="navbar">
		<div class="container">
			<div class="panel-control-left">
				<a href="#" data-activates="slide-out-left"
					class="sidenav-control-left"><i class="fa fa-bars"></i></a>
			</div>
			<div class="site-title">
				<a href="${pageContext.request.contextPath}" class="logo"><h1>ONCE</h1></a>
			</div>
			<div class="panel-control-right">
				<a href="contact.html"><i class="fa fa-shopping-cart"></i></a>
			</div>
		</div>
	</div>
	<!-- 상단 navbar 끝 -->

	<!-- 좌측 메뉴패널 -->
	<div class="panel-control-right">
		<ul id="slide-out-left" class="side-nav collapsible"
			data-collapsible="accordion">
			<li>
				<div class="photos">
					<h3>cus1</h3>
				</div>
			</li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li>
				<div class="collapsible-header">
					<i class="fa fa-map-signs"></i>층별 매장 보기<span><i
						class="fa fa-chevron-right"></i></span>
				</div>
				<div class="collapsible-body">
					<ul class="side-nav-panel">
						<li><a href="${pageContext.request.contextPath}/menu/1F">1F</a></li>
						<li><a href="${pageContext.request.contextPath}/menu/2F">2F</a></li>
						<li><a href="${pageContext.request.contextPath}/menu/3F">3F</a></li>
					</ul>
				</div>
			</li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li>
				<div class="collapsible-header">
					<i class="fa fa-th"></i>상품별 보기 <span><i class="fa fa-chevron-right"></i></span>
				</div>
				<div class="collapsible-body">
					<ul class="side-nav-panel">
						<li class="tileList">
							<table>
								<tr>
									<td><a href="${pageContext.request.contextPath}/menu/men" class="tileMenu"><i class="fa fa-male"></i><br/>남성
											의류</a></td>
									<td class="menuSpace"></td>
									<td><a href="${pageContext.request.contextPath}/menu/women" class="tileMenu"><i class="fa fa-female"></i><br/>여성 의류</a></td>
								</tr>
							</table>
						</li>
						<li>
							<div class="menuSpace"></div>
						</li>
						<li class="tileList">
							<table class="tileMenu">
								<tr>
									<td><a href="${pageContext.request.contextPath}/menu/kids" class="tileMenu"><i class="fa fa-child"></i><br/>유·아동복</a></td>
									<td class="menuSpace"></td>
									<td><a href="${pageContext.request.contextPath}/menu/general" class="tileMenu"><i class="fa fa-briefcase"></i><br/>패션 잡화</a></td>
								</tr>
							</table>
						</li>
					</ul>
				</div>
			</li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li><a href="login.html"><i class="fa fa-sign-in"></i>로그인</a></li>
			<li>
				<div class="menuSpace"></div>
			</li>
			<li><a href="register.html"><i class="fa fa-user-plus"></i>회원가입</a>
			</li>
		</ul>
	</div>
	</header>
	
	<section>
	<div class="portfolio portfolio-card column2 app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3>남성의류</h3>
			</div>
			<ul class="portfolio-filter">
				<li data-filter="all" class="active">전체</li>
				<li data-filter="1">상의</li>
				<li data-filter="2">하의</li>
				<li data-filter="3">ACC</li>
			</ul>
			<div class="portfolio-item">
				<div class="row">
					<div class="col s6 filtr-item" data-category="1">
						<a href="${pageContext.request.contextPath}/resources/img/men1.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/men1.jpg" alt=""></a>
						<h5>따뜻한 패딩</h5>
						<p>259,000원</p>
					</div>
					<div class="col s6 filtr-item" data-category="1">
						<a href="${pageContext.request.contextPath}/resources/img/men2.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/men2.jpg" alt=""></a>
						<h5>멋진 셔츠</h5>
						<p>158,000원</p>
					</div>
				</div>
				<div class="row">
					<div class="col s6 filtr-item" data-category="1">
						<a href="${pageContext.request.contextPath}/resources/img/men3.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/men3.jpg" alt=""></a>
						<h5>이쁜 니트</h5>
						<p>175,000원</p>
					</div>
					<div class="col s6 filtr-item" data-category="1">
						<a href="${pageContext.request.contextPath}/resources/img/men4.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/men4.jpg" alt=""></a>
						<h5>편한 맨투맨</h5>
						<p>45,900원</p>
					</div>
				</div>
				<div class="row">
					<div class="col s6 filtr-item" data-category="2">
						<a href="${pageContext.request.contextPath}/resources/img/men5.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/men5.jpg" alt=""></a>
						<h5>회색 바지</h5>
						<p>88,000원</p>
					</div>
					<div class="col s6 filtr-item" data-category="2">
						<a href="${pageContext.request.contextPath}/resources/men6.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/men6.jpg" alt=""></a>
						<h5>검정 슬랙스</h5>
						<p>113,000원</p>
					</div>
				</div>
				<div class="row">
					<div class="col s6 filtr-item" data-category="2">
						<a href="${pageContext.request.contextPath}/resources/img/men7.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/men7.jpg" alt=""></a>
						<h5>면바지</h5>
						<p>79,000원</p>
					</div>
					<div class="col s6 filtr-item" data-category="2">
						<a href="${pageContext.request.contextPath}/resources/img/men8.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/men8.jpg" alt=""></a>
						<h5>기모 슬랙스</h5>
						<p>126,000원</p>
					</div>
				</div>
				<div class="row">
					<div class="col s6 filtr-item" data-category="3">
						<a href="${pageContext.request.contextPath}/resources/img/men9.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/men9.jpg" alt=""></a>
						<h5>검정 벨트</h5>
						<p>108,000원</p>
					</div>
					<div class="col s6 filtr-item" data-category="3">
						<a href="${pageContext.request.contextPath}/resources/img/men10.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/men10.jpg" alt=""></a>
						<h5>이쁜 키링</h5>
						<p>63,000원</p>
					</div>
				</div>
				<div class="row">
					<div class="col s6 filtr-item" data-category="3">
						<a href="${pageContext.request.contextPath}/resources/img/men11.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/men11.jpg" alt=""></a>
						<h5>검정 볼캡</h5>
						<p>55,000원</p>
					</div>
					<div class="col s6 filtr-item" data-category="3">
						<a href="${pageContext.request.contextPath}/resources/img/men12.jpg" data-lightbox="image-1"><img src="${pageContext.request.contextPath}/resources/img/men12.jpg" alt=""></a>
						<h5>도트 타이</h5>
						<p>78,000원</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	
	<footer>
		<div class="container">
			<h6>About us</h6>
			<div class="tel-fax-mail">
				<ul>
					<li><span>회사명:</span> (주)ONCE</li>
					<li><span>대표이사:</span> 장경준</li>
					<li><span>사업자등록번호:</span> 000-0000-00000<li>
				</ul>
			</div>
		</div>
		<div class="ft-bottom">
			<span>Copyright © 2017 All Rights Reserved </span>
		</div>
	</footer>
<!-- 하단 navbar -->
	<div class="w3-bottom">
		<div class="w3-bar w3-white w3-border w3-xlarge" style="text-align: center;">
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/likeStore" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-star"></i></a>
			<a href="${pageContext.request.contextPath}" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<a href="#" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-truck"></i></a>
			<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #b2b2b2;" class="w3-bar-item"><i class="fa fa-user"></i></a>
		</div>
	</div>
	<!-- 하단 navbar 끝 -->
</body>
</html>