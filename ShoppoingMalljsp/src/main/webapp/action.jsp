<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file='dbConnection.jsp'%>
<%
	//회원 등록화면에서 입력한 내용 받아오기
	//성명, 전화, 주소, 가입일자, 고객등급, 도시코드
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	Date joindate = Date.valueOf(request.getParameter("joindate"));
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	//DB에 저장하기
	//3. 질의문 준비
	String sql = "insert into member_tbl_02 values ((select nvl(max(custno), 100000) + 1 from member_tbl_02), ?, ?, ?, ?, ?, ?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	//4. 질의문 세팅
	stmt.setString(1, custname);
	stmt.setString(2, phone);
	stmt.setString(3, address);
	stmt.setDate(4, joindate);
	stmt.setString(5, grade);
	stmt.setString(6, city);

	//5. 질의문 실행
	stmt.executeUpdate();
	response.sendRedirect("addmember.jsp");
	//6. 닫기
	if(stmt != null) stmt.close();
	if(conn != null) conn.close();
	
	//저장후 이동할 화면 알려주기
	
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