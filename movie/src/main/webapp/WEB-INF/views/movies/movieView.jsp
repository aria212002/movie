<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>영화 상세보기</title>
<!-- favicon -->
<link href="<c:url value='.//resources/L2.ico'/>" rel="icon" type="image/x-icon">
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
</head>
<body class="body">
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

	<section class="after-head d-flex section-text-white position-relative">
		<div class="d-background"
			data-image-src=""
			data-parallax="scroll"></div>
		<div class="d-background bg-black-80"></div>
		<div class="top-block top-inner container">
			<div class="top-block-content">
				<h1 class="section-title">영화 상세보기</h1>
				<div class="page-breadcrumbs">
					<a class="content-link" href="./"></a> 
				</div>
			</div>
		</div>
	</section>
	<div class="container">
		<div class="sidebar-container">
			<div class="content">
				<section class="section-long">
					<div class="section-line">
						<div class="movie-info-entity">
							<div class="entity-poster" data-role="hover-wrap">
								<div class="embed-responsive embed-responsive-poster">
									<img class="embed-responsive-item" src="${view.miPoster}"
										alt="" />
								</div>
								<div class="d-over bg-theme-lighted collapse animated faster"
									data-show-class="fadeIn show" data-hide-class="fadeOut show">
									<div class="entity-play">
										<a
											class="action-icon-theme action-icon-bordered rounded-circle"
											href="${view.miTeaser}" data-magnific-popup="iframe"> <span
											class="icon-content"><i class="fas fa-play"></i></span>
										</a>
									</div>
								</div>
							</div>
							<div class="entity-content">
								<h2 class="entity-title">${view.miName}</h2>

								<div class="entity-category">
									<a class="content-link"
										href="mvSearch?keyword=${view.miGenre1}">${view.miGenre1}</a>
									<c:if test="${view.miGenre2 != null}">
										<a class="content-link"
											href="mvSearch?keyword=${view.miGenre2}">,${view.miGenre2}</a>
									</c:if>
									<c:if test="${view.miGenre3 != null}">
										<a class="content-link"
											href="mvSearch?keyword=${view.miGenre3}">,${view.miGenre3}</a>
									</c:if>
								</div>
								<div class="entity-info">
									<div class="info-lines">

										<div class="info info-short">
											<span class="text-theme info-icon"><i
												class="fas fa-clock"></i></span> <span class="info-text">${view.miRuntime}</span>
											<span class="info-rest">&nbsp;min</span><span
												class="info-text">&nbsp;,&nbsp; ${view.miAge}</span>
										</div>
									</div>
								</div>
								<ul class="entity-list">
									<li><span class="entity-list-title">개봉일:</span>${view.miRelease}</li>
									<li><span class="entity-list-title">감독:</span>
										${view.miDirecter}</li>
									<li><span class="entity-list-title">배우:</span>${view.miActor}</li>

								</ul>
								<input class="px-5 btn btn-theme" type="button" value="예매"
									id="reserv" /><br/><br/>

								<div class="entity-extra">
								
									<div class="text-uppercase entity-extra-title">금일 상영 시간표</div><br/>
									<div class="entity-showtime">
										<div class="showtime-wrap" id="msArea">
									
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>

					<div class="section-line">
						<div class="section-head">
							<h2 class="section-title text-uppercase">줄거리</h2>
						</div>
						<div class="section-description">

							<h6 class="text-dark">${view.miSynopsis}</h6>

						</div>
						<div class="section-bottom">
							<div class="row">

								<div class="col-auto">
									<div class="entity-links">
										<div class="entity-list-title">장르:</div>
										<a class="content-link"
											href="mvSearch?keyword=${view.miGenre1}">${view.miGenre1}</a>
										<c:if test="${view.miGenre2 != null}">
											<a class="content-link"
												href="mvSearch?keyword=${view.miGenre2}">,${view.miGenre2}</a>
										</c:if>
										<c:if test="${view.miGenre3 != null}">
											<a class="content-link"
												href="mvSearch?keyword=${view.miGenre3}">,${view.miGenre3}</a>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
						<div class="section-line">
							<div class="section-head">
								<h2 class="section-title text-uppercase">Photos</h2>
							</div>
							<div class="grid row">
								<div class="col-sm-6 col-xl-4">
									<div class="gallery-card-entity">
										<div class="entity-preview" data-role="hover-wrap">
											<div class="embed-responsive embed-responsive-16by9">
												<img class="embed-responsive-item" src="${view.miStillcut1}"
													alt="" />
											</div>
											<div class="d-over bg-black-40 collapse animated faster"
												data-show-class="fadeIn show" data-hide-class="fadeOut show">
												<div class="entity-view-popup">
													<a class="content-link action-icon-bordered rounded-circle"
														href="${view.miStillcut1}" data-magnific-popup="image">
														<span class="icon-content"><i class="fas fa-search"></i></span>
													</a>
												</div>
											</div>
										</div>
										<div class="entity-content">
											<h4 class="entity-title">스틸컷1</h4>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-xl-4">
									<div class="gallery-card-entity">
										<div class="entity-preview" data-role="hover-wrap">
											<div class="embed-responsive embed-responsive-16by9">
												<img class="embed-responsive-item" src="${view.miStillcut2}"
													alt="" />
											</div>
											<div class="d-over bg-black-40 collapse animated faster"
												data-show-class="fadeIn show" data-hide-class="fadeOut show">
												<div class="entity-view-popup">
													<a class="content-link action-icon-bordered rounded-circle"
														href="${view.miStillcut2}" data-magnific-popup="image">
														<span class="icon-content"><i class="fas fa-search"></i></span>
													</a>
												</div>
											</div>
										</div>
										<div class="entity-content">
											<h4 class="entity-title">스틸컷2</h4>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-xl-4">
									<div class="gallery-card-entity">
										<div class="entity-preview" data-role="hover-wrap">
											<div class="embed-responsive embed-responsive-16by9">
												<img class="embed-responsive-item" src="${view.miStillcut3}"
													alt="" />
											</div>
											<div class="d-over bg-black-40 collapse animated faster"
												data-show-class="fadeIn show" data-hide-class="fadeOut show">
												<div class="entity-view-popup">
													<a class="content-link action-icon-bordered rounded-circle"
														href="${view.miStillcut3}" data-magnific-popup="image">
														<span class="icon-content"><i class="fas fa-search"></i></span>
													</a>
												</div>
											</div>
										</div>
										<div class="entity-content">
											<h4 class="entity-title">스틸컷3</h4>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-xl-4">
									<div class="gallery-card-entity">
										<div class="entity-preview" data-role="hover-wrap">
											<div class="embed-responsive embed-responsive-16by9">
												<img class="embed-responsive-item" src="${view.miStillcut4}"
													alt="" />
											</div>
											<div class="d-over bg-black-40 collapse animated faster"
												data-show-class="fadeIn show" data-hide-class="fadeOut show">
												<div class="entity-view-popup">
													<a class="content-link action-icon-bordered rounded-circle"
														href="${view.miStillcut4}" data-magnific-popup="image">
														<span class="icon-content"><i class="fas fa-search"></i></span>
													</a>
												</div>
											</div>
										</div>
										<div class="entity-content">
											<h4 class="entity-title">스틸컷4</h4>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-xl-4">
									<div class="gallery-card-entity">
										<div class="entity-preview" data-role="hover-wrap">
											<div class="embed-responsive embed-responsive-16by9">
												<img class="embed-responsive-item" src="${view.miStillcut5}"
													alt="" />
											</div>
											<div class="d-over bg-black-40 collapse animated faster"
												data-show-class="fadeIn show" data-hide-class="fadeOut show">
												<div class="entity-view-popup">
													<a class="content-link action-icon-bordered rounded-circle"
														href="${view.miStillcut5}" data-magnific-popup="image">
														<span class="icon-content"><i class="fas fa-search"></i></span>
													</a>
												</div>
											</div>
										</div>
										<div class="entity-content">
											<h4 class="entity-title">스틸컷5</h4>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-xl-4">
									<div class="gallery-card-entity">
										<div class="entity-preview" data-role="hover-wrap">
											<div class="embed-responsive embed-responsive-16by9">
												<img class="embed-responsive-item" src="${view.miStillcut6}"
													alt="" />
											</div>
											<div class="d-over bg-black-40 collapse animated faster"
												data-show-class="fadeIn show" data-hide-class="fadeOut show">
												<div class="entity-view-popup">
													<a class="content-link action-icon-bordered rounded-circle"
														href="${view.miStillcut6}" data-magnific-popup="image">
														<span class="icon-content"><i class="fas fa-search"></i></span>
													</a>
												</div>
											</div>
										</div>
										<div class="entity-content">
											<h4 class="entity-title">스틸컷6</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="section-line">
							<div class="section-head">
								<h2 class="section-title text-uppercase">리뷰</h2>
							</div>

							<div class="comment-entity">
								<div class="entity-inner" id="cmtArea"></div>
							</div>
						</div>



						<div class="section-line" id="rvWriteArea"></div>
				</section>
			</div>

		</div>
	</div>
	<a class="scroll-top disabled" href="#"><i class="fas fa-angle-up"
		aria-hidden="true"></i></a>

	<!-- footer -->
	<div id="footer_section" class="footer ty3">
		<%@ include file="../footer.jsp"%>
	</div>
