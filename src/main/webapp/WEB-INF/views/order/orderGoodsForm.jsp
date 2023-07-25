<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- 주문자 휴대폰 번호 -->
<c:set var="orderer_hp" value="" />
<!-- 최종 결제 금액 -->
<c:set var="final_total_order_price" value="0" />

<!-- 총주문 금액 -->
<c:set var="total_order_price" value="0" />
<!-- 총 상품수 -->
<c:set var="total_order_goods_qty" value="0" />
<!-- 총 배송비 -->
<c:set var="total_delivery_price" value="3000" />


<div id="order_box">
	<div>
		<form name="form_order">
			<div>
				<h2>주문자 정보</h2>
				<label>이름 <input type="text" value="${memberInfo.member_name }"
					name="member_name" placeholder="이름을 입력해 주세요." required>
				</label> 
				<label>연락처 <input type="text" value="${memberInfo.hp1 }"
					name="hp1" placeholder="- 없이 01000000000" required>
				</label>
			</div>
			<div>
				<div class="checked_box">
					<h2>배송지 정보</h2>
					<p>
						<input type="checkbox" onclick="sameInfo(this)"> 주문자와 동일
						<input type="checkbox"> 배송지 저장
					</p>
				</div>
	
				<label>수령인 <input type="text" name="receiver_name" id="receiver_name"
					placeholder="이름을 입력해 주세요." required>
				</label> <label>연락처 <input type="text" name="receiver_hp1" id="receiver_hp1"
					placeholder="- 없이 01000000000" required>
				</label>
				<div>
					<label>배송지
						<p class="zipbox">
							<!-- 우편번호  -->
							<input type="text" placeholder="우편번호" id="zipcode" name="zipcode" required>
							<!-- 다음 우편번호 검색 -->
							<a href="javascript:execDaumPostcode()">우편번호검색</a>
						</p>
						<input type="text" id="address" placeholder="주소" name="address" required>
						<input type="text" id="subAddress" name="subAddress" required>
					</label>
				</div>
			</div>
			<div>
				<h2>결제방법 선택</h2>
				<table>
					<tr>
						<td>
							<input type="radio" id="pay_method" name="pay_method" value="신용카드" checked>신용카드 &nbsp;&nbsp;&nbsp; 
							<input type="radio" id="pay_method" name="pay_method" value="휴대폰결제">휴대폰 결제 &nbsp;&nbsp;&nbsp;
						   	<input type="radio" id="pay_method" name="pay_method" value="카카오페이(간편결제)">카카오페이(간편결제) &nbsp;&nbsp;&nbsp;
						   	<input type="radio"  id="pay_method" name="pay_method" value="직접입금">직접입금&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td class="card_select">
							<strong>카드 선택<strong>:&nbsp;&nbsp;&nbsp;
							  <select id="card_com_name" name="card_com_name" onchange="selectValue(this, this.value)">
									<option value="삼성" selected>삼성</option>
									<option value="하나SK">하나SK</option>
									<option value="현대">현대</option>
									<option value="KB">KB</option>
									<option value="신한">신한</option>
									<option value="롯데">롯데</option>
									<option value="BC">BC</option>
									<option value="시티">시티</option>
									<option value="NH농협">NH농협</option>
							</select><br>
							<strong>할부 기간:<strong>  &nbsp;&nbsp;
							<select id="card_pay_month" name="card_pay_month" onchange="selectValue(this, this.value)">
									<option value="일시불" selected>일시불</option>
									<option value="2개월">2개월</option>
									<option value="3개월">3개월</option>
									<option value="4개월">4개월</option>
									<option value="5개월">5개월</option>
									<option value="6개월">6개월</option>
							</select>
						</td>
					</tr>
					<tr id="tr_pay_phone" style="visibility:hidden">
					  <td>
					  	<strong>휴대폰 번호 입력: <strong>
					  	<input  type="text" size="5" value=""  id="pay_order_hp_num" name="pay_order_hp_num" />-
					  </td>
					</tr>
				</table>
			</div>	
		</form>
		<button onclick="fn_process_pay_order()">결제하기</button>
		<button onclick="location.href='${contextPath}/main/main.do'">쇼핑 계속하기</button>
	</div>
	

	<div class="order_div">
		<h2>주문 정보</h2>
		<div class="order_goods">
			<h4>주문상품</h4>
			<c:forEach var="item" items="${myOrderList }">
				<div>
					<!-- 주문 상품  -->
					<div>
						<a
							href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
							<div class="detail_info">
								<img
									src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"
									style="width: 64px; height: 64px">
								<div>
									<p>${item.goods_title }</p>
									<p>
										<span>${item.order_goods_qty }</span>개 <span> · </span> <span>
											<fmt:formatNumber
												value="${item.goods_price*item.order_goods_qty}"
												pattern="#,###" />
										</span> <span class="goods_price d-none">${item.goods_price*item.order_goods_qty}</span>
										원
									</p>
								</div>
							</div>
						</a>
					</div>
				</div>
				<!-- 상품 가격정보 -->
								<c:set var="total_order_price"
									value="${total_order_price+ item.goods_price* item.order_goods_qty}" />
								<c:set var="total_order_goods_qty"
									value="${total_order_goods_qty+item.order_goods_qty }" />
								<c:set var="final_total_order_price"
									value="${final_total_order_price+ item.goods_price* item.order_goods_qty}" />
								<!-- 상품 가격정보 -->
			</c:forEach>
		</div>
		<div class="order_info">
			<h4>주문정보</h4>
			<p>
				총 수량 <span>${total_order_goods_qty } 개</span>
			</p>
			<p>
				총 상품금액 <span><fmt:formatNumber value="${total_order_price }" pattern="#,###"/> 원</span>
			</p>
			<p>
				총 배송비 <span><fmt:formatNumber value="${total_delivery_price }" pattern="#,###"/> 원</span>
			</p>
			<c:set var="final_total_order_price" value="${final_total_order_price+total_delivery_price }"/>
			<p>
				총 주문 금액 <span><fmt:formatNumber value="${final_total_order_price }" pattern="#,###"/> 원</span>
			</p>
		</div>
	</div>
