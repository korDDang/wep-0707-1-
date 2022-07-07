<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
try{
	String sql="update member0707 set custname=?,phone=?,address=?,joindate=?,grade=?,city=? where custno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(7, request.getParameter("custno"));
	pstmt.setString(1, request.getParameter("custname"));
	pstmt.setString(2, request.getParameter("phone"));
	pstmt.setString(3, request.getParameter("address"));
	pstmt.setString(4, request.getParameter("joindate"));
	pstmt.setString(5, request.getParameter("grade"));
	pstmt.setString(6, request.getParameter("city"));
	pstmt.executeUpdate();
	%>
	<script>
	alert("회원정보수정이 완료 되었습니다!");
	location.href="select_member.jsp";
	</script>
	
	
	 <% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정 실패");
}

%>
</body>
</html>