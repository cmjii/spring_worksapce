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
      <th scope="col">regAt</th>
      <th scope="col">modAt</th>
      <th scope="col">readCount</th>
<!--       <th scope="col">comment</th>
      <th scope="col">file</th> -->
    </tr>
  </thead>
  <c:forEach items="${list }" var="bvo">
  <tbody>
    <tr>
      <th scope="row">${bvo.bno }</th>
      <td><a href="/board/detail?bno=${bvo.bno }">${bvo.title}</a></td>
      <td>${bvo.writer}</td>
      <td>${bvo.regAt}</td>
      <td>${bvo.modAt}</td>
      <td>${bvo.readCount}</td>
<%--       <td>${bvo.commentCount}</td>
      <td>${bvo.fileCount}</td> --%>
    </tr>
    </c:forEach>
  </tbody>
</table>
</div>



<script>
const de = `<c:out value="${de}" />`;
if(de == 1){
	alert("삭제 완료");
}
</script>

<jsp:include page="../layout/footer.jsp"></jsp:include>
