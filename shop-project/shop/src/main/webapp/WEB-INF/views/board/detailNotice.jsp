<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<html>
<head>
<title>Home</title>
</head>
<style>
.container {
	width: 90%;
	max-width: 600px;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	align-items: center;
}

.post-image {
	margin-bottom: 20px;
}

.post-image img {
	width: 100%;
	height: auto;
	border-radius: 8px;
}

.post-header {
	text-align: center;
	margin-bottom: 20px;
}

.post-header h1 {
	font-size: 2em;
}

.post-content {
	line-height: 1.6;
	text-align: center;
	margin-bottom: 30px;
}

.comments-section {
	width: 100%;
	margin-top: 30px;
}

.comments-section h2 {
	font-size: 1.5em;
	margin-bottom: 20px;
	text-align: center;
}

.comment {
	margin-bottom: 15px;
	padding: 15px;
	background-color: #f9f9f9;
	border-radius: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.comment-author {
	font-weight: bold;
	margin-bottom: 5px;
}

.comment-text {
	margin-left: 10px;
	line-height: 1.5;
}

.comment-form {
	margin-top: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.comment-form textarea {
	width: 100%;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ddd;
	margin-bottom: 10px;
	font-size: 1em;
	resize: none;
	height: 80px;
}

.comment-form .btn {
	padding: 10px 20px;
	background-color: #007BFF;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 1em;
	transition: background-color 0.3s ease;
}

.comment-form .btn:hover {
	background-color: #0056b3;
}

.back-button {
    align-self: flex-start;
    margin-bottom: 20px;
}

.back-button button {
    padding: 10px 20px;
    background-color: #007BFF;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
    transition: background-color 0.3s ease;
}

.back-button button:hover {
    background-color: #0056b3;
}

</style>
<body>
	<div id="wrap">
		<c:choose>
			<c:when test="${not empty user}">
				<%@ include file="../include/loginAfterHeader.jsp"%>
			</c:when>
			<c:otherwise>
				<%@ include file="../include/loginBeforeHeader.jsp"%>
			</c:otherwise>
		</c:choose>
		<div class="container">
			<div class="back-button">
				<button onclick="history.back()">뒤로가기</button>
			</div>
			<!-- 게시글 제목 -->
			<div class="post-header">
				<h1>${notice.title }</h1>
			</div>

			<!-- 게시글 이미지 -->
			<div class="post-image">
				<img src="example.jpg" alt="게시글 이미지">
			</div>

			<!-- 게시글 내용 -->
			<div class="post-content">
				<p>${notice.content }</p>
			</div>

			<!-- 댓글 섹션 -->
			<div class="comments-section">
				<h2>댓글</h2>

				<!-- 개별 댓글 -->
				<div class="comment">
					<p class="comment-author">작성자: 김철수</p>
					<p class="comment-text">좋은 글 잘 읽었습니다!</p>
				</div>
				<!-- 댓글 작성 폼 -->
				<div class="comment-form">
					<textarea placeholder="댓글을 작성하세요..."></textarea>
					<button class="btn">댓글 달기</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>
