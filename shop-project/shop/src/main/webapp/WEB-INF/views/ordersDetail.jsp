<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
</head>
<style>
.swiper-slide {
	margin: 0 auto;
	padding: 5px;
}

.order-summary {
	width: 650px;
	height: 650px;
}
</style>
<body>
	<div id="wrap">
		<c:choose>
			<c:when test="${not empty user}">
				<%@ include file="include/loginAfterHeader.jsp"%>
			</c:when>
			<c:otherwise>
				<%@ include file="include/loginBeforeHeader.jsp"%>
			</c:otherwise>
		</c:choose>
		<div class="swiper">
			<div class="swiper-wrapper">
				<c:forEach var="orders" items="${ordersList}">
					<div class="swiper-slide">
						<div class="order-summary">
							<h1>주문 내역</h1>
							<div class="order-info">
								<p>
									<strong>주문 번호:</strong> ${orders.imp}
								</p>
								<p>
									<strong>주문 날짜:</strong> ${orders.purchaseDate}
								</p>
								<p>
									<strong>고객 이름:</strong> ${orders.name}
								</p>
								<p>
									<strong>배송 주소:</strong> ${orders.addr}
								</p>
							</div>
							<h2>상품 정보</h2>
							<table class="table">
								<thead>
									<tr>
										<th>상품명</th>
										<th>수량</th>
										<th>단가</th>
										<th>합계</th>
									</tr>
								</thead>
								<tbody>
									<!-- 상품 정보 -->
									<c:choose>
										<c:when test="${not empty ordersDetailMap[orders.imp]}">
											<c:forEach var="detail"
												items="${ordersDetailMap[orders.imp]}">
												<tr>
													<td>${detail.name}</td>
													<td>${detail.count}개</td>
													<td><fmt:formatNumber value="${detail.price}"
															type="number" groupingUsed="true" />원</td>
													<td><fmt:formatNumber
															value="${detail.price * detail.count}" type="number"
															groupingUsed="true" />원</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="4">상품 정보가 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
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
									<strong>총 결제 금액:</strong>
									<fmt:formatNumber value="${orders.payPrice}"
										groupingUsed="true" />
									원
								</p>
							</div>
							<p class="contact-info">문의 사항이 있으시면 고객센터로 연락해 주세요.</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="swiper-pagination"></div>
		</div>
	</div>
	<%@ include file="include/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var swiper = new Swiper('.swiper', {
				slidesPerView : 1,
				spaceBetween : 10,
				pagination : {
					el : '.swiper-pagination',
					clickable : true,
				},
				navigation : {
					nextEl : '.swiper-button-next',
					prevEl : '.swiper-button-prev',
				},
			});
		});
	</script>
</body>
</html>
