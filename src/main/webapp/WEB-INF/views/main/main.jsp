<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<script defer src="${contextPath }/resources/js/slide.js" type="text/javascript"></script>
<body>
	<div id="slide">
		<ul>
			<li><a href="#"><img alt="배너1" src="${contextPath}/resources/image/main_banner01.jpg"></a></li>
			<li><a href="#"><img alt="배너2" src="${contextPath}/resources/image/main_banner02.jpg"></a></li>
			<li><a href="#"><img alt="배너3" src="${contextPath}/resources/image/main_banner03.jpg"></a></li>
			<li><a href="#"><img alt="배너4" src="${contextPath}/resources/image/main_banner04.jpg"></a></li>
		</ul>
			
		<a class="btn_left" data-direction="-1" href="#">
			<img alt="왼쪽 슬라이드" src="${contextPath}/resources/image/arrow_back.svg">
		</a>
		<a class="btn_right" data-direction="1" href="#">
			<img alt="오른쪽 슬라이드" src="${contextPath}/resources/image/arrow_forward.svg">
		</a>
		<div class="button"></div>
	</div>
	
	<div id="best_goods">
		<h2>인기 굿즈</h2>
		<hr>
	</div>
	
	<div id="new_goods">
		<h2>신규 굿즈</h2>
		<hr>
	</div>
	

</body>
</html>