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
<link rel="stylesheet" href="${contextPath }/resources/css/payment.css">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container wrapper">
		<div class="row cart-head">
			<div class="container">
				<div class="row">
					<p></p>
				</div>
				<div class="row">
					<div style="display: table; margin: auto;">
						<span class="step step_complete"> <a
							href="${contextPath }/cart" class="check-bc">Cart</a> <span
							class="step_line step_complete"> </span> <span
							class="step_line backline"> </span>
						</span> <span class="step step_complete"> <a
							href="${contextPath }" class="check-bc">돌아가기</a> <span
							class="step_line "> </span> <span class="step_line step_complete"> </span>
						</span> <span class="step_thankyou check-bc step_complete">Thank
							you</span>
					</div>
				</div>
				<div class="row">
					<p></p>
				</div>
			</div>
		</div>
		<div class="row cart-body">
			<div class="form-horizontal">
				<div
					class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">
					<!--REVIEW ORDER-->
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="heading-name">장바구니</div>
						</div>
						<div class="panel-body">
							<!-- foreach시작 -->
							<c:forEach var="cart" items="${cart }">
								<c:set var="total" value="${total + cart.price*cart.count }" />
								<div class="form-group">
									<div class="col-sm-3 col-xs-3">
										<img class="img-responsive" src="${contextPath }/${cart.path}" />
									</div>
									<div class="col-sm-6 col-xs-6">
										<div class="col-xs-12">${cart.name }</div>
										<div class="col-xs-12">
											<small>개수 : <span>${cart.count }</span></small>
										</div>
									</div>
									<div class="col-sm-3 col-xs-3 text-right">
										<h6>
											<span> <fmt:formatNumber value="${cart.price }"
													type="number" groupingUsed="true" />원
											</span>
										</h6>
									</div>
								</div>
								<div class="form-group">
									<hr />
								</div>
							</c:forEach>
							<!-- foreach 끝단 -->
							<div class="form-group">
								<div class="col-xs-12">
									<strong>총금액</strong>
									<div class="pull-right">
										<span> <fmt:formatNumber value="${total }"
												type="number" groupingUsed="true" />원
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--장바구니-->
				</div>
				<!-- 결제 시작부 -->
				<div
					class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
					<!--SHIPPING METHOD-->
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="panel-name">결제</div>
						</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-md-12">
									<h4>결제 정보</h4>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-6 col-xs-12">
									<strong>성 : </strong> <input type="text" name="first_name"
										class="form-control" value="" />
								</div>
								<div class="span1"></div>
								<div class="col-md-6 col-xs-12">
									<strong>이름 : </strong> <input type="text" name="last_name"
										class="form-control" value="" />
								</div>
							</div>
							<!-- 주소부분 다음 주소api로 날릴예정 -->
							<input type="text" id="sample6_postcode" placeholder="우편번호">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br> 
							<input type="text" id="sample6_address" placeholder="주소"><br> 
							<input type="text" id="sample6_detailAddress" placeholder="상세주소">
							<input type="text" id="sample6_extraAddress" placeholder="참고항목">
							<!-- 끝단 -->
							<div class="form-group">
								<div class="col-md-12">
									<strong>전화번호 :</strong>
								</div>
								<div class="col-md-12">
									<input type="text" name="phone_number" class="form-control"
										value="" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<strong>이메일 :</strong>
								</div>
								<div class="col-md-12">
									<input type="text" name="email_address" class="form-control"
										value="" />
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading">
							<span><i class="glyphicon glyphicon-lock"></i></span> Secure
							Payment
						</div>
						<!-- 결제 부근 포트원 쓸 예정 첫단 -->
						<div class="form-group">
							<div class="col-md-12">
								<strong class="payment-title">결제 방법 :</strong> 
								<label><input type="radio" name="payment_method" value="kakaopay" checked>카카오페이</label> 
								<label> <input type="radio" name="payment_method" value="tosspay">토스페이</label>
								<label><input type="radio" name="payment_method" value="payco">페이코</label>
								<label><input type="radio" name="payment_method" value="smilpay">스마일페이</label>
								<label><input type="radio" name="payment_method" value="daou">키움페이</label>
							</div>
						</div>
						<button onclick="onClickPay()">결제하기</button>
					</div>
				</div>
				<!--결제 끝단-->
			</div>

		</div>
	</div>
	<div class="row cart-footer"></div>
	</div>
</body>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
const onClickPay = async () => {
    const IMP = window.IMP; // Iamport 객체 접근
    IMP.init("imp55461844"); // 가맹점 식별키

    // 선택된 결제 방법 가져오기
    const paymentMethod = document.querySelector('input[name="payment_method"]:checked').value;

    // 결제 요청
    IMP.request_pay({
        pg: paymentMethod, // 선택된 결제 방법
        pay_method: 'card', // 결제 방법
        merchant_uid: "order_no_0001", // 주문 번호
        name: '주문명:결제테스트',
        amount: parseFloat(${total}), // 총 금액
    }, function (rsp) {
        if (rsp.success) {
            // [1] 서버단에서 결제정보 조회를 위해 imp_uid 전달하기
            jQuery.ajax({
                url: "/payments/complete", // 서버의 결제 확인 엔드포인트
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify({
                    imp_uid: rsp.imp_uid
                    // 기타 필요한 데이터가 있으면 추가 전달
                })
            }).done(function(data) {
                // [2] 서버에서 REST API로 결제정보 확인 및 서비스 루틴이 정상적인 경우
                if (data.success) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '\n고유ID : ' + rsp.imp_uid;
                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                    msg += '\n결제 금액 : ' + rsp.paid_amount;
                    msg += '\n카드 승인번호 : ' + rsp.apply_num;

                    alert(msg);
                    window.location.href = '${contextPath}/thankyou'; // 결제 완료 후 이동할 페이지
                } else {
                    // [3] 아직 제대로 결제가 되지 않았습니다.
                    // [4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소 처리하였습니다.
                    alert('결제 처리에 실패하였습니다. 서버에서 문제가 발생하였습니다.');
                }
            }).fail(function(jqXHR, textStatus, errorThrown) {
                console.error('결제 처리 중 서버 오류:', textStatus, errorThrown);
                alert('결제 처리 중 오류가 발생하였습니다.');
            });
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '\n에러내용 : ' + rsp.error_msg;

            alert(msg);
        }
    });
}

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === 'R') {
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
</html>
