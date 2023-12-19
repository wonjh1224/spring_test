<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../layout/header.jsp"></jsp:include>

<style type="text/css">
a{
text-decoration: none;
}
</style>


<div class="container-md">
<h2>회원가입 페이지 (Register Page)</h2>


<form action="/member/register" method="post">

	<div class="mb-3">
		<label for="id" class="form-label">아이디</label> <input type="text"
			name="id" class="form-control" id="id" placeholder="ID">
	</div>
	<div class="mb-3">
		<label for="pw" class="form-label">비밀번호</label> <input type="password"
			name="pw" class="form-control" id="pw" placeholder="PW">
	</div>
	<div class="mb-3">
		<label for="name" class="form-label">이름</label> <input type="text"
			name="name" class="form-control" id="name" placeholder="name">
	</div>
	<div class="mb-3">
		<label for="email" class="form-label">이메일</label> <input type="email"
			name="email" class="form-control" id="email" placeholder="email">
	</div>
	<div class="mb-3">
		<label for="home" class="form-label">주소</label> <input type="text"
			name="home" class="form-control" id="home" placeholder="home">
	</div>
	<div class="mb-3">
		<label for="age" class="form-label">나이</label> <input type="text"
			name="age" class="form-control" id="age" placeholder="age">
	</div>

	<button type="submit" class="btn btn-success">Register</button>

</form>


</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>