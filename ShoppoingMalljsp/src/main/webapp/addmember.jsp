<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbConnection.jsp"%>
<%
//회원번호 자동생성하기
//DB작업
//1. 드라이버 로드
//2. 연결설정
//3. 질의문 준비
String sql = "select nvl(max(custno), 0) + 1 custno from member_tbl_02";
PreparedStatement stmt = conn.prepareStatement(sql);
//4. 질의문 세팅
int custno = 0;
ResultSet rs = stmt.executeQuery();
if(rs.next())
	custno = rs.getInt("custno");

//5. 질의문 실행
//ResultSet rs = stmt.executeQuery();
//System.out.print(request.getParameter("custno"));

//if(request.getParameter("custno") != null) {
	//System.out.print("notnull");
//} else {
	//System.out.print("bnull");
//}

//6. 질의문 닫기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	height: 80vh;
}

section table {
	margin: 50px auto;
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
			<h2>홈쇼핑 회원 등록</h2>
		</span>
		<div></div>
	</header>
	<nav>
		<a href="addmember.jsp">회원등록</a> <a href="getMember.jsp">회원목록조회/수정</a> <a href="memberMoney.jsp">회원매출조회</a> <a href="index.jsp">홈으로.</a>
	</nav>
	<section>
		<form action='action.jsp' method="post">
			<table>
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" name="custno" value=<%=custno %>></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" /></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" /></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address" /></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="date" name="joindate" /></td>
				</tr>
				
				<tr>
					<td>고객등급[A:VIP, B:일반 C:직원]</td>
					<td><input type="text" name="grade" /></td>
				</tr>
				<tr>
					<td>도서코드</td>
					<td><input type="text" name="city" /></td>
				</tr>
				<tr>
					<td colspan=2 align=center><input type="submit" value="등록"><button type="button" onclick="location.href='getMember.jsp'">조회</button></td>
				</tr>
			</table>
		</form>
	</section>
	
	<footer>
		<div>이수호</div>

	</footer>
</body>
</html>