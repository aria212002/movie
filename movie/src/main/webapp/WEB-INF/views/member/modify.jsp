<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
<style type="text/css">	
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
                        <span class="text-theme">Modify</span>
                    </h2>
                </div>
 <form action="mModify" method="POST">
		<h4><i class="fa-solid fa-user-group"></i>&nbsp;수정할 정보를 입력해 주세요</h4>
		<table>
			<tr>
				<td>
					<i class="fa-solid fa-user"></i>
					<input type="text" name="mbId" value="${modify.mbId}" class="mvm-in2" readonly/>
				<br/>
			</tr>

			<tr>
				<td>
					<i class="fa-solid fa-lock"></i>
					<input type="password" name="mbPw" id="mbPw" placeholder="비밀번호" class="mvm-in2"/><br />
					<span id="check2"></span>
				</td>
			</tr>

			<tr>
				<td>
					<i class="fa-regular fa-eye"></i>
					<input type="password" id="checkPw" placeholder="비밀번호를 확인해 주세요" class="mvm-in"/><br />
					<span id="check3"></span>
				</td>
			</tr>

			<tr>
				<td>
					<i class="fa-regular fa-address-card"></i>
					<input type="text" name="mbName" placeholder="이름" class="mvm-in3" value="${modify.mbName}" required/>
				</td>
			</tr>
			
			<tr>
				<td>
					<i class="fa-solid fa-venus-mars"></i>
					<input type="radio" name="mbGender" value="남자" checked/>
					<label>
						남자&nbsp;
					</label>
					<input type="radio" name="mbGender" value="여자"/>
					<lable>
						여자&nbsp;
					</lable>
					<input type="radio" name="mbGender" value="선택X"/>
					<lable>
						선택안함
					</lable>
				</td>
			</tr>			

			<tr>
				<td>
					<i class="fa-solid fa-calendar-days"></i>
					<input type="date" name="mbBirth" placeholder="생년월일 8자리" value="${modify.mbBirth}" class="mvm-in2"/>
				</td>
			</tr>
			
			<tr>
				<td>	
					<i class="fa-solid fa-house-user"></i>
					<input type="text" name="addr1" id="sample6_postcode" placeholder="우편번호" class="mvm-inAddr">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="a-btn"><br>
					<input type="text" name="addr2" id="sample6_address" placeholder="주소" class="mvm-inAddr2"><br>
					<input type="text" name="addr3" id="sample6_detailAddress" placeholder="상세주소" class="mvm-inAddr3">
				</td>
			</tr>			

			<tr>
				<td>
					<i class="fa-solid fa-phone-volume"></i>
					<input type="text" name="mbPhone" placeholder="연락처" value="${modify.mbPhone}" class="mvm-in"/>
				</td>
			</tr>
			
			<tr>
				<td>
					<i class="fa-solid fa-envelope"></i>
					<input type="text" name="mbEmail" placeholder="이메일" value="${modify.mbEmail}" class="mvm-in3"/>
				</td>
			</tr>		
		</table>
		<i class="fa-solid fa-arrow-right"></i>&nbsp;
		<button type="submit" class="btn btn-primary">회원수정</button>
		<button type="reset" class="btn btn-primary">다시작성</button>

	</form>
	<br/><br/><br/><br/><br/><br/>
            </div>
        </section>
<div id="footer_section" class="footer ty3">
				<%@ include file="../footer.jsp" %>
</div>


</body>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>		
<script>
	
	$('#mbPw').keyup(function(){
		
		let mPw = $('#mbPw').val();
		let check2 = $('#check2');
	
		let num = mPw.search(/[0-9]/);	
		let eng = mPw.search(/[a-z]/);	
		let spe = mPw.search(/[`~!@#$%^&*|\\\'\":;\/?]/);	
		let spc = mPw.search(/\s/);	
		
		if(mbPw.length < 8 || mbPw.length > 16){
			check2.html("8자리에서 16자리 이내로 입력해주세요!");
			check2.css("color", "red");
			check2.css("margin-left", "35px");
			check2.css("font-size", "20px");
			check2.css("font-weight", "bold");
		} else if(spc != -1 ) {
			check2.html("공백없이 입력해주세요!");
			check2.css("color", "red");
			check2.css("margin-left", "35px");
			check2.css("font-size", "20px");
			check2.css("font-weight", "bold");
		} else if(num == -1 || eng == -1 || spe == -1){
			check2.html("영문, 숫자, 특수문자를 혼합하여 입력해주세요!");
			check2.css("color", "red");
			check2.css("margin-left", "35px");
			check2.css("font-size", "20px");
			check2.css("font-weight", "bold");
		} else {
			check2.html("사용가능한 비밀번호 입니다!");
			check2.css("color", "white");
			check2.css("margin-left", "35px");
			check2.css("font-size", "20px");
			check2.css("font-weight", "bold");
		}
		
	});
	
	$('#checkPw').keyup(function(){
		
		let mbPw = $('#mbPw').val();
		let checkPw = $('#checkPw').val();
		
		let check3 = $('#check3');
		
		if(mbPw==checkPw){
			check3.html("비밀번호가 일치합니다!");
			check3.css("color", "white");
			check3.css("margin-left", "35px");
			check3.css("font-size", "20px");
			check3.css("font-weight", "bold");
		} else {
			check3.html("비밀번호가 불일치합니다!");
			check3.css("color", "red");
			check3.css("margin-left", "35px");
			check3.css("font-size", "20px");
			check3.css("font-weight", "bold");
			
		}
		
	});
	
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                var addr = ''; 

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }	
</script>
</html>