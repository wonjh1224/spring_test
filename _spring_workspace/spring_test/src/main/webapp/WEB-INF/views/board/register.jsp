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
<h2>글쓰기 페이지</h2><br>

<form action="/board/register" method="post">

<div class="mb-3">
  <label for="title" class="form-label">Title</label>
  <input type="text" name="title" class="form-control" id="title" placeholder="Title">
</div>

<div class="mb-3">
  <label for="writer" class="form-label">Writer</label>
  <input type="text" name="writer" class="form-control" id="writer" placeholder="Wirter">
</div>

<div class="mb-3">
  <label for="content" class="form-label">Content</label>
  <textarea class="form-control" name="content" id="content" rows="3"></textarea>
</div>

<button type="submit" class="btn btn-success">Register</button>

</form>
</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>