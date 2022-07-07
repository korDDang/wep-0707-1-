<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홈쇼핑</title>
</head>
<script>
function check() {
	var doc=document.form;
	if(doc.custno.value==""){
		alert("회원번호 입력되지 않았습니다.");
		doc.custno.focus();
		return false;
	}if(doc.custname.value==""){
		alert("회원성명이 입력되지 않았습니다.");
		doc.custname.focus();
		return false;
	}if(doc.phone.value==""){
		alert("회원전화가 입력되지 않았습니다.");
		doc.phone.focus();
		return false;
	}if(doc.address.value==""){
		alert("회원주소가 입력되지 않았습니다.");
		doc.address.focus();
		return false;
	}if(doc.joindate.value==""){
		alert("가입일자가 입력되지 않았습니다.");
		doc.joindate.focus();
		return false;
	}if(doc.grade.value==""){
		alert("고객등급이 입력되지 않았습니다.");
		doc.grade.focus();
		return false;
	}if(doc.city.value==""){
		alert("도시코드가 입력되지 않았습니다.");
		doc.city.focus();
		return false;
	}else{
		doc.submit();
	}
}
</script>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<%
int ss=0;
try{
	String sql="select ss.nextval from dual";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ss=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}

%>
<br>
<h2>홈쇼핑 회원등록 화면</h2>
<br>
<form name="form" method="post" action="insert_memberProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>회원번호(자동발생)</th>
<td>
<input type="text" name="custno" value="<%=ss%>">
</td>
</tr>
<tr>
<th>회원성명</th>
<td>
<input type="text" name="custname" >
</td>
</tr>
<tr>
<th>회원전화</th>
<td>
<input type="text" name="phone" >
</td>
</tr>
<tr>
<th>회원주소</th>
<td>
<input type="text" name="address">
</td>
</tr>
<tr>
<th>가입일자</th>
<td>
<input type="text" name="joindate" >
</td>
</tr>
<tr>
<th>고객등급[A:VIP,B:일반,C:직원]</th>
<td>
<input type="text" name="grade" >
</td>
</tr>
<tr>
<th>도시코드</th>
<td>
<input type="text" name="city" >
</td>
</tr>
<tr>
<td colspan="2" class="td1">
<input type="button" value="등록" onclick="check()" class="bt1">
<input type="button" value="조회" onclick="location.href='index.jsp'" class="bt1">
</td>
</tr>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>