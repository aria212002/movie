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
<title>L2PJH 씨네마</title>
 <!-- favicon -->
<link href="<c:url value='.//resources/L2.ico'/>" rel="icon" type="image/x-icon">
<!-- Bootstrap -->
<link href="./resources/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<!-- Animate.css -->
<link href="./resources/animate.css/animate.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome iconic font -->
<link href="./resources/fontawesome/css/fontawesome-all.css"
	rel="stylesheet" type="text/css" />
<!-- Magnific Popup -->
<link href="./resources/magnific-popup/magnific-popup.css"
	rel="stylesheet" type="text/css" />
<!-- Slick carousel -->
<link href="./resources/slick/slick.css" rel="stylesheet"
	type="text/css" />
<!-- Fonts -->
<link
	href='https://fonts.googleapis.com/css?family=Oswald:300,400,500,700'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'
	rel='stylesheet' type='text/css'>
<!-- Theme styles -->
<link href="./resources/css/dot-icons.css" rel="stylesheet"
	type="text/css">
<link href="./resources/css/theme.css" rel="stylesheet" type="text/css">
</head>
<body class="body">
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
	<section class="after-head d-flex section-text-white position-relative">
		<div class="d-background"
			data-image-src=""
			data-parallax="scroll"></div>
		<div class="d-background bg-black-80"></div>
		<div class="top-block top-inner container">
			<div class="top-block-content">
				<h1 class="section-title">Movies list</h1>
				<div class="page-breadcrumbs">
					<a class="content-link" href="./">HOME</a> <span
						class="text-theme mx-2"><i class="fas fa-chevron-right" ></i></span>
					<span>영화</span>
				</div>
			</div>
		</div>
	</section>
	<section class="section-long">
		<div class="container">
			<div class="section-pannel">
				<div class="grid row">
					<div class="col-md-10">
						<form action="mvSearch" method="get">
							<div class="row form-grid">
								<div class="col-sm-6 col-lg-3" style="padding-right : 3px;">
									<div class="input-view-flat input-group">
										<select class="form-control" name="keyword" autofocus>
										<c:choose>
											<c:when test="${keyword == null}">
												<option  value="장르"><span>장르</span></option>
										</c:when>
											
											<c:otherwise>
												<option selected="true" value="장르"><span>${keyword}</span></option>
											
											</c:otherwise>
										</c:choose> 
											<optgroup label="===================">
											<option value="액션">액션</option>
											<option value="코미디">코미디</option>
											<option value="범죄">범죄</option>
											<option value="드라마">드라마</option>
											<option value="로맨스">로맨스</option>
											<option value="스릴러">스릴러</option>
											<option value="어드벤처">어드벤처</option>
											<option value="뮤지컬">뮤지컬</option>
											<option value="SF">SF</option>
											<option value="애니메이션">애니메이션</option></optgroup>
										</select>
									</div>
								</div>
								<div class="col-sm-6 col-lg-3" style="padding-left : 3px;">
									<input class="btn-theme btn" type="submit" value="검색" />
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-2 my-md-auto d-flex">
						<span class="info-title d-md-none mr-3">Select view:</span>
						<ul class="ml-md-auto h5 list-inline">
							<li class="list-inline-item"></li>
							<li class="list-inline-item"></li>
						</ul>
					</div>
				</div>
			</div>

			<c:forEach var="list" items="${mList}">
				<article class="movie-line-entity">
					<div class="entity-poster" data-role="hover-wrap">
						<div class="embed-responsive embed-responsive-poster">
							<img class="embed-responsive-item" src="${list.miPoster}" alt="" />
						</div>
						<div class="d-over bg-theme-lighted collapse animated faster"
							data-show-class="fadeIn show" data-hide-class="fadeOut show">
							<div class="entity-play">
								<a class="action-icon-theme action-icon-bordered rounded-circle" href="${list.miTeaser }" data-magnific-popup="iframe"> 
								<span class="icon-content"><i class="fas fa-play"></i></span>
								</a>
							</div>
						</div>
					</div>


					<div class="entity-content">
						<h4 class="entity-title">
							<a class="content-link" href="mvDetail?miName=${list.miName}">${list.miName}</a>
						</h4>
						<div class="entity-category">
							<a class="content-link" href="mvSearch?keyword=${list.miGenre1}">${list.miGenre1}</a>
							<c:if test="${list.miGenre2 != null}">
							,<a class="content-link" href="mvSearch?keyword=${list.miGenre2}">${list.miGenre2}</a>
							</c:if>
							<c:if test="${list.miGenre3 != null}">
							,<a class="content-link" href="mvSearch?keyword=${list.miGenre3}">${list.miGenre3}</a>
							</c:if>
						</div>
						<div class="entity-info">
							<div class="info-lines">
								<div class="info info-short">
									<span class="text-theme info-icon"><i
										class="fas fa-clock"></i></span> <span class="info-text">${list.miRuntime}</span>
									<span class="info-rest">&nbsp;min</span><span class="info-text">&nbsp;,&nbsp; ${list.miAge}</span>
								</div>
							</div>
						</div>
						<p class="text-short entity-text">${list.miSynopsis}</p>
						<input class="px-5 btn btn-theme" type="button"
							onclick="location.href='reservePage?miName=${list.miName}'"
							value="예매" />
					</div>

				</article>
			</c:forEach>

		</div>
	</section>
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
	
</script>
</html>