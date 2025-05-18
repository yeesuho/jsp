<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbConnection.jsp" %>
<%
	String action = request.getParameter("action");
	String move_url = "getMemberList.jsp";
	String msg = "";
	
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	Date joindate = Date.valueOf(request.getParameter("joindate"));
	String grade = request.getParameter("grae");
	String city = request.getParameter("city");
	
	String sql = null;
	
	try {
		switch(action) {
			case "insert":
				sql = "insert into member_tbl_02 values((select nvl(max(custno), 100000) + 1 from member_tbl_02), ?, ?, ?, ?, ?, ?)";
				PreparedStatement stmtInsert = conn.prepareStatement(sql);
				stmtInsert.setString(1, custname);
				stmtInsert.setString(2, phone);
				stmtInsert.setString(3, address);
				stmtInsert.setDate(4, joindate);
				stmtInsert.setString(5, grade);
				stmtInsert.setString(6, city);
				stmtInsert.close();
				
				msg = "등록이 완료되었습니다.";
				
				
				break;
			case "update":
				sql = "update member_tbl_02 set custname = ?, phone = ?, address = ?, joindate = ?, grade = ?, city = ? where custno = ?";
				PreparedStatement stmtUpdate = conn.prepareStatement(sql);
				stmtUpdate.setString(1, custname);
				stmtUpdate.setString(2, phone);
				stmtUpdate.setString(3, address);
				stmtUpdate.setDate(4, joindate);
				stmtUpdate.setString(5, grade);
				stmtUpdate.setString(6, city);
				stmtUpdate.setString(7, custno);
				stmtUpdate.close();
				
				msg = "수정이 완료되었습니다.";
				
				break;
			default:
				msg = "잘못된 요청입니다.";
				
				
				break;
		}
		
		out.println("<script type='text/javascript'>");
		out.println("alert('"+msg+"');");
		out.println("location.replace('"+move_url+"')");
		out.println("</script>");
	}catch(Exception e) {
		e.printStackTrace();
		move_url = "errorPage.jsp";
		out.println("<script type='text/javascript'>");
		out.println("alert('오류가 발생했습니다.');");
		out.println("location.replace('"+move_url+"')");
		out.println("</script>");
	}
%>
