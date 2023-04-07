<%@page import="dbphrd.MemberDAO"%>
<%@page import="dbphrd.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	MemberDTO dto = new MemberDTO();
	dto.setCustno(Integer.parseInt(request.getParameter("custno")));
	dto.setCustname(request.getParameter("custname"));
	dto.setPhone(request.getParameter("phone"));
	dto.setAddress(request.getParameter("address"));
	dto.setGrade(request.getParameter("grade"));
	dto.setCity(request.getParameter("city"));
	
	MemberDAO dao= new MemberDAO();
	
	int result=dao.updateMember(dto);
	
	if(result==1){%>
		<script>
			alert('수정 완료!')
			history.back()
		</script>		
	<%}else{%>
		<script>
			alert('수정 실패..')
			history.back()
		</script>	
	<%}
%>


</body>
</html>