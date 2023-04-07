<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	MemberDTO dto= new MemberDTO();
	MemberDAO dao= new MemberDAO();
	dto.setCustno(Integer.parseInt(request.getParameter("custno")));
	dto.setCustname(request.getParameter("custname"));
	dto.setPhone(request.getParameter("phone"));
	dto.setAddress(request.getParameter("address"));
	
	String date=request.getParameter("joindate");
	SimpleDateFormat simple= new SimpleDateFormat("yyyy-DD-mm");
	Date join= new Date(simple.parse(date).getTime());
	//근데~ 그냥 sql 문에 sysdate 넣어주는게 훨씬 낫쥬? 알아만 두자고
	dto.setJoindate(join);
	dto.setGrade(request.getParameter("grade"));
	dto.setCity(request.getParameter("city"));
	int result=dao.insertMember(dto);
	
	if(result==1){%>
		<script type="text/javascript">
			alert("회원가입 완료!")
			history.back()
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert("회원가입 실패..")
			history.back()
		</script>
	<%}
	
%>




</body>
</html>