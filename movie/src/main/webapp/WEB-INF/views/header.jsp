<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>L2PJH 씨네마</title>
        
        <!-- favicon -->
        <link href="<c:url value='../resources/L2.ico'/>" rel="icon" type="image/x-icon">
        
        
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
 <header class="header header-horizontal header-view-pannel">
            <div class="container">
                <nav class="navbar">
                    <a class="navbar-brand" href="./">
                        <span class="logo-element">
                            <span class="logo-tape">
                                <span class="svg-content svg-fill-theme" data-svg="./resources/images/svg/logo-part.svg"></span>
                            </span>
                            <span class="logo-text text-uppercase">
                                <span><img src=".//resources/images/l2pjh 로고.png" width="70px"/></span></span>
                        </span>
                    </a>
                    <button class="navbar-toggler" type="button">
                        <span class="th-dots-active-close th-dots th-bars">
                            <span></span>
                            <span></span>
                            <span></span>
                        </span>
                    </button>
                    <div class="navbar-collapse">
                        <ul class="navbar-nav">
                            <li class="nav-item nav-item-arrow-down nav-hover-show-sub">
                                <a class="nav-link" href="movie_list">영화</a>
                            </li>
                            <li class="nav-item nav-item-arrow-down nav-hover-show-sub">
                                <a class="nav-link" href="mvReservation">예매하기</a>
                            </li>
                            <li class="nav-item nav-item-arrow-down nav-hover-show-sub">
                                <a class="nav-link" href="customerService">고객센터</a>
                            </li>
                        </ul>
                        <c:choose>
						<c:when test="${loginId == null}">
                        <div class="navbar-extra">
                            <a class="btn-theme btn" href="login">Login</a>
                            <a class="btn-theme btn" href="join">회원가입</a>
                        </div>
                        </c:when>
                        
                        <c:when test="${loginId == 'admin'}">
                        <div class="navbar-extra">
                         <a class="btn-theme btn" href="logout">Logout</a>
                         </div>
                        </c:when>
                        
                        <c:otherwise>
                        <div class="navbar-extra">
                         <a class="btn-theme btn" href="logout">Logout</a>
                         </div>
                        </c:otherwise>
                        </c:choose>
                    </div>
                </nav>
            </div>
        </header>
</body>
 <!-- jQuery library -->
        <script src="./resources/js/jquery-3.3.1.js"></script>
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
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAJ4Qy67ZAILavdLyYV2ZwlShd0VAqzRXA&callback=initMap"></script>
        <script async defer src="https://ia.media-imdb.com/images/G/01/imdb/plugins/rating/js/rating.js"></script>
</html>