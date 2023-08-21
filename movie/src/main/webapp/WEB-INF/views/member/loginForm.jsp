<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link href="<c:url value='/resources/L2.ico'/>" rel="icon" type="image/x-icon">
<link rel="stylesheet" href="./resources/css/add.css"/>
<script src="https://kit.fontawesome.com/121d217c4e.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="header_section" class="header ty3">
				<%@ include file="../header.jsp" %>
</div>
<section class="section-text-white position-relative">
            <div class="d-background"  data-parallax="scroll"></div>
            <div class="d-background bg-theme-blacked"></div>
            <div class="mt-auto container position-relative">
                <div class="top-block-head text-uppercase">
                    <h2 class="display-4">log
                        <span class="text-theme">in</span>
                    </h2>
                </div>
                <form action="mLogin" method="post">
					<fieldset>
						<legend><i class="fa-solid fa-right-to-bracket"></i>&nbsp;로그인</legend>
						<i class="fa-solid fa-user"></i>
						<input type="text" name="mbId" placeholder="아이디를 입력해주세요" class="mvm-login"/><br/>
						<i class="fa-solid fa-lock"></i>
						<input type="password" name="mbPw" placeholder="비밀번호를 입력해주세요" class="mvm-login"/><br/><br/>
						<i class="fa-solid fa-arrow-right"></i>&nbsp;&nbsp;
						<button type="submit" value="로그인" class="btn-theme btn" onclick="checkLogin()">로그인</button>
						<br/><br/><br/><br/>
						<a href = "findForm">아이디</a> / <a href = "changePW" >비밀번호</a>를 잊어버렸어요!<br/>
						<br/><br/><br/><br/><br/>
					</fieldset>
				</form>
            </div>
        </section>
<div id="footer_section" class="footer ty3">
				<%@ include file="../footer.jsp" %>
</div>
</body>
<script>
	function checkLogin() {
		let mbId = $('#mbId').val();
	    let mbPw = $('#mbPw').val();
	
	    if (mbId === "") {
	        alert("아이디를 입력하세요");
	        return false; 
	    } else if (mbPw === "") {
	        alert("비밀번호를 입력하세요");
	        return false;
	    }
	
	}

</script>
</html>
