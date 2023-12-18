<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
</head>
<body>
<jsp:include page="./layout/header.jsp"></jsp:include>
<h1>
	Hello world!  
</h1>

<div>
 <c:if test="${ses.id ne null }">
	${ses.id}님이 로그인 하셨습니다. <br>
	마지막 로그인 : 
	<button type="button" class="btn btn-primary">${ses.last_login }</button>
</c:if>
</div> 

<script type="text/javascript">
	const msg_login = `<c:out value="${msg_login}"/>`;
	if(msg_login === "1"){
		alert("로그인 실패");
	}
	const join = `<c:out value="${join}"/>`;
	if(join ==='2'){
		alert("회원가입 성공");
	}
	const msg_logout = `<c:out value="${msg_logout}"/>`;
	if(msg_logout ==='1'){
		alert("로그아웃 성공");
	}
</script>


<jsp:include page="./layout/footer.jsp"></jsp:include>

</body>
</html>
