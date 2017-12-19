<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Creative - Multipurpose Mobile Template</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1  maximum-scale=1 user-scalable=no">
<meta name="mobile-web-app-capable" content="yes">
<meta name="HandheldFriendly" content="True">

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.png">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/materialize.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slick.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slick-theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.transitions.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lightbox.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript">

	var listJSON = '${sessionScope.listJSON}';
	var resultList = $.parseJSON(listJSON);
	var storeJSON = '${sessionScope.storeJSON}';
	var storeList = $.parseJSON(storeJSON);
		
	var colorList = null;
	var sizeList = null;
	
	var btnList = new Array();	/* 옵션 버튼 눌린 횟수*/
	for(var k=0; k<resultList.length; k++){
		btnList[k] = 0;
	}
	
	var cntList = new Array(); /* 해당 store의 상품 개수 */
	for(var k=0; k<storeList.length; k++){
		cntList[k] = 0;
	}
	
	var sumCntList = new Array();	/* 해당 store까지 누적 상품 개수*/
	for(var k=0; k<storeList.length; k++){
		sumCntList[k] = 0;
	}
	
	function getAllTotal(resultList){
		
		if(listJSON != null){
			$.each(storeList, function(loop, store){

				var ori_total_storeNo = 0; /* 매장별 상품 총 정상가 */
				var cur_total_storeNo = 0; /* 매장별 상품 총 금액 */
				var itemCnt_storeNo = 0; /* 매장별 상품 총 개수 */
				
				var storeNo = store.storeNo;
				cntList[loop] = 0;
				
				$.each(resultList, function(index, item){	/* storeNo 같은 거 끼리 묶기 */
										
					if( storeNo == item.storeNo){
						itemCnt_storeNo = item.count;
						
						if(index==0){
							sumCntList[loop] = 0;
						}
						cntList[loop]++;
						
						ori_total_storeNo += item.price*itemCnt_storeNo;
						
						if(item.salePrice == 0){
							cur_total_storeNo += item.price*itemCnt_storeNo;
						}else{
							cur_total_storeNo += item.salePrice*itemCnt_storeNo;
						}
					}
				
					$('#ori_total_'+loop).text(ori_total_storeNo);
					$('#dis_total_'+loop).text(ori_total_storeNo - cur_total_storeNo);
					$('#cur_total_'+loop).text(cur_total_storeNo);
					
					sumCntList[loop]++;
				});
			});
		}
	}
	
	$(document).ready(function(){
		getAllTotal(resultList);
		$('.changeOption').hide();
	});
	
	function plusCnt(loop, index){
		var changeCnt = $('#count_'+loop+"_"+index).val();
		changeCnt++;
		$('#count_'+loop+"_"+index).val(changeCnt);
	}
	
	function minusCnt(loop, index){
		if($('#count_'+loop+"_"+index).val() == 1){
		}else{
			var changeCnt = $('#count_'+loop+"_"+index).val();
			changeCnt--;
			$('#count_'+loop+"_"+index).val(changeCnt);
		}
	}
		
	function oriPriceForm(loop, index){
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/oriPriceForm",
			data : {
				'index' : index
			},
			success : function(data) {
				$('#oriPrice_'+loop+"_"+index).html("");
				$('#oriPrice_'+loop+"_"+index).html(data);
			}
		});
	}
	
	function salePriceForm(loop, index){
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/salePriceForm",
			data : {
				'index' : index
			},
			success : function(data) {
				$('#salePrice_'+loop+"_"+index).html("");
				$('#salePrice_'+loop+"_"+index).html(data);
			}
		});
	}
	
	function changeCnt(loop, index){
		
		var count = $('#count_'+loop+"_"+index).val();
		
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/changeCnt",
			type : "get",
			data : {
				'index' : index,
				'count' : count
			},
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			cache : false,
			success : function(data) {
				alert("수량이 변경 되었습니다.");
				var changeList = $.parseJSON(data);
				
				oriPriceForm(loop, index);
				salePriceForm(loop, index);
							
				var ori_total_storeNo = 0;
				var ori_total_storeNo = 0;
				var ori_total_storeNo = 0;
						
				getAllTotal(changeList);
			}		
		});
					
	}
	
	function showOption(loop, index){	/* 옵션 리스트 보여주게끔 */
		
		if(btnList[index]==0){
			$.ajax({
				url : "${ pageContext.request.contextPath }/shoppingCart/showOption",
				type : "get",
				data : {
					'index' : index
				},
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				cache : false,
				success : function(data) {
					var optionList = $.parseJSON(data);
					var colorList = optionList.colorList;
					var sizeList = optionList.sizeList;
					
					for(var i=0; i<colorList.length; i++){
						var colors = $("<option>"+colorList[i]+"</option>");
						$('#colorSelect_'+loop+"_"+index).append(colors);
					}
					for(var i=0; i<sizeList.length; i++){
						var sizes = $("<option>"+sizeList[i]+"</option>");
						$('#sizeSelect_'+loop+"_"+index).append(sizes);
					}
				}
			});
		}
	
		$('#changeOption_'+loop+"_"+index).show();
		
		btnList[index]++;
	}
	
	function changeConfirm(loop, index){ /* 옵션 변경 적용 */
		
		var colorSelect = $('#colorSelect_'+loop+"_"+index).val();
		var sizeSelect = $('#sizeSelect_'+loop+"_"+index).val();
				
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/changeOption",
			type : "get",
			data : {
				'index' : index,
				'colorSelect' : colorSelect,
				'sizeSelect' : sizeSelect
			},
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			cache : false,
			success : function(data) {
				var newJsonList = $.parseJSON(data);
				$('#option_'+loop+"_"+index).html(newJsonList[index].color+" | "+newJsonList[index].size+"&nbsp;&nbsp;&nbsp;");				
				
				$('#color_'+loop+"_"+index).val('');
				$('#color_'+loop+"_"+index).val(newJsonList[index].color);
				
				$('#size_'+loop+"_"+index).val('');
				$('#size_'+loop+"_"+index).val(newJsonList[index].size); 
				
				alert($('#size_'+loop+"_"+index).val());
				
				alert('변경되었습니다.');
				
				$('#changeOption_'+loop+"_"+index).hide();
			}
		});
	}
	
	function changeCancle(loop, index){
		alert('취소되었습니다.');
		$('#changeOption_'+loop+"_"+index).hide();
	}

	function deleteOne(loop, index) {
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/deleteOne",
			type : "get",
			data : {
				'loop'  : loop,
				'index' : index
			},
			success : function(data) {
				alert("삭제되었습니다.");
				$('#shoppingCart').html("");
				$('#shoppingCart').html(data);
			}
		});
	}
	
	function deleteAll(loop){
		
		var storeName = null;
		$.each(storeList, function(i, store){
			if(i==loop){
				storeName = store.storeName;
			}
		});
		$.ajax({
			url : "${ pageContext.request.contextPath }/shoppingCart/deleteAll",
			type : "get",
			data : {
				'loop' : loop
			},
			success : function(data) {
				alert("삭제되었습니다.");
				alert(storeName + "의 상품들이 모두 삭제되었습니다.");
				$('#shoppingCart').html("");
				$('#shoppingCart').html(data);
			}
		});
		
	}
	
	function buySubmit(loop){
		$('#count_'+loop).val(cntList[loop]);
			
		$('#orderVO_'+loop).attr("action", "${ pageContext.request.contextPath }/orderList/addCartItem/"+cntList[loop]+"/"+sumCntList[loop]);
		
		$('#orderVO_'+loop).submit();
	}
