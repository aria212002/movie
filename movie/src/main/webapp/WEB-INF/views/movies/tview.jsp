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
	border: 1px solid white;
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
					상영관 <span class="text-theme">상세 보기</span>
				</h2>
			</div>

			<table>
				

				<tr>
					<th>상영관</th>
					<td>${tView.mtTheater}</td>
				</tr>
				<tr>
					<th>상영관 종류</th>
					<td>${tView.mtKind}</td>
				</tr>
				<tr>
					<th>좌석수</th>
					<td>${tView.mtSeats}</td>
				</tr>
				<tr>
					<th>일반가격</th>
					<td>${tView.mtCommon}</td>
				</tr>
				<tr>
					<th>어린이가격</th>
					<td>${tView.mtChild}</td>
				</tr>

				<tr>
					<th colspan="2">
						<button id="tModify">수정</button>
						<button id="tDelete">삭제</button>
						<button id="swrite">스케쥴작성</button>
						<button id="slist">스케쥴리스트</button>
						<button id="list">리스트가기</button>
					</th>
				</tr>

			</table>
			<br/><br/><br/><br/><br/>
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
	$('#tModify').click(function() {
		location.href = "tModiForm?mtTheater=${tView.mtTheater}";
	});
	$('#tDelete').click(function() {
		location.href = "tDelete?mtTheater=${tView.mtTheater}";
	});
	$('#swrite').click(function() {
		location.href = "sWriteForm?mtTheater=${tView.mtTheater}";
	});
	$('#list').click(function() {
		location.href = "tList"
	});
	$('#slist').click(function() {
		location.href = "sList?mtTheater=${tView.mtTheater}"
	});
</script>
</html>