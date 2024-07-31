<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>
<html>
<head>

</head>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<body>
	<div id="wrap">
	<c:set var="total" value="${total + oe.price*oe.goodsCount }" />
		<c:choose>
			<c:when test="${not empty user}">
				<%@ include file="include/loginAfterHeader.jsp"%>
			</c:when>
			<c:otherwise>
				<%@ include file="include/loginBeforeHeader.jsp"%>
			</c:otherwise>
		</c:choose>
		<div class="order-summary">
			<h1>주문 내역</h1>
				<div class="order-info">
					<p>
						<strong>주문 번호:</strong> ${oe.imp }
					</p>
					<p>
						<strong>주문 날짜:</strong> ${oe.purchaseDate }
					</p>
					<p>
						<strong>고객 이름:</strong> ${oe.name }
					</p>
					<p>
						<strong>배송 주소:</strong> ${oe.addr }
					</p>
				</div>

			<h2>상품 정보</h2>
			<table>
				<thead>
					<tr>
						<th>상품명</th>
						<th>수량</th>
						<th>단가</th>
						<th>합계</th>
					</tr>
				</thead>
			<!-- c:foreach써요 -->
			<c:forEach var="orders" items="${ordersList }">
				<tbody>
					<tr>
						<td>${orders.goodsName }</td>
						<td>${orders.goodsCount }개</td>
						<td><fmt:formatNumber value="${orders.price }" type="number" groupingUsed="true" />원</td>
						<td><fmt:formatNumber value="${orders.payPrice }" type="number" groupingUsed="true" />원</td>
					</tr>
				</tbody>
			</c:forEach>
			</table>

			<h2>결제 정보</h2>
			<div class="payment-info">
				<p>
					<strong>배송비:</strong> 무료
				</p>
				<p>
					<strong>할인:</strong> [할인]
				</p>
				<p>
					<strong>총 결제 금액:</strong> <fmt:formatNumber value="${total }" groupingUsed="true" />원
				</p>
			</div>
			<p class="contact-info">문의 사항이 있으시면 고객센터로 연락해 주세요.</p>
		</div>
	</div>
	<%@ include file="include/footer.jsp"%>
</body>
</html>
