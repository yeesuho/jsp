<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
<%
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");

// 현재 날짜를 얻어오기
java.util.Calendar cal = java.util.Calendar.getInstance();
cal.setTime(new java.util.Date());  // 현재 날짜로 설정

// 날짜를 "yyyy-MM-dd" 형식으로 포맷
String join_date = sdf.format(cal.getTime());

String sql = "select nvl(max(cust_no), 00000) + 1 cust_no from member_tbl_001";

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
		<h1>회원정보관리(등록)</h1>
		<%
		if (rs.next()) {
		%>
		<form name="form" action="./action.jsp" method="post">
		<input type="hidden" name="action" value="member_insert" />
			<table>
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="cust_no"
						value="<%=rs.getString("cust_no")%>" readonly/></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="cust_name" /></td>
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td><input type="text" name="phone" /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" /></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="join_date" value="<%=join_date%>"
						readonly /></td>
				</tr>
				<tr>
					<td>상태구분</td>
					<td>
						<select name="stat_fg">
							<option value="0">정상</option>
							<option value="1">탈퇴</option>
							<option value="2">휴면</option>
						</select>					
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" ><input type="submit" value="등록" />
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