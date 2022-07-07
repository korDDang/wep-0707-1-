<%@ page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<br>
<h2>회원매출조회</h2>
<br>
<table border="1" id="tab1">
<tr>
<th>회원번호</th>
<th>회원성명</th>
<th>고객등급</th>
<th>매출</th>
</tr>
<%
try{
	String sql=" select m.custno,m.custname,m.grade,sum(n.price) from member0707 m,money0707 n where m.custno=n.custno group by m.custno,m.custname,m.grade order by sum(n.price)desc";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String custno=rs.getString(1);
		String custname=rs.getString(2);
		String grade=rs.getString(3);
		switch(grade){
		case "A": grade="VIP";
		break;
		case "B": grade="일반";
		break;
		case "C": grade="직원";
		break;
		}
		String price=rs.getString(4);
		System.out.println("조회성공");
	
%>
<tr>
<td class="td1"><%=custno %></td>
<td class="td1"><%=custname %></td>
<td class="td1"><%=grade %></td>
<td class="td1"><%=price %></td>
</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("조회실패");
	}

%>

</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>