<%@page import="java.util.ArrayList"%>
<%@page import="dbphrd.MemberDTO"%>
<%@page import="dbphrd.MemberDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../home/header.jsp" %>
<%
	Date date= new Date();
	SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd");
	String d=simple.format(date);
	
	MemberDAO dao=new MemberDAO();
	ArrayList<MemberDTO> list=dao.selectMemberList();
	int j=0;
	for(int i=0;i<list.size();i++){
		j=list.get(i).getCustno();
	}
	j+=1;
%>

						<h1>홈쇼핑 회원등록</h1>

<form action="insertChk.jsp" method="post" id="go">
	<table border="1">
		<tr>
			<th>회원번호(자동발생)</th>
			<th><input type="text" name="custno" value="<%=j%>" readonly></th>
		</tr>
		<tr>
			<th>회원성명</th>
			<th><input type="text" name="custname" id="custname" required></th>
		</tr>
		<tr>
			<th>회원전화</th>
			<th><input type="text" name="phone" id="phone"></th>
		</tr>
		<tr>
			<th>회원주소</th>
			<th><input type="text" name="address" id="address"></th>
		</tr>
		<tr>
			<th>가입일자</th>
			<th><input type="text" name="joindate" value="<%=d%>" readonly></th>
		</tr>
		<tr>
			<th>고객등급 [A:VIP,B:일반,C:직원]</th>
			<th><input type="text" name="grade" id="grade"></th>
		</tr>
		<tr>
			<th>도시코드</th>
			<th><input type="text" name="city" id="city"></th>
		</tr>
		<tr>
			<th colspan="2">
			<button type="button" onclick="chk()">등록</button>
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
			if(grade.value=="A"||grade.value=="a"||
			   grade.value=="B"||grade.value=="b"||
			   grade.value=="C"||grade.value=="c"){
			   go.submit();
			}else{
				alert('등급은 A , B , C 입니다')
				grade.focus();
			}
		}	
	}
</script>
<%@include file="../home/footer.jsp" %>