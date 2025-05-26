<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./dbConnection.jsp" %>
<%
	String store_cd = request.getParameter("store_cd");
	String sql = "select case when sl.sale_fg = '1' then '판매' else '판매취소' end sale_fg, sl.sale_no, to_char(sl.sale_ymd,'yyyy-mm-dd'), g.goods_nm, sl.sale_cnt, g.goods_price, case when sl.pay_type = '01' then '현금' else '카드' end pay_type from sale_tbl_003 sl join store_tbl_003 st on sl.store_cd = st.store_cd join goods_tbl_003 g on g.goods_cd = sl.goods_cd where st.store_cd = ?";
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, store_cd);
	
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
<%@ include file = "./nav.jsp" %>
<section>
	<table border="1">
		<tr>
			<td>판매구분</td>
			<td>판매번호</td>
			<td>판매일자</td>
			<td>상품명</td>
			<td>판매수량</td>
			<td>판매금액</td>
			<td>수취구분</td>
		</tr>
		<%
			while(rs.next()){
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
		</tr>
		<%
			}
		%>
	</table>
</section>
<%@ include file = "./footer.jsp" %>
</body>
</html>