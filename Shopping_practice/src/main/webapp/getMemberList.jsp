<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./dbConnection.jsp" %>
<%
	String sql = "select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd') joindate, case grade when 'A' then 'VIP' when 'B' then '일반' else '직원' end grade, city from member_tbl_02";

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
<%@ include file = "./nav.jsp" %>
<section>
	<h1>회원목록조회/수정</h1>
	<table border="1">
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
			while(rs.next()) {
		%>
		<tr>
			<td><a href="./getMember.jsp?custno=<%= rs.getString("custno") %>"><%= rs.getString("custno") %></a></td>
			<td><%= rs.getString("custname") %></td>
			<td><%= rs.getString("phone") %></td>
			<td><%= rs.getString("address") %></td>
			<td><%= rs.getString("joindate") %></td>
			<td><%= rs.getString("grade") %></td>
			<td><%= rs.getString("city") %></td>
		</tr>
		<%
			}
		%>
	</table>
</section>
<%@ include file = "./footer.jsp" %>
</body>
</html>