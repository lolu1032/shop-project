
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
		<%@include file="include/loginBeforeHeader.jsp"%>
		<div class="container">
			<div class="form-wrapper">
				<h1>회원가입</h1>
				<form method="post" name="joinForm">
					<div class="space-y-2">
						<label for="id">아이디</label> <input id="id" placeholder="아이디"
							name="id" type="text">
						<div class="error">아이디는 5자 이상 12자 이하, 영문자로 시작해야 하며 영문자, 숫자,
							밑줄(_)만으로 만들어주세요</div>
							<div id="check"></div>
					</div>
					<div class="space-y-2">
						<label for="password">비밀번호</label> <input id="password"
							placeholder="비밀번호" type="password" name="password">
							<div class="error">비밀번호는 최소 5자 이상, 숫자, 대문자, 소문자가 포함되어야 합니다.</div>
					</div>
					<div class="space-y-2">
						<label for="confirm-password">비밀번호 확인</label> <input
							id="confirm-password" placeholder="비밀번호 확인" type="password"
							name="confirm_password">
					</div>
					<div class="space-y-2">
						<label for="name">이름</label> <input id="name" placeholder="이름"
							name="name">
							<div class="error">이름은 한글만 입력 가능합니다.</div>
					</div>
					<div class="space-y-2">
						<label for="phone">전화번호</label>
						<div class="phone-inputs">
							<input id="phone" placeholder="010-1234-1234" maxlength="13"
								name="phone">
						</div>
								<div class="error">전화번호는 010-1234-5678 형식으로 입력해주세요.</div>
					</div>
					<div class="space-y-2">
						<label for="email">이메일</label> <input id="email" placeholder="이메일"
							name="email">
							<div class="error">이메일은 example@naver.com 형식으로 쳐주세요.</div>
					</div>
					<div class="submit-button-wrapper">
						<button type="button" onclick="check(event)">회원가입</button>
					</div>
				</form>
				<c:if test="${not empty error}">
					<div class="error-message">${error}</div>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="include/footer.jsp"%>
</body>
<script>
$('#id').focusout(function() {
    let id = $('#id').val();

    $.ajax({
        url: "joinForm",
        type: "POST",
        data: { id: id },
        dataType: "json",
        success: function(result) {
            let resultInt = parseInt(result, 10);
            if (resultInt == 0) {
                $("#check").html('사용할 수 있는 아이디입니다.');
                $("#check").css('color', 'green');
            } else {
                $("#check").html('사용할 수 없는 아이디입니다.');
                $("#check").css('color', 'red');
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX Error:", status, error);
            console.error("Response:", xhr.responseText);
            alert("서버요청실패");
        }
    });
});
	function check(event) {
		// form의 새로고침을 방지하기위해 event.preventDefault사용
		event.preventDefault();
		// 회원가입 유효성검사
		let id = document.getElementById("id");
		let pw = document.getElementById("password");
		let confirm_pw = document.getElementById("confirm-password");
		let name = document.getElementById("name");
		let phone = document.getElementById("phone");
		let email = document.getElementById("email");

		if (id.value == "") {
			alert("아이디를 입력해주세요");
			id.focus();
			return false;
		} else if (id.value.length < 4) {
			alert("4글자 이상 아이디를 입력해주세요");
			id.focus();
			return false;
		} else if (pw.value == "") {
			alert("비밀번호를 입력해주세요");
			pw.focus();
			return false;
		} else if (pw.value.length < 4) {
			alert("4글자이상 비밀번호를 입력해주세요");
			pw.focus();
			return false;
		} else if (confirm_pw.value == "") {
			alert("비밀번호를 입력해주세요");
			confirm_pw.focus();
			return false;
		} else if (confirm_pw.value != pw.value) {
			alert("비밀번호가 일치하지 않습니다");
			confirm_pw.focus();
			return false;
		} else if (name.value == "") {
			alert("이름을 입력해주세요");
			name.focus();
			return false;
		} else if (phone.value == "") {
			alert("전화번호를 입력해주세요");
			phone.focus();
			return false;
		} else if (email.value == "") {
			alert("이메일을 입력해주세요");
			email.focus();
			return false;
		}
		document.joinForm.submit();
	}
</script>
</html>
