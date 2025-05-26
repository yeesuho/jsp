<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./dbConnection.jsp" %>
<%
	String sql = "select to_char(goods_num.nextval, 'fm000000'), to_char(sysdate,'yyyy-mm-dd') from dual";
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
<%@ include file = "./nav.jsp" %>
<section>
	<h1>상품정보 등록</h1>
	<form name="form" action="action.jsp" method="post">
		<input type="hidden" name="action" value="insertGoods">
		<%
			if(rs.next()) {
		%>
		<table>
			<tr>
				<td>상품코드(자동채번)</td>
				<td><input type="text" name="goods_cd" value="<%=rs.getString(1) %>" readonly></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" name="goods_nm"></td>
			</tr>
			<tr>
				<td>단가</td>
				<td><input type="text" name="goods_price"></td>
			</tr>
			<tr>
				<td>원가</td>
				<td><input type="text" name="cost"></td>
			</tr>
			<tr>
				<td>입고일자(변경불가)</td>
				<td><input type="text" name="in_date" value="<%=rs.getString(2) %>" readonly></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="저장"><button type="button" onclick="location.href='./goodsList.jsp'">상품 목록</button></td>
			</tr>
		</table>
		<%
			}
		%>
	</form>
	
</section>

<%@ include file = "./nav.jsp" %>
</body>
</html>