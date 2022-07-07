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
<h2>회원목록조회/수정</h2>
<br>
<table border="1" id="tab1">
<tr>
<th>회원번호</th>
<th>회원성명</th>
<th>전화번호</th>
<th>주소</th>
<th>가입일자</th>
<th>고객등급</th>
<th>거주지역</th>
</tr>
<%
try{
	String sql="select custno,custname,phone,address,to_char(joindate,'YYYY-MM-DD'),grade,city from member0707";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String custno=rs.getString(1);
		String custname=rs.getString(2);
		String phone=rs.getString(3);
		String address=rs.getString(4);
		String joindate=rs.getString(5);
		String grade=rs.getString(6);
		switch(grade){
		case "A": grade="VIP";
		break;
		case "B": grade="일반";
		break;
		case "C": grade="직원";
		break;
		}
		String city=rs.getString(7);
		System.out.println("조회성공");
	
%>
<tr>
<td class="td2"><a href="update_member.jsp?custno=<%=custno %>"><%=custno %></a></td>
<td class="td1"><%=custname %></td>
<td class="td1"><%=phone %></td>
<td class="td1"><%=address %></td>
<td class="td1"><%=joindate %></td>
<td class="td1"><%=grade%></td>
<td class="td1"><%=city%></td>
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