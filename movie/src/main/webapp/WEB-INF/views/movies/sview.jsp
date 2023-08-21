<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, td, th {
	border: 1px solid black;
	border-collapse: collapse;
}

td, th {
	padding: 10px;
}

caption {
	margin-bottom: 10px;
	font-size: 20px;
	font-weight: bold;
}

table {
	width: 50%;
}
</style>
</head>
<body>
	<!-- header -->
	<div id="header_section" class="header ty3">
		<%@ include file="../header.jsp"%>
	</div>

	<c:choose>
		<c:when test="${loginId != null}">
			<!-- sidebar -->
			<div id="header_section" class="sidebar">
				<%@ include file="../sidebar.jsp"%>
			</div>
		</c:when>
	</c:choose>

	<section class="section-text-white position-relative">
		<div class="d-background"
			
			data-parallax="scroll"></div>
		<div class="d-background bg-theme-blacked"></div>
		<div class="mt-auto container position-relative">
			<div class="top-block-head text-uppercase">
				<h2 class="display-4">
					스케줄 <span class="text-theme">수정</span>
				</h2>
			</div>
	
	<table>
		<caption>스케쥴 상세보기</caption>

		<tr>
			<th>스케쥴 번호</th>
			<td>${sView.msNumber}</td>
		</tr>
		<tr>
			<th>영화 제목</th>
			<td>${sView.msName}</td>
		</tr>
		<tr>
			<th>시작 시간</th>
			<td>${sView.msStartTime}</td>
		</tr>
		<tr>
			<th>종료 시간</th>
			<td>${sView.msEndTime}</td>
		</tr>
		<tr>
			<th>상영일</th>
			<td>${sView.msDate}</td>
		</tr>
		<tr>
			<th>상영관</th>
			<td>${sView.msTheater}</td>
		</tr>
		<tr>
			<th colspan="2">
				<button id="sModify">수정</button>
				<button id="sDelete">삭제</button>
				<button id="back">정보가기</button>
				<button id="list">리스트가기</button>
			</th>
		</tr>

	</table>
	</div>
	</section>
	
		<!-- footer -->
	<div id="footer_section" class="footer ty3">
		<%@ include file="../footer.jsp"%>
	</div>
	

</body>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script>
	$('#sModify').click(function() {
		location.href = "sModiForm?msNumber=${sView.msNumber}";
	});
	$('#sDelete').click(function() {
		location.href = "sDelete?msNumber=${sView.msNumber}";
	});
	$('#back').click(function() {
		location.href = "tDetail?mtTheater=${sView.msTheater}";
	});
	$('#list').click(function() {
		location.href = "tList"
	});
</script>
</html>