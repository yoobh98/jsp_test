<%@page import="dbphrd.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbphrd.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../home/header.jsp" %>
<h1>멤버 조회 및 수정</h1>

<table border="1">
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
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> list=dao.selectMemberList();
		
		
		for(int i=0; i<list.size(); i++){%>
			<tr>
				<th><a href="update.jsp?custno=<%=list.get(i).getCustno()%>"><%=list.get(i).getCustno()%></a></th>
				<th><%=list.get(i).getCustname()%></th>
				<th><%=list.get(i).getPhone()%></th>
				<th><%=list.get(i).getAddress()%></th>
				<th><%=list.get(i).getJoindate()%></th>
				<th><%=list.get(i).getGrade()%></th>
				<th><%=list.get(i).getCity()%></th>
			</tr>
		<%}
	%>
</table>








<%@include file="../home/footer.jsp" %>