<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath }/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="sidebar">
		<div class="inner">
			<div class="xans-element- xans-layout xans-layout-logotop top_logo">
				<a href="${contextPath }/">로고다! &nbsp;</a>
			</div>
			<div class="top1">
				<div class="top_right">
					<div class="top_search">
						<form id="searchBarForm" name="" action="/product/search.html"
							method="get" target="_self" enctype="multipart/form-data">
							<input id="banner_action" name="banner_action" value=""
								type="hidden">
							<div class="xans-element- xans-layout xans-layout-searchheader">
								<input id="keyword" name="keyword" fw-filter="" fw-label="검색어"
									fw-msg="" class="inputTypeText" placeholder=""
									onmousedown="SEARCH_BANNER.clickSearchForm(this)" value=""
									type="text">
							</div>
						</form>
					</div>
					<div class="xans-element- xans-myshop xans-myshop-main left_wish">
						<a href="" class="wish_icon"> <span class="wish_count p_bg">
								<span class="xans_myshop_main_interest_prd_cnt">찜</span>
						</span>
						</a>
					</div>
					<div
						class="xans-element- xans-layout xans-layout-orderbasketcount left_cart">
						<a href="" class="cart_icon"> <span class="cart_count p_bg">장</span>
						</a>
					</div>
				</div>
			</div>
			<div class="top_login">
				<a href="${contextPath }/login"
					class="xans-element- xans-layout xans-layout-statelogoff">로그인</a> <a
					href="${contextPath }/join"
					class="xans-element- xans-layout xans-layout-statelogoff">회원가입</a>
				<div class="bt_mypage">
					<a href="">마이페이지 ∨</a>
					<div class="mypage_sub">
						<a href="">주문조회</a> <a href="">회원정보수정</a> <a href="">관심상품</a> <a
							href="">적립금</a> <a href="">나의게시물</a> <a href="">최근본상품</a>
					</div>
				</div>
			</div>
			<div id="category"
				class="xans-element- xans-layout xans-layout-category top_cate">
				<div>
					<ul>
						<li class="xans-record-"><a href="${contextPath }"><b><font
									color="#ef7b48">BEST 100</font></b></a></li>
						<li class="xans-record-"><a href="${contextPath }"><font
								color="red" class="z">9,900원💰</font></a></li>
						<li class="xans-record-"><a href="${contextPath }/outer">아우터</a></li>
						<li class="xans-record-"><a href="${contextPath }">상의</a></li>
						<li class="xans-record-"><a href="${contextPath }">하의</a></li>
						<li class="xans-record-"><a href="${contextPath }">원피스</a></li>
						<li class="xans-record-"><a href="${contextPath }">코디세트</a></li>
						<li class="xans-record-"><a href="${contextPath }">슈즈/백</a></li>
						<li class="xans-record-"><a href="${contextPath }">이너/잡화</a></li>
						<li class="xans-record-"><a href="${contextPath }">홈&amp;리빙</a></li>
						<li class="xans-record-"><a href="${contextPath }"><b>빠른배송</b>🚛</a></li>
						<li class="xans-record-"><a href="${contextPath }">프리미엄</a></li>
						<li class="xans-record-"><a href="${contextPath }">🕐품절임박</a></li>
					</ul>
					<div
						class="xans-element- xans-layout xans-layout-boardinfo top_board">
						<a href="" class="xans-record-">공지사항</a> <a href=""
							class="xans-record-">이벤트</a> <a href="" class="xans-record-">자주묻는
							질문</a> <a href="" class="xans-record-">리얼구매후기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>