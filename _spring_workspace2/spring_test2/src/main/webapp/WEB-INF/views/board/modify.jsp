<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-md">
<h1>글수정</h1> <br>
<form action="/board/modify" method="post" >
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">번호</span>
  <input type="text" class="form-control" value="${bvo.bno }" name="bno" readonly="readonly">
  <span class="input-group-text" id="basic-addon1">작성일</span>
  <input type="text" class="form-control"value="${bvo.regAt}"  readonly="readonly">
  <span class="input-group-text" id="basic-addon1">수정일</span>
  <input type="text" class="form-control"value="${bvo.modAt}" name="modAt" readonly="readonly">
  <span class="input-group-text" id="basic-addon1">조회수</span>
  <input type="text" class="form-control" value="${bvo.readCount}" readonly="readonly">
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">제목</span>
  <input type="text" class="form-control"  name="title" value="${bvo.title}" >
  <span class="input-group-text" id="basic-addon1">작성자</span>
  <input type="text" class="form-control" name="writer" value="${bvo.writer}" readonly="readonly">
</div>

<div class="input-group">
  <span class="input-group-text">내용</span>
  <textarea class="form-control" name="content">${bvo.content}</textarea>
</div>
<br>
<button type="submit" class="btn btn-secondary" id="regBtn">modify</button>
</form>
</div>