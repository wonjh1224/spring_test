<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<jsp:include page="layout/header.jsp"></jsp:include>


<h1>Hello world!</h1>


<div>
	<c:if test="${ses.id ne null }">
		<div
			style="width: 600px; height: 200px; border: 5px solid black; margin: 200px auto; border-radius: 50px;">
			<div style="text-align: center; margin: 20px auto; width: 200px">
				사용자 : ${ses.id }</div>
			<div style="text-align: center; margin: 20px auto; width: 400px">
				마지막접속 : ${ses.last_login }</div>
		</div>
	</c:if>
</div>

<div>
	<c:if test="${ses.id eq null }">

		<div>비회원</div>

	</c:if>
</div>

<script>

const msg_login = `<c:out value="${msg_login}"/>`;
const msg_logout = `<c:out value="${msg_logout}"/>`;
const msg_modify = `<c:out value="${msg_modify}"/>`;
const msg_delete = `<c:out value="${msg_delete}"/>`;

if(msg_login === "1"){
	alert("로그인 실패");
}
if(msg_logout === "1" && msg_modify != "1" && msg_delete != "1"){
	alert("로그아웃.");	
}
if(msg_modify === "1"){
	alert("수정완료.");
}
if(msg_delete === "1"){
	alert("회원탈퇴.")
}
</script>

<jsp:include page="layout/footer.jsp"></jsp:include>

