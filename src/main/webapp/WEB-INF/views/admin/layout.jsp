<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<!-- 레이아웃 컨테이너  -->
	<div class="container">
		<div class="mypageBox">
			관리자
		</div>
		<div class="mypageBox">
			<h5>상품</h5>
			
			<!-- 배송중 카운트 -->
			<span>0</span>
			<!-- 배송중 카운트 -->
			
		</div>
		<div class="mypageBox">
			<h5>회원</h5>
			
			<!-- 장바구니 카운트 -->
			<span>0</span>
			<!-- 장바구니 카운트 -->
			
		</div>
		<div class="congrat">
			<h5>${memInfo.member_name }님 환영합니다!</h5>
		</div>
			
		<!-- side 메뉴 -->
		<div class="side">
			<b>관리자</b><br>
			<a href="#">상품관리</a><br>
			<a href="#">주문/배송관리</a><br>
			<a href="#">회원관리</a>
		</div>
		<!-- side 메뉴 -->
	</div> 
	<!-- 레이아웃 컨테이너  -->
	
	
</body>
</html>