</script>
</head>
<body>
	<!-- navbar -->
	<jsp:include page="/WEB-INF/jsp/include/topmenu.jsp" flush="false"></jsp:include>
	<!-- end navbar -->

	<!-- product cart -->
	<div class="product-cart app-pages app-section">
		<div id="shoppingCart" class="container">
			<div class="pages-title">
				<h3>Shopping Cart</h3>
			</div>
			<c:choose>
				<c:when test="${ not empty productList }"><!-- productList에 상품이 1개 이상 -->
					<c:forEach var="storeVO" items="${ storeList }" varStatus="loop">
					<form id="orderVO_${loop.index }" name="orderVO" method="post">
					<input type="hidden" name="storeNo" value="${ storeVO.storeNo }" />
					<input type="hidden" name="storeName" value="${ storeVO.storeName }" />
					<input type="hidden" id="count_${ loop.index }" name="count" />
					<div class="entry" id="productList_${ loop.index }">
						<p style="font-weight: bold;">${ storeVO.storeName }
						<button id="deleteAll_${ loop.index }" class="button" style="background-color: #86E57F; font-weight: normal;  float: right; margin-bottom: 10px;" onclick="deleteAll(${ loop.index })">장바구니 비우기</button>
						</p>
						<c:forEach var="itemContents" items="${productList}" varStatus="status">
							<c:if test="${ storeVO.storeNo  eq itemContents.storeNo}">
							<div class="car/t-title s-title">
								<div class="row">
									<div class="col s4">
										<img src="${pageContext.request.contextPath}/upload/${itemContents.imgSaveName}" alt="이미지 준비 중">
									</div>
									<div class="col s7">
										<p>${itemContents.itemName}</p>
										<input type="hidden" name="orderDetails[${ status.index }].detailNo" value="${ itemContents.detailNo }" />
										<input type="hidden" name="orderDetails[${ status.index }].itemName" value="${ itemContents.itemName }" />
										<input type="hidden" name="orderDetails[${ status.index }].storeNo" value="${ itemContents.storeNo }" />
										<input type="hidden" name="orderDetails[${ status.index }].storeName" value="${ itemContents.storeName }" />
									</div>
									<div class="col s1">
										<a href="" onclick="deleteOne(${ loop.index }, ${status.index})">
										<i class="fa fa-remove"></i></a><!-- 삭제버튼 -->
									</div>
								</div>
								<div class="row">
									<div class="col s4">
										<p>Count</p>
									</div>
									<div class="col s8">
										<button class="button" type="button" onclick="minusCnt(${loop.index}, ${status.index})">-</button>
										<input type="number" name="orderDetails[${status.index }].count" id="count_${loop.index}_${status.index}" value="${itemContents.count}" />
										<button class="button" type="button"  onclick="plusCnt(${loop.index}, ${status.index})">+</button>
										<button class="button" type="button"  onclick="changeCnt(${loop.index}, ${status.index})">변경</button>
									</div>
								</div>
								<div class="row">
									<div class="col s4">
										<p>옵션</p>
									</div>
									<div class="col s8"	>
										<p id="option_${loop.index}_${status.index}" style="float: left;">${itemContents.color} | ${itemContents.size} &nbsp;&nbsp;&nbsp;</p>
										<input type="hidden" name="orderDetails[${ status.index  }].color" id="color_${loop.index}_${status.index}" value="${itemContents.color}" />
										<input type="hidden" name="orderDetails[${ status.index  }].size" id="size_${loop.index}_${status.index}" value="${itemContents.size}" />
										<button id="optionBtn" type="button"  class="button" onclick="showOption(${loop.index}, ${status.index})">옵션변경</button>
									</div>
									<div class="changeOption" id="changeOption_${loop.index}_${status.index}" style="display: table; margin-top: 15px; margin-bottom: 15px; margin-left: auto; margin-right: auto; text-align: center;">
										<div>
											<label style="float: left; width: 45px;">color</label> 
											<select id="colorSelect_${loop.index}_${status.index}" class="form-control browser-default" style="width: 200px;">
												<option value="" selected="selected" disabled="disabled">color를 선택해 주세요</option>
												<c:forEach var="color" items="${colorList}">
												<option value="${color}">${color}</option>
												</c:forEach>
											</select>
										</div>
										<div style="margin-bottom: 10px;">
											<label style="float: left; width: 45px;">size</label> 
											<select id="sizeSelect_${loop.index}_${status.index}" class="form-control  browser-default" style="width: 200px;">
												<option value="" selected="selected" disabled="disabled">size 선택해 주세요</option>
												<c:forEach var="size" items="${sizeList}">
												<option value="${size}">${size}</option>
												</c:forEach>
											</select>											
										</div>
										<div>
											<button id="option" type="button"  class="button" onclick="changeConfirm(${loop.index}, ${status.index})">변경</button>
											<button id="option" type="button" class="button" onclick="changeCancle(${loop.index}, ${status.index})">취소</button>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col s4">
											<p>Price</p>
											<input type="hidden" name="orderDetails[${ status.index }].price" value="${itemContents.price}"/>
											<input type="hidden" name="orderDetails[${ status.index }].salePrice" value="${itemContents.salePrice}"/>
										</div>
										<div class="col s8" >
											<div id="oriPrice_${loop.index}_${status.index}">
											<p style="float: left; margin-left: 10px;">정상가:</p>
												<c:choose>
													<c:when test="${ itemContents.salePrice eq 0 }">
														<p style="float: left;">${itemContents.price * itemContents.count }</p>
													</c:when>
													<c:otherwise>
														<p style="text-decoration:line-through;">${itemContents.price * itemContents.count }</p>
													</c:otherwise>
												</c:choose>
											</div>
											<br/>
											<div id="salePrice_${loop.index}_${status.index}">
											<c:choose>
												<c:when test="${ itemContents.salePrice eq 0 }" />
												<c:otherwise>
													<p style="float: left;  margin-left: 10px; ">할인가:</p>
													<p style="color:red; float: left;">${itemContents.salePrice * itemContents.count}</p>
												</c:otherwise>
											</c:choose>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="cart-total" id="cart-total_${ loop.index }">			
						<div class="row">
							<div class="col s8">
								<h6>상품 가격</h6>
							</div>
							<div class="col s4">
								<h6 id="ori_total_${ loop.index }"></h6>
							</div>
							<div class="col s8">
								<h6>할인 금액</h6>
							</div>
							<div class="col s4">
								<h6 id="dis_total_${ loop.index }"></h6>
							</div>
							<div class="col s8">
								<h5>Total</h5>
							</div>
							<div class="col s4">
								<h5 id="cur_total_${ loop.index }"></h5>
							</div>
						</div>
						<div class="row">
							<button type="button" class="button" onclick="buySubmit(${ loop.index })" style="background-color: #ffc305; margin-bottom: 10px; font-size: 12px;">주 문 하 기</button>
						</div>
					</div>
					</form>
					</c:forEach>
				</c:when>
				
				<c:otherwise><!-- productList에 아무것도 없을 때  -->
					<h6>장바구니에 등록된 상품이 없습니다.</h6>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- end product cart -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp" flush="false"></jsp:include>
	<!-- end footer -->

	<!-- navbar -->
	<jsp:include page="/WEB-INF/jsp/include/navbar.jsp" flush="false"></jsp:include>
	<!-- end navbar -->

	<!-- script -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

</body>
</html>