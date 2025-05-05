<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
    }
    header {
        text-align: center;
        height: 100px;
        background-color: blue;
        color: aliceblue;
        line-height: 100px;
    }
    header span {
        font-size: 30px;
    }
    nav {
        background-color: rgb(104, 104, 248);
        height: 60px;
    }
    nav a {
        line-height: 60px;
        display: inline-block;
        color: aliceblue;
        margin-left: 40px;
        
    }
    section {
    	
    }
    section > div{
    	text-align: center;
    	
    	height: 80vh;
    }
    section span {
    	display: inline-block;
    	margin-top: 40px;
		text-align: left;
    	
    }
    section p {
    	font-size: 30px;
    }
    footer {
    	color: #fff;
    	background-color: blue;
    	height: 100px;
    	line-height: 100px;
    	text-align: center;
    }
</style>
<body>
	<header>
        <span>
            쇼핑몰 회원 관리 ver 1.0
        </span>
        
    </header>
    <nav>
        <a href="addmember.jsp">회원등록</a>
        <a href="getMember.jsp">회원목록조회/수정</a>
        <a href="memberMoney.jsp">회원매출조회</a>
        <a href="index.jsp">홈으로.</a>
    </nav>
    <section>
    	<div>
        <p>쇼핑몰 회원관리 프로그램</p>
        <span>
            쇼핑몰 회원정보와 매출정보데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.<br>
            프로그램 작성 순서<br>
            1. 회원정보 테이블을 생성한다.<br>
            2. 매출정보 테이블을 생성한다<br>
            3. 회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.<br>
            4. 회원정보 입력 화면프로그램을 작성한다.<br>
            5. 회원정보 조회 프로그램을 작성한다.<br>
            6. 회원매출정보 조회 프로그램을 작성한다.<br>
        </span>
        </div>
    </section>
    <footer>
    <div>이수호</div>
	
    </footer>
</body>
</html>