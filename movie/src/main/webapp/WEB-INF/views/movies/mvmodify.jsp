<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	border-radius: 7px;
	background-color: #323232;
}
.mw-th{
	width : 20%;
}
.mw-inpu{
	width : 95%;
	border-radius: 7px;
}
.mw-date{
	width : 32%;
	margin-left: 32%;
	border-radius: 7px;
}
.mige{
	font-weight: bold;
	border-radius: 7px;
	margin-left: 32%; 
	text-align : center;
}
.mw-bn{
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
			data-image-src="http://via.placeholder.com/1920x1500"
			data-parallax="scroll"></div>
		<div class="d-background bg-theme-blacked"></div>
		<div class="mt-auto container position-relative">
			<div class="top-block-head text-uppercase">
				<h2 class="display-4">
					영화 <span class="text-theme">수정</span>
				</h2>
			</div>

			<form action="mvModify" method="GET" enctype="multipart/form-data">
				<table>
					<tr>
						<th class="mw-th">
							<i class="fa-solid fa-film"></i>
							&nbsp;영화 이름
						</th>
						<td><input type="text" name="miName" value='${mvmodify.miName}' class="mw-inpu" readonly /></td>
					</tr>
					<tr>
						<th>
							<i class="fa-solid fa-square-check"></i>
							&nbsp;영화 장르1
						</th>
						<td><select name="miGenre1" class="px-5 mige">
								<option value="">장르1</option>
								<option value="액션">액션</option>
								<option value="범죄">범죄</option>
								<option value="애니메이션">애니메이션</option>
								<option value="SF">SF</option>
								<option value="드라마 ">드라마</option>
								<option value="코미디">코미디</option>
								<option value="스릴러">스릴러</option>
								<option value="어드벤처">어드벤처</option>
						</select></td>
					</tr>
					<tr>
						<th>
							<i class="fa-solid fa-square-check"></i>
							&nbsp;영화 장르2
						</th>
						<td><select name="miGenre2" class="px-5 mige">
								<option value="">장르2</option>
								<option value="액션">액션</option>
								<option value="범죄">범죄</option>
								<option value="애니메이션">애니메이션</option>
								<option value="SF">SF</option>
								<option value="드라마 ">드라마</option>
								<option value="코미디">코미디</option>
								<option value="스릴러">스릴러</option>
								<option value="어드벤처">어드벤처</option>
						</select></td>
					</tr>
					<tr>
						<th>
							<i class="fa-solid fa-square-check"></i>
							&nbsp;영화 장르3
						</th>
						<td><select name="miGenre3" class="px-5 mige">
								<option value="">장르3</option>
								<option value="액션">액션</option>
								<option value="범죄">범죄</option>
								<option value="애니메이션">애니메이션</option>
								<option value="SF">SF</option>
								<option value="드라마 ">드라마</option>
								<option value="코미디">코미디</option>
								<option value="스릴러">스릴러</option>
								<option value="어드벤처">어드벤처</option>
						</select></td>
					</tr>
					<tr>
						<th>
							<i class="fa-solid fa-user-large" class="mw-inpu"></i>
							&nbsp;영화 감독
						</th>
						<td><input type="text" name="miDirecter" class="mw-inpu"/></td>
					</tr>
					<tr>
						<th>
							<i class="fa-solid fa-users"></i>
							영화 배우
						</th>
						<td><input type="text" name="miActor" class="mw-inpu"/></td>
					</tr>
					<tr>
						<th>
							<i class="fa-solid fa-book"></i>
							&nbsp;영화 줄거리
						</th>
						<td><textarea rows="20" cols="40" name="miSynopsis" class="mw-inpu"></textarea></td>
					</tr>
					<tr>
						<th>
							<i class="fa-solid fa-star"></i>
							&nbsp;영화 등급
						</th>
						<td><select name="miAge" class="px-5 mige">
								<option value="">관람등급</option>
								<option value="전체관람가">전체관람가</option>
								<option value="12세이상관람가">12세이상관람가</option>
								<option value="15세이상관람가">15세이상관람가</option>
								<option value="청소년 관람불가">청소년 관람불가</option>
						</select></td>
					</tr>
					<tr>
						<th>
							<i class="fa-solid fa-clock"></i>
							&nbsp;영화 시간
						</th>
						<td><input type="text" name="miRuntime" class="mw-inpu"/></td>
					</tr>
					<tr>
						<th>
							&nbsp;<i class="fa-solid fa-file"></i>
							&nbsp;영화 포스터
						</th>
						<td><input type="text" name="miPoster" class="mw-inpu"/></td>
					</tr>
					<tr>
						<th>
							<i class="fa-solid fa-calendar-days"></i>
							&nbsp;영화 개봉일
						</th>
						<td><input type="date" name="miRelease" class="mw-date"/></td>
					</tr>
					
					<tr>
						<th>
							<i class="fa-solid fa-video"></i>
							&nbsp;영화 예고편
						</th>
						<td><input type="text" name="miTeaser" class="mw-inpu"/></td>
					</tr>
					<tr>
						<th>
							<i class="fa-solid fa-image"></i>
							&nbsp;영화 스틸컷1
						</th>
						<td><input type="text" name="miStillcut1" class="mw-inpu"/></td>
					</tr>
					<tr>
						<th>
							<i class="fa-solid fa-image"></i>
							&nbsp;영화 스틸컷2
						</th>
						<td><input type="text" name="miStillcut2" class="mw-inpu"/></td>
					</tr>
					<tr>
						<th>
							<i class="fa-solid fa-image"></i>
							&nbsp;영화 스틸컷3
						</th>
						<td><input type="text" name="miStillcut3" class="mw-inpu"/></td>
					</tr>
					<tr>
						<th>
							<i class="fa-solid fa-image"></i>
							&nbsp;영화 스틸컷4
						</th>
						<td><input type="text" name="miStillcut4" class="mw-inpu"/></td>
					</tr>
					<tr>
						<th>
							<i class="fa-solid fa-image"></i>
							&nbsp;영화 스틸컷5
						</th>
						<td><input type="text" name="miStillcut5" class="mw-inpu"/></td>
					</tr>
					<tr>
						<th>
							<i class="fa-solid fa-image"></i>
							&nbsp;영화 스틸컷6
						</th>
						<td><input type="text" name="miStillcut6" class="mw-inpu"/></td>
					</tr>
					<tr>
						<th colspan="2">
							<input class="px-5 btn-theme btn mw-bn" type="submit" value="등록" />
						</th>
					</tr>
					
					
				</table>
			</form>
			<br/><br/><br/><br/><br/><br/>
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
	
</script>
</html>