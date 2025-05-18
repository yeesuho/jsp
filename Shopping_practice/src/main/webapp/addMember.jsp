<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "./dbConnection.jsp" %>
<%
	String sql = "select nvl(max(custno), 100000) + 1 custno from member_tbl_02";
	
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
	<%@ include file="./nav.jsp"%>
	<section>
		<h1>홈쇼핑 회원 등록</h1>
		<%
			if(rs.next()) {
		%>
		<form name="form" action="./action.jsp" method="post">
			<input type="hidden" name="action" value="insert"/>
			<table border="1">
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" name="custno" value="<%=rs.getString("custno") %>" readonly /></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" /></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone"  /></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address"/></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="date" name="joindate" /></td>
				</tr>
				<tr>
					<td>고객등급 [A:VIP,B:일반,C:직원]</td>
					<td><input type="text" name="grade" /></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="등록"/><button type="button" onclick="location.href='./getMemberList.jsp'">조회</button></td>
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