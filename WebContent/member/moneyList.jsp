<%@page import="dbphrd.MemberDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbphrd.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../home/header.jsp" %>
<h1>매출조회</h1>

<table border="1">
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>고객등급</th>
		<th>매출</th>
	</tr>
	<%
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> list= dao.getJoinList();
		for(int i= 0 ; i < list.size() ; i++){%>
			<tr>
				<th><%=list.get(i).getCustno()%></th>
				<th><%=list.get(i).getCustname()%></th>
				<th><%=list.get(i).getGrade()%></th>
				<th><%=list.get(i).getPrice()%></th>
			</tr>
		<%}	
	%>
</table>




<%@include file="../home/footer.jsp" %>