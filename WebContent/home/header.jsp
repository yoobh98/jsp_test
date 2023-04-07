<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body *{margin: auto; padding: 0;}
	header{background-color: blue; font-size: 20pt; color:white;padding: 30px;}
	footer{background-color: blue; font-size: 20pt; color:white;}
	.mainWrap{
		width:100%; margin: auto; 
		text-align: center; font-style: italic; 
		font-weight: bold;
	}
	.header_nav{
		background-color: powderblue; 
		color:white;padding: 15px;
	}
	.header_nav ul:after{
		content: "";
		display: block;
		clear: both;
	}
	.header_nav ul li{list-style: none; float: left; padding: 10px;}
	.main_section{padding: 20px;}
	
	table{margin: auto;}
	
</style>
</head>
<body>

<div class="mainWrap">
	<header>쇼핑몰 회원관리 프로그램 ver.1</header>
	<nav class="header_nav">
		<ul>
			<li><a href="<%=request.getContextPath()%>/member/insert.jsp">회원등록</a></li>
			<li><a href="<%=request.getContextPath()%>/member/memberList.jsp">회원목록 조회/수정</a></li>
			<li><a href="<%=request.getContextPath()%>/member/moneyList.jsp">회원매출조회</a></li>
			<li><a href="<%=request.getContextPath()%>/home/main.jsp">홈으로</a></li>
		</ul>
	</nav>
	<section class="main_section">