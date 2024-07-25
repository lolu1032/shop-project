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

		<div class="wrapper">
			<div id="formContent">
				<div class="fadeIn first">
					<h2 class="my-5">로그인</h2>
				</div>
				<!-- Login Form -->
				<form method="post" action="login">
					<input name="id" type="text" id="id" class="fadeIn"
						placeholder="아이디"> <input name="pw" type="password"
						id="pw" class="fadeIn" placeholder="비밀번호">
					<div id="formFooter">
						<a class="underlineHover" href="#">비밀번호/아이디 찾기</a> <a
							href="${contextPath }/join">회원가입</a>
					</div>
					<input type="submit" class="fadeIn fourth" value="로그인">
				</form>
				<!-- error가 비어있지 않는 경우 ${error}을 보여줘라는뜻 -->
				<c:if test="${not empty error}">
					<div class="error-message" style="color: red;">${error}</div>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="include/footer.jsp"%>
</body>
</html>
