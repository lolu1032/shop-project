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
				<c:choose>
					<c:when test="${not empty sessionScope.login }">
						<div
							class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
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
											<strong>이름 : </strong> <input type="text" id="last_name"
												name="last_name" class="form-control" value="${sessionScope.user.name }" disabled="disabled" />
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<strong>전화번호 : </strong>
										</div>
										<div class="col-md-12">
											<input type="text" id="phone_number" name="phone_number"
												class="form-control" value="${sessionScope.user.number }" disabled="disabled" />
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<strong>이메일 :</strong>
										</div>
										<div class="col-md-12">
											<input type="email" id="email_address" name="email_address"
												class="form-control" value="${sessionScope.user.email }" disabled="disabled"/>
										</div>
									</div>
								</div>
					</c:when>
					<c:otherwise>
					<div
						class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
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
										<strong>이름 : </strong> <input type="text" id="last_name"
											name="last_name" class="form-control" placeholder="이름" />
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<strong>전화번호 : </strong>
									</div>
									<div class="col-md-12">
										<input type="text" id="phone_number" name="phone_number"
											class="form-control" placeholder="010-1234-1234" />
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<strong>이메일 :</strong>
									</div>
									<div class="col-md-12">
										<input type="text" id="email_address" name="email_address"
											class="form-control" placeholder="example@naver.com"
											onblur="checkEmail()" />
										<div id="check"></div>
									</div>
								</div>
							</div>
					</c:otherwise>
				</c:choose>
				<input type="text" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()"
					value="우편번호 찾기"><br> <input type="text"
					id="sample6_address" placeholder="주소"><br> <input
					type="text" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목">
			</div>
			<div class="panel panel-info">
				<div class="panel-heading">
					<span>
						<div class="panel-name">결제방법</div>
					</span>
				</div>
				<!-- 결제 부근 포트원 쓸 예정 첫단 -->
				<div class="form-group">
					<div class="col-md-12">
						<label class="pay"><input type="radio"
							name="payment_method" value="kakaopay" checked> 카카오페이</label> <label
							class="pay"> <input type="radio" name="payment_method"
							value="tosspay"> 토스페이
						</label> <label class="pay"><input type="radio"
							name="payment_method" value="payco"> 페이코</label> <label
							class="pay"><input type="radio" name="payment_method"
							value="smilpay"> 스마일페이</label> <label class="pay"><input
							type="radio" name="payment_method" value="daou"> 키움페이</label>
					</div>
				</div>
				<div class="btn">
					<input type="button" class="pay-btn" id="money-btn" value="결제하기">
				</div>
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$('#email_address').focusout(function(){
		let email = $('#email_address').val();
		
		$.ajax({
			url: "checkEmail",
			type: "post",
			data: {email: email},
			dataType: "text",
	        success: function(result) {
	            if (result == "success") {
	                $("#check").html('사용할 수 있는 이메일입니다.');
	                $("#check").css('color', 'green');
	            } else if (result == "duplicationEmail") {
	                $("#check").html('이미 사용 중인 이메일입니다.');
	                $("#check").css('color', 'red');
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("AJAX Error:", status, error);
	            console.error("Response:", xhr.responseText);
	            alert("서버 요청 실패");
	        }
	    });
	});
	var IMP = window.IMP;
	IMP.init("imp55461844");   /* imp~ : 가맹점 식별코드*/
	const paymentMethod = document.querySelector('input[name="payment_method"]:checked').value;
    $('#money-btn').click(function() {
        const lastName = document.getElementById('last_name');
        const phoneNumber = document.getElementById('phone_number');
        const email = document.getElementById('email_address');
        const postCode = document.getElementById('sample6_postcode');
        const detailAddress = document.getElementById('sample6_detailAddress');
        const addr = document.getElementById('sample6_address');
        // 빈 문자열 체크 및 경고 메시지 표시
      	if (!lastName.value) {
            alert("이름을 써주세요");
            lastName.focus();
            return false;
        } else if (!phoneNumber.value) {
            alert("전화번호를 써주세요");
            phoneNumber.focus();
            return false;
        } else if (!email.value) {
            alert("이메일을 써주세요");
            email.focus();
            return false;
        }
    	IMP.request_pay({
    		pg: paymentMethod,
    		pay_method: 'card',
    		name: "쇼오핑몰",
    		merchant_uid: 'merchant_' + new Date().getTime(),

    		amount: `${total}`,
            buyer_email: email.value, // 사용자가 입력한 이메일
            buyer_name: lastName.value, // 사용자가 입력한 이름
            buyer_tel: phoneNumber.value, // 사용자가 입력한 전화번호
            buyer_addr : postCode.value,
    	}, async function(rsp) {
    		console.log(rsp);
    		
    		 //결제 성공 시
    		if (rsp.success) {
    			var msg = '결제가 완료되었습니다.';
                    alert(msg);
    			try {
                    // 두 개의 AJAX 요청을 순차적으로 처리
                    await $.ajax({
                        type: "POST",
                        url: 'paymentPay',
                        data: {
                            amount: `${total}`, // total은 실제 변수로 사용
                            imp_uid: rsp.imp_uid,
                            merchant_uid: rsp.merchant_uid,
                            buyer_email: email.value,
                            buyer_name: lastName.value,
                            buyer_tel: phoneNumber.value,
                            buyer_addr: addr.value + " (" + postCode.value + ") " + detailAddress.value,
                            username: `${usernames}`, 
                            goodsId: `${goodsId}` 
                        }
                    });

                    await $.ajax({
                        type: "get",
                        url: "ordersDetail",
                        data: {
                            username: `${usernames}` 
                        }
                    });

                    window.location.href = '/dong'; // 페이지 이동

                } catch (error) {
                    alert('서버 요청 처리 중 오류가 발생했습니다.');
                    console.error(error);
                }
    		} else {
    			var msg = '결제에 실패하였습니다.';
    			msg += '에러내용 : ' + rsp.error_msg;
	    		 alert(msg);
    		}
        });
    });
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