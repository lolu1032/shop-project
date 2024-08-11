<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<html>
<head>
<title>Home</title>
</head>
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
		 <div class="board-container">
		 	<div class="noticeTitle">
		 		<div class="notice">공지사항</div>
		 	</div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">이름</th>
                        <th scope="col">제목</th>
                        <th scope="col">날짜</th>
                    </tr>
                </thead>
                <c:forEach var="notice" items="${notice }">
                <tbody>
                    	<tr>	
                    	    <th scope="row" class="boardId">${notice.id}</th>
                	        <td class="boardName">sldoog234</td>
            	            <td class="boardTitle">${notice.content}</td>
        	                <td class="boardDate">${notice.createDay }</td>
    	                </tr>
	                </tbody>
                </c:forEach>
            </table>
            <button class="boardWrite">글쓰기</button>
        </div>
    </div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>
