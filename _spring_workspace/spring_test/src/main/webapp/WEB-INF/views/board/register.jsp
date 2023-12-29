<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp"></jsp:include>


<div class="container-md">
<h2>글쓰기</h2><br>
<form action="/board/register" method="post" enctype="multipart/form-data">
<div class="mb-3">
  <label for="title" class="form-label">Title</label>
  <input type="text" name="title" class="form-control" id="title" placeholder="Title">
</div>
<div class="mb-3">
  <label for="title" class="form-label">writer</label>
  <input type="text" name="writer" class="form-control" id="writer" value="${ses.id }" readonly="readonly">
</div>
<div class="mb-3">
  <label for="writer" class="form-label">content</label>
  <textarea class="form-control" id="contetn" name="content" rows="3"></textarea>
</div>

<!-- file입력 라인 추가 -->
<div class="mb-3">
  <label for="file" class="form-label">files...</label>
  <input type="file" name="files" class="form-control" id="file" multiple="multiple" style="display: none;"> <!-- multiple == 한번에 여러개의 파일을 업로드 -->
  <br><button type="button" class="btn btn-secondary" id="trigger">FileUpload</button>
</div>
<!-- 파일 목록 표시라인 -->
<div class="mb-3" id="fileZone">
</div>
<button type="submit" class="btn btn-secondary" id="regBtn">register</button>
</form>
</div>
<script src="/resources/js/boardRegister.js"></script>

<jsp:include page="../layout/footer.jsp"></jsp:include>