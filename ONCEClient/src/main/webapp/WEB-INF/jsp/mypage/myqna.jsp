<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Creative - Multipurpose Mobile Template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1  maximum-scale=1 user-scalable=no">
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
 	<link rel="stylesheet" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
 	
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	
	<style type="text/css">
		.normal {
			font-weight: 400
		}
		
		.bold {
			font-weight: 700
		}
		
		.bolder {
			font-weight: 800
		}
		
		.light {
			font-weight: 300
		}
		
		.sltBtn {
			text-align: center;
		}
		
		.sltBtn i {
			color: #fff;
			font-size: 25pt !important;
			-webkit-text-stroke: 1px #000;
		}
	</style>
	<script type="text/javascript">
	function login(){
		alert('로그인이 필요한 메뉴입니다. 로그인 화면으로 이동합니다.');
	}
	</script>
</head>
<body>

	<header>
		<!-- navbar -->
		<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp"></jsp:include>
	<!-- end navbar -->
	</header>
	
	<section>
	<div class="grid-app app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3 class="bold">1:1 문의</h3>
				<img src="${ pageContext.request.contextPath }/resources/img/moon.png" width="30%">
			</div>
			<p class="normal" style="text-align: center; padding-bottom: 30px;">어떤 문의를 하고 싶으세요?</p>
			<div class="row">
				<div class="col s4 sltBtn">
					<a href="${pageContext.request.contextPath}/mypage/writeForm/Dept">
						<i class="fa fa-building"></i><br/>
						백화점
					</a>
				</div>
				<div class="col s4 sltBtn">
					<a href="${pageContext.request.contextPath}/mypage/writeForm/Store">
						<i class="fa fa-shopping-basket"></i><br/>
						매장
					</a>
				</div>
				<div class="col s4 sltBtn">
					<a href="${pageContext.request.contextPath}/mypage/writeForm/Info">
						<i class="fa fa-shopping-bag"></i><br/>
						주문/수령
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="table-app">
		<div class="container">
			<div class="pages-title">
				<h3 class="bold">나의 Q&A</h3>
				<img src="${ pageContext.request.contextPath }/resources/img/moon.png" width="30%">
			</div>
			<table class="bordered">
				<thead>
					<tr>
						<th>분류</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead> 
				<tbody>
				  <c:forEach var="boardQA" items="${ qnaList }">
					<c:if test="${ boardQA.staffNo eq 0}">
					<tr>
						<td>${ boardQA.category1 }</td>
						<td><a href="${pageContext.request.contextPath}/qnaDetail/${boardQA.boardNo}">${ boardQA.title }</a></td>
						<td>${ boardQA.regDate }</td>
					</tr>
				   </c:if>
			      </c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</section>
	
	
	<footer>
		<!-- footer -->
		<jsp:include page="/WEB-INF/jsp/include/bottom.jsp"></jsp:include>
	<!-- end footer -->
	</footer>
	<!-- footer 끝 -->
<!-- 하단 navbar -->
	<div class="w3-bottom" style="background-color: #d0c5ff;">
		<div class="w3-bar w3-border w3-xlarge" style="text-align: center;">
			<a href="${pageContext.request.contextPath}/item/serach" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-search"></i></a>
			<c:choose>
				<c:when test="${ !empty loginVO }">
					<a href="${pageContext.request.contextPath}/mypage/likeStore" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-star"></i></a>
				</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/login/loginForm" style="width: 20%; color: #b2b2e8;" class="w3-bar-item" onclick="login()"><i class="fa fa-star"></i></a>
			</c:otherwise>
			</c:choose>
			<a href="${pageContext.request.contextPath}/main" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-home"></i></a>
			<c:choose>
				<c:when test="${ !empty loginVO }">
					<a href="${pageContext.request.contextPath}/order/status" style="width: 20%; color: #b2b2e8;" class="w3-bar-item"><i class="fa fa-truck"></i></a>
					<a href="${pageContext.request.contextPath}/mypage/mypageMain" style="width: 20%; color: #fff;" class="w3-bar-item"><i class="fa fa-user"></i></a>
				</c:when>
				<c:otherwise>				
					<a href="${pageContext.request.contextPath}/login/loginForm" style="width: 20%; color: #b2b2e8;" class="w3-bar-item" onclick="login()"><i class="fa fa-truck"></i></a>
					<a href="${pageContext.request.contextPath}/login/loginForm" style="width: 20%; color: #fff;" class="w3-bar-item" onclick="login()"><i class="fa fa-user"></i></a>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
	<!-- 하단 navbar 끝 -->
</body>
</html>