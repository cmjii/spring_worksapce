<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-md">
<h1>글보기</h1> <br>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">번호</span>
  <input type="text" class="form-control" value="${bvo.bno }" readonly="readonly">
  <span class="input-group-text" id="basic-addon1">작성일</span>
  <input type="text" class="form-control"value="${bvo.regAt}" readonly="readonly">
  <span class="input-group-text" id="basic-addon1">조회수</span>
  <input type="text" class="form-control" value="${bvo.readCount}" readonly="readonly">
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">제목</span>
  <input type="text" class="form-control"  value="${bvo.title}" readonly="readonly">
  <span class="input-group-text" id="basic-addon1">작성자</span>
  <input type="text" class="form-control"  value="${bvo.writer}" readonly="readonly">
</div>

<div class="input-group">
  <span class="input-group-text">내용</span>
  <textarea class="form-control" readonly="readonly">"${bvo.content}"</textarea>
</div>
<br>
<a href="/board/modify?bno=${bvo.bno }"><button type="button" class="btn btn-secondary" id="regBtn">modify</button></a>
<a href="/board/delete?bno=${bvo.bno }"><button type="button" class="btn btn-secondary" id="regBtn">delete</button></a>
</div>
