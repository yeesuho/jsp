<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./dbConnection.jsp" %>    
<%
	String sql = "select to_char(sale_num.nextval, 'fm0000'), to_char(sysdate,'yyyy-mm-dd') from dual";
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	ResultSet rs = stmt.executeQuery();
	
	String sql2 = "select distinct sale_fg, case when sale_fg = '1' then '판매' else '판매취소' end from sale_tbl_003 order by 1";
	
	PreparedStatement stmt2 = conn.prepareStatement(sql2);
	
	ResultSet rs2 = stmt2.executeQuery();
	
	String sql3 = "select store_cd, store_nm from store_tbl_003";
	
	PreparedStatement stmt3 = conn.prepareStatement(sql3);
	
	ResultSet rs3 = stmt3.executeQuery();
	
	String sql4 = "select goods_cd, goods_nm from goods_tbl_003";
	
	PreparedStatement stmt4 =  conn.prepareStatement(sql4);
	
	ResultSet rs4 = stmt4.executeQuery();
			
	String sql5 = "select distinct pay_type, case when pay_type = '01' then '현금' else '카드' end from sale_tbl_003";
	
	PreparedStatement stmt5 = conn.prepareStatement(sql5);
	
	ResultSet rs5 = stmt5.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./style.css">
<script type="text/javascript">
	function validation() {
		let form = document.form;

		
		if (form.goods_cd.value === "선택") {
			alert("상품을 선택해주세요.");
			form.goods_cd.focus();
			return false;
		}

		
		if (form.sale_cnt.value.trim() === "") {
			alert("판매 수량을 입력해주세요.");
			form.sale_cnt.focus();
			return false;
		}

		
		if (isNaN(form.sale_cnt.value)) {
			alert("판매 수량은 숫자로 입력해주세요.");
			form.sale_cnt.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<%@ include file = "./nav.jsp" %>
<section>
	<h1>매출등록</h1>
	<form name="form" action="action.jsp" method="post" onSubmit="return validation()">
	<input type="hidden" name="action" value="insertMC">
	<%
		if(rs.next()) {
	%>
	
	<table>
		<tr>
			<td>판매번호(자동발생)</td>
			<td><input type='text' name="sale_no" value="<%=rs.getString(1) %>"></td>
		</tr>
		<tr>
			<td>판매일자(자동발생)</td>
			<td><input type='text' name="sale_ymd" value="<%=rs.getString(2) %>"></td>
		</tr>
		<tr>
			<td>판매구분</td>
			<td>
				<select name="sale_fg">
				<option>선택</option>
				<%
					while(rs2.next()){
				%>
					<option value="<%=rs2.getString(1) %>"><%=rs2.getString(2) %></option>
				<%
					}
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td>판매점포</td>
			<td>
				<select name="store_cd">
					<option>선택</option>
					<%
					while(rs3.next()){
				%>
					<option value="<%=rs3.getString(1) %>"><%=rs3.getString(2) %></option>
				<%
					}
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td>판매상품</td>
			<td>
				<select name="goods_cd">
					<option>선택</option>
					<%
					while(rs4.next()){
				%>
					<option value="<%=rs4.getString(1) %>"><%=rs4.getString(2) %></option>
				<%
					}
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type='text' name="sale_cnt"></td>
		</tr>
		<tr>
			<td>수취구분</td>
			<td>
				<select name="pay_type">
					<option>선택</option>
					<%
					while(rs5.next()){
				%>
					<option value="<%=rs5.getString(1) %>"><%=rs5.getString(2) %></option>
				<%
					}
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="등록"><button type="button" onclick="location.href='./nowMC.jsp'">조회</button></td>
		</tr>
	</table>
	<%
		}
	%>
	</form>
</section>

<%@ include file = "./footer.jsp" %>
</body>
</html>