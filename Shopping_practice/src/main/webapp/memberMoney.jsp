<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./dbConnection.jsp" %>
<%
	String sql = "select me.custno, custname, case grade when 'A' then 'VIP' when 'B' then '일반' else '직원' end grade, sum(price) price from member_tbl_02 me, money_tbl_02 mo where me.custno = mo.custno group by me.custno, custname, grade order by 4 desc";
	
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
	<h1>회원매출조회</h1>
	 <table border="1">
	 	<tr>
	 		<td>회원번호</td>
	 		<td>회원성명</td>
	 		<td>고객등급</td>
	 		<td>매출</td>
	 	</tr>
	 	<%
	 		while(rs.next()) {
	 	%>
	 	<tr>
	 		<td><%=rs.getString("custno") %></td>
	 		<td><%=rs.getString("custname") %></td>
	 		<td><%=rs.getString("grade") %></td>
	 		<td><%=rs.getString("price") %></td>
	 	</tr>
	 	<%
	 		}
	 	%>
	 </table>
</section>
<%@ include file = "./footer.jsp" %>
</body>
</html>