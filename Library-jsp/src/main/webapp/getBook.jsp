<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
<%
String book_code = request.getParameter("book_code");
String sql = "select * from book_tbl_001 where book_code = ?";

PreparedStatement stmt = conn.prepareStatement(sql);

stmt.setString(1, book_code);

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
		<h1>보유도서관리(수정)</h1>

		<%
		if (rs.next()) {
		%>
		<form name = "form" action="./action.jsp" method="post">
		<input type="hidden" name="action" value="book_delete"/>
			<table>
				<tr>
					<td>도서코드(자동채번)</td>
					<td><input type="text" name="book_code"
						value="<%=rs.getString("book_code")%>" readonly/></td>
				</tr>

				<tr>
					<td>도서명</td>
					<td><input type="text" name="book_name"
						value="<%=rs.getString("book_name")%>" readonly/></td>
				</tr>

				<tr>
					<td>장르(A:에세이,B:인문,C:소설")</td>
					<td><input type="text" name="book_type"
						value="<%=rs.getString("book_type")%>" readonly/></td>
				</tr>

				<tr>
					<td>작가</td>
					<td><input type="text" name="book_author"
						value="<%=rs.getString("book_author")%>" readonly/></td>
				</tr>

				<tr>
					<td>입고일자</td>
					<td><input type="text" name="in_date"
						value="<%=rs.getDate("in_date")%>" readonly/></td>
				</tr>

				<tr>
					<td>도서상태</td>
					<td>
						<select name="stat_fg">
							<option value="0">대여가능</option>
							<option value="1">대여중</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정" />
					<button type="button" onclick="location.href='./getBookList.jsp'">조회</button>
					</td>
				</tr>
				
			</table>

		</form>
		<%
		}
		%>
	</section>

	<%@ include file="./footer.jsp"%>
</body>
</html>