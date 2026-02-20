<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<style>
</style>
</head>
<body>
	<h1>home page</h1>
	<p>서버 날짜: ${serverTime}</p>
	<a href="/board/list">회원 게시판</a>
	<br>
	<a href="/notice/list">공지사항</a>
	<!-- 로그인을 하지 않은 경우 -->
	<sec:authorize access="isAnonymous()">
		<a href="/login">로그인</a>
	</sec:authorize>
	<!-- 인증된 사용자인 경우 true -->
	<sec:authorize access="isAuthenticated()">
		<a href="/logout">로그아웃</a>
	</sec:authorize>


</body>
</html>