<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./dbConnection.jsp" %>
<%

	String goods_cd = request.getParameter("goods_cd");

	String sql = "select goods_cd, goods_nm, goods_price, cost, to_char(in_date,'yyyy-mm-dd') from goods_tbl_003 where goods_cd = ?";
	
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, goods_cd);
	
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
<h1>상품정보 변경</h1>
<%
	if(rs.next()) {
%>
<form name="form" action="./action.jsp" method="post">
<input type="hidden" name="action" value="updateGoods">

	<table>
		<tr>
			<td>상품코드(변경불가)</td>
			<td><input type="text" name="goods_cd" value="<%=rs.getString(1) %>" readonly></td>
		</tr>
		<tr>
			<td>상품명</td>
			<td><input type="text" name="goods_nm" value="<%=rs.getString(2) %>"></td>
		</tr>
		<tr>
			<td>단가</td>
			<td><input type="text" name="goods_price" value="<%=rs.getString(3) %>"></td>
		</tr>
		<tr>
			<td>원가</td>
			<td><input type="text" name="cost" value="<%=rs.getString(4) %>"></td>
		</tr>
		<tr>
			<td>입고일자(변경불가)</td>
			<td><input type="text" value="<%=rs.getString(5) %>" readonly></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="저장"><button type="button" onclick="location.href='./goodsList.jsp'">상품목록</button></td>
		</tr>
	</table>
	
</form>
<%
	}
	%>
</section>
<%@ include file = "./footer.jsp" %>
</body>
</html>