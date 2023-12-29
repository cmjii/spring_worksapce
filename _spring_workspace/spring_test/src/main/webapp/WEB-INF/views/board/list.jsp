<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container-md">
<h1>게시판</h1> <br>

<!-- 검색라인 -->
<div>
<form action="/board/list" method="get">
<div class="input-group mb-3">
	<select name="type">
	<option ${ph.pgvo.type ==null ? 'selected' : ''} >검색</option>
	<option value="t" ${ph.pgvo.type eq 't' ? 'selected' : ''} >제목</option>
	<option value="w" ${ph.pgvo.type eq 'w' ? 'selected' : ''}>작성자</option>
	<option value="c" ${ph.pgvo.type eq 'c' ? 'selected' : ''}>내용</option>
	<option value="tc" ${ph.pgvo.type eq 'tc' ? 'selected' : ''}>제목&내용</option>
	<option value="tw" ${ph.pgvo.type eq 'tw' ? 'selected' : ''}>제목&작성자</option>
	<option value="wc" ${ph.pgvo.type eq 'wc' ? 'selected' : ''}>작성자&내용</option>
	<option value="twc" ${ph.pgvo.type eq 'twc' ? 'selected' : ''}>전체</option>
	</select>
	<input type="text" name="keyword" placeholder="검색" value="${ph.pgvo.keyword }" class="form-control">
	<input type="hidden" name="pageNo" value="1"> <!-- 검색을 하면 무조건 1페이지로 넘어감 -->
	<input type="hidden" name="qty" value="10">
	<label class="input-group-text" for="inputGroupSelect02">
	<button type="submit" class="btn btn-primary position-relative">Search
  	<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
	${ph.totalCount }
  	</span>
	</button>
	</label>
</div>
</form>
</div>


<table class="table">
  <thead class="table-light">
    <tr>
      <th scope="col">#</th>
      <th scope="col">title</th>
      <th scope="col">writer</th>
      <th scope="col">reg_date</th>
      <th scope="col">read_count</th>
      <th scope="col">comment</th>
      <th scope="col">file</th>
    </tr>
  </thead>
  <c:forEach items="${list }" var="bvo">
  <tbody>
    <tr>
      <th scope="row">${bvo.bno }</th>
      <td><a href="/board/detail?bno=${bvo.bno }">${bvo.title}</a></td>
      <td>${bvo.writer}</td>
      <td>${bvo.reg_date}</td>
      <td>${bvo.read_count}</td>
      <td>${bvo.commentCount}</td>
      <td>${bvo.fileCount}</td>
    </tr>
    </c:forEach>
  </tbody>
</table>

<nav aria-label="Page navigation example">
<!-- 이전라인 if -->
  <ul class="pagination justify-content-center">
	<c:if test="${ph.prev }">
    <li class="page-item">
      <a class="page-link" href="/board/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">이전</a>
    </li>
    </c:if>
    <!-- 페이지번호라인 for문 -->
    <c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
    <li class="page-item"><a class="page-link" href="/board/list?PageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a></li>
    </c:forEach>

    <!-- 다음라인 if -->
	<c:if test="${ph.next }">
    <li class="page-item">
      <a class="page-link" href="/board/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">Next</a>
    </li>
  </c:if>
    <li class="page-item"><a class="page-link" href="/board/list">전체보기</a></li>
  </ul>
</nav>

</div>


<script>
	const isDel = `<c:out value="${isDel}" />`;
	if(isDel ==1){
		alert("게시글이 삭제되었습니다.");
	}
	

	
</script>





<jsp:include page="../layout/footer.jsp"></jsp:include>

