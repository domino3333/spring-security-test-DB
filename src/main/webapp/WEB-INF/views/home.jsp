<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

</body>
</html>