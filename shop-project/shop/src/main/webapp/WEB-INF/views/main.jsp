<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
<div id="wrap">
        <c:choose>
            <c:when test="${not empty user}">
                <%@ include file="include/loginAfterHeader.jsp" %>
            </c:when>
            <c:otherwise>
                <%@ include file="include/loginBeforeHeader.jsp" %>
            </c:otherwise>
        </c:choose>
    <div class="content">
			<div class="goods_cont">
				<h1 class="list">메인</h1>
				<div class="top_row">
					<c:forEach items="${list}" var="goods">
						<div class="img">
							<a href="goods/${goods.id}"><img
								src="${contextPath }/${goods.path}"></a>
							<div class="explanation">
								<a href="goods/${goods.id}"><div class="title">${goods.name}</div></a>
								<div class="priceOrLike">
									<div class="price">
										<fmt:formatNumber value="${goods.price }" type="number" groupingUsed="true" />원
									</div>
									<div class="like"><i class="fa-regular fa-heart"></i></div>
									<!-- 하트는 폰트어썸에서 가져올예정 -->
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>
