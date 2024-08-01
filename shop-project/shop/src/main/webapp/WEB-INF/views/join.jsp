
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
							name="id" type="text" value="${id }">
							<c:if test="${not empty loginError }"><div class="error">${loginError }</div></c:if>
							<div id="check"></div>
					</div>
					<div class="space-y-2">
						<label for="password">비밀번호</label> <input id="password"
							placeholder="비밀번호" type="password" name="password" value="${password }">
							<c:if test="${not empty pwError }"><div class="error">${pwError }</div></c:if>
					</div>
					<div class="space-y-2">
						<label for="confirm-password">비밀번호 확인</label> <input
							id="confirm-password" placeholder="비밀번호 확인" type="password"
							name="confirm_password" value="${confirm_password }">
					</div>
					<div class="space-y-2">
						<label for="name">이름</label> <input id="name" placeholder="이름"
							name="name" value="${name }">
							<c:if test="${not empty nameError }"><div class="error">${nameError }</div></c:if>
					</div>
					<div class="space-y-2">
						<label for="phone">전화번호</label>
						<div class="phone-inputs">
							<input id="phone" placeholder="010-1234-1234" maxlength="13"
								name="phone" value="${phone }">
						</div>
						<c:if test="${not empty numberError }"><div class="error">${numberError }</div></c:if>
					</div>
					<div class="space-y-2">
						<label for="email">이메일</label> <input id="email" placeholder="이메일" type="email"
							name="email" value="${email }">
							<c:if test="${not empty emailError }"><div class="error">${emailError }</div></c:if>
							<c:if test="${not empty checkEmail }"><div class="error">${checkEmail }</div></c:if>
					</div>
					<div class="submit-button-wrapper">
						<button type="button" onclick="check(event)">회원가입</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="include/footer.jsp"%>
</body>
<script>
		let id = document.getElementById("id");
		let pw = document.getElementById("password");
		let confirm_pw = document.getElementById("confirm-password");
		let name = document.getElementById("name");
		let phone = document.getElementById("phone");
		let email = document.getElementById("email");
$('#id').focusout(function() {
    let id = $('#id').val();

    $.ajax({
        url: "joinForm",
        type: "POST",
        data: { id: id },
        dataType: "text",
        success: function(result) {
            if (result == "success") {
                $("#check").html('사용할 수 있는 아이디입니다.');
                $("#check").css('color', 'green');
            }else if(result == "reguxError") {
                $("#check").html('아이디는 5자 이상 12자 이하, 영문자로 시작해야 하며 영문자, 숫자, 밑줄(_)만 사용할 수 있습니다.');
                $("#check").css('color', 'red');            	
            }else if(result == "duplicateError") {
            	 $("#check").html('이미 있는 아이디입니다.');
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
