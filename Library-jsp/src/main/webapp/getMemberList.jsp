<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
<%
String sql = "select cust_no, cust_name, phone, address, to_char(join_date, 'yyyy-mm-dd') join_date, case stat_fg when '0' then '정상' when '1' then '휴면' else '탈퇴' end stat_fg from member_tbl_001 order by cust_no asc";

PreparedStatement stmt = conn.prepareStatement(sql);
ResultSet rs = stmt.executeQuery();
%>
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
	<%@ include file="./nav.jsp"%>	
	<section>
		<h1><button type="button" onclick="location.href='./addMember.jsp'">회원등록</button></h1>
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>핸드폰번호</td>
				<td>주소</td>
				<td>가입일자</td>
				<td>상태구분</td>
			</tr>
			<%
			while (rs.next()) {
			%>

			<tr>
				<td><a href="./getMember.jsp?cust_no=<%=rs.getString("cust_no")%>"><%=rs.getString("cust_no")%></a></td>
				<td><%=rs.getString("cust_name")%></td>
				<td><%=rs.getString("phone")%></td>
				<td><%=rs.getString("address")%></td>
				<td><%=rs.getString("join_date")%></td>
				<td><%=rs.getString("stat_fg")%></td>
			</tr>
			<%
				}
			%>
		</table>
	</section>

	<%@ include file="./footer.jsp"%>
</body>
</html>