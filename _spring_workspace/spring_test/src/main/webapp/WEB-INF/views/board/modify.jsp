<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-md">
<h1>수정</h1> <br>
<c:set value="${boardDTO.bvo }" var="bvo" />
<form action="/board/modify" method="post" enctype="multipart/form-data">
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">번호</span>
  <input type="text" class="form-control" name="bno" value="${bvo.bno }" readonly="readonly">
  <span class="input-group-text" id="basic-addon1">작성일</span>
  <input type="text" class="form-control"value="${bvo.reg_date}" readonly="readonly">
  <span class="input-group-text" id="basic-addon1">조회수</span>
  <input type="text" class="form-control" value="${bvo.read_count}" readonly="readonly">
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">제목</span>
  <input type="text" class="form-control" name="title" value="${bvo.title}" >
  <span class="input-group-text" id="basic-addon1">작성자</span>
  <input type="text" class="form-control"  value="${bvo.writer}" readonly="readonly">
</div>
<div class="input-group">
  <span class="input-group-text">내용</span>
  <textarea class="form-control" name="content">"${bvo.content}"</textarea>
</div>

<c:set value="${boardDTO.flist }" var="flist"></c:set>
<div>
	<ul>
	<!-- 파일 개수만큼 li를 추가하여 파일을 표시, 타입이 1인 경우만 표시 -->
	<!-- li -> div -> img 그림표시
			   div -> 파일이름, 작성일, span size		
	-->
	<!-- 파일 리스트 중 하나만 가져와서 fvo로 저장 -->
	<c:forEach items="${flist }" var="fvo">
		<li>
			<c:choose>
				<c:when test="${fvo.file_type > 0 }"><br>
					<div class="container-md">
					<!-- /upload/save_dir/uuid_file_name -->
						<img class="rounded " alt="." src="/upload/${fvo.save_dir}/${fvo.uuid}_${fvo.file_name}">
					</div>
				</c:when>
				<c:otherwise>
					<div>
						<!-- 아이콘 같은 모양 하나 가져와서 넣기 -->
					</div>
				</c:otherwise>
			</c:choose>
			<div>
			<!-- div -> 파일이름, 작성일, span size -->
				<div>${fvo.file_name }</div>
				${fvo.reg_date }
			</div>
			<span>${fvo.file_size }Byte</span>
			<button type="button" class="file-x" data-uuid="${fvo.uuid }">X</button>
		</li>
	</c:forEach>
	</ul>
</div>

<!-- 수정 파일 등록 라인 -->

<div class="mb-3">
  <label for="file" class="form-label">files...</label>
  <input type="file" name="files" class="form-control" id="file" multiple="multiple" style="display: none;"> <!-- multiple == 한번에 여러개의 파일을 업로드 -->
  <br><button type="button" class="btn btn-secondary" id="trigger">FileUpload</button>
</div>
<!-- 파일 목록 표시라인 -->
<div class="mb-3" id="fileZone">
</div>

<br>
<a href="/board/list"><button type="button" class="btn btn-warning">게시판</button></a>
<a href="/board/remove?bno=${bvo.bno }"><button type="button" class="btn btn-warning">삭제</button></a>
<button type="submit" class="btn btn-success">수정</button>
</form>
</div>

<script>
const uuid = `<c:out value="${fvo.uuid}" />`;
</script>
<script src="/resources/js/boardRegister.js"></script>
<script src="/resources/js/boardModify.js"></script>

<jsp:include page="../layout/footer.jsp"></jsp:include>