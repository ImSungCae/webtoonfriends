<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="myCartList" value="${cartMap.myCartList}" />
<c:set var="myGoodsList" value="${cartMap.myGoodsList}" />

<c:set var="totalGoodsNum" value="0" />
<!--주문 개수 -->
<c:set var="totalDeliveryPrice" value="0" />
<!-- 총 배송비 -->
<c:set var="totalDiscountedPrice" value="0" />
<!-- 총 할인금액 -->
<div id="cart" class="detail_box">
	<h2>장바구니</h2>
	<div>
		<c:choose>
			<c:when test="${empty myCartList }">
				<p>장바구니에 상품이 없습니다.</p>
			</c:when>
			<c:otherwise>
				<form name="frm_order_all_cart">
					<c:forEach var="item" items="${myGoodsList }" varStatus="cnt">
						<!-- 인덱스 초기화 -->
						<c:set var="cart_goods_qty" value="${myCartList[cnt.count-1].cart_goods_qty}" />
						<c:set var="cart_id" value="${myCartList[cnt.count-1].cart_id}" />
						<!-- 인덱스 초기화 -->
						<!-- 상품정보 및 선택영역  -->
						<div>
							<!-- 체크박스 영역  -->
							<div>
								<input type="checkbox" name="checked_goods"
									price="${item.goods_price*cart_goods_qty }"
									value="${item.goods_id }">
							</div>
							<!-- 체크박스 영역  -->
							
							<!-- 상품상세페이지로 이동  -->
							<div>
								<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
									<div>
										<img src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"
											style="width: 64px; height: 64px">
										<div>
											<p>${item.goods_title }</p>
											<p>
												<span>${cart_goods_qty }</span>개
												<span> · </span>
												<span>
													<fmt:formatNumber value="${item.goods_price*cart_goods_qty}" pattern="#,###" />
												</span>
												원
											</p>
										</div>
									</div>
								</a>
							</div>
							<!-- 상품상세페이지로 이동  -->
							
							<!-- 상품정보 수정영역  -->
							<div>
								<select id="" selectedValue="${cart_goods_qty}"
									onchange="selectValue(this, this.value,${item.goods_id },${cnt.count-1 })">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
								</select> <input type="hidden" id="cart_goods_qty"
															name="cart_goods_qty" value="${cart_goods_qty}">
	
								<!-- 주문하기 -->
								<%-- javascript:fn_order_each_goods('${item.goods_id }','${item.goods_title }','${item.goods_sales_price}','${item.goods_fileName}'); --%>
								<a href="#"
									style="width: 150px;">주문하기</a>
	
								<!-- 삭제하기 -->
								<%-- javascript:delete_cart_goods('${cart_id}'); --%>
								<a href="#"
									style="width: 150px;">삭제</a>
							</div>
							<!-- 상품정보 수정영역  -->
							
						</div>
						<!-- 상품정보 및 선택영역  -->
						
					</c:forEach>
				</form>
			</c:otherwise>
		</c:choose>
	</div>

	<!-- 전체선택  -->
	<label>
		<input name="cheked_goods" 
			title="모든 상품을 결제상품으로 설정" type="checkbox" onclick="selectAll(this)">
		전체선택
	</label>
	<!-- 전체선택  -->
	
	<!-- 선택상품 가격표시 영역  -->
	<div>
		<!-- 변수세팅 및 형 변환 -->
		<!-- 상품가격 * 갯수 및 형변환 -->
		<c:set var="totalGoodsPrice"
			value="${totalGoodsPrice+item.goods_price*cart_goods_qty }" />
					
		<c:set var="total_price"
			value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" />
		<!-- 변수세팅 및 형 변환 -->
		<!-- 가격정보 hidden input -->
		<input id="h_totalGoodsPrice" type="hidden" value="${totalGoodsPrice}" /> 
		<input id="h_totalDeliveryPrice" type="hidden" value="${totalDeliveryPrice}" /> 
		<input id="h_totalSalesPrice" type="hidden" value="${totalSalesPrice}" />
		<input id="h_final_totalPrice" type="hidden" value="${totalGoodsPrice+totalDeliveryPrice}" />
		<!-- 가격정보 hidden input -->
		
		<!-- 총 상품가격 -->
		<p>총 상품가격 
			<span>${total_goods_price }</span>원
		</p>
		+
		<!-- 총 배송비 -->
		<p>총 배송비
			<span>${totalDeliveryPrice }</span>원
		</p>
		=
		<!-- 총 주문금액 -->
		<p>총 주문금액
			<span>${total_price }</span>원
		</p>
		
	</div>
	<!-- 선택상품 가격표시 영역  -->
	<button onclick="">주문하기</button>
</div>
