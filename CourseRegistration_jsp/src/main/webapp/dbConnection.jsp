<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//2. 연결설정
String url = "jdbc:oracle:thin:@localhost:1521:xe";

Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection(url, "suho", "1234");

%>