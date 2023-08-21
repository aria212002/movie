<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="<c:url value='/resources/L2.ico'/>" rel="icon" type="image/x-icon">
<link rel="stylesheet" href="./resources/css/add.css"/>
<script src="https://kit.fontawesome.com/121d217c4e.js" crossorigin="anonymous"></script>
</head>
<style>
.ph-btn{
	weight : 60px;
	margin-top: 5px;
	font-weight: bold;
	border-radius: 7px;
}
#mbPhone2{
	margin-left: 30px;
}
</style>

<body>
<div id="header_section" class="header ty3">
				<%@ include file="../header.jsp" %>
</div>

<section class="section-text-white position-relative">
            <div class="d-background"  data-parallax="scroll"></div>
            <div class="d-background bg-theme-blacked"></div>
            <div class="mt-auto container position-relative">
                <div class="top-block-head text-uppercase">
                    <h2 class="display-4">Member
                        <span class="text-theme">Join</span>
                    </h2>
                </div>
        <form action="mJoin" method="POST">
		<table>
			<h4><i class="fa-solid fa-user-group"></i>&nbsp;회원정보를 입력해 주세요</h4>
			<tr>
				<td class="mvm-join">
					<i class="fa-solid fa-user"></i>
					<input type="text" name="mbId" id="mbId" placeholder="아이디" class="mvm-in2" required/><br/>
					<span id="check1"></span>
				</td>
			</tr>

			<tr>
				<td>
					<i class="fa-solid fa-lock"></i>
					<input type="password" name="mbPw" id="mbPw" placeholder="비밀번호" class="mvm-in2" required/><br />
					<span id="check2"></span>
				</td>
			</tr>

			<tr>
				<td>
					<i class="fa-regular fa-eye"></i>
					<input type="password" id="checkPw" placeholder="비밀번호를 확인해 주세요" class="mvm-in" required/><br />
					<span id="check3"></span>
				</td>
			</tr>

			<tr>
				<td>
					<i class="fa-regular fa-address-card"></i>
					<input type="text" name="mbName" placeholder="이름" class="mvm-in3" required/>
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
					<input type="date" name="mbBirth" placeholder="생년월일 8자리" class="mvm-in2"/>
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
					<input id="mbPhone" type="text" name="mbPhone" placeholder="연락처" class="mvm-in"/><br/>
					<input id="phoneChk" type="button" class="doubleChk a-btn" value="인증번호 보내기"/><br/>
					<input id="mbPhone2" type="text" name="mbPhone2" placeholder="인증번호 입력" required/>
					<input id="phoneChk2" type="button" class="doubleChk ph-btn" value="본인인증"/><br/>
					<span class="successPhoneChk" style="margin-left: 30px;">휴대폰 번호 입력 후 인증번호 보내기를 해주십시오.</span>
					<input type="hidden" id="phoneDoubleChk"/>
				</td>
			</tr>
			
			<tr>
				<td>
					<i class="fa-solid fa-envelope"></i>
					<input type="text" name="mbEmail" placeholder="이메일" class="mvm-in3"/>
				</td>
			</tr>		
		</table>
		<i class="fa-solid fa-arrow-right"></i>&nbsp;
		<input type="submit" id="join" class="btn-theme btn" value="회원가입">
		</form>
	<br/><br/><br/><br/><br/><br/><br/>
 </div>
 </section>

<div id="footer_section" class="footer ty3">
				<%@ include file="../footer.jsp" %>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>		
<script>
let check1 = $('#check1');
let check2 = $('#check2');
let check3 = $('#check3');

$("#phoneDoubleChk").val("false");
	$('#mbId').keyup(function(){
		
		let mbId = $('#mbId').val();


		$.ajax({
			type : "GET",
			url : "idCheck",
			data : 
			{ 
				"mbId" : mbId 
			},
			dataType : "text",
			success : function(result){
				if(result=="OK"){
					check1.html("사용 가능한 아이디입니다!");
					check1.css("color", "white");
					check1.css("margin-left", "35px");
					check1.css("font-size", "20px");
					check1.css("font-weight", "bold");
				} else {
					check1.html("사용 불가능한 아이디입니다!");
					check1.css("color", "red");
					check1.css("margin-left", "35px")
					check1.css("font-size", "20px");
					check1.css("font-weight", "bold");
				}
			},
			error : function(){
				alert("idCheck함수 통신실패!");
			}  
		});
	});
	
	$('#mbPw').keyup(function(){
		
		let mPw = $('#mbPw').val();


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
	
	// 휴대폰 인증 번호
	$("#phoneChk").click(function(){
		alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
		var mbPhone = $("#mbPhone").val();
		$.ajax({
	        type:"GET",
	        url:"phoneCheck?mbPhone=" + mbPhone,
	        cache : false,
	        success:function(data){
	        	if(data == "error"){
	        		alert("휴대폰 번호가 올바르지 않습니다.")
					$(".successPhoneChk").html("유효한 번호를 입력해주세요.");
					$(".successPhoneChk").css("color","red");
	        		$(".successPhoneChk").css("font-weight", "bold");
					$("#mbPhone").attr("autofocus",true);
	        	}else{	        		
	        		$("#mbPhone2").attr("disabled",false);
	        		$("#phoneChk2").css("display","inline-block");
	        		$(".successPhoneChk").html("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
	        		$(".successPhoneChk").css("color","green");
	        		$(".successPhoneChk").css("font-weight", "bold");
					$("#mbPhone").attr("autofocus",true);
	        		$("#mbPhone").attr("readonly",true);
	        		code2 = data;
	        	}
	        }
	    });
	});
	
	//휴대폰 인증번호 대조
	$("#phoneChk2").click(function(){
		if($("#mbPhone2").val() == code2){
			$(".successPhoneChk").html("인증번호가 일치합니다.");
			$(".successPhoneChk").css("color","green");
    		$(".successPhoneChk").css("font-weight", "bold");
			$("#mbPhone").attr("autofocus",true);
			$("#phoneDoubleChk").val("true");
			$("#mbPhone2").attr("disabled",true);
		}else{
			$(".successPhoneChk").html("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".successPhoneChk").css("color","red");
    		$(".successPhoneChk").css("font-weight", "bold");
			$("#mbPhone").attr("autofocus",true);
			$("#phoneDoubleChk").val("false");
			$(this).attr("autofocus",true);
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
	
	$(document).ready(function() {
		  $("#join").click(function() {

		    var mbPw = $('#mbPw').val();
		    var checkPw = $('#checkPw').val();
		    var phoneDoubleChk = $("#phoneDoubleChk").val();
		    console.log(phoneDoubleChk);
		    if (phoneDoubleChk == "false") {
		    	alert('인증을 완료해야 합니다');
			    return false;
		    }
		    if(check1.html()!="사용 가능한 아이디입니다!"){
		     	alert('사용 불가능한 아이디입니다!');
		      	return false;
		    }
		    if(check2.html()!="사용가능한 비밀번호 입니다!"){
		     	alert('비밀번호가 형식에 맞지 않습니다.');
		      	return false;
		    }

		    if (check3.html()!="비밀번호가 일치합니다!") {
		     	alert('비밀번호가 일치하지 않습니다.');
		      	return false;
		    }
		    

		    $("#joinForm").submit();
		  });
		});
</script>
</html>