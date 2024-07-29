<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 숫자 100,000단위로 끊기위해 추가 -->
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<html>
<head>
<title>Home</title>
</head>
<link rel="stylesheet" href="${contextPath }/resources/css/payment.css">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<body>
	<button>결제하기</button>
</body>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
IMP.init("imp55461844");
const button = document.querySelector("button");

const onClickPay = async () => {
	IMP.request_pay({
	    pg : 'kakaopay',
	    pay_method : 'card', //생략 가능
	    merchant_uid: "order_no_0001", // 상점에서 관리하는 주문 번호
	    name : '주문명:결제테스트',
	    amount : 14000,
})
}


button.addEventListener("click",onClickPay)
</script>
</html>
