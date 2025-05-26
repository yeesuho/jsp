<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./dbConnection.jsp" %>
<%
	String sql = "select st.store_cd, store_nm, to_char(sum(case when pay_type = '01' then sl.sale_cnt * g.goods_price else 0 end), '999,999')||'원' 현금매출, to_char(sum(case when pay_type = '02' then sl.sale_cnt * g.goods_price else 0 end), '999,999')||'원' 카드매출, to_char(sum(sl.sale_cnt * g.goods_price),'999,999')||'원' 총매출 from goods_tbl_003 g, store_tbl_003 st, sale_tbl_003 sl where sl.goods_cd = g.goods_cd and sl.store_cd = st.store_cd group by st.store_cd, st.store_nm order by 4 desc";

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
<%@ include file = "nav.jsp" %>
<section>
	<h1>점포별매출현황</h1>
	<table border = '1'>
		<tr>
			<td>점포명</td>
			<td>현금매출</td>
			<td>카드매출</td>
			<td>총매출</td>
		</tr>
		<%
			while(rs.next()) {
		%>
		<tr>
			<td><a href="./mcList.jsp?store_cd=<%=rs.getString(1) %>"><%=rs.getString(2) %></a></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
		</tr>
		<%
			}
		%>
	</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>