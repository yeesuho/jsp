<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./dbConnection.jsp" %>
<%
	String action = request.getParameter("action");
	String move_url = "";
	String msg = "";
	String sql = "";

	
	String goods_cd = request.getParameter("goods_cd");
	String goods_nm = request.getParameter("goods_nm");
	String goods_price = request.getParameter("goods_price");
	String cost = request.getParameter("cost");
	String in_date = request.getParameter("in_date");
	
	String store_cd = request.getParameter("store_cd");
	String store_nm = request.getParameter("store_nm");
	String store_fg = request.getParameter("store_fg");
	
	String sale_no = request.getParameter("sale_no");
	String sale_ymd = request.getParameter("sale_ymd");
	String sale_fg = request.getParameter("sale_fg");
// 	String store_cd = request.getParameter("store_cd");
// 	String goods_cd = request.getParameter("goods_cd");
	String sale_cnt = request.getParameter("sale_cnt");
	String pay_type = request.getParameter("pay_type");
	
	
	
	
	try {
		switch(action){
		case "insertMC":
			sql = "insert into sale_tbl_003 values(?,?,?,?,?,?,?)";
			PreparedStatement stmtInsertMC = conn.prepareStatement(sql);
			stmtInsertMC.setString(1, sale_no);
			stmtInsertMC.setString(2, sale_ymd);
			stmtInsertMC.setString(3, sale_fg);
			stmtInsertMC.setString(4, store_cd);
			stmtInsertMC.setString(5, goods_cd);
			stmtInsertMC.setString(6, sale_cnt);
			stmtInsertMC.setString(7, pay_type);
			stmtInsertMC.executeUpdate();
			stmtInsertMC.close();
			
			msg = "매출이 정상적으로 저장되었습니다.";
			move_url = "nowMC.jsp";
			break;
		case "insertGoods":
			sql = "insert into goods_tbl_003 values(?, ?, ?, ?, ?)";
			PreparedStatement stmtInsertGoods = conn.prepareStatement(sql);
			stmtInsertGoods.setString(1, goods_cd);
			stmtInsertGoods.setString(2, goods_nm);
			stmtInsertGoods.setString(3, goods_price);
			stmtInsertGoods.setString(4, cost);
			stmtInsertGoods.setString(5, in_date);
			stmtInsertGoods.executeUpdate();
			stmtInsertGoods.close();
			
			msg = "등록이 완료되었습니다.";
			move_url = "goodsList.jsp";
			break;
		case "updateGoods":
			sql = "update goods_tbl_003 set goods_nm = ?, goods_price = ?, cost = ? where goods_cd = ?";
			
			PreparedStatement stmtUpdateGoods = conn.prepareStatement(sql);
			
			stmtUpdateGoods.setString(1, goods_nm);
			stmtUpdateGoods.setString(2, goods_price);
			stmtUpdateGoods.setString(3, cost);

			stmtUpdateGoods.setString(4, goods_cd);
			System.out.println(goods_cd);
			stmtUpdateGoods.executeUpdate();
			stmtUpdateGoods.close();
			
			msg = "변경이 완료되었습니다.";
			move_url = "goodsList.jsp";
			break;
		default :
			msg = "잘못된 요청입니다.";
            
            move_url = "errorPage.jsp";  
            break;
			
		}
		out.println("<script type='text/javascript'>");
	    out.println("alert('" + msg + "');");
	    out.println("location.replace('" + move_url + "');");
	    out.println("</script>");
		
	} catch(Exception e) {
		e.printStackTrace();
	    move_url = "errorPage.jsp";  
	    out.println("<script type='text/javascript'>");
	    out.println("alert('오류가 발생했습니다.');");
	    out.println("location.replace('" + move_url + "');");
	    out.println("</script>");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>