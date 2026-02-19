<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T1 Community | Write</title>
<style>
/* T1 Official Theme */
:root {
	--t1-red: #E2012D;
	--t1-black: #0f0f0f;
	--t1-gray: #1a1a1a;
	--t1-gold: #C69C6D;
}

body {
	background-color: var(--t1-black);
	font-family: 'Pretendard', sans-serif;
	color: #ffffff;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin: 0;
}

.write-container {
	width: 100%;
	max-width: 700px;
	background: var(--t1-gray);
	padding: 40px;
	border-radius: 15px;
	border: 2px solid var(--t1-red);
	box-shadow: 0 0 30px rgba(226, 1, 45, 0.2);
}

.header {
	text-align: center;
	margin-bottom: 40px;
}

.header h1 {
	font-size: 2rem;
	font-weight: 900;
	letter-spacing: -1px;
}

.header span {
	color: var(--t1-red);
}

/* Form Styles */
.form-group {
	margin-bottom: 25px;
}

.form-group label {
	display: block;
	font-size: 0.9rem;
	color: var(--t1-gold);
	margin-bottom: 8px;
	text-transform: uppercase;
	font-weight: bold;
}

input[type="text"], textarea {
	width: 100%;
	padding: 12px 15px;
	background: #0b0b0b;
	border: 1px solid #333;
	border-radius: 5px;
	color: #fff;
	font-size: 1rem;
	box-sizing: border-box;
	transition: 0.3s;
}

input[type="text"]:focus, textarea:focus {
	border-color: var(--t1-red);
	outline: none;
	box-shadow: 0 0 10px rgba(226, 1, 45, 0.3);
}

textarea {
	resize: none;
	height: 250px;
}

/* Buttons */
.btn-area {
	display: flex;
	gap: 15px;
	margin-top: 30px;
}

.btn {
	flex: 1;
	padding: 15px;
	font-size: 1rem;
	font-weight: bold;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
	text-transform: uppercase;
}

.btn-submit {
	background: var(--t1-red);
	color: #fff;
}

.btn-submit:hover {
	background: #ff1a4a;
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(226, 1, 45, 0.5);
}

.btn-reset {
	background: #333;
	color: #fff;
}

.btn-reset:hover {
	background: #fff;
	color: #ff1a4a;
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(226, 1, 45, 0.5);
}

.btn-cancel {
	background: #333;
	color: #bbb;
}

.btn-cancel:hover {
	background: #444;
	color: #fff;
}

/* Decoration */
.bottom-deco {
	margin-top: 30px;
	font-size: 12px;
	color: #444;
	text-align: center;
	font-family: monospace;
}

.btn-list {
	display: inline-block;
	padding: 15px 40px;
	background: var(--t1-red);
	color: white;
	text-decoration: none;
	font-weight: bold;
	border-radius: 5px;
	transition: 0.3s;
	border: none;
	cursor: pointer;
}

.btn-list:hover {
	background: #ffffff;
	color: var(--t1-red);
	box-shadow: 0 0 20px rgba(255, 255, 255, 0.4);
}
</style>
</head>
<body>

	<div class="write-container">
		<div class="header">
			<h1>
				T1 COMMUNITY<br><span>${board.writer}님의 게시판 수정</span>
			</h1>
		</div>

		<form action="/board/update" method="post">
			<div class="form-group">
				<label for="no">작성자 번호</label> <input type="text"
					id="no" name="no" value="${board.no}" readonly>
			</div>
			<div class="form-group">
				<label for="writer">작성자(Writer)</label> <input type="text"
					id="writer" name="writer" value="${board.writer}" required>
			</div>

			<div class="form-group">
				<label for="title">제목(Title)</label> <input type="text" id="title"
					name="title" value="${board.title}" required>
			</div>

			<div class="form-group">
				<label for="content">내용(Content)</label>
				<textarea id="content" name="content">${board.content}</textarea>
			</div>

			<div class="btn-area">
				<a href="/board/boardlist" class="btn-list">게시판 목록</a>
				<button type="submit" class="btn btn-submit">게시판 수정</button>
				<button type="reset" class="btn btn-reset">수정 취소</button>
			</div>
		</form>

		<div class="bottom-deco">[ SYSTEM: READY TO TRANSMIT DATA TO
			JDBCBOARD ]</div>
	</div>

</body>
</html>