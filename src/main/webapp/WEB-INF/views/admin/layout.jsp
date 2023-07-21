<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- intercepter에서 set한 회원정보에 따른 조회값  get -->
<c:set var="goodsLen" value="${sessionScope.goodsLen}" />
<c:set var="ordersLen" value="${sessionScope.ordersLen}" />
<c:set var="totalSales" value="${sessionScope.totalSales}" />
<!-- intercepter에서 set한 회원정보에 따른 조회값  get -->

<!-- 레이아웃 컨테이너  -->
<div class="container">
	<div class="mypageBox">관리자</div>
	<div class="mypageBox">
		<h5>상품</h5>

		<!-- 배송중 카운트 -->
		<span>${goodsLen }</span>
		<!-- 배송중 카운트 -->

	</div>
	<div class="mypageBox">
		<h5>회원</h5>

		<!-- 장바구니 카운트 -->
		<span>${ordersLen }</span>
		<!-- 장바구니 카운트 -->

	</div>
	<div class="mypageBox">
		<h5>총 매출</h5>

		<!-- 총 매출 -->
		<span><fmt:formatNumber value="${totalSales }" pattern="#,###"/></span>
		<!-- 총 매출 -->

	</div>

	<!-- side 메뉴 -->
	<div class="side">
		<b>관리자</b><br> <a href="#">상품관리</a><br> <a href="#">주문/배송관리</a><br>
		<a href="${contextPath }/admin/member/adminMemberMain.do">회원관리</a>
	</div>
	<!-- side 메뉴 -->
</div>
<!-- 레이아웃 컨테이너  -->


