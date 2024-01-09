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

<br>

<!-- 댓글 등록 라인 -->
   <div class="input-group mb-3">
	  <span class="input-group-text" id="cmtWriter">${bvo.writer }</span>
	  <input type="text" class="form-control" id="cmtText" aria-label="Amount (to the nearest dollar)">
	  <button type="button" class="btn btn-success" id="cmtPostBtn">Post</button>
	</div>
   
   <!-- 댓글 표시 라인 -->
   <ul class="list-group list-group-flush" id="cmtListArea">
	  <li class="list-group-item">
	  	<div class="mb-3">
	  		<div class="fw-bold">Writer</div>
	  		content
	  	</div>
	  	<span class="badge rounded-pill text-bg-warning">modAt</span>
	  </li>
	</ul>
	
	<br>
	
	<!-- 댓글 더보기 버튼 -->
	<div>
		<button type="button" id="moreBtn" data-page="1" class="btn btn-outline-dark" style="visibility:hidden" >MORE+</button>
	</div>
    
    <!-- Modal -->
	<div class="modal" id="myModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">writer</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	           <div class="input-group mb-3">
	           	  <input type="text" class="form-control" id="cmtTextMod">
			       <button type="button" id="cmtModBtn" class="btn btn-primary">post</button>
	           </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">close</button>
	      </div>
	    </div>
	  </div>
	</div>
    
    </div>

<script type="text/javascript">
let bnoVal = `<c:out value="${bvo.bno}" />`;
console.log(bnoVal);
</script>

<script src="/resources/js/boardComment.js" ></script>

<script type="text/javascript">
spreadCommentList(bnoVal);
</script>

<jsp:include page="../layout/footer.jsp"></jsp:include>

</body>
</body>
</html>