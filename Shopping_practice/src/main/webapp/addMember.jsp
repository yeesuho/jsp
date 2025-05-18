<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "./dbConnection.jsp" %>
<%
	String sql = "select nvl(max(custno), 100000) + 1 custno from member_tbl_02";
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./style.css">
<script type="text/javascript">
	function validation() {
		const phoneRegexp = /^0\d{1,2}-\d{3,4}-\d{4}$/;
		const dateRegexp = /^\d{4}-(0)[1-9]|(1)[012]-0[1-9]|[1-2][0-9]|(3)[0-1]$/;
		const gradeRegexp = /^[ABC]$/;
		const cityRegexp = /^\d{2}$/;

		if (form.custname.value === "") {
			alert("회원 성명이 입력되지 않았습니다.");
			form.custname.focus();
			return false;
		}

		if (form.phone.value === "") {
			alert("전화번호가 입력되지 않았습니다.");
			form.phone.focus();
			return false;
		} else {
			if (!phoneRegexp.test(form.phone.value)) {
				alert("전화번호를 형식에 맞게 입력하세요.")
				form.phone.focus();
				return false;
			}
		}

		if (form.address.value === "") {
			alert("주소가 입력되지 않았습니다.");
			form.address.focus();
			return false;
		}

		if (form.joindate.value === "") {
			alert("가입일자가 입력되지 않았습니다.");
			form.joindate.focus();
			return false;
		} else {
			if (!dateRegexp.test(form.joindate.value)) {
				alert("가입일자를 형식에 맞게 입력하세요.")
				form.joindate.focus();
				return false;
			}
		}

		if (form.grade.value === "") {
			alert("등급이 입력되지 않았습니다.");
			form.grade.focus();
			return false;
		} else {
			if (!gradeRegexp.test(form.grade.value)) {
				alert("등급은 A, B, C 중에서 입력하세요.")
				form.grade.focus();
				return false;
			}
		}

		if (form.city.value === "") {
			alert("도시코드가 입력되지 않았습니다.");
			form.city.focus();
			return false;
		} else {
			if (!cityRegexp.test(form.city.value)) {
				alert("도시코드는 숫자 2자리로 입력하세요.")
				form.city.focus();
				return false;
			}
		}

		return true;

	}
</script>
</head>
<body>
	<%@ include file="./nav.jsp"%>
	<section>
		<h1>홈쇼핑 회원 등록</h1>
		<%
			if(rs.next()) {
		%>
		<form name="form" action="./action.jsp" method="post" onSubmit="return validation()">
			<input type="hidden" name="action" value="insert"/>
			<table border="1">
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" name="custno" value="<%=rs.getString("custno") %>" readonly /></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" /></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone"  /></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address"/></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="date" name="joindate" /></td>
				</tr>
				<tr>
					<td>고객등급 [A:VIP,B:일반,C:직원]</td>
					<td><input type="text" name="grade" /></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="등록"/><button type="button" onclick="location.href='./getMemberList.jsp'">조회</button></td>
				</tr>
			</table>
		</form>
		<%
			}
		%>
	</section>
	<%@ include file="./footer.jsp"%>
</body>
</html>