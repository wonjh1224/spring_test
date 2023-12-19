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
<h2>수정 페이지</h2><br>

<form action="/board/modify" method="post">

<div class="mb-3">
  <label for="title" class="form-label">bno</label>
  <input type="text" name="bno" class="form-control" id="bno" placeholder="bno" value="${bvo.bno }" readonly="readonly">
</div>
<div class="mb-3">
  <label for="title" class="form-label">제목</label>
  <input type="text" name="title" class="form-control" id="title" placeholder="Title" value="${bvo.title }">
</div>

<div class="mb-3">
  <label for="writer" class="form-label">작성자</label>
  <input type="text" name="writer" class="form-control" id="writer" placeholder="Wirter" value="${bvo.writer }" readonly="readonly">
</div>
<div class="mb-3">
  <label for="content" class="form-label">등록일</label>
   <input type="text" name="reg_date" class="form-control" id="reg_date" placeholder="Wirter" value="${bvo.reg_date }" readonly="readonly">
</div>
<div class="mb-3">
  <label for="content" class="form-label">내용</label>
  <textarea class="form-control" name="content" id="content" rows="3">${bvo.content }</textarea>
</div>


<a href="/board/list">
<button type="button" class="btn btn-secondary">List</button>
</a>

<a href="/board/detail">
<button type="submit" class="btn btn-success">edit</button>
</a>

</form>
</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>