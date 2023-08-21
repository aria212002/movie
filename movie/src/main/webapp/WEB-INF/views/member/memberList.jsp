<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<style type="text/css">	
td, th{
	padding : 10px;
	font-size : 20px;
	text-align: center;
}
	
caption {
	margin-bottom : 10px;
	font-size : 20px;
	font-weight : bold;
}
</style>
<link rel="stylesheet" href="./resources/css/add.css"/>
<script src="https://kit.fontawesome.com/121d217c4e.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="header_section" class="header ty3">
				<%@ include file="../header.jsp" %>
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
            <div class="d-background"  data-parallax="scroll"></div>
            <div class="d-background bg-theme-blacked"></div>
            <div class="mt-auto container position-relative">
                <div class="top-block-head text-uppercase">
                    <h2 class="display-4">Member
                        <span class="text-theme">List</span>
                    </h2>
                </div>
        <table>
        <h4><i class="fa-solid fa-list"></i>&nbsp;회원목록</h4><br/>
		<tr>
			<th>
				<i class="fa-solid fa-user"></i>
				회원 아이디
			</th>
			<th>
				<i class="fa-regular fa-address-card"></i>
				회원 이름
			</th>
			<th>
				<i class="fa-solid fa-calendar-days"></i>
				회원 생년월일
			</th>
		</tr>
		
		<c:forEach var="list" items="${mvmList}">
			<tr>
				<td><a href="mView?mbId=${list.mbId}">${list.mbId}</a></td>
				<td>${list.mbName}</td>
				<td>${list.mbBirth}</td>
			</tr>
		</c:forEach>

		<tr>
			<td colspan="5">
			<c:if test="${paging.page <= 1}">◀</c:if>
			<c:if test="${paging.page > 1}"><a href="mList?page=${paging.page - 1}">◀</a></c:if>

			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
				<c:if test="${paging.page == i}"> ${i} </c:if>
				<c:if test="${paging.page != i}"> <a href="mList?page=${i}">${i}</a> </c:if>
			</c:forEach>

			<c:if test="${paging.page >= paging.maxPage}">▶</c:if>
			<c:if test="${paging.page < paging.maxPage}"><a href="mList?page=${paging.page + 1}">▶</a></c:if>
			</td>
		</tr>
		
		<tr>
			<td colspan="5">
			<form action="mSearch" method="GET">

				<select name="category" class="l-cat">
					<option value="MBNAME">이름</option>
					<option value="MBID">아이디</option>
				</select>

				<input type="text" name="keyword" class="k-list"/>
				<button type="submit" value="검색" class="btn-theme btn">검색</button>

			</form>
			</td>
		</tr>
	</table>
               
            
            </div>
        </section>
<div id="footer_section" class="footer ty3">
				<%@ include file="../footer.jsp" %>
</div>

</body>
</html>