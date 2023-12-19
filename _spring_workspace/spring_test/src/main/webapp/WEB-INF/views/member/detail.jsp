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
<h2>회원 정보</h2><br>

<form action="/member/modify" method="post">

<div class="mb-3">
  <label for="title" class="form-label">ID</label>
  <input type="text" name="id" class="form-control" id="id" value="${ses.id }" readonly="readonly">
</div>
<div class="mb-3">
  <label for="title" class="form-label">PW</label>
  <input type="text" name="pw" class="form-control" id="pw" placeholder="password">
</div>

<div class="mb-3">
  <label for="writer" class="form-label">NAME</label>
  <input type="text" name="name" class="form-control" id="name"  value="${ses.name }" readonly="readonly">
</div>
<div class="mb-3">
  <label for="content" class="form-label">Email</label>
   <input type="text" name="email" class="form-control" id="email"  value="${ses.email }">
</div>
<div class="mb-3">
  <label for="content" class="form-label">주소</label>
   <input type="text" name="home" class="form-control" id="home"  value="${ses.email }">
</div>
<div class="mb-3">
  <label for="content" class="form-label">나이</label>
  <input type="text" name="age" class="form-control" id="age" value="${ses.age }">
</div>


<a href="/">
<button type="button" class="btn btn-secondary">index</button>
</a>

<button type="submit" class="btn btn-success">modify</button>


</form>

<form action="/member/delete" method="post">
<button type="submit" class="btn btn-danger">remove</button>

</form>

</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>