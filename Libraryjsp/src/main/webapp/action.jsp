<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "./dbConnection.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String book_code = request.getParameter("book_code");
String book_name = request.getParameter("book_name");
String book_type = request.getParameter("book_type");
String book_author = request.getParameter("book_author");
String in_date = request.getParameter("in_date");
String stat_fg = request.getParameter("stat_fg");

String cust_no = request.getParameter("cust_no");
String cust_name = request.getParameter("cust_name");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String join_date = request.getParameter("join_date");

String rent_no = request.getParameter("rent_no");
String rent_ymd = request.getParameter("rent_ymd");
String rent_book = request.getParameter("rent_book");
String rent_rent = request.getParameter("rent_rent");
String close_ymd = request.getParameter("close_ymd");

try {
	if (book_code != null && book_name != null) {
		// 도서 등록 또는 수정
		String sql = "MERGE INTO book_tbl_001 b " + "USING (SELECT ? AS book_code FROM dual) src "
		+ "ON (b.book_code = src.book_code) " + "WHEN MATCHED THEN "
		+ "  UPDATE SET book_name=?, book_type=?, book_author=?, in_date=TO_DATE(?, 'YYYY-MM-DD'), stat_fg=? "
		+ "WHEN NOT MATCHED THEN "
		+ "  INSERT (book_code, book_name, book_type, book_author, in_date, stat_fg) "
		+ "  VALUES (?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, book_code); // for merge
		stmt.setString(2, book_name);
		stmt.setString(3, book_type);
		stmt.setString(4, book_author);
		stmt.setString(5, in_date);
		stmt.setString(6, stat_fg);
		// insert values
		stmt.setString(7, book_code);
		stmt.setString(8, book_name);
		stmt.setString(9, book_type);
		stmt.setString(10, book_author);
		stmt.setString(11, in_date);
		stmt.setString(12, stat_fg);
		stmt.executeUpdate();
		stmt.close();
		response.sendRedirect("getBookList.jsp");
	} else if (cust_no != null && cust_name != null) {
		// 회원 등록 또는 수정
		String sql = "MERGE INTO member_tbl_001 m " + "USING (SELECT ? AS cust_no FROM dual) src "
		+ "ON (m.cust_no = src.cust_no) " + "WHEN MATCHED THEN "
		+ "  UPDATE SET cust_name=?, phone=?, address=?, stat_fg=? " + "WHEN NOT MATCHED THEN "
		+ "  INSERT (cust_no, cust_name, phone, address, join_date, stat_fg) "
		+ "  VALUES (?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, cust_no); // for merge
		stmt.setString(2, cust_name);
		stmt.setString(3, phone);
		stmt.setString(4, address);
		stmt.setString(5, stat_fg);
		// insert values
		stmt.setString(6, cust_no);
		stmt.setString(7, cust_name);
		stmt.setString(8, phone);
		stmt.setString(9, address);
		stmt.setString(10, join_date);
		stmt.setString(11, stat_fg);
		stmt.executeUpdate();
		stmt.close();
		response.sendRedirect("getMemberList.jsp");
	} else if (rent_no != null && rent_book != null) {
		// 대여 등록
		String sql = "INSERT INTO rental_tbl_001 (rent_no, rent_ymd, rent_book, rent_rent, close_ymd) "
		+ "VALUES (?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, TO_DATE(?, 'YYYY-MM-DD'))";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, rent_no);
		stmt.setString(2, rent_ymd);
		stmt.setString(3, rent_book);
		stmt.setString(4, rent_rent);
		stmt.setString(5, close_ymd);
		stmt.executeUpdate();
		stmt.close();
		response.sendRedirect("rentNow.jsp");
	} else {
		out.println("처리할 데이터가 없습니다.");
	}
} catch (Exception e) {
	e.printStackTrace();
	out.println("오류 발생: " + e.getMessage());
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