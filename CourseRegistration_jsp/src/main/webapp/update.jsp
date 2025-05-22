<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
<%
String id = request.getParameter("id");
String sql = "select * from course_tbl where id = ?";

PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1, id);
ResultSet rs = stmt.executeQuery();


String sql2 = "select idx, name from lecturer_tbl";

PreparedStatement stmt2 = conn.prepareStatement(sql2);

ResultSet rs2 = stmt2.executeQuery();
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
		<h1>교과목 수정</h1>
		<%
		if (rs.next()) {
		%>
		<form name="form" action="./action.jsp" method="post">
			<input type="hidden" name="action" value="update" />
			<table border="1">
				<tr>
					<td>교과목 코드</td>
					<td><input type="text" name="id"
						value="<%=rs.getString("id")%>" readonly/></td>
				</tr>
				<tr>
					<td>과목명</td>
					<td><input type="text" name="name"
						value="<%=rs.getString("name")%>" /></td>
				</tr>
				<tr>
					<td>담당강사</td>
					<td><select name="lecturer">
							
							<%
								while(rs2.next()){
							%>
							<option value="<%=rs2.getString("idx") %>"><%=rs2.getString("name") %></option>
							<%
							}
							%>
					</select></td>
				</tr>
				<tr>
					<td>학점</td>
					<td><input type="text" name="credit" value="<%=rs.getString("credit") %>" /></td>
				</tr>
				<tr>
					<td>요일</td>
					<td><label><input type="radio" name="week" value="1" <%=rs.getString("week").equals("1") ? "checked" : "" %> />월</label>
					<label><input type="radio" name="week" value="2" <%=rs.getString("week").equals("2") ? "checked" : "" %>/>화 </label>
					<label><input type="radio" name="week" value="3" <%=rs.getString("week").equals("3") ? "checked" : "" %>/>수 </label>
					<label><input type="radio" name="week" value="4" <%=rs.getString("week").equals("4") ? "checked" : "" %>/>목 </label>
					<label><input type="radio" name="week" value="5" <%=rs.getString("week").equals("5") ? "checked" : "" %>/>금 </label>
					<label><input type="radio" name="week" value="6" <%=rs.getString("week").equals("6") ? "checked" : "" %>/>토 </label>
					
				</tr>
				<tr>
					<td>시작</td>
					<td><input type="text" name="start_hour"
						value="<%=rs.getString("start_hour")%>" /></td>
				</tr>
				<tr>
					<td>종료</td>
					<td><input type="text" name="end_end"
						value="<%=rs.getString("end_end")%>" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="button" onclick="location.href='./index.jsp'">목록</button>
						<button type="button" onclick="location.href='./index.jsp'">취소</button>
						<input type="submit" value="완료" />
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