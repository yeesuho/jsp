<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
<%
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
String rent_ymd = sdf.format(new java.util.Date());

java.util.Calendar cal = java.util.Calendar.getInstance();
cal.setTime(new java.util.Date());
cal.add(java.util.Calendar.DATE, 7);
String close_ymd = sdf.format(cal.getTime());


String sql = "select nvl(max(rent_no), 00000) + 1 rent_no from rental_tbl_001 where rent_ymd = to_date(?, 'YYYY-MM-DD')";

PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1, rent_ymd);

int rent_no = 0;
ResultSet rs = stmt.executeQuery();

if (rs.next())
	rent_no = rs.getInt("rent_no");
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
		<h1>대여도서 등록</h1>
		<form name="form" action="./action.jsp" method="post">
			<input type="hidden" name="action" value="rent_insert" />
			<table>
				<tr>
					<td>대여일자</td>
					<td><input type="text" name="rent_ymd" value="<%=rent_ymd %>" readonly></td>

				</tr>
				<tr>
					<td>대여번호(자동채번)</td>
					<td><input type="text" name="rent_no" value="<%=String.format("%05d", rent_no) %>"></td>
				</tr>
				<tr>
					<td>도서코드</td>
					<td><input type="text" name="rent_book"></td>
				</tr>
				<tr>
					<td>고객번호</td>
					<td><input type="text" name="rent_rent"></td>
				</tr>
				<tr>
					<td>반납기한(대여일 7일후)</td>
					<td><input type="text" name="close_ymd" value="<%=close_ymd %>" readonly></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="등록"><button type="button" onclick="location.href='./rentNow.jsp'">조회</button></td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="./footer.jsp"%>

</body>
</html>