</body>

<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script>


	var delId = "";
	//예매 페이지 이동
	$('#reserv').click(function() {
		location.href = "reservePage?miName=${view.miName}";
	});

	let mrName = '${view.miName}';
	let mrId = '${loginId}';
	console.log(mrName);

	// ajax로 리뷰 불러오기
	$.ajax({
		type : "GET",
		url : "cList",
		data : {
			"mrName" : mrName
		},
		dataType : "json",
		success : function(list) {
			console.log(list);

			// cmtList()  함수 호출
			cmtList(list);
		},
		error : function() {
			alert("댓글 불러오기 통신 실패")
		}

	});

	// mrIdCheck : ajax로 리뷰 id 비교
	$.ajax({
		type : "GET",
		url : "mrIdCheck",
		data : {
			"mrId" : mrId,
			"mrName" : '${view.miName}'
		},
		dataType : "text",
		success : function(check) {
			console.log(check);
			checkIdView(check);

		},
		error : function() {
			alert("mrId 비교 통신 실패")
		}

	});

	// checkIdView 함수 적용

	function checkIdView(check) {
		let output = "";
		let nuId = '${loginId}';
		if (nuId == '') {
			nuId = null;
		}
		if (nuId != null && check == 'NO') {

			output += "<div class='section-head'>";
			output += "<h2 class='section-title text-uppercase'>리뷰 쓰기</h2>";
			output += "</div>";
			output += "<div class='row form-grid'>";
			output += "<div class='col-12'>";
			output += "<div class='input-view-flat input-group'>";

			output += "<input type='hidden' value='${view.miName}' name='mrName' id='mrName'/>";
			output += "<input type='hidden' value='${loginId}'name='mrId' id='mrId'/>";

			output += "<textarea class='form-control' name='mrReview' id='mrReview' placeholder='리뷰 작성(200자)'></textarea>";
			output += "</div>";
			output += "</div>";
			output += "<div class='col-12'>";
			output += "<button class='px-5 btn btn-theme' onclick='writeBtn()'>리뷰 작성</button>";
			output += "</div>";
			output += "</div>";
		} else {
			output += "";
		}

		$('#rvWriteArea').append(output);
	}

	// 리뷰 입력(writeBtn) 버튼을  클릭했을 경우
	function writeBtn() {

		let mrReview = $('#mrReview').val();

		console.log(mrId);
		console.log(mrReview);

		// console.log("cWriter : " + cWrtier + ", cContent : " + cContent + ", cbNum : " + cbNum);

		$.ajax({
			type : "GET",
			url : "rvWrite",
			data : {
				"mrReview" : mrReview,
				"mrName" : mrName,
				"mrId" : mrId
			},
			dataType : "json",
			success : function(list) {

				$('#mrReview').val("");
			},
			error : function() {
				alert('댓글 작성 통신 실패!');
			}
		});

		location.href = "mvDetail?miName=" + mrName;
	};

	// 리뷰 목록 보기
	function cmtList(list) {

		let output = "";

		for ( let i in list) {

			let rId = list[i].mrId;
			console.log(list[i].mrId);

			output += "<div class='entity-content'>";
			output += "<table id='rvId" + rId +"'>";
			output += "<tr>";
			output += "<th>" + list[i].mrId + "</th>";

			output += "<th>" + list[i].mrDate + "</th>";
			output += "</tr>";

			output += "<tr>";

			output += "<td colspan='2'>" + list[i].mrReview + "</td>";

			output += "</tr>";
			if ('${loginId}' == 'admin' || '${loginId}' == list[i].mrId) {

				console.log('${loginId}');

				output += "<tr col span='2'><td>";

				if ('${loginId}' == list[i].mrId) {
					output += "<button class='px-5 btn btn-theme' onclick=\"rmodiForm('"
							+ list[i].mrId
							+ "','"
							+ list[i].mrReview
							+ "')\">수정</button>";
				}
				output += "<button class=\"px-5 btn btn-theme\" onclick=\"del('"
						+ list[i].mrId + "')\">삭제</button>";
				output += "</td></tr>";

			}
			;
			output += "</table>";
			output += "</div><hr/>";

		}

		$('#cmtArea').append(output);

	}

	// rvModify : 
	// 1. 리뷰 수정
	function rmodiForm(mrId, mrReview) {
		console.log(mrId);
		console.log(mrReview);

		let output = "";

		output += "<div class='row form-grid'>";
		output += "<div class='col-12'>";
		output += "<div class='input-view-flat input-group'>";

		output += "<tr>";
		output += "<td colspan='2'>";

		output += "<input type='hidden' value='${view.miName}' name='mrName' id='mrName'/>";
		output += "<input type='hidden' value='${loginId}' name='mrId' id='mrId'/>";
		output += "<textarea class='form-control' name='edReview' id='edReview'>"
				+ mrReview + "</textarea>";
		output += "</td>";
		output += "</tr>";

		output += "</div>";
		output += "</div>";

		output += "<tr>";
		output += "<td colspan='2'>";
		output += "<button class='px-5 btn btn-theme' onclick='rmodify()'>수정</button>";
		output += "</td>";
		output += "</tr>";

		output += "</div>";

		$('#rvId' + mrId).replaceWith(output);
		$('#edReview').focus();
	};

	// 2. 리뷰 수정 ajax
	function rmodify() {

		let mrReview = $('#edReview').val();
		let mrName = $('#mrName').val();

		$.ajax({
			type : "POST",
			url : "rvModify",
			data : {
				"mrId" : mrId,
				"mrName" : mrName,
				"mrReview" : mrReview
			},
			dataType : "json", // DB에서 받아오는 값이 object 타입은 json으로 String타입은 text로 입력
			success : function(result) {
				location.href = "mvDetail?miName=" + mrName;
				cmtList(result);

			},
			error : function() {
				alert('댓글 수정 통신 실패!');
			}
		});
	}

	// 리뷰 삭제
	function del(delId) {
		let conf = confirm('삭제하시겠습니까?');

		if (conf) {

			$.ajax({
				type : "POST",
				url : "rvDelete",
				data : {

					"mrId" : delId,
					"mrName" : mrName
				},
				dataType : "json", // DB에서 받아오는 값이 object 타입은 json으로 String타입은 text로 입력
				success : function(result) {
					cmtList(result);
				},
				error : function() {
					alert('댓글 삭제 통신 실패!');
				}
			});

			location.href = "mvDetail?miName=" + mrName;
		} else {
			alert('취소했습니다.')
		}
	}
	
	// 스케줄 정보 불러오기
	$.ajax({
		type : "GET",
		url : "msInfo",
		data : {
			"msName" : mrName
			
		},
		dataType : "json",
		success : function(msTime) {
			console.log(msTime);
			console.log(mrName);

			// cmtList()  함수 호출
			msList(msTime);
		},
		error : function() {
			alert("시간 불러오기 통신 실패")
		}

	});
	
	// 스케줄 정보 보기
	function msList(msTime) {
		
	

		let output = "";

		for ( let i in msTime) {
			
			let msDateDate = msTime[i].msDate.slice(8);
			let msDateMo = msTime[i].msDate.slice(2);
			
			let msStartTime = msTime[i].msStartTime;									
			let msStartTimeHour = msStartTime.slice(0,
					-3);									
			let msStartTimeMinute = msStartTime
					.slice(3);	
			
			let now = new Date();
			let nowDate = now.getDate();
			let nowHour = now.getHours();									
			let nowMinute = now.getMinutes();									

			console.log(msTime);

			// 시간 비교용 변수 생성
			let check = false;

			// 시간 비교 후 스케쥴이 현재 시간보다 이전이면 true
			if (msDateDate == nowDate) {
				if (msStartTimeHour < nowHour) {
					check = true;
				} else if (msStartTimeHour == nowHour) {
					if (msStartTimeMinute <= nowMinute) {
						check = true;
					}
				}
			}
			if(msDateDate == nowDate && check == false){

			
			
			output += "<div class='showtime-item'>";
			output += "<a class='btn-time btn' aria-disabled='false' href='seat?msNumber=" + msTime[i].msNumber + "'>" + msTime[i].msTheater  + msTime[i].msStartTime + "</a>";

			output += "</div>";

				}
			}

		

		$('#msArea').append(output);

	}
	
	
	


	$('#mvModify').click(function() {
		location.href = "mvModiForm?miName=${view.miName}";
	});
	$('#mvDelete').click(function() {
		location.href = "mvDelete?miName=${view.miName}";
	});
</script>
</html>