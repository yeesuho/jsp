<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file = "./dbConnection.jsp" %>
<%
	String sql = "select id, c.name, credit, l.name, case week when 1 then '월' when 2 then '화' when 3 then '수' when 4 then '목' when 5 then '금' when 6 then '토' end week, lpad(start_hour, 4, 0), lpad(end_end,4,0) from course_tbl c, lecturer_tbl l where c.lecturer = l.idx";
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	ResultSet rs = stmt.executeQuery();
	
	String total = "select count(name) from course_tbl";
	PreparedStatement stmt2 = conn.prepareStatement(total);
	ResultSet rs2 = stmt2.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@ include file = "./nav.jsp" %>
	<section>
	<%
		if(rs2.next()) {
	%>
	<h1>총 <%=rs2.getString(1) %>개의 교과목이 있습니다.</h1>
	<%
		}
	%>
	<br/>
<!-- 	<form name="form" action="./action.jsp" method="post"> -->
<!-- 	<input type="hidden" name="action" value="delete"/> -->
	<table border="1">
		<tr>
			<td>과목코드</td>
			<td>과목명</td>
			<td>학점</td>
			<td>담당강사</td>
			<td>요일</td>
			<td>시작시간</td>
			<td>종료시간</td>
			<td>관리</td>
		</tr>
		<%
			while(rs.next()) {
		%>
		<tr>
			
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
			<td>
			<a href="update.jsp?id=<%=rs.getString("id") %>">수정</a>
<!-- 			/ <input type="submit" value="삭제"/> -->
			<a href="action.jsp?id=<%=rs.getString("id") %>&action=delete">삭제</a>
			</td>
		</tr>
		<%
			}
		%>
		
		<tr>
			<td colspan="8" align="right">
			<button type="button" onclick="location.href='./add.jsp'">작성</button>
			</td>
		</tr>
	</table>
<!-- 	</form> -->
	
	
	</section>
	<%@ include file = "./footer.jsp" %>
</body>
</html>