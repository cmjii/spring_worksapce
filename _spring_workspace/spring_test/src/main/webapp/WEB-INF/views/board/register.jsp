<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp"></jsp:include>


<div class="container-md">
<h2>글쓰기</h2><br>
<form action="/board/register" method="post">
<div class="mb-3">
  <label for="title" class="form-label">Title</label>
  <input type="text" name="title" class="form-control" id="title" placeholder="Title">
</div>
<div class="mb-3">
  <label for="title" class="form-label">writer</label>
  <input type="text" name="writer" class="form-control" id="writer" placeholder="Writer">
</div>
<div class="mb-3">
  <label for="writer" class="form-label">content</label>
  <textarea class="form-control" id="contetn" name="content" rows="3"></textarea>
</div>
<button type="submit" class="btn btn-secondary">register</button>
</form>
</div>


<jsp:include page="../layout/footer.jsp"></jsp:include>