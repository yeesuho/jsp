<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
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
<body>
	<%@ include file="./nav.jsp"%>
	<section>
		<h1>홈쇼핑 회원 정보 수정</h1>
		<%
		if (rs.next()) {
		%>
		<form name="form" action="./action.jsp" method="post">
			<input type="hidden" name="action" value="update" />
			<table>
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="custno"
						value="<%=rs.getString("custno")%>" readonly/></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname"
						value="<%=rs.getString("custname")%>" /></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone"
						value="<%=rs.getString("phone")%>" /></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address"
						value="<%=rs.getString("address")%>" /></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate"
						value="<%=rs.getDate("joindate")%>" /></td>
				</tr>
				<tr>
					<td>고객등급 [A:VIP,B:일반,C:직원]</td>
					<td><input type="text" name="grade"
						value="<%=rs.getString("grade")%>" /></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city"
						value="<%=rs.getString("city")%>" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정" />
					<button type="button" onclick="location.href='./getMemberList.jsp'">조회</button></td>
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