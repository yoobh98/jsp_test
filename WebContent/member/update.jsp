<%@page import="dbphrd.MemberDTO"%>
<%@page import="dbphrd.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../home/header.jsp" %>
<h1>회원 수정</h1>
<%
	int custno= Integer.parseInt(request.getParameter("custno"));
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.selectOne(custno);
	
%>
<form action="updateChk.jsp" method="post" id="go">
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th><input type="text" name="custno" value="<%=dto.getCustno()%>" readonly></th>
		</tr>
		<tr>
			<th>회원성명</th>
			<th><input type="text" name="custname" id="custname" value="<%=dto.getCustname()%>"></th>
		</tr>
		<tr>
			<th>회원전화</th>
			<th><input type="text" name="phone" id="phone" value="<%=dto.getPhone()%>"></th>
		</tr>
		<tr>
			<th>회원주소</th>
			<th><input type="text" name="address" id="address" value="<%=dto.getAddress()%>"></th>
		</tr>
		<tr>
			<th>가입일자</th>
			<th><input type="text" name="joindate" value="<%=dto.getJoindate()%>" readonly></th>
		</tr>
		<tr>
			<th>고객등급 [A:VIP,B:일반,C:직원]</th>
			<th><input type="text" name="grade" id="grade" value="<%=dto.getGrade()%>"></th>
		</tr>
		<tr>
			<th>도시코드</th>
			<th><input type="text" name="city" id="city" value="<%=dto.getCity()%>"></th>
		</tr>
		<tr>
			<th colspan="2">
			<button type="button" onclick="chk()">수정</button>
			<button type="button" onclick="location.href='memberList.jsp'">조회</button>
			</th>
		</tr>
	</table>
</form>

<script>
	//걍 얘네 싹 다 html5 속성으로 유효성 검사 자동으로 해주는거 있지 그것도 해주는게 좋을듯 형식에 맞게 물론 시간 남으면

	var custname=document.getElementById("custname");
	var phone=document.getElementById("phone");
	var address=document.getElementById("address");
	var grade=document.getElementById("grade");
	var city=document.getElementById("city");
	function chk(){
		if(custname.value==""){
			alert('이름 입력은 필수입니다!')
			custname.focus()
		}else if(phone.value==""){
			alert('전화번호 입력은 필수입니다!')
			phone.focus()
		}else if(address.value==""){
			alert('주소 입력은 필수입니다!')
			address.focus()
		}else if(grade.value==""){
			alert('등급 입력은 필수입니다!')
			grade.focus()
		}else if(city.value==""){
			alert('도시번호 입력은 필수입니다!')
			city.focus()
		}else{
			go.submit();
		}	
	}
</script>

<%@include file="../home/footer.jsp" %>
