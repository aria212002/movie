<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관 등록</title>
<style>
td, th {
	padding: 10px;
}


table {
	width: 80%;
}
i {
	font-size: 20px;
	margin: 5px
}
.mvWrite-ipt {
	border-radius: 7px;
	width: 80%;
	line-height: center; *
}
.tw-th{
	width : 20%;
}	
.tw-inpu{
	width : 100%;
	border-radius: 7px;
}
.mtki{
	font-weight: bold;
	border-radius: 7px;
	margin-left: 32%; 
}
.tw-bn{
	margin-left: 50%; 
}
</style>
<script src="https://kit.fontawesome.com/121d217c4e.js" crossorigin="anonymous"></script>
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
					상영관 <span class="text-theme">등록</span>
				</h2>
			</div>


	<form action="tWrite" method="GET">
		<table>

			<tr>
				<th class="tw-th">
					<i class="fa-solid fa-masks-theater"></i>
					상영관
				</th>
				<td>
					<input type="text" name="mtTheater" class="tw-inpu"/>
				</td>
			</tr>
			<tr>
				<th>
					<i class="fa-solid fa-check"></i>
					&nbsp;&nbsp;상영관 종류	
				</th>
				<td>
					<select name="mtKind" class="px-5 mtki">
						<option value="">상영관 종류</option>
						<option value="일반">일반</option>
						<option value="3D">3D</option>
						<option value="IMAX">IMAX</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<i class="fa-solid fa-chair"></i>
					&nbsp;&nbsp;좌석수
				</th>
				<td>
					<input type="text" name="mtSeats" class="tw-inpu"/>
				</td>
			</tr>
			<tr>
				<th>
					<i class="fa-solid fa-barcode"></i>
					&nbsp;성인가격
				</th>
				<td>
					<input type="text" name="mtCommon" class="tw-inpu"/>
				</td>
			</tr>
			<tr>
				<th>
				 	&nbsp;<i class="fa-solid fa-dollar-sign"></i>
					&nbsp;&nbsp;어린이가격
				</th>
				<td>
					<input type="text" name="mtChild" class="tw-inpu"/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
				<input class="px-5 btn-theme btn tw-bn" type="submit" value="등록" />
				</th>
			</tr>
			
		</table>
	</form>
	<br /> <br /> <br /> <br /> <br /> <br /> <br />
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
$('#back').click(function() {
	location.href = "mvList";
});
</script>
</html>