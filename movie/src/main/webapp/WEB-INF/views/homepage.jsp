<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
 <head>
 
 		 <!-- favicon -->
        <link href="<c:url value='.//resources/L2.ico'/>" rel="icon" type="image/x-icon">
 		
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>L2PJH 씨네마</title>
        <!-- Bootstrap -->
        <link href=".//resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <!-- Animate.css -->
        <link href=".//resources/animate.css/animate.css" rel="stylesheet" type="text/css" />
        <!-- Font Awesome iconic font -->
        <link href=".//resources/fontawesome/css/fontawesome-all.css" rel="stylesheet" type="text/css" />
        <!-- Magnific Popup -->
        <link href=".//resources/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css" />
        <!-- Slick carousel -->
        <link href=".//resources/slick/slick.css" rel="stylesheet" type="text/css" />
        <!-- Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Oswald:300,400,500,700' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
        <!-- Theme styles -->
        <link href=".//resources/css/dot-icons.css" rel="stylesheet" type="text/css">
        <link href=".//resources/css/theme.css" rel="stylesheet" type="text/css">
    </head>
<body class="body">

	<!-- header -->
	<div id="header_section" class="header ty3">
		<%@ include file="./header.jsp"%>
	</div>

	<c:choose>
		<c:when test="${loginId != null}">
			<!-- sidebar -->
			<div id="header_section" class="sidebar">
				<%@ include file="./sidebar.jsp"%>
			</div>
		</c:when>
	</c:choose>


	<section class="section-text-white position-relative">
            <div class="d-background" data-image-src="" data-parallax="scroll"></div>
            <div class="d-background bg-theme-blacked"></div>
            <div class="mt-auto container position-relative">
                <div class="top-block-head text-uppercase">
                    <h2 class="display-4">now
                        <span class="text-theme">in cinema</span>
                    </h2>
                </div>
                <div class="top-block-footer">
                    <div class="slick-spaced slick-carousel" data-slick-view="navigation responsive-4">
                        <div class="slick-slides">
                        <div class="slick-slide">
                                <article class="poster-entity" data-role="hover-wrap">
                                    <div class="embed-responsive embed-responsive-poster">
                                       <a href="mvDetail?miName=인디아나 존스-운명의 다이얼 (Indiana Jones and the Dial of Destiny)"><img class="embed-responsive-item" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86878/86878_1000.jpg" alt="" /></a>
                                    </div> 
                                    <div>
                                        <h4 class="entity-title">
                                            <a class="content-link" href="mvDetail?miName=인디아나 존스-운명의 다이얼 (Indiana Jones and the Dial of Destiny)">인디아나 존스-운명의 다이얼 </a>
                                        </h4>
                                        <div class="entity-category">
                                            <a class="content-link">어드벤처, 액션</a>
                                        </div>
                                        <div class="entity-info">
                                            <div class="info-lines">
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-star"></i></span>
                                                    <span class="info-text">8.0</span>
                                                    <span class="info-rest">/10</span>
                                                </div>
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-clock"></i></span>
                                                    <span class="info-text">154</span>
                                                    <span class="info-rest">&nbsp;min</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <div class="slick-slide">
                                <article class="poster-entity" data-role="hover-wrap">
                                    <div class="embed-responsive embed-responsive-poster">
                                       <a href="mvDetail?miName=가디언즈 오브 갤럭시-Volume 3(Guardians of the Galaxy Volume 3)"><img class="embed-responsive-item" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86883/86883_1000.jpg" alt="" /></a>
                                    </div> 
                                    <div>
                                        <h4 class="entity-title">
                                            <a class="content-link" href="mvDetail?miName=가디언즈 오브 갤럭시-Volume 3(Guardians of the Galaxy Volume 3)">가디언즈 오브 갤럭시-Volume 3</a>
                                        </h4>
                                        <div class="entity-category">
                                            <a class="content-link" href="movies-blocks.html">액션</a>
                                        </div>
                                        <div class="entity-info">
                                            <div class="info-lines">
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-star"></i></span>
                                                    <span class="info-text">8.8</span>
                                                    <span class="info-rest">/10</span>
                                                </div>
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-clock"></i></span>
                                                    <span class="info-text">150</span>
                                                    <span class="info-rest">&nbsp;min</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <div class="slick-slide">
                                <article class="poster-entity" data-role="hover-wrap">
                                    <div class="embed-responsive embed-responsive-poster">
                                       <a href="mvDetail?miName=너의 눈을 들여다보면(Small, Slow but Steady)"><img class="embed-responsive-item" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000087/87049/87049_1000.jpg" alt="" /></a>
                                    </div> 
                                    <div>
                                        <h4 class="entity-title">
                                            <a class="content-link" href="mvDetail?miName=너의 눈을 들여다보면(Small, Slow but Steady)">너의 눈을 들여다보면</a>
                                        </h4>
                                        <div class="entity-category">
                                            <a class="content-link">드라마</a>
                                        </div>
                                        <div class="entity-info">
                                            <div class="info-lines">
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-star"></i></span>
                                                    <span class="info-text">6.7</span>
                                                    <span class="info-rest">/10</span>
                                                </div>
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-clock"></i></span>
                                                    <span class="info-text">100</span>
                                                    <span class="info-rest">&nbsp;min</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <div class="slick-slide">
                                <article class="poster-entity" data-role="hover-wrap">
                                    <div class="embed-responsive embed-responsive-poster">
                                       <a href="mvDetail?miName=명탐정코난-하이바라 아이 이야기 ~흑철의 미스터리 트레인(Detective Conan: The Story of Ai Haibara: Black Iron Mystery Train)"><img class="embed-responsive-item" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000087/87133/87133_1000.jpg" alt="" /></a>
                                    </div> 
                                    <div>
                                        <h4 class="entity-title">
                                            <a class="content-link" href="mvDetail?miName=명탐정코난-하이바라 아이 이야기 ~흑철의 미스터리 트레인(Detective Conan: The Story of Ai Haibara: Black Iron Mystery Train)">명탐정코난-하이바라 아이 이야기 ~흑철의 미스터리 트레인</a>
                                        </h4>
                                        <div class="entity-category">
                                            <a class="content-link">애니메이션 </a>
                                        </div>
                                        <div class="entity-info">
                                            <div class="info-lines">
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-star"></i></span>
                                                    <span class="info-text">7.4</span>
                                                    <span class="info-rest">/10</span>
                                                </div>
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-clock"></i></span>
                                                    <span class="info-text">99</span>
                                                    <span class="info-rest">&nbsp;min</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <div class="slick-slide">
                                <article class="poster-entity" data-role="hover-wrap">
                                    <div class="embed-responsive embed-responsive-poster">
                                       <a href="mvDetail?miName=트랜스포머-비스트의 서막 (Transformers: Rise of the Beasts)"><img class="embed-responsive-item" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000087/87055/87055_1000.jpg" alt="" /></a>
                                    </div> 
                                    <div>
                                        <h4 class="entity-title">
                                            <a class="content-link" href="mvDetail?miName=트랜스포머-비스트의 서막 (Transformers: Rise of the Beasts)">트랜스포머-비스트의 서막</a>
                                        </h4>
                                        <div class="entity-category">
                                            <a class="content-link" >액션</a>,
                                            <a class="content-link" >SF</a>
                                        </div>
                                        <div class="entity-info">
                                            <div class="info-lines">
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-star"></i></span>
                                                    <span class="info-text">7,1</span>
                                                    <span class="info-rest">/10</span>
                                                </div>
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-clock"></i></span>
                                                    <span class="info-text">127</span>
                                                    <span class="info-rest">&nbsp;min</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <div class="slick-slide">
                                <article class="poster-entity" data-role="hover-wrap">
                                    <div class="embed-responsive embed-responsive-poster">
                                       <a href="mvDetail?miName=스파이더맨-어크로스 더 유니버스 (Spider-Man: Across the Spider-Verse)"><img class="embed-responsive-item" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000087/87106/87106_1000.jpg" alt="" /></a>
                                    </div> 
                                    <div>
                                        <h4 class="entity-title">
                                            <a class="content-link" href="mvDetail?miName=스파이더맨-어크로스 더 유니버스 (Spider-Man: Across the Spider-Verse)">스파이더맨-어크로스 더 유니버스</a>
                                        </h4>
                                        <div class="entity-category">
                                            <a class="content-link">애니메이션 </a>
                                        </div>
                                        <div class="entity-info">
                                            <div class="info-lines">
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-star"></i></span>
                                                    <span class="info-text">8,7</span>
                                                    <span class="info-rest">/10</span>
                                                </div>
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-clock"></i></span>
                                                    <span class="info-text">140</span>
                                                    <span class="info-rest">&nbsp;min</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <div class="slick-slide">
                                <article class="poster-entity" data-role="hover-wrap">
                                    <div class="embed-responsive embed-responsive-poster">
                                       <a href="mvDetail?miName=귀공자 (The Childe)"><img class="embed-responsive-item" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000087/87095/87095_1000.jpg" alt="" /></a>
                                    </div> 
                                    <div>
                                        <h4 class="entity-title">
                                            <a class="content-link" href="mvDetail?miName=귀공자 (The Childe)">귀공자</a>
                                        </h4>
                                        <div class="entity-category">
                                            <a class="content-link" href="movies-blocks.html">액션</a>
                                        </div>
                                        <div class="entity-info">
                                            <div class="info-lines">
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-star"></i></span>
                                                    <span class="info-text">8.1</span>
                                                    <span class="info-rest">/10</span>
                                                </div>
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-clock"></i></span>
                                                    <span class="info-text">118</span>
                                                    <span class="info-rest">&nbsp;min</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                           <div class="slick-slide">
                                <article class="poster-entity" data-role="hover-wrap">
                                    <div class="embed-responsive embed-responsive-poster">
                                       <a href="mvDetail?miName=범죄도시3 (THE ROUNDUP : NO WAY OUT)"><img class="embed-responsive-item" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000087/87045/87045_1000.jpg" alt="" /></a>
                                    </div> 
                                    <div>
                                        <h4 class="entity-title">
                                            <a class="content-link" href="mvDetail?miName=범죄도시3 (THE ROUNDUP : NO WAY OUT)">범죄도시3 </a>
                                        </h4>
                                        <div class="entity-category">
                                            <a class="content-link" href="movies-blocks.html">범죄</a>,
                                            <a class="content-link" href="movies-blocks.html">액션</a>
                                        </div>
                                        <div class="entity-info">
                                            <div class="info-lines">
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-star"></i></span>
                                                    <span class="info-text">9,8</span>
                                                    <span class="info-rest">/10</span>
                                                </div>
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-clock"></i></span>
                                                    <span class="info-text">105</span>
                                                    <span class="info-rest">&nbsp;min</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <div class="slick-slide">
                                <article class="poster-entity" data-role="hover-wrap">
                                    <div class="embed-responsive embed-responsive-poster">
                                       <a href="mvDetail?miName=엘리멘탈 (Elemental)"><img class="embed-responsive-item" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000087/87034/87034_320.jpg" alt="" /></a>
                                    </div> 
                                    <div>
                                        <h4 class="entity-title">
                                            <a class="content-link" href="mvDetail?miName=엘리멘탈 (Elemental)">엘리멘탈 </a>
                                        </h4>
                                        <div class="entity-category">
                                            <a class="content-link">애니메이션 </a>
                                        </div>
                                        <div class="entity-info">
                                            <div class="info-lines">
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-star"></i></span>
                                                    <span class="info-text">8.3</span>
                                                    <span class="info-rest">/10</span>
                                                </div>
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-clock"></i></span>
                                                    <span class="info-text">109</span>
                                                    <span class="info-rest">&nbsp;min</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <div class="slick-slide">
                                <article class="poster-entity" data-role="hover-wrap">
                                    <div class="embed-responsive embed-responsive-poster">
                                       <a href="mvDetail?miName=플래시 (The Flash)"><img class="embed-responsive-item" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000087/87090/87090_1000.jpg" alt="" /></a>
                                    </div> 
                                    <div>
                                        <h4 class="entity-title">
                                            <a class="content-link" href="mvDetail?miName=플래시 (The Flash)">플래시  </a>
                                        </h4>
                                        <div class="entity-category">
                                            <a class="content-link">액션</a>
                                        </div>
                                        <div class="entity-info">
                                            <div class="info-lines">
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-star"></i></span>
                                                    <span class="info-text">8.3</span>
                                                    <span class="info-rest">/10</span>
                                                </div>
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-clock"></i></span>
                                                    <span class="info-text">144</span>
                                                    <span class="info-rest">&nbsp;min</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </div>
                        <div class="slick-arrows">
                            <div class="slick-arrow-prev">
                                <span class="th-dots th-arrow-left th-dots-animated">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </span>
                            </div>
                            <div class="slick-arrow-next">
                                <span class="th-dots th-arrow-right th-dots-animated">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
	<section class="section-long">
		<div class="container" id="homePageMv">
			<div class="section-head">
				<h2 class="section-title text-uppercase" style="font-weight : bold;">상영중인 영화</h2>
				<p class="section-text">2023년 6월 26일 ~ 2023년 7월 3일</p>
			</div>

		</div>
	</section>

	<a class="scroll-top disabled" href="#"><i class="fas fa-angle-up"
		aria-hidden="true"></i></a>

	<!-- footer -->
	<div id="footer_section" class="footer ty3">
		<%@ include file="./footer.jsp"%>
	</div>

	<!-- Bootstrap -->
	<script src="./resources/bootstrap/js/bootstrap.js"></script>
	<!-- Paralax.js -->
	<script src="./resources/parallax.js/parallax.js"></script>
	<!-- Waypoints -->
	<script src="./resources/waypoints/jquery.waypoints.min.js"></script>
	<!-- Slick carousel -->
	<script src="./resources/slick/slick.min.js"></script>
	<!-- Magnific Popup -->
	<script src="./resources/magnific-popup/jquery.magnific-popup.min.js"></script>
	<!-- Inits product scripts -->
	<script src="./resources/js/script.js"></script>

	<script async defer
		src="https://ia.media-imdb.com/images/G/01/imdb/plugins/rating/js/rating.js"></script>
