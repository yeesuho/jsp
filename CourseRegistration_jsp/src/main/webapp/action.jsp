<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
<%
String action = request.getParameter("action");
String move_url = "";
String msg = "";

String id = request.getParameter("id");
System.out.println(id);
String name = request.getParameter("name");
String credit = request.getParameter("credit");
String lecturer = request.getParameter("lecturer");
String week = request.getParameter("week");
String start_hour = request.getParameter("start_hour");
String end_end = request.getParameter("end_end");

String idx = request.getParameter("idx");
String major = request.getParameter("major");
String field = request.getParameter("field");

String sql = null;


try {
	switch (action) {
	case "insert":
		// 회원 등록
		sql = "insert into course_tbl (id, name, lecturer, credit, week, start_hour, end_end) values (?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement stmtAdd = conn.prepareStatement(sql);
		stmtAdd.setString(1, id);
		stmtAdd.setString(2, name);
		stmtAdd.setString(3, lecturer);
		stmtAdd.setString(4, credit);
		stmtAdd.setString(5, week);
		stmtAdd.setString(6, start_hour);
		stmtAdd.setString(7, end_end);
		
		stmtAdd.executeUpdate();
		
		stmtAdd.close();
		

		msg = "등록이 완료되었습니다.";
		move_url = "index.jsp";

		break;
	case "update":
		sql = "update course_tbl set name = ?, lecturer = ?, credit= ?, week=?, start_hour=?, end_end=? where id = ?";
		PreparedStatement stmtUpdate = conn.prepareStatement(sql);
		
		stmtUpdate.setString(1, name);
		stmtUpdate.setString(2, lecturer);
		stmtUpdate.setString(3, credit);
		stmtUpdate.setString(4, week);
		stmtUpdate.setString(5, start_hour);
		stmtUpdate.setString(6, end_end);
		stmtUpdate.setString(7, id);
		stmtUpdate.executeUpdate();
		stmtUpdate.close();
		
		msg = "수정이 완료되었습니다.";
		move_url = "index.jsp";
		
		break;
		
    case "delete":
    	System.out.println(id);
    	sql = "delete course_tbl where id = ?";
    	PreparedStatement stmtDelete = conn.prepareStatement(sql);
    	
    	
    	stmtDelete.setString(1, id);
    	stmtDelete.executeUpdate();
    	stmtDelete.close();
        
    	msg = "삭제가 완료되었습니다.";
        move_url = "index.jsp";  
        
        
        break;
	default:
		msg = "잘못된 요청입니다.";

		move_url = "errorPage.jsp";
		break;
	}

	// 5. 페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("alert('" + msg + "');");
	out.println("location.replace('" + move_url + "');");
	out.println("</script>");

} catch (Exception e) {
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