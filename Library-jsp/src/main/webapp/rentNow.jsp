<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
<%
String sql = "select r.rent_ymd, r.rent_no, r.rent_book, b.book_name, r.rent_rent, m.cust_name, r.close_ymd from rental_tbl_001 r join member_tbl_001 m on r.rent_rent = m.cust_no join book_tbl_001 b on r.rent_book = b.book_code where b.stat_fg = '1' order by 1, 2, 3 asc";

PreparedStatement stmt = conn.prepareStatement(sql);
ResultSet rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<header>
		<h1>도서대여관리 ver 1.0</h1>
	</header>
	<%@ include file="./nav.jsp"%>
	<section>
		<h1>도서대여현황</h1>
		<table border="1">
			<tr>
				<td>대여일자</td>
				<td>대여번호</td>
				<td>도서코드</td>
				<td>대여도서명</td>
				<td>고객번호</td>
				<td>대여고객명</td>
				<td>반납기한</td>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("rent_ymd")%></td>
				<td><%=rs.getString("rent_no")%></td>
				<td><%=rs.getString("rent_book")%></td>
				<td><%=rs.getString("book_name")%></td>
				<td><%=rs.getString("rent_rent")%></td>
				<td><%=rs.getString("cust_name")%></td>
				<td><%=rs.getString("close_ymd")%></td>
			</tr>
			<%
			}
			%>
		</table>

	</section>

	<%@ include file="./footer.jsp"%>
</body>
</html>