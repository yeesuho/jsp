<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbConnection.jsp" %>
<%
	//화면에 들어오자마자
	//DB에서 모든 회원 목록을 가져와서
	
	//3. 질의문 준비
	String sql = "select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd') joindate, case grade when 'A' then 'VIP' when 'B' then '일반' else '직원' end grade, city from member_tbl_02";
	PreparedStatement stmt = conn.prepareStatement(sql);
	//4. 질의문 세팅
	//5. 질의문 실행
	ResultSet rs = stmt.executeQuery();
	//화면에 보여주기
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 조회/수정</title>
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

section table{
	margin: 50px auto;
}

section td {
	margin-top: 20px;
}

section>div {
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
		<span> 쇼핑몰 회원 관리 ver 1.0 </span>

	</header>
	<nav>
		<a href="addmember.jsp">회원등록</a> <a href="getMember.jsp">회원목록조회/수정</a> <a href="memberMoney.jsp">회원매출조회</a> <a href="index.jsp">홈으로.</a>
	</nav>
	<section>
		<br>
		<br>
		<div>
			<h2>회원목록 조회/수정</h2>
			<table border="1" width="750px" height="300px">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>전화번호</td>
				<td>주소</td>
				<td>가입일자</td>
				<td>고객등급</td>
				<td>거주지역</td>
			</tr>
			<%
				while(rs.next()){
			%>
			<tr>
				<td><a href="getMemberList.jsp?custno=<%=rs.getString("custno") %>"><%=rs.getString("custno") %></a></td>
				<td><%=rs.getString("custname") %></td>
				<td><%=rs.getString("phone") %></td>
				<td><%=rs.getString("address") %></td>
				<td><%=rs.getString("joindate") %></td>
				<td><%=rs.getString("grade") %></td>
				<td><%=rs.getString("city") %></td>
			</tr>
			<%
				}
			%>
			</table>
		</div>
	</section>
	<footer>
		<div>이수호</div>

	</footer>
</body>
</html>