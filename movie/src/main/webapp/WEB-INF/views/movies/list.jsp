<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 영화 목록</title>
<!-- Bootstrap -->
<link href="./bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<!-- Animate.css -->
<link href="./animate.css/animate.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome iconic font -->
<link href="./fontawesome/css/fontawesome-all.css" rel="stylesheet"
	type="text/css" />
<!-- Magnific Popup -->
<link href="./magnific-popup/magnific-popup.css" rel="stylesheet"
	type="text/css" />
<!-- Slick carousel -->
<link href="./slick/slick.css" rel="stylesheet" type="text/css" />
<!-- Fonts -->
<link
	href='https://fonts.googleapis.com/css?family=Oswald:300,400,500,700'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'
	rel='stylesheet' type='text/css'>
<!-- Theme styles -->
<link href="./css/dot-icons.css" rel="stylesheet" type="text/css">
<link href="./css/theme.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="./resources/css/add.css" />
<style>
td, th {
	padding: 10px;
     border-bottom: 1px solid white;
}

.list-admin{
text-align : center;
}

.adminListTable {
	font-size: 18px;
	padding-bottom: 200px;
	border : none;
	border-collapse: collapse;
    width: 100%;
    text-align : center;
}



</style>
</head>
<body>
	<div id="header_section" class="header ty3">
		<%@ include file="../header.jsp"%>
	</div>

	<c:choose>
		<c:when test="${loginId != null}">
			<!-- sidebar -->
			<div id="sidebar_section" class="header ty3">
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
					관리자 <span class="text-theme">영화 목록</span>
				</h2>
			</div>
			<table class="adminListTable">
				<tr>

					<th class="list-admin">이름</th>
					<th colspan="2" class="list-admin">영화정보</th>
					<th colspan="2" class="list-admin">스케쥴정보</th>					
				</tr>
				<c:forEach var="list" items="${mvlist}">
					<tr>
						<td><a href="mvDetail?miName=${list.miName}">${list.miName}</a></td>
						<td>
							<button type="button" class="btn-theme btn" onclick="location.href='mvModiForm?miName=${list.miName}'">수정</button>
						</td>
						<td>
							<button type="button" class="btn-theme btn" onclick="deleteMovie('${list.miName}')">삭제</button>
						</td>
						<td>
							<button type="button" class="btn-theme btn" onclick="location.href='sWriteForm?miName=${list.miName}'">등록</button>
						</td>
						<td>
							<button type="button" class="btn-theme btn" onclick="location.href='sList?miName=${list.miName}'">리스트</button>
						</td>
					</tr>
				</c:forEach>
			</table>
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
function deleteMovie(miName) {
    var confirmed = confirm("정말 삭제하시겠습니까?");
    
    if (confirmed) {
        location.href = "mvDelete?miName=" + miName;
        alert('영화를 삭제했습니다.')
    } else{
    	alert('영화 삭제를 취소했습니다.');
    }
}
</script>
</html>