<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./style.css">
</head>
<body>
	<header>
		<h1>도서대여관리 ver 1.0</h1>
	</header>
	<%@ include file = "./nav.jsp" %>
	<section>
    	<div>
        <h1>도서대여관리 프로그램</h1>
        <span>
            도서관 회원정보, 도서정보, 대여정보 데이터베이스를 구축하고 도서대여관리 프로그램을 작성하는 프로그램이다.<br>
            프로그램 작성순서<br>
            1. 회원정보 테이블을 생성한다.<br>
            2. 도서정보 테이블을 생성한다<br>
            3. 대여정보 테이블을 생성한다.<br>
            4. 회원정보, 도서정보, 대여정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.<br>
            5. 도서대여정보입력화면 프로그램을 작성한다.<br>
            6. 회원관리 프로그램을 작성한다.<br>
            7. 도서관리 프로그램을 작성한다.<br>
            8. 도서대여정보 조회 프로그램을 작성한다.<br>
        </span>
        </div>
    </section>
    <%@ include file = "./footer.jsp" %>
</body>
</html>