</body>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script>
	//ajax로 영화 목록 불러오기
	$.ajax({
		type : "GET",
		url : "mvhome",
		dataType : "json",
		success : function(hList) {
			console.log(hList);
			hoList(hList); 
		},
		error : function() {
			alert("홈페이지 정보 불러오기 실패")
		}

	});
	
	
	// 아래 영화정보
	function hoList(hList) {
		let output = "";

		for ( let i in hList) {
			output += "<article class=\"movie-line-entity\">";
			output += "<div class='entity-poster' data-role='hover-wrap'>";
			output += "<div class=\"embed-responsive embed-responsive-poster\">";
			output += "<img class=\"embed-responsive-item\" src=\""+hList[i].miPoster+"\" alt=\"\" />";
			output += "</div>";
			output += "<div class=\"d-over bg-theme-lighted collapse animated faster\" data-show-class=\"fadeIn show\" data-hide-class=\"fadeOut show\">";
			output += "<div class=\"entity-play\">";
			output += "<a class=\"action-icon-theme action-icon-bordered rounded-circle\" href='"+hList[i].miTeaser+"' data-magnific-popup='iframe'>";
			output += "<span class=\"icon-content\"><i class=\"fas fa-play\"></i></span>";
			output += "</a>";
			output += "</div>";
			output += "</div>";
			output += "</div>";
			output += "<div class=\"entity-content\">";
			output += "<h4 class=\"entity-title\">";
			output += "<a class=\"content-link\" href=\"mvDetail?miName="+hList[i].miName+"\">"+hList[i].miName+"</a></h4>";
			output += "<div class=\"entity-category\">";
			output += "<a class=\"content-link\" href=\"mvSearch?keyword="+hList[i].miGenre1+"\">"+hList[i].miGenre1+"</a>";
			
			if(hList[i].miGenre2 !=null){
				output += ",<a class=\"content-link\" href=\"mvSearch?keyword="+hList[i].miGenre2+"\">"+hList[i].miGenre2+"</a>";
			}
			if(hList[i].miGenre3 !=null){
			output += ",<a class=\"content-link\" href=\"mvSearch?keyword="+hList[i].miGenre3+"\">"+hList[i].miGenre3+"</a>";
			}
			output += "</div>";
			output += "<div class=\"entity-info\">";
			output += "<div class=\"info-lines\">";
			
			output += "<div class=\"info info-short\">";
			output += "<span class=\"text-theme info-icon\">";
			output += "<i class=\"fas fa-clock\"></i></span>";
			output += "<span class=\"info-text\">"+hList[i].miRuntime+"</span>";
			output += "<span class=\"info-rest\">&nbsp;min</span><span class='info-text'>&nbsp;,&nbsp; " + hList[i].miAge + "</span>";
			output += "</div>";
			output += "</div>";
			output += "</div>";
			output += "<p class=\"text-short entity-text\">"+hList[i].miSynopsis+"</p>";
			output += "</div>";
			output += "</article>";
			
		}
		$('#homePageMv').append(output);
	}
</script>
</html>
