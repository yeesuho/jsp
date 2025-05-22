<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
<%
	String sql = "select idx, name from lecturer_tbl";

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
	<%@ include file="nav.jsp"%>
	<section>
		<h1>교과목 추가</h1>
		<form name="form" action="./action.jsp" method="post">
			<input type="hidden" name="action" value="insert" />
			<table border="1">
				<tr>
					<td>교과목 코드</td>
					<td><input type="text" name="id" /></td>
				</tr>
				<tr>
					<td>과목명</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>담당강사</td>
					<td><select name="lecturer">
							<option value="">담당강사선택</option>
							<%
								while(rs.next()){
							%>
							<option value="<%=rs.getString("idx") %>"><%=rs.getString("name") %></option>
							<%
							}
							%>
					</select></td>
				</tr>
				<tr>
					<td>학점</td>
					<td><input type="text" name="credit" /></td>
				</tr>
				<tr>
					<td>요일</td>
					<td><input type="radio" name="week" value="1" />월 <input
						type="radio" name="week" value="2" />화 <input type="radio"
						name="week" value="3" />수 <input type="radio" name="week"
						value="4" />목 <input type="radio" name="week" value="5" />금 <input
						type="radio" name="week" value="6" />토</td>
				</tr>
				<tr>
					<td>시작</td>
					<td><input type="text" name="start_hour" /></td>
				</tr>
				<tr>
					<td>종료</td>
					<td><input type="text" name="end_end" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="button" onclick="location.href='./index.jsp'">목록</button>
						<input type="submit" value="완료" />
					</td>

				</tr>
			</table>
		</form>
	</section>

	<%@ include file="footer.jsp"%>
</body>
</html>