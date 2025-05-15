<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
<%
String action = request.getParameter("action");
String move_url = "";
String msg = "";

String cust_no = request.getParameter("cust_no");
String cust_name = request.getParameter("cust_name");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
Date join_date = null;
if (action.equals("member_insert") || action.equals("member_update")) {
    
    String join_date_str = request.getParameter("join_date");
    try {
        if (join_date_str != null && !join_date_str.isEmpty()) {
            join_date = Date.valueOf(join_date_str); 
        } else {
            throw new IllegalArgumentException("가입일자가 비어있습니다.");
        }
    } catch (IllegalArgumentException e) {
    	System.out.println("가입일자 형식이 잘못되었습니다.");
        return;  
    }
}

String stat_fg = request.getParameter("stat_fg");

String book_code = request.getParameter("book_code");
String book_name = request.getParameter("book_name");
String book_type = request.getParameter("book_type");
String book_author = request.getParameter("book_author");
Date in_date = null;
if (action.equals("book_insert") || action.equals("book_update")) {
    
    String in_date_str = request.getParameter("in_date");
    try {
        if (in_date_str != null && !in_date_str.isEmpty()) {
            in_date = Date.valueOf(in_date_str);
        } else {
            throw new IllegalArgumentException("입고일자가 비어있습니다.");
        }
    } catch (IllegalArgumentException e) {
        System.out.println("입고일자 형식이 잘못되었습니다.");
        return; 
    }
}

String rent_ymd = request.getParameter("rent_ymd") != null ? request.getParameter("rent_ymd").replace("-", "") : null;

String rent_no = request.getParameter("rent_no");
String rent_book = request.getParameter("rent_book");
String rent_rent = request.getParameter("rent_rent");
String close_ymd = request.getParameter("close_ymd") != null ? request.getParameter("close_ymd").replace("-", "") : null;

String return_ymd = request.getParameter("return_ymd") != null ? request.getParameter("return_ymd").replace("-", "") : null;
String return_fg = request.getParameter("return_fg");

String sql = null;

try {
    switch(action) {
        case "member_insert":
            // 회원 등록
            sql = "insert into member_tbl_001 (cust_no, cust_name, phone, address, join_date, stat_fg) values ((select nvl(max(cust_no), 100000) + 1 from member_tbl_001), ?, ?, ?, ?, ?)";
            PreparedStatement stmtMember = conn.prepareStatement(sql);
            
            stmtMember.setString(1, cust_name);
            stmtMember.setString(2, phone);
            stmtMember.setString(3, address);
            stmtMember.setDate(4, join_date);
            stmtMember.setString(5, stat_fg);
            stmtMember.executeUpdate();
            stmtMember.close();
            
            msg = "회원 등록이 완료되었습니다.";
            move_url = "getMemberList.jsp"; 
            
            
            break;
        case "member_update":
            // 회원 수정
            sql = "update member_tbl_001 set cust_name = ?, phone = ?, address = ?, join_date = ?, stat_fg=? where cust_no = ?";
            PreparedStatement stmtUpdateMember = conn.prepareStatement(sql);
            stmtUpdateMember.setString(1, cust_name);
            stmtUpdateMember.setString(2, phone);
            stmtUpdateMember.setString(3, address);
            stmtUpdateMember.setDate(4, join_date);
            stmtUpdateMember.setString(5, stat_fg);
            stmtUpdateMember.setString(6, cust_no);
            stmtUpdateMember.executeUpdate();
            stmtUpdateMember.close();
            
            msg = "회원 정보 수정이 완료되었습니다.";
            move_url = "getMemberList.jsp";  
            
            break;

        case "rent_insert":
            // 대여 도서 등록
            sql = "insert into rental_tbl_001 (rent_ymd, rent_no, rent_book, rent_rent, close_ymd, return_ymd, return_fg) values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmtRent = conn.prepareStatement(sql);
            stmtRent.setString(1, rent_ymd);
            stmtRent.setString(2, rent_no);
            stmtRent.setString(3, rent_book);
            stmtRent.setString(4, rent_rent);
            stmtRent.setString(5, close_ymd);
            stmtRent.setString(6, null);
            stmtRent.setString(7, "1");
            stmtRent.executeUpdate();
            stmtRent.close();
            msg = "대여 등록이 완료되었습니다.";
            move_url = "rentNow.jsp";  
            
            break;

        case "book_insert":
            // 보유 도서 추가
            sql="insert into book_tbl_001 (book_code, book_name, book_type, book_author, in_date, stat_fg) values (?, ?, ?, ?, to_date(?, 'yyyy-mm-dd'), ?)";
            PreparedStatement stmtAddBook = conn.prepareStatement(sql);
            stmtAddBook.setString(1, book_code);
            stmtAddBook.setString(2, book_name);
            stmtAddBook.setString(3, book_type);
            stmtAddBook.setString(4, book_author);
            stmtAddBook.setDate(5, in_date);
            stmtAddBook.setString(6, stat_fg);
            stmtAddBook.executeUpdate();
            stmtAddBook.close();
            
            msg = "도서 등록이 완료되었습니다.";
            move_url = "getBookList.jsp";  
            
            break;
        case "book_delete":
        	sql = "delete book_tbl_001 where book_code = ?";
        	PreparedStatement stmtUpdateBook = conn.prepareStatement(sql);
        	
        	
        	stmtUpdateBook.setString(1, book_code);
        	stmtUpdateBook.executeUpdate();
        	stmtUpdateBook.close();
            
        	msg = "보유 도서 정보 수정이 완료되었습니다.";
            move_url = "getBookList.jsp";  
            
            
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