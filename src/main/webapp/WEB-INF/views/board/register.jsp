<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<style>
</style>
</head>
<body>
	<h1>register page</h1>
	<h3>게시글 등록 : 로그인한 회원만 접근 가능</h3>
	<form action="/logout" method="post">
		<sec:csrfInput />
		<button>로그아웃</button>
	</form>

</body>
</html>