</div>

<script>

	//select박스가 체크되었을때 input에 반영함.
	function selectValue(selectBox, value){
		var input = selectBox.nextElementSibling
		input.setAttribute("value", value);
	} 


	//다음 주소 찾기
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('address').value = data.address;
			}
		}).open();
	}
	
	
	
	function sameInfo(sameInfo) {
		
		if(sameInfo.checked == true){
			$("#receiver_name").prop("value","${memberInfo.member_name}");
			$("#receiver_hp1").prop("value","${memberInfo.hp1}");
			$("#zipcode").prop("value","${memberInfo.zipcode}");
			$("#address").prop("value","${memberInfo.address}");
			$("#subAddress").prop("value","${memberInfo.subAddress}");
		}else if(sameInfo.checked==false){
			$("#receiver_name").prop("value","");
			$("#receiver_hp1").prop("value","");
			$("#zipcode").prop("value","");
			$("#address").prop("value","");
			$("#subAddress").prop("value","");
			 
		}
		
		
	}
	
	//pay_method
	// 라디오 버튼 요소 선택
	function pay_method(){
		var radios = document.getElementsByName('pay_method');
		// 선택된 라디오 버튼의 값을 가져오기
		for (var i = 0; i < radios.length; i++) {
		  if (radios[i].checked) {
		    var selectedValue = radios[i].value;
		    return selectedValue;
		    break;
		  }
		}	
	}
	
	
	// 분리되어있는 배송지 정보 
	let delivery_address;
	var i_zipcode = document.getElementById("zipcode");
	var i_address = document.getElementById("address");
	var i_subAddress = document.getElementById("subAddress");
	const inputs = document.querySelectorAll("input[required]");
	
	var formObj = document.createElement("form");
	formObj.setAttribute("id", "form_basic");
	
	/* 최종결제 */
	function fn_process_pay_order(){
		
		let reqBool = true;
		inputs.forEach(input => {
			if(!input.value){
				reqBool=false;
			}
		});
		if(reqBool){
			if(!confirm("결제하시겠습니까?")){
				alert("결제가 취소되었습니다.");
			}else{
				// 배송지 통합
				delivery_address = "우편번호:" + i_zipcode.value + "<br>" + "주소:"
				+ i_address.value + "<br>" + "상세주소:"
				+ i_subAddress.value;
				
				//수령자 이름
				var i_receiver_name = document.createElement("input");
				i_receiver_name.name = "receiver_name";
				i_receiver_name.value = document.getElementById("receiver_name").value;
				formObj.appendChild(i_receiver_name);
				
				//수령자 핸드폰
				var i_receiver_hp1 = document.createElement("input");
				i_receiver_hp1.name = "receiver_hp1";
				i_receiver_hp1.value = document.getElementById("receiver_hp1").value;
				formObj.appendChild(i_receiver_hp1);
				
				//배송정보
				var i_delivery_address = document.createElement("input");
				i_delivery_address.name = "delivery_address";
				i_delivery_address.value = delivery_address;
				formObj.appendChild(i_delivery_address);
				
				//결제방법
				var i_pay_method = document.createElement("input");
				i_pay_method.name = "pay_method";
				i_pay_method.value= pay_method();
				formObj.appendChild(i_pay_method);
				
				//카드사선택
				var i_card_com_name = document.createElement("input");
				i_card_com_name.name="card_com_name";
				i_card_com_name.value=document.getElementById("card_com_name").value;
				formObj.appendChild(i_card_com_name);
				
				//할부기간
				var i_card_pay_month = document.createElement("input");
				i_card_pay_month.name="card_pay_month";
				i_card_pay_month.value=document.getElementById("card_pay_month").value;
				formObj.appendChild(i_card_pay_month);
				
				//핸드폰결제
			 	var i_pay_order_hp_num = document.createElement("input");
				i_pay_order_hp_num.name="pay_order_hp_num"; 
			    i_pay_order_hp_num.value=document.getElementById("pay_order_hp_num").value;
			    formObj.appendChild(i_pay_order_hp_num); 
				
			    document.body.appendChild(formObj); 
			    formObj.method="post";
			    formObj.action="${contextPath}/order/payToOrderGoods.do";
			    formObj.submit();
			}
			
			
		}else{
			alert("입력하신 정보가 없거나 올바르지않습니다.");
		}
		
	}	
	
	
	
</script>

