<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T1 Community | Transmission Complete</title>
<style>
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
        height: 100vh;
        margin: 0;
    }

    .result-container {
        text-align: center;
        background: var(--t1-gray);
        padding: 60px;
        border-radius: 20px;
        border: 2px solid var(--t1-gold); /* 성공의 상징 골드 테두리 */
        box-shadow: 0 0 40px rgba(198, 156, 109, 0.2);
        max-width: 500px;
        width: 90%;
    }

    .icon-box {
        font-size: 50px;
        color: var(--t1-red);
        margin-bottom: 20px;
        animation: pulse 1.5s infinite;
    }

    @keyframes pulse {
        0% { transform: scale(1); opacity: 1; }
        50% { transform: scale(1.1); opacity: 0.7; }
        100% { transform: scale(1); opacity: 1; }
    }

    h2 {
        font-size: 1.8rem;
        font-weight: 900;
        margin-bottom: 15px;
        letter-spacing: -1px;
    }

    p {
        color: #bbb;
        line-height: 1.6;
        margin-bottom: 30px;
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

    .auto-redirect {
        margin-top: 25px;
        font-size: 0.8rem;
        color: #555;
    }
</style>
</head>
<body>

<div class="result-container">
    <div class="icon-box">🏆</div>
    <h2>MISSION <span style="color:var(--t1-red)">COMPLETE</span></h2>
    <p>${message}<br>다시 시도해 주시기 바랍니다.</p>

    <a href="/board/insertForm" class="btn-list">New Board Insert</a>
    <a href="/board/boardlist" class="btn-list">View Board List</a>

</div>

</body>
</html>