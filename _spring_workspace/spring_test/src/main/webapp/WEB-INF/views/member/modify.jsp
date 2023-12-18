<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container-md">
<h1>회원 수정</h1> <br>

<form action="/member/edit" method="post">
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">아이디</span>
  <input type="text" class="form-control" name="id" value="${ses.id }" readonly="readonly">
  <span class="input-group-text" id="basic-addon1" >비밀번호</span>
  <input type="text" name="pw" class="form-control">
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">이름</span>
  <input type="text" class="form-control" value="${ses.name}" name="name" >
  <span class="input-group-text" id="basic-addon1">나이</span>
  <input type="text" class="form-control" name="age" value="${ses.age }" >
  <span class="input-group-text" id="basic-addon1">이메일</span>
  <input type="text" name="email" class="form-control"value="${ses.email}" >
  <span class="input-group-text" id="basic-addon1">주소</span>
  <input type="text" class="form-control" value="${ses.home}" name="home" >
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">가입날짜</span>
  <input type="text" class="form-control" value="${ses.reg_date}" name="reg_date" >
  <span class="input-group-text" id="basic-addon1">마지막 로그인</span>
  <input type="text" class="form-control" name="last_login" value="${ses.last_login }" >
</div>

<a href="#"><button type="button" class="btn btn-warning">취소</button></a>
<button type="submit" class="btn btn-success">수정</button>
</form>
</div>

