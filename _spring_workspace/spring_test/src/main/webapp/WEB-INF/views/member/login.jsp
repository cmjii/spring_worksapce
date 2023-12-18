<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container-md">
<h1>로그인</h1> <br>

<form action="/member/login" method="post">
	<div class="mb-3">
	  <label for="title" class="form-label">ID</label>
	  <input type="text" name="id" class="form-control" id="id" placeholder="id">
	</div>
	<div class="mb-3">
	  <label for="title" class="form-label">PassWord</label>
	  <input type="password" name="pw" class="form-control" id="pw" placeholder="pw">
	</div>
	<button type="submit" class="btn btn-secondary">로그인</button>
</form>


</div>


<jsp:include page="../layout/footer.jsp"></jsp:include>