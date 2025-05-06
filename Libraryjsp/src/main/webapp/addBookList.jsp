<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./dbConnection.jsp"%>
<%
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
java.util.Calendar cal = java.util.Calendar.getInstance();
cal.setTime(new java.util.Date());
String in_date = sdf.format(cal.getTime());

// 숫자 부분만 채번
String sql = "select lpad(nvl(max(substr(book_code, 2)), '0') + 1, 5, '0') num_part from book_tbl_001";
PreparedStatement stmt = conn.prepareStatement(sql);
ResultSet rs = stmt.executeQuery();
String numPart = "00001";
if (rs.next()) {
    numPart = rs.getString("num_part");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
<script>
function updateBookCode() {
    const genreSelect = document.getElementById("book_type");
    const selectedGenre = genreSelect.value;
    const numberPart = "<%= numPart %>";
    document.getElementById("book_code").value = selectedGenre + numberPart;
}
</script>
</head>
<body>
	<%@ include file="./nav.jsp"%>
	<section>
		<h1>도서 등록</h1>
		<form action="./action.jsp" method="post">
			<table>
				<tr>
					<td>도서코드(자동)</td>
					<td><input type="text" name="book_code" id="book_code" value="" readonly /></td>
				</tr>
				<tr>
					<td>도서명</td>
					<td><input type="text" name="book_name" /></td>
				</tr>
				<tr>
					<td>장르(A:에세이,B:인문,C:소설)</td>
					<td>
						<select name="book_type" id="book_type" onchange="updateBookCode()">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>작가</td>
					<td><input type="text" name="book_author" /></td>
				</tr>
				<tr>
					<td>입고일자</td>
					<td><input type="text" name="in_date" value="<%=in_date%>" /></td>
				</tr>
				<tr>
					<td>도서상태</td>
					<td>
						<select name="stat_fg">
							<option value="0">대여가능</option>
							<option value="1">대여중</option>
						</select>					
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" >
						<input type="submit" value="등록" />
						<button type="button" onclick="location.href='./getBookList.jsp'">조회</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="./footer.jsp"%>
</body>
</html>
