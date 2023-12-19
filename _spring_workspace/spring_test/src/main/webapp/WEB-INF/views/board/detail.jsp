<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    


<jsp:include page="../layout/header.jsp"></jsp:include>
<style type="text/css">
a{
text-decoration: none;
}
</style>
<div class="container-md">
<h2>게시판</h2><br>

<form action="/board/register" method="post">

<div class="mb-3">
  <label for="title" class="form-label">bno</label>
  <input type="text" name="title" class="form-control" id="title" placeholder="Title" value="${bvo.bno }" readonly="readonly">
</div>
<div class="mb-3">
  <label for="title" class="form-label">제목</label>
  <input type="text" name="title" class="form-control" id="title" placeholder="Title" value="${bvo.title }" readonly="readonly">
</div>

<div class="mb-3">
  <label for="writer" class="form-label">작성자</label>
  <input type="text" name="writer" class="form-control" id="writer" placeholder="Wirter" value="${bvo.writer }" readonly="readonly">
</div>
<div class="mb-3">
  <label for="content" class="form-label">등록일 ${bvo.read_count }</label>
   <input type="text" name="writer" class="form-control" id="writer" placeholder="Wirter" value="${bvo.reg_date }" readonly="readonly">
</div>
<div class="mb-3">
  <label for="content" class="form-label">내용</label>
  <textarea class="form-control" name="content" id="content" rows="3" readonly="readonly">${bvo.content }</textarea>
</div>


<a href="/board/list">
<button type="button" class="btn btn-secondary">List</button>
</a>

<c:if test="${ses.id eq bvo.writer }">
<a href="/board/modify?bno=${bvo.bno }">
<button type="button" class="btn btn-success">modify</button>
</a>
<a href="/board/remove?bno=${bvo.bno }">
<button type="button" class="btn btn-danger">remove</button>
</a>
</c:if>

</form>
</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>