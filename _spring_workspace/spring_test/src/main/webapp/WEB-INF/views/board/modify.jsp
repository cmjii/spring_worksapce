<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-md">
<h1>수정</h1> <br>

<form action="/board/modify" method="post">
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">번호</span>
  <input type="text" class="form-control" value="${bvo.bno }" readonly="readonly">
  <span class="input-group-text" id="basic-addon1">작성일</span>
  <input type="text" class="form-control"value="${bvo.reg_date}" readonly="readonly">
  <span class="input-group-text" id="basic-addon1">조회수</span>
  <input type="text" class="form-control" value="${bvo.read_count}" readonly="readonly">
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">제목</span>
  <input type="text" class="form-control"  value="${bvo.title}" >
  <span class="input-group-text" id="basic-addon1">작성자</span>
  <input type="text" class="form-control"  value="${bvo.writer}" readonly="readonly">
</div>
<div class="input-group">
  <span class="input-group-text">내용</span>
  <textarea class="form-control">"${bvo.content}"</textarea>
</div>
<br>
<a href="/board/list"><button type="button" class="btn btn-warning">게시판</button></a>
<button type="submit" class="btn btn-success">수정</button>
</form>
</div>



<jsp:include page="../layout/footer.jsp"></jsp:include>