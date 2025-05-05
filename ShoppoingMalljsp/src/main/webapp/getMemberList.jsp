<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbConnection.jsp" %>
<%
	String custno = request.getParameter("custno");
 	
	String sql = "select * from member_tbl_02 where custno = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	stmt.setString(1, custno);
	
	ResultSet rs = stmt.executeQuery();
			
			
			
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

section table {
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
		<a href="addmember.jsp">회원등록</a> <a href="getMember.jsp">회원목록조회/수정</a>
		<a href="memberMoney.jsp">회원매출조회</a> <a href="index.jsp">홈으로.</a>
	</nav>
	<section>
		<br> <br>

		<div>
			<h2>홈쇼핑 회원 정보 수정</h2>
			<%
				if(rs.next()){
			%>
			<from action="action.jsp" method="post">
			<table>
				<tr>
					<th>회원 번호</th>
					<th><input type="text" name="custno" value="<%=rs.getString("custno")%>"></th>
				</tr>

				<tr>
					<th>회원 성명</th>
					<th><input type="text" name="custname" value="<%=rs.getString("custname")%>"></th>
				</tr>

				<tr>
					<th>전화번호</th>
					<th><input type="text" name="phone" value="<%=rs.getString("phone")%>"></th>
				</tr>

				<tr>
					<th>주소</th>
					<th><input type="text" name="address"value="<%=rs.getString("address")%>"></th>
				</tr>

				<tr>
					<th>가입일자</th>
					<th><input type="text" name="joindate" value="<%=rs.getDate("joindate")%>"></th>
				</tr>

				<tr>
					<th>고객등급</th>
					<th><input type="text" name="grade" value="<%=rs.getString("grade")%>"></th>
				</tr>

				<tr>
					<th>도시코드</th>
					<th><input type="text" name="city" value="<%=rs.getString("city")%>"></th>
				</tr>
				<tr>
					<td colspan=2 align=center><input type="submit" value="수정">
					<button type="button" onclick="location.href='getMember.jsp'">조회</button></td>
				</tr>
			</table>
			</from>
			<%
				}
			%>
		</div>
	</section>
	<footer>
		<div>이수호</div>

	</footer>
</body>
</html>