<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>
<html>
<head>

</head>
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
		<div class="login-container">
			<h1>비회원 조회</h1>
			<form action="#" method="post">
				<label for="email">이메일:</label> <input type="email" id="email"
					name="email" required>

				<button type="submit">비회원 조회</button>
			</form>
			<c:if test="${not empty error}">
				<div class="error-message">${error}</div>
			</c:if>
		</div>
	</div>
	<%@ include file="include/footer.jsp"%>
</body>
</html>
