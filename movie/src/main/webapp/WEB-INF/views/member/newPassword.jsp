<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link href="<c:url value='/resources/L2.ico'/>" rel="icon"
	type="image/x-icon">
<style type="text/css">
.changePassword {
	margin-left: 5px;
	border-radius: 7px;
	width: 40%;
}

.changePassword2 {
	margin-left: 5px;
	border-radius: 7px;
	width: 40%;
}

.changePassword3 {
	border-radius: 7px;
	width: 40%;
}

.ph-check {
	margin-left: 3px;
	margin-bottom: 5px;
	border-radius: 7px;
	width: 40%;
}

.p-btn {
	margin-left: 30px;
	font-weight: bold;
	border-radius: 7px;
}

.ph-btn {
	weight: 60px;
	margin-top: 5px;
	font-weight: bold;
	border-radius: 7px;
}

#mbPhone2 {
	margin-left: 30px;
}
</style>
<link rel="stylesheet" href="./resources/css/add.css" />
<script src="https://kit.fontawesome.com/121d217c4e.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="header_section" class="header ty3">
		<%@ include file="../header.jsp"%>
	</div>
	<section class="section-text-white position-relative">
		<div class="d-background" data-parallax="scroll"></div>
		<div class="d-background bg-theme-blacked"></div>
		<div class="mt-auto container position-relative">
			<form id="changePassword" style="padding-top: 50px">
				<fieldset>
					<legend>
						<i class="fa-solid fa-rotate"></i>&nbsp;비밀번호 변경하기
					</legend>
					<i class="fa-solid fa-user"></i> <input type="text" id="mbId"
						placeholder="아이디를 입력해 주세요" class="changePassword" required /><br />
					<span id="check1"></span><br /> <i class="fa-solid fa-lock"></i> <input
						type="password" id="mbPw" placeholder="새로운 비밀번호를 입력해주세요"
						class="changePassword2" required /><br /> <span id="check2"></span><br />
					<i class="fa-regular fa-eye"></i> <input type="password"
						id="checkPw" placeholder="비밀번호를 확인해 주세요" class="changePassword3"
						required /><br /> <span id="check3"></span><br /> <i
						class="fa-solid fa-phone-volume"></i> <input type="text"
						id="mbPhone" placeholder="전화번호를 입력해주세요" class="ph-check" /><br />
					<input id="phoneChk" type="button" class="doubleChk p-btn"
						value="인증번호 보내기" /><br /> <input id="mbPhone2" type="text"
						name="mbPhone2" placeholder="인증번호 입력" required /> <input
						id="phoneChk2" type="button" class="doubleChk ph-btn" value="본인인증" /><br />
					<span class="successPhoneChk" style="margin-left: 30px;">휴대폰
						번호 입력 후 인증번호 보내기를 해주십시오.</span><br /> <input type="hidden"
						id="phoneDoubleChk" /><br /> <i class="fa-solid fa-arrow-right"></i>&nbsp;&nbsp;
					<button type="submit" class="btn-theme btn">변경하기</button>
					<br /> <br /> <br /> <br />
				</fieldset>
			</form>
		</div>
	</section>
	<div id="footer_section" class="footer ty3">
		<%@ include file="../footer.jsp"%>
	</div>

	<script src="https://code.jquery.com/jquery-3.7.0.js"
		integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
		crossorigin="anonymous"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	let check1 = $('#check1');
	let check2 = $('#check2');
	let check3 = $('#check3');
var phoneDoubleChk = $("#phoneDoubleChk").val('false');
	$('#mbId').keyup(function(){
		
		let mbId = $('#mbId').val();

	
		$.ajax({
			type : "GET",
			url : "idCheck2",
			data : 
			{ 
				"mbId" : mbId 
			},
			dataType : "text",
			success : function(result){
				if(result=="OK"){
					check1.html("존재하는 아이디 입니다!");
					check1.css("color", "white");
					check1.css("margin-left", "35px");
					check1.css("font-weight", "bold");
				} else {
					check1.html("존재하지 않는 아이디 입니다!");
					check1.css("color", "red");
					check1.css("margin-left", "35px")
					check1.css("font-weight", "bold");
				}
			},
			error : function(){
				alert("idCheck2함수 통신실패!");
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
			check2.css("font-weight", "bold");
		} else if(spc != -1 ) {
			check2.html("공백없이 입력해주세요!");
			check2.css("color", "red");
			check2.css("margin-left", "35px");
			check2.css("font-weight", "bold");
		} else if(num == -1 || eng == -1 || spe == -1){
			check2.html("영문, 숫자, 특수문자를 혼합하여 입력해주세요!");
			check2.css("color", "red");
			check2.css("margin-left", "35px");
			check2.css("font-weight", "bold");
		} else {
			check2.html("사용가능한 비밀번호 입니다!");
			check2.css("color", "white");
			check2.css("margin-left", "35px");
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
			check3.css("font-weight", "bold");
		} else {
			check3.html("비밀번호가 불일치합니다!");
			check3.css("color", "red");
			check3.css("margin-left", "35px");
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

	$(document).ready(function() {
		$('#changePassword').submit(function(event) {
		    event.preventDefault();
		    var mbId = $('#mbId').val();
		    var mbPw = $('#mbPw').val();
		    phoneDoubleChk = $("#phoneDoubleChk").val();	    
		    if (phoneDoubleChk == "false") {
		    	alert('인증을 완료해야 합니다');
			    return false;
		    } else {
		    if(check1.html()=="존재하는 아이디 입니다!"){
		    	if(check3.html()=="비밀번호가 일치합니다!"&&check2.html()=="사용가능한 비밀번호 입니다!"){
		    	$.ajax({
			        url: 'mChangePassword',
			        type: 'POST',
			        data: {
			            mbId: mbId,
			            mbPw: mbPw
			        },
			        success: function() {
			            alert('비밀번호를 변경하였습니다.');
			            $('#changePassword')[0].reset();
			            location.href="login";
			        },
			        error: function() {
			            alert('비밀번호 변경에 실패하셨습니다.');
			        }
			    });
		    	}
		    	else{
			    	alert("비밀번호가 일치하지 않거나 형식에 위배됩니다");
			    	}
		    }else{
		    	alert("아이디가 존재하지 않습니다");
		    	}
		    }
		    	
		    
		   
		});
	});
</script>
</body>
</html>