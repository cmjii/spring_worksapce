<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container-md">
<h1>회원가입</h1> <br>

<form action="/member/register" method="post">
<div class="mb-3">
  <label for="title" class="form-label">ID</label>
  <input type="text" name="id" class="form-control" id="id" placeholder="id">
</div>
<div class="mb-3">
  <label for="title" class="form-label">PassWord</label>
  <input type="password" name="pw" class="form-control" id="pw" placeholder="pw">
</div>
<div class="mb-3">
  <label for="title" class="form-label">name</label>
  <input type="text" name="name" class="form-control" id="name" placeholder="name">
</div>
<div class="mb-3">
  <label for="title" class="form-label">email</label>
  <input type="email" name="email" class="form-control" id="email" placeholder="email">
</div>
<div class="mb-3">
  <label for="title" class="form-label">home</label>
  <input type="text" name="home" class="form-control" id="home" placeholder="home">
</div>
<div class="mb-3">
  <label for="title" class="form-label">age</label>
  <input type="text" name="age" class="form-control" id="age" placeholder="age">
</div>

<button type="submit" class="btn btn-secondary">가입</button>
</form>

</div>


<script>
	const join = `<c:out value="${join}"/>`;
	if(join ==='1'){
		alert("회원가입 실패 (아이디 중복)");
	}
</script>
<jsp:include page="../layout/footer.jsp"></jsp:include>
