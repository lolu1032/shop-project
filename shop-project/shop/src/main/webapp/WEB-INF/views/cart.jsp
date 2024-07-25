<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>Home</title>
</head>
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
		<section class="h-100">
			<div class="container h-100 py-5">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-10">

						<div
							class="d-flex justify-content-between align-items-center mb-4">
							<h3 class="fw-normal mb-0">장바구니</h3>
						</div>

						<div class="card rounded-3 mb-4">
							<!-- Carts.goods_id로 goods, img 조인해서 값들 가져와야할거같음 -->
							<!-- 여기서부터 c:foreach쓰면 될거같음 -->
							<div class="card-body p-4">
								<div
									class="row d-flex justify-content-between align-items-center">
									<div class="col-md-2 col-lg-2 col-xl-2">
										<!-- 이쪽 이미지 -->
										<img
											src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
											class="img-fluid rounded-3" alt="Cotton T-shirt">
									</div>
									<!-- 상품이름 -->
									<div class="col-md-3 col-lg-3 col-xl-3">
										<p class="lead fw-normal mb-2">Basic T-shirt</p>
										<p>
											<!-- 색깔 -->
											</span>M <span class="text-muted">Color: </span>Grey
										</p>
									</div>
									<div class="col-md-3 col-lg-3 col-xl-2 d-flex">
									<!-- 버튼 없애고 form1을 키우거나 css로 보이게 꾸미거나 둘 중 하나 -->
									<!-- -버튼도 안보임 수정필요 -->
										<button data-mdb-button-init data-mdb-ripple-init
											class="btn btn-link px-2"
											onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
											<i class="fas fa-minus"></i>
										</button>

										<input id="form1" min="0" name="quantity" value="2"
											type="number" class="form-control form-control-sm" />
											<!-- +버튼 안보임 수정필요 -->
										<button data-mdb-button-init data-mdb-ripple-init
											class="btn btn-link px-2"
											onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
											<i class="fas fa-plus"></i>
										</button>
									</div>
									<div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
										<h5 class="mb-0">$499.00</h5>
									</div>
									<div class="col-md-1 col-lg-1 col-xl-1 text-end">
										<a href="#!" class="text-danger"><i
											class="fas fa-trash fa-lg"></i></a>
									</div>
								</div>
							</div>
							<!-- foreach끝단 -->
						</div>

						<div class="card mb-5">
							<div class="card-body p-4">

								<div class="float-end">
									<p class="mb-0 me-5 d-flex align-items-center">
										<span class="small text-muted me-2">Order total:</span>
										<!-- 이쪽 부근은 상품의 총 가격을 넣기 -->
										<spanclass ="leadfw-normal">$799</span>
									</p>
								</div>

							</div>
						</div>

						<div class="d-flex justify-content-end">
							<button type="button" data-mdb-button-init data-mdb-ripple-init
								class="btn btn-light btn-lg me-2"
								onclick="location.href='${contextPath}'">계속 쇼핑하기</button>
							<button type="button" data-mdb-button-init data-mdb-ripple-init
								class="btn btn-primary btn-lg">구매하기</button>
						</div>

					</div>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="include/footer.jsp"%>
</body>
</html>
