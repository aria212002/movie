<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스케줄 등록</title>
<style>
td, th {
	padding: 10px;
}

caption {
	margin-bottom: 10px;
	font-size: 20px;
	font-weight: bold;
}

table {
	width: 80%;
}
.sw-th{
	width : 20%;
}
.sw-inpu{
	width : 80%;
	border-radius: 7px;
}
.sw-dati{
	width : 30%;
	margin-left: 25%;
	border-radius: 7px;
}
.msth{
	font-weight: bold;
	border-radius: 7px;
	margin-left: 25%; 
}
.sw-bn{
	margin-left: 43%; 
}
</style>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
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
			data-image-src="http://via.placeholder.com/1920x1500"
			data-parallax="scroll"></div>
		<div class="d-background bg-theme-blacked"></div>
		<div class="mt-auto container position-relative">
			<div class="top-block-head text-uppercase">
				<h2 class="display-4">
					스케줄 <span class="text-theme">등록</span>
				</h2>
			</div>
	<form action="sWrite" method="GET">
		<table>


			<tr>
				<th class="sw-th">
					<i class="fa-solid fa-film"></i>
					영화 제목
				</th>
				<td><input type="text" name="msName" value="${tView.miName}" class="sw-inpu" readonly/></td>
			</tr>
			<tr>
				<th>
					<i class="fa-solid fa-clock"></i>
					시작 시간
				</th>
				<td><input class="timepicker sw-dati" name="msStartTime" autocomplete="off"/></td>
			</tr>
			<tr>
				<th>
					<i class="fa-solid fa-calendar-days"></i>
					&nbsp;상영일
				</th>
				<td><input type="date" name="msDate" class="sw-dati"/></td>
			</tr>
			<tr>
				<th>
					<i class="fa-solid fa-masks-theater"></i>
					상영관
				</th>
				<td>
				<select name="msTheater" class="px-5 msth">
           		 <option value="">상영관</option>
           		 <option value="1관">1관</option>
          		 <option value="2관">2관</option>
          		 <option value="3관">3관</option>
           		 <option value="4관">4관</option>
          		 <option value="5관">5관</option>
           		 <option value="6관">6관</option>
           		 <option value="7관">7관</option>
           		 <option value="8관">8관</option>
           		 <option value="9관">9관</option>
           		 </select>
				</td>
			</tr>
			<tr>
				<th colspan="2"><input class="px-5 btn-theme btn sw-bn" type="submit" value="등록" /></th>
			</tr>
		</table>
	</form>
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
	<script src="https://kit.fontawesome.com/121d217c4e.js" crossorigin="anonymous"></script>
	<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script>
$(".timepicker").timepicker({
	timeFormat : 'HH:mm',
	// year, month, day and seconds are not important
	minTime : new Date(0, 0, 0, 9, 0, 0),
	maxTime : new Date(0, 0, 0, 23, 0, 0),
	// items in the dropdown are separated by at interval minutes
	interval : 10,

})
</script>
</html>