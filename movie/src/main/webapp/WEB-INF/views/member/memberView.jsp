<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세보기</title>
<style type="text/css">

	
td, th{
	padding : 10px;
	font-size : 20px;
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
            <div class="d-background" data-parallax="scroll"></div>
            <div class="d-background bg-theme-blacked"></div>
            <div class="mt-auto container position-relative">
                <div class="top-block-head text-uppercase">
                    <h2 class="display-4">Member
                        <span class="text-theme">Profile</span>
                    </h2>
                </div>
 	<table>
 	<h4><i class="fa-regular fa-user"></i>&nbsp;회원 프로필</h4><br/>
		<tr>
			<th>
				<i class="fa-solid fa-user"></i>&nbsp;
				회원 아이디
			</th>
			<td>
				${view.mbId}
			</td>
		</tr>

		<tr>
			<th>
				<i class="fa-regular fa-address-card"></i>
				회원 이름
			</th>
			<td>
				${view.mbName}
			</td>
		</tr>

		<tr>
			<th>
				<i class="fa-solid fa-venus-mars"></i>
				회원 성별
			</th>
			<td>
				${view.mbGender}
			</td>
		</tr>
		
		<tr>
			<th>
				<i class="fa-solid fa-calendar-days"></i>&nbsp;
				회원 생년월일
			</th>
			<td>
				${view.mbBirth}
			</td>
		</tr>		

		<tr>
			<th>
				<i class="fa-solid fa-house-user"></i>
				회원 주소
			</th>
			<td>
				${view.mbAddr}
			</td>
		</tr>
		
		<tr>
			<th>
				<i class="fa-solid fa-phone-volume"></i>
				회원 연락처
			</th>
			<td>
				${view.mbPhone}
			</td>
		</tr>

		<tr>
			<th>
				<i class="fa-solid fa-envelope"></i>
				회원 이메일
			</th>
			<td>
				${view.mbEmail}
			</td>
		</tr>
	
		<c:if test="${loginId == view.mbId || loginId == 'admin'}">
		<tr>
			<th colspan="2">
				<button type="submit" class="btn-theme btn" id="modify">수정</button>
				<button class="btn-theme btn" onclick="deleteID()" >탈퇴</button>
			</th>
		</tr>
		</c:if>
	</table>
	<br/><br/><br/><br/><br/><br/>
            </div>
        </section>
<div id="footer_section" class="footer ty3">
				<%@ include file="../footer.jsp" %>
</div>


</body>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script>
	$('#modify').click(function() {
		location.href = "modifyForm?mbId=${view.mbId}";
	});
	
	function deleteID(){
		let conf = confirm('정말 탈퇴 하시겠습니까?');
		if (conf) {
			location.href = "mDelete?mbId=${view.mbId}";
			alert('삭제했습니다.');
		} else {
			alert('취소했습니다.');
		}
	};
</script>
</html>