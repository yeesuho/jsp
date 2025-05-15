<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
<%
String cust_no = request.getParameter("cust_no");
String sql = "select * from member_tbl_001 where cust_no = ?";

PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1, cust_no);
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
		<h1>회원정보관리(수정)</h1>
		<%
			if(rs.next()) {
		%>
		<form name="form" action="./action.jsp" method="post">
		<input type="hidden" name="action" value="member_update" />
			<table>
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="cust_no"
						value="<%=rs.getString("cust_no")%>" readonly/></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="cust_name"
						value="<%=rs.getString("cust_name")%>" /></td>
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td><input type="text" name="phone" value="<%=rs.getString("phone")%>" /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value="<%=rs.getString("address")%>" /></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="join_date" value="<%=rs.getDate("join_date")%>" readonly /></td>
				</tr>
				<tr>
					<td>상태구분</td>
					<td><input type="text" name="stat_fg" value="<%=rs.getString("stat_fg")%>"
						 /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정"/>
					<button type="button" onclick="location.href='./getMemberList.jsp'">조회</button>
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