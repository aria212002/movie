<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link href="<c:url value='/resources/L2.ico'/>" rel="icon"
	type="image/x-icon">
<!-- Bootstrap -->
<link href=".//resources/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<!-- Animate.css -->
<link href=".//resources/animate.css/animate.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome iconic font -->
<link href=".//resources/fontawesome/css/fontawesome-all.css"
	rel="stylesheet" type="text/css" />
<!-- Magnific Popup -->
<link href=".//resources/magnific-popup/magnific-popup.css"
	rel="stylesheet" type="text/css" />
<!-- Slick carousel -->
<link href=".//resources/slick/slick.css" rel="stylesheet"
	type="text/css" />
<!-- Fonts -->
<link
	href='https://fonts.googleapis.com/css?family=Oswald:300,400,500,700'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'
	rel='stylesheet' type='text/css'>
<!-- Bootstrap -->
<link href=".//resources/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<!-- Animate.css -->
<link href=".//resources/animate.css/animate.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome iconic font -->
<link href=".//resources/fontawesome/css/fontawesome-all.css"
	rel="stylesheet" type="text/css" />
<!-- Magnific Popup -->
<link href=".//resources/magnific-popup/magnific-popup.css"
	rel="stylesheet" type="text/css" />
<!-- Slick carousel -->
<link href=".//resources/slick/slick.css" rel="stylesheet"
	type="text/css" />
<!-- Fonts -->
<link
	href='https://fonts.googleapis.com/css?family=Oswald:300,400,500,700'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'
	rel='stylesheet' type='text/css'>
<!-- Theme styles -->
<link href=".//resources/css/dot-icons.css" rel="stylesheet"
	type="text/css">

<link href=".//resources/css/theme.css" rel="stylesheet" type="text/css">
<style type="text/css">
td, th {
	padding: 10px;
	font-size: 20px;
	text-align: center;
}

caption {
	margin-bottom: 10px;
	font-size: 20px;
	font-weight: bold;
}

ul.list {
	list-style-type: none;
	margin: 0;
	padding: 0;
	border-bottom: 1px solid #ccc;
}

ul.list::after {
	content: '';
	display: block;
	clear: both;
}

.Q-title {
	text-align: left;
}

.A-text {
	display: none;
	text-align: left;
	font-size: 15px;
}

.Q-title:hover+.A-text {
	display: block;
}
</style>
<link rel="stylesheet" href="./resources/css/add.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
</head>
<body class="body">
	<!-- header -->
	<div id="header_section" class="header ty3">
		<%@ include file="./header.jsp"%>
	</div>

	<c:choose>
		<c:when test="${loginId != null}">
			<!-- sidebar -->
			<div id="sidebar_section" class="header ty3">
				<%@ include file="./sidebar.jsp"%>
			</div>
		</c:when>
	</c:choose>

	<section class="after-head d-flex section-text-white position-relative">
		<div class="d-background" data-parallax="scroll"></div>
		<!-- data-image-src="http://via.placeholder.com/1920x1080" -->
		<div class="d-background bg-black-80"></div>
		<div class="top-block top-inner container">
			<div class="top-block-content">
				<h1 class="section-title">고객센터</h1>
				<div class="page-breadcrumbs">
					<a class="content-link" href="./"></a>
				</div>
			</div>
		</div>
	</section>
	<div class="card">
		<div class="cardBody">
			<div class="container mt-5">
				<ul class="list">
					<li class="tab-button active">고객문의</li>
					<li class="tab-button">자주 묻는 질문</li>
					<li id="company" class="tab-button">회사소개</li>
				</ul>

				<div class="tab-content show">
					<table style="margin-left: auto; margin-right: auto; width: 80%;">
						<tr>
							<th colspan="5">
								<h3>
									<i class="fa-solid fa-list card-title"></i>&nbsp;고객문의
								</h3>
							</th>
						</tr>
						<tr>
							<th style="width: 15%;"><i
								class="fa-solid fa-arrow-down-9-1"></i> 번호</th>
							<th style="width: 50%;"><i class="fa-solid fa-t"></i> 제목</th>
							<th style="width: 15%;"><i class="fa-solid fa-user"></i> 작성자
							</th>
							<th style="width: 20%;"><i class="fa-solid fa-pen-to-square"></i>
								작성일</th>
						</tr>
						<c:forEach var="list" items="${bdList}">
							<tr>
								<th style="text-align: center;">${list.bdNum}</th>
								<th><a href="bdView?bdNum=${list.bdNum}">${list.bdTitle}</a>
								</th>
								<th>${list.bdWriter}</th>
								<th>${list.bdDate}</th>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="5"><c:if test="${paging.page<=1}">◀</c:if> <c:if
									test="${paging.page>1}">
									<a href="customerService?page=${paging.page-1}">◀</a>
								</c:if> <c:forEach var="i" begin="${paging.startPage}"
									end="${paging.endPage}">
									<c:if test="${paging.page==i}"> ${i} </c:if>
									<c:if test="${paging.page!=i}">
										<a href="customerService?page=${i}">${i}</a>
									</c:if>
								</c:forEach> <c:if test="${paging.page>=paging.maxPage}">▶</c:if> <c:if
									test="${paging.page<paging.maxPage}">
									<a href="customerService?page=${paging.page+1}">▶</a>
								</c:if></td>
						</tr>

						<tr>
							<td colspan="5">
								<form action="bdSearch" method="GET">

									<select name="category" class="l-cat">
										<option value="BDTITLE">제목</option>
										<option value="BDWRITER">작성자</option>
									</select> <input type="text" name="keyword" class="k-list" />
									<button type="submit" value="검색" class="btn-theme btn">검색</button>
								</form>
							</td>
						</tr>
						<c:choose>
							<c:when test="${loginId != null}">
								<tr>
									<td colspan="5">
										<button id="bdwrite" class="btn-theme btn">게시글작성</button>
									</td>
								</tr>
							</c:when>
						</c:choose>
					</table>
				</div>
				<div class="tab-content">
					<div class="accordion" id="accordionExample">
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseOne"
									aria-expanded="false" aria-controls="collapseOne">카드로
									결제할 경우 환불은 언제 가능한가요?</button>
							</h2>
							<div id="collapseOne" class="accordion-collapse collapse"
								data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<p>
										<i class="fa-solid fa-a"></i> 환불안내<br /> ㆍ 신용카드<br /> - 결제 후
										3일 이내 취소시 승인취소 가능합니다.<br /> - 3일 이후 예매 취소 시 영업일 기준 3일 ~7일 이내
										카드사에서 환불됩니다.<br /> <br /> ㆍ 체크카드<br /> - 결제 후 3일 이내 취소 시 당일
										카드사에서 환불 처리됩니다.<br /> - 3일 이후 예매 취소 시 카드사에 따라 3일 ~ 10일 이내
										카드사에서 환불됩니다.<br /> <br /> ㆍ 휴대폰 결제<br /> - 결제 일자 기준
										당월(1일~말일까지) 취소만 가능합니다.<br /> - 익월 취소의 경우 L2PJH
										고객센터(1544-0376)로 문의 주시기 바랍니다.<br /> <br /> ㆍ카카오페이 간편결제<br />
										- 카카오페이머니를 사용하신 경우 카카오페이머니 잔액으로 원복됩니다.<br /> - 카드 결제를 한 경우
										카드사 정책에 따라 승인취소가 진행되며, 3일 이후 매입 취소 시 영업일 기준 3~10일 소요됩니다.
									</p>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo">
									분실물을 찾고 싶어요!</button>
							</h2>
							<div id="collapseTwo" class="accordion-collapse collapse"
								data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<p>
										<i class="fa-solid fa-a"></i>영화관을 이용하시다가 소지물품을 분실하신 경우에는 L2PJH
										통합콜센터 1544-0376로 연락하시어 확인 하시거나, L2PJH 홈페이지 고객센터 - 분실물 안내에서 분실물
										접수 혹은 확인을 하실 수 있습니다.
									</p>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree">
									영화 예매 및 취소는 어떻게 하나요?</button>
							</h2>
							<div id="collapseThree" class="accordion-collapse collapse"
								data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<p>
										<i class="fa-solid fa-a"></i><br /> ■ 예매 (결제 방법)<br /> ㆍ
										홈페이지, 모바일 앱/웹에서 [예매하기]에 들어가 영화와 날짜, 시간표를 선택하신 후 결제하시면 됩니다.<br />
										ㆍ 영화관 현장 예매는 영화시작시간 직전까지 예매 가능합니다.<br /> <br /> ■ 취소<br />
										ㆍ 홈페이지, 모바일 앱/웹 예매는 영화시작시간 전까지 취소 가능합니다.<br /> ㆍ 영화관 현장 취소는
										영화시작시간 직전까지 취소 가능합니다.<br /> <br /> ※ 현장에서 티켓으로 출력을 진행한 경우
										온라인 취소가 불가능하며, 영화관 매표소를 통해 상영시간 전까지 취소 가능합니다.<br /> <br /> ※
										스페셜 상영회 및 무대인사가 포함된 영화의 경우 행사의 원활한 진행을 위해 상영전일 23시 59분 전까지만 취소
										가능합니다.
									</p>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseFour"
									aria-expanded="false" aria-controls="collapseFour">
									인터넷 예매 후 예매 내용 확인은 어떻게 하나요?</button>
							</h2>
							<div id="collapseFour" class="accordion-collapse collapse"
								data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<p>
										<i class="fa-solid fa-a"></i> 인터넷 예매 후 예매내역 확인을 원하시는 경우 다음과 같이
										확인하세요.<br /> <br /> ■ 예매 확인<br /> - 홈페이지 로그인 → [MY 예매내역]<br />
									</p>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseFive"
									aria-expanded="false" aria-controls="collapseFive">
									회원정보를 수정하고 싶어요!</button>
							</h2>
							<div id="collapseFive" class="accordion-collapse collapse"
								data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<p>
										<i class="fa-solid fa-a"></i> 회원정보를 수정하고 싶으신 경우 다음과 같이 하시면
										됩니다.<br /> <br /> ■ 홈페이지 [로그인] → 왼쪽 사이드바에서 [정보수정] → 정보수정 후
										[회원수정] 클릭<br />
									</p>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseSix"
									aria-expanded="false" aria-controls="collapseSix">
									아이디, 비밀번호를 잊었어요!</button>
							</h2>
							<div id="collapseSix" class="accordion-collapse collapse"
								data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<p>
										<i class="fa-solid fa-a"></i> [로그인]페이지에서 하단에 있는 '아이디 찾기',
										'비밀번호 변경'를 이용하세요.<br /> <br /> ■ 아이디 찾기<br /> - [로그인] →
										[아이디 찾기] 클릭 시, 이름과 전화번호를 통해 아이디 찾기 가능<br /> <br /> ■ 비밀번호 변경<br />
										- [로그인] → [비밀번호 변경] 클릭 시, 아이디 조회 후 새로운 비밀번호로 수정 가능
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-content">
					<table style="margin-left: auto; margin-right: auto; width: 80%;">
						<tr>
							<th colspan="2">
								<h3>
									<i class="fa-solid fa-handshake"></i>&nbsp;회사소개
								</h3>
							</th>
						</tr>
						<tr>
							<td colspan="2" style="margin-top: 20px;"><img
								src=".//resources/images/l2pjh 로고.png" width="500px" /><br />
								<strong>VISION & MISSION</strong><br /> L2PJH는 선진화된 관람문화와 최고의
								서비스로 고객에게 잊을수 없는 감동을 선사합니다.</td>
						</tr>

						<tr>
							<th style="text-align: center; color: red; font-size: 50px;">
								<strong>Vision</strong>
							</th>
							<th><strong>지속적인 진화를 바탕으로 영화 관람 환경 뿐만 아니라 그 이상의
									서비스와 감동을 전달한다.</strong></th>
						</tr>

						<tr>
							<th style="text-align: center; color: red; font-size: 50px;">
								<strong>Mission</strong>
							</th>
							<th><strong>우리만이 제공할 수 있는 다양한 즐거움과 특별한 경험을 통해 고객의
									삶을 풍요롭게 만든다.</strong></th>
						</tr>
					</table>
					<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<div id="footer_section" class="footer ty3">
		<%@ include file="./footer.jsp"%>
	</div>
</body>

<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script src="js/tab.js"></script>
<script src="https://kit.fontawesome.com/121d217c4e.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
<script>
	$('#bdwrite').click(function() {
		location.href = "writeForm";
	});

	//함수 호출 반복문
	for (let i = 0; i < $('.tab-button').length; i++) {
		tabOpen(i);
	}

	//함수에 보관
	function tabOpen(e) {
		$('.tab-button').eq(e).click(function() {
			$('.tab-button').removeClass('active');
			$('.tab-content').removeClass('show');
			$('.tab-button').eq(e).addClass('active');
			$('.tab-content').eq(e).addClass('show');
		});
	}
</script>
</html>