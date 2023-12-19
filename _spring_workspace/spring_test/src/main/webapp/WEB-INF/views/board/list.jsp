<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container-md">
<h1>게시판</h1> <br>
<table class="table">
  <thead class="table-light">
    <tr>
      <th scope="col">#</th>
      <th scope="col">title</th>
      <th scope="col">writer</th>
      <th scope="col">reg_date</th>
      <th scope="col">read_count</th>
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
    </tr>
    </c:forEach>
  </tbody>
</table>

<nav aria-label="Page navigation example">
<!-- 이전라인 if -->
  <ul class="pagination justify-content-center">
	<c:if test="${ph.prev }">
    <li class="page-item">
      <a class="page-link" href="/board/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}">이전</a>
    </li>
    </c:if>
    <!-- 페이지번호라인 for문 -->
    <c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
    <li class="page-item"><a class="page-link" href="/board/list?PageNo=${i }&qty=${ph.pgvo.qty}">${i }</a></li>
    </c:forEach>

    <!-- 다음라인 if -->
	<c:if test="${ph.next }">
    <li class="page-item">
      <a class="page-link" href="/board/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}">Next</a>
    </li>
  </c:if>
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

