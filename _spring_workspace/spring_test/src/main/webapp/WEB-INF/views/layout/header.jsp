<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiar">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
      <ul class="justify-content-center navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item ">
          <a class="nav-link active" aria-current="page" href="/board/list">게시판</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/board/register">글쓰기</a> <!-- 컨트롤러 경로로 가는거임 -->
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/member/register">회원가입</a>
        </li>
        <c:if test="${ses.id ne null }">
        <li class="nav-item">
          <a class="nav-link" href="/member/logout">로그아웃</a>
        </li>
        </c:if>
        <c:if test="${ses.id ne null }">
        <li class="nav-item">
          <a class="nav-link" href="/member/modify">${ses.id }( ${ses.email }) welcome!</a> <!-- 내 정보 수정 -->
        </li>
        </c:if>
        <c:if test="${ses.id eq null }">        
        <li class="nav-item">
          <a class="nav-link" href="/member/login">로그인</a>
        </li>
        </c:if>
      </ul>
    </div>
  </div>
</nav>

</html>