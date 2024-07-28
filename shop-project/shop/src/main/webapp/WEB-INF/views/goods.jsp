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
		<c:choose>
			<c:when test="${not empty user}">
				<%@ include file="include/loginAfterHeader.jsp"%>
			</c:when>
			<c:otherwise>
				<%@ include file="include/loginBeforeHeader.jsp"%>
			</c:otherwise>
		</c:choose>
		<div class="page_container">
			<div class="page_img_box">
				<div id="carouselExampleIndicators"
					class="carousel slide page_img_box" data-ride="carousel"
					data-interval="3000">
					<ol class="carousel-indicators">
						<c:forEach var="img" items="${imgs}" varStatus="status">
							<li data-target="#carouselExampleIndicators"
								data-slide-to="${status.index}"
								class="${status.first ? 'active' : ''}"></li>
						</c:forEach>
					</ol>
					<div class="carousel-inner">
						<c:forEach var="img" items="${imgs}" varStatus="status">
							<div class="carousel-item ${status.first ? 'active' : ''}">
								<img class="d-block w-100" src="${contextPath}/${img.path}"
									alt="Slide ${status.index + 1}">
							</div>
						</c:forEach>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<!-- selectList써야함  -->
			<div class="page_content">
				<div class="page_cont">
					<h1 class="page_title">${list.name }</h1>
					<div class="page_type">색상 : ${list.colorType }</div>
					<div class="page_type">브랜드 : ${list.brandName }</div>
					<div class="page_type">
						<select class="form-select" aria-label="Default select example">
							<option selected>Open this select menu</option>
							<option value="1" title="${contextPath }/${list.path}">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
					</div>
					<div class="page_price">
						<fmt:formatNumber value="${list.price }" type="number" groupingUsed="true" /> 원
					</div>
					<div class="btn-container">
						<div class="btn-group">
							<form action="${contextPath}/cart" method="post" class="btn-form">
								<input type="hidden" name="goodsId" value="${list.id}">
								<input type="submit" value="장바구니" class="btn btn-cart">
							</form>
							<form action="${contextPath}/payment" method="post"
								class="btn-form">
								<input type="hidden" name="goodsId" value="${list.id}">
								<input type="submit" value="구매하기" class="btn btn-checkout">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="include/footer.jsp"%>
</body>
</html>
