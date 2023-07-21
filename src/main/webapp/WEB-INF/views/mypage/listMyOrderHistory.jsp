<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="order_detail" class="detail_box">
	<h2>주문목록</h2>
	<form method="post" id="history_search">
		<!-- 검색 - 오늘 -->
		<a href="javascript:search_order_history('today')" class="badge">오늘</a>
		<!-- 검색 - 1개월 -->
		<a href="javascript:search_order_history('one_month')"
			name="one_month" class="badge">최근 1개월</a>
		<!-- 검색 - 2개월 -->
		<a href="javascript:search_order_history('two_month')" class="badge">최근 2개월</a>
		<!-- 검색 - 3개월 -->
		<a href="javascript:search_order_history('three_month')" class="badge">최근 3개월 </a>
		<!-- 검색 - 6개월 -->
		<a href="javascript:search_order_history('six_month')" class="badge">최근 6개월</a>

	</form>

	<div class="order_history_box">
		<c:choose>
			<c:when test="${empty myOrderHistList }">
				<p style="text-align: center;opacity: .5;">주문한 상품이 없습니다.</p>
			</c:when>
			<c:otherwise>
				<c:forEach var="item" items="${myOrderHistList }" varStatus="i">
					<c:choose>
						<c:when test="${item.order_id != pre_order_id }">
							<c:set var="pre_order_id" value="${item.order_id }" />
							<div class="history_detail_box">
								<p>${item.pay_order_time } 주문</p>
								<div class="history_goods_detail">
									<p>
										<c:choose>
											<c:when test="${item.delivery_state=='delivery_prepared' }">배송준비중</c:when>
											<c:when test="${item.delivery_state=='delivering' }">배송중</c:when>
											<c:when test="${item.delivery_state=='finished_delivering' }">배송완료</c:when>
											<c:when test="${item.delivery_state=='cancel_order' }">주문취소</c:when>
											<c:when test="${item.delivery_state=='returning_goods' }">반품중</c:when>
											<c:when test="${item.delivery_state=='exchange_goods' }">교환중</c:when>
										</c:choose>
									</p>
									<c:forEach var="item2" items="${myOrderHistList }">
										<c:if test="${item.order_id == item2.order_id }">
												<div class="goods_detail_box">
													<img
														src="${contextPath}/thumbnails.do?goods_id=${item2.goods_id}&fileName=${item2.goods_fileName}"
														style="width: 64px; height: 64px; border-radius: 10px; margin-right:20px;">
													<div>
														<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item2.goods_id }">
														<p>${item2.goods_title }</p>
														<span>${item2.order_goods_qty }</span> 개 <span> · </span>
														<span> <fmt:formatNumber
																value="${item2.goods_price*item2.order_goods_qty}"
																pattern="#,###" />
														</span> 원
														</a>
													</div>
												</div>
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${item.delivery_state=='cancel_order'}">
										</c:when>
										<c:when test="${item.delivery_state=='returning_goods'}">
										</c:when>
										<c:when test="${item.delivery_state=='exchange_goods'}">
										</c:when>
										<c:when test="${item.delivery_state=='delivering'}">
										</c:when>
	
										<c:otherwise>
											<div class="modi_state">
												<c:choose>
													<c:when test="${item.delivery_state=='delivery_prepared' }">
														<button
															onclick="fn_edit_order('${item.order_id}','cancel')"
															style="width: 150px;">주문취소</button>
													</c:when>
													<c:when
														test="${item.delivery_state=='finished_delivering' }">
														<button
															onClick="fn_edit_order('${item.order_id}', 'exchange')"
															style="width: 150px;">교환신청</button>
														<button
															onClick="fn_edit_order('${item.order_id}','return')"
															style="width: 150px;">반품신청</button>
													</c:when>
												</c:choose>
											</div>
										</c:otherwise>
									</c:choose>
								</div>


							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>

</div>


<script>
			
			//기간별 조회, fixedSearchPeriod값을 가지고 submit
			function search_order_history(fixedSearchPeriod) {
				var formObj = document.createElement("form");
				var i_fixedSearch_period = document.createElement("input");
				i_fixedSearch_period.name = "fixedSearchPeriod";
				i_fixedSearch_period.value = fixedSearchPeriod;
				formObj.appendChild(i_fixedSearch_period);
				document.body.appendChild(formObj);
				formObj.method = "get";
				formObj.action = "${contextPath}/mypage/listMyOrderHistory.do";
				formObj.submit();
			}
			
			//주문수정, option값에 따라 if문을 통해 submit한다.
			function fn_edit_order(order_id, option){
				var formObj=document.createElement("form");
				var i_order_id = document.createElement("input"); 
				 	i_order_id.name="order_id";
				    i_order_id.value=order_id;
					
				    formObj.appendChild(i_order_id);
				    document.body.appendChild(formObj); 
				    formObj.method="post";
				   
				    //취소
				    if(option == "cancel"){
				    	var answer=confirm("주문을 취소하시겠습니까?");
						if(answer==true){
							formObj.action="${contextPath}/mypage/cancelMyOrder.do";
							formObj.submit();
						}
				    }else if(option == "return"){
				    //반품
				    	var answer=confirm("반품신청 하시겠습니까?");
						if(answer==true){
				    	formObj.action="${contextPath}/mypage/returnMyOrder.do";
				    	formObj.submit();
						}
				    }else if(option == "exchange"){
				    //교환
				    	var answer=confirm("교환신청 하시겠습니까?");
						if(answer==true){
				    	formObj.action="${contextPath}/mypage/exchangeMyOrder.do";
				    	formObj.submit();
						}
				    }
				    	
				
			}
			
			//url에 따라서 버튼의 style을 변경
			if (window.location.href.includes("fixedSearchPeriod")) {
				//모든 뱃지 style 초기화
				const badges = document.querySelectorAll(".badge");
				for (b of badges){ b.classList.remove("active");}
				
				//url에 표시된 txt에 따른 style 변경
				if (window.location.href.includes("today")) {
					badges[0].classList.add("active");
				} else if (window.location.href.includes("one_month")) {
					badges[1].classList.add("active");
				}else if (window.location.href.includes("two_month")) {
					badges[2].classList.add("active");
				}else if (window.location.href.includes("three_month")) {
					badges[3].classList.add("active");
				}else if (window.location.href.includes("six_month")) {
					badges[4].classList.add("active");
				}
			
			}
			
		</script>