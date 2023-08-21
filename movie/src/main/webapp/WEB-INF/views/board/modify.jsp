<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<link rel="stylesheet" href="./resources/css/add.css"/>
<script src="https://kit.fontawesome.com/121d217c4e.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="header_section" class="header ty3">
				<%@ include file="../header.jsp" %>
</div>

<div id="sidebar_section" class="header ty3">
		<%@ include file="../sidebar.jsp"%>
</div>

<section class="section-text-white position-relative">
            <div class="d-background" data-parallax="scroll"></div>
            <div class="d-background bg-theme-blacked"></div>
            <div class="mt-auto container position-relative">
                <div class="top-block-head text-uppercase">
                    <h2 class="display-4">Modify
                        <span class="text-theme">Post</span>
                    </h2>
                </div>
    <form action="bdModify" method="POST">
    <input type="hidden" name="bdNum" value="${modify.bdNum}" /> 
	<input type="hidden" name="bdWriter" value="${modify.bdWriter}"/>
	<table>
		<h4><i class="fa-solid fa-pen-nib"></i>&nbsp;수정할 게시글을 작성해 주세요</h4>
		<tr>
			<th>
				<i class="fa-solid fa-t"></i>
			</th>
			<td>
				<input type="text" name="bdTitle" placeholder="제목을 입력해주세요" class="bd-in" style="width : 500px;"/>
			</td>
		</tr>
		
		<tr>
			<th>
				<i class="fa-solid fa-file-signature"></i>
			</th>
			<td>
				<textarea row="20" cols="40" name="bdContent" placeholder="내용을 입력해주세요" class="bd-in" style="width : 500px; height : 500px;"></textarea>
			</td>
		</tr>
	</table>
	<i class="fa-solid fa-arrow-right"></i>&nbsp;
	<button type="submit" class="btn-theme btn bd-btn">게시글 수정</button>	
	</form>
	<br/><br/><br/>
 </div>
 </section>

<div id="footer_section" class="footer ty3">
				<%@ include file="../footer.jsp" %>
</div>
</body>

</html>