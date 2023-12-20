<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-md">
<h1>글보기</h1> <br>
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
  <input type="text" class="form-control"  value="${bvo.title}" readonly="readonly">
  <span class="input-group-text" id="basic-addon1">작성자</span>
  <input type="text" class="form-control"  value="${bvo.writer}" readonly="readonly">
</div>

<div class="input-group">
  <span class="input-group-text">내용</span>
  <textarea class="form-control" readonly="readonly">"${bvo.content}"</textarea>
</div>
<br>
<a href="/board/list"><button type="button" class="btn btn-warning">게시판</button></a>
<a href="/board/modify?bno=${bvo.bno }"><button type="button" class="btn btn-success">수정</button></a><br>

<!-- 댓글 등록 라인 -->
<br><hr>
<div class="input-group mb-3">
    <span class="input-group-text" id="cmtWriter">${ses.id }</span>
	<input type="text" placeholder="댓글을 입력해주세요" class="form-control" id="cmtText">
	<button type="button" class="btn btn-secondary"  id="cmtAddBtn">등록</button>
</div>



<!-- 댓글 표시 라인 -->

<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        cno,writer,reg_date
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>Add Comment..</strong>
      </div>
    </div>
  </div>
</div>
</div>
<br>
<script>
	const bnoVal = `<c:out value="${bvo.bno}" />`;
</script>
<script src="/resources/js/boardComment.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>