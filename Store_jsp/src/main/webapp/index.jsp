<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="style.css">
</head>
<body>
<%@ include file = "./nav.jsp" %>
<section>
<h1>편의점 매출관리 프로그램</h1>

<p>편의점 매출정보와 상품관리를 위한 데이터베이스를 구축하고 편의점 매출관리 프로그램을 작성하는 프로그램이다.</p>
<p>프로그램 작성순서</p>
<p>1. 상품정보 테이블을 생성한다.</p>
<p>2. 매출정보 테이블을 생성한다.</p>
<p>3. 점포정보 테이블을 생성한다.</p>
<p>4. 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.</p>
<p>5. 매출등록 프로그램을 작성한다.</p>
<p>6. 상품관리(등록,수정,삭제) 프로그램을 작성한다.</p>
<p>7. 매출현황 조회 프로그램을 작성한다.</p>
</section>
<%@ include file = "./footer.jsp" %>
</body>
</html>