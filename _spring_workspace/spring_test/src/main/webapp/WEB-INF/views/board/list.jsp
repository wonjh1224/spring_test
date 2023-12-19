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
<h2>게시판 페이지</h2><br>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="bvo">
				<tr>
					<th scope="row">${bvo.bno }</th>
					<td><a href="/board/detail?bno=${bvo.bno }">${bvo.title }</a></td>
					<td>${bvo.writer }</td>
					<td>${bvo.reg_date }</td>
					<td>${bvo.read_count }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	

	<nav aria-label="Page navigation example">
  <ul class="pagination">
   
    <!-- 이전 -->
    <c:if test="${ph.prev }">
    <li class="page-item">
      <a class="page-link" href="/board/list?pageNo=${ph.startPage-1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    
    <!-- 페이지 번호 -->
    <c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
    <li class="page-item"><a class="page-link" href="/board/list?pageNo=${i }">${i }</a></li>
    </c:forEach>
   
    
    <!-- 다음 -->
    <c:if test="${ph.next }">
    <li class="page-item">
      <a class="page-link" href="/board/list?pageNo=${ph.endPage+1 }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    </c:if>
    
  </ul>
  
</nav>

	
	
</div>

<script type="text/javascript">

	const isDel = `<c:out value="${isDel}" />`;
	if(isDel == 1){
		alert("삭제 완료.");
	}
	
</script>


<jsp:include page="../layout/footer.jsp"></jsp:include>