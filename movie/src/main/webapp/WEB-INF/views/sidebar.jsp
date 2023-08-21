<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 추가 css -->
<link href="./resources/css/add.css" rel="stylesheet" type="text/css">
<body>
	<aside class="side-bar">
		<section class="side-bar__icon-box">
			<section class="side-bar__icon-1">
				<div></div>
				<div></div>
				<div></div>
			</section>
		</section>
		<ul>
			<c:choose>
				<c:when test="${loginId == 'admin'}">
					<li><a href="#">영화 관리</a>
						<ul>
							<li><a href="mvWriteForm">영화 등록</a></li>
							<li><a href="mvList">영화 목록</a></li>
						</ul></li>
					<li><a href="#">영화 상영관 관리</a>
						<ul>
							<li><a href="twriteForm">상영관 정보 등록</a></li>
							<li><a href="tList">상영관 목록</a></li>
						</ul></li>
					<li><a href="mList">회원 목록</a></li>
					<li><a href="adminTicketList">예약 관리</a></li>

				</c:when>
				<c:otherwise>
					<li><a href="mView?mbId=${loginId }">내 정보</a>
						<ul>
							<li><a href="mView?mbId=${loginId }">정보 보기</a></li>
							<li><a href="modifyForm?mbId=${loginId }">정보 수정</a></li>
							<li><a href="" id="delete">회원 탈퇴하기</a></li>
						</ul></li>
					<li><a href="ticketingList?mbId=${loginId }">예매내역</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</aside>

</body>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script>
	$('#delete').click(function() {
		let conf = confirm('정말 탈퇴 하시겠습니까?');

		if (conf) {
			console.log('${loginId}');
			location.href = "mDelete?mbId=${loginId}";
			alert('삭제했습니다.')
		} else {
			alert('취소했습니다.')
		}
	});
</script>
</html>