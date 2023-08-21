<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관 리스트</title>
<style>
table  {
	font-size: 18px;
	padding-bottom: 200px;
	border : none;
	border-collapse: collapse;
    width: 100%;
    text-align : center;
}

caption {
	margin-bottom: 10px;
	font-size: 20px;
	font-weight: bold;
}

td, th {
	padding: 10px;
     border-bottom: 1px solid white;
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
					상영관 <span class="text-theme">목록</span>
				</h2>
			</div>

	<table>
		<tr>
			
			<th>상영관</th>
			<th>종류</th>
			<th>좌석수</th>
			<th>일반가격</th>
			<th>청소년가격</th>
			<th colspan="2">정보</th>	
			<th>스케쥴</th>
		</tr>
		<c:forEach var="list" items="${tlist}">
			<tr>
				<td>${list.mtTheater}</td>
				<td>${list.mtKind}</td>
				<td>${list.mtSeats}</td>
				<td>${list.mtCommon}</td>
				<td>${list.mtChild}</td>
				<td><button type="button" class="btn-theme btn" onclick="location.href='tModiForm?mtTheater=${list.mtTheater}'">수정</button></td>
				<td><button type="button" class="btn-theme btn" onclick="deleteTheater('${list.mtTheater}')">삭제</button></td>
				<td><button type="button" class="btn-theme btn" onclick="location.href='sList2?mtTheater=${list.mtTheater}'">리스트</button></td>
			</tr>
		</c:forEach>
		
				
</table>
<br/><br/><br/><br/>
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
$('#main').click(function() {
	location.href = "index"
});
function deleteTheater(mtTheater) {
    var confirmed = confirm("정말 삭제하시겠습니까?");
    
    if (confirmed) {
        location.href = "tDelete?mtTheater=" + mtTheater;
        alert('상영관 정보를 삭제했습니다.')
    } else{
    	alert('상영관 정보 삭제를 취소했습니다.');
    }
}
</script>
</html>