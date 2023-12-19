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
	
		<h2>로그인 페이지 (login Page)</h2>
		
			<form action="/member/login" method="post">

				<div class="mb-3">
				<label for="id" class="form-label">아이디</label> <input type="text"
				name="id" class="form-control" id="id" placeholder="ID">
				</div>
	
				<div class="mb-3">
				<label for="pw" class="form-label">비밀번호</label> <input type="password"
				name="pw" class="form-control" id="pw" placeholder="PW">
				</div>
				
				<button type="submit" class="btn btn-secondary">로그인</button>
	
			</form>


	</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>