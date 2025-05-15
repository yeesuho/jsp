<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
<%
String sql = "select book_code, book_name, case book_type when 'A' then '에세이' when 'B' then '인문' else '소설' end book_type, book_author, to_char(in_date, 'yyyy-mm-dd') in_date, case stat_fg when '0' then '대여가능' else '대여중' end stat_fg from book_tbl_001 order by book_code";

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
		<h1>
			<button type="button" onclick="location.href='./addBookList.jsp'">도서등록</button>
		</h1>
		<table border="1">
			<tr>
				<td>도서코드</td>
				<td>도서명</td>
				<td>장르</td>
				<td>작가</td>
				<td>입고일자</td>
				<td>도서상태</td>
			</tr>
			<%
			while (rs.next()) {
			%>

			<tr>
				<td><a
					href="./getBook.jsp?book_code=<%=rs.getString("book_code")%>"><%=rs.getString("book_code")%></a></td>
				<td><%=rs.getString("book_name")%></td>
				<td><%=rs.getString("book_type")%></td>
				<td><%=rs.getString("book_author")%></td>
				<td><%=rs.getString("in_date")%></td>
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