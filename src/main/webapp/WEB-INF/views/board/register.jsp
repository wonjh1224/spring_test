<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="../layout/header.jsp"></jsp:include>

<style type="text/css">
a {
	text-decoration: none;
}
</style>

<br>

<div class="container-md">
	<h2>글쓰기</h2>
	<br>

	<form action="/board/register" method="post">

		<div class="mb-3">
			<label for="title" class="form-label">제목</label> <input
				type="text" name="title" class="form-control" id="title"
				placeholder="title">
		</div>

		<div class="mb-3">
			<label for="writer" class="form-label">작성자</label> <input
				type="text" name="writer" class="form-control" id="writer"
				placeholder="writer">
		</div>
		
		<div class="mb-3">
			<label for="content" class="form-label">내용</label>
			<textarea class="form-control" name="content" id="content" rows="3"
				placeholder="content"></textarea>
		</div>

		<button type="submit" class="btn btn-secondary" id="regBtn">Register</button>
                        
	</form>
</div>


<jsp:include page="../layout/footer.jsp"></jsp:include>