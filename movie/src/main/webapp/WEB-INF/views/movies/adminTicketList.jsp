<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>L2PJH 씨네마</title>

<style>
.ad-tic-ti{
	margin-bottom : 50px; 
	margin-top : 50px;
	margin-left: 26%; 
	margin-right: 26%;
}
.ticketTable {
	padding-bottom: 200px;
	text-align: center;
	margin-left: auto; 
	margin-right: auto; 
	width : 80%;
}

td, th {
	border-top: 3px solid gray;
	border-bottom: 3px solid gray;
}

.adt-list {
	border-radius: 7px;
	width: 30%;
}

</style>
<script src="https://kit.fontawesome.com/121d217c4e.js" crossorigin="anonymous"></script>
</head>
<body>

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
			data-image-src="http://via.placeholder.com/1920x3000"
			data-parallax="scroll"></div>
		<div class="d-background bg-theme-blacked"></div>
		<div class="mt-auto container position-relative">
			<div class="top-block-head text-uppercase">
				<h2 class="display-4">예매 <span class="text-theme">관리</span></h2>
			</div>
		</div>
	</section>
		<div>
		<table class="ticketTable">
			<h1 class="ad-tic-ti">
				<i class="fa-solid fa-person"></i>
				[모든 <span class="text-theme">고객님</span>들의 <span class="text-theme">예매내역</span> 입니다]
				<i class="fa-solid fa-person"></i>
			</h1>
			<tr style="background-color : orange;">
				<th nowrap>예매 번호</th>
				<th nowrap>스케줄 번호</th>
				<th nowrap>예매 아이디</th>
				<th nowrap>영화 제목</th>
				<th nowrap>상영일</th>
				<th nowrap>상영 시간 </th>
				<th nowrap>인원 수</th>
				<th nowrap>결제 가격</th>
				<th nowrap>결제 여부</th>
				<th nowrap>예매 취소</th>
			</tr>
			<c:forEach var="list" items="${adList}">
				<tr>
					<th>${list.mtNumber}</th>
					<td>${list.mtsNumber}</td>
					<td>${list.mtId}</td>
					<td>${list.mtName}</td>					
					<td nowrap>${list.msDate}</td>
					<td>${list.msStartTime}</td>
					<td>${list.mtCount}</td>
					<td>${list.mtPrice}</td>
					<c:if test="${list.mtPayment == '0'}">
						<td>X</td>
					</c:if>
					<c:if test="${list.mtPayment == '1'}">
						<td>O</td>
					</c:if>
					<td>
						<button type="button" class="btn-theme btn" onclick="deleteReserve2('${list.mtNumber}')">취소</button>
					</td>
				</tr>
			</c:forEach>
			<tr>
			<td colspan="9">
			<c:if test="${paging.page <= 1}">◀</c:if>
			<c:if test="${paging.page > 1}"><a href="adminTicketList?page=${paging.page - 1}">◀</a></c:if>

			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
				<c:if test="${paging.page == i}"> ${i} </c:if>
				<c:if test="${paging.page != i}"> <a href="adminTicketList?page=${i}">${i}</a> </c:if>
			</c:forEach>

			<c:if test="${paging.page >= paging.maxPage}">▶</c:if>
			<c:if test="${paging.page < paging.maxPage}"><a href="adminTicketList?page=${paging.page + 1}">▶</a></c:if>
			</td>
		</tr>
		
		<tr>
			<td colspan="9">
			<form action="adtSearch" method="GET">

				<select name="category" class="l-cat" >
					<option value="mtId">예매 아이디</option>
					<option value="mtName">영화 제목</option>
					<option value="mtCount">인원 수</option>
				</select>
				&nbsp;
				<input type="text" name="keyword" class="adt-list"/>&nbsp;
				<button type="submit" value="검색" class="btn-theme btn">검색</button>

			</form>
			</td>
		</tr>
		</table>
		<br/>
		<br/>
		<br/>
		<br/>
		</div>

<!-- footer -->
	<div id="footer_section" class="footer ty3">
		<%@ include file="../footer.jsp"%>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
	<script>
	function deleteReserve2(mtNumber) {
	    var confirmed = confirm("정말 삭제하시겠습니까?");
	    
	    if (confirmed) {
	        location.href = "reserveDel3?mtNumber=" + mtNumber;
	        alert('예매내역을 삭제했습니다')
	    } else{
	    	alert('예매내역 삭제를 취소했습니다.');
	    }
	}
	</script>

</html>