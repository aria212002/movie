<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link href="<c:url value='/resources/L2.ico'/>" rel="icon" type="image/x-icon">
<style type="text/css">	
.findId {
	margin-bottom: 10px;
	border-radius: 7px;
	width: 40%;
}
.findId2 {
	margin-left: 3px;
	margin-bottom: 5px;
	border-radius: 7px;
	width: 40%;
}
.p-btn{
	margin-left: 30px;
	font-weight: bold;
	border-radius: 7px;
}
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
				<form id="searchForm" style="padding-top: 100px">
			        <fieldset>
			            <legend><i class="fa-solid fa-magnifying-glass"></i>&nbsp;아이디 찾기</legend>
			            <i class="fa-regular fa-address-card"></i>
			            <input type="text" id="mbName" placeholder="이름을 입력해주세요" class="findId" required/><br/>
			            <i class="fa-solid fa-phone-volume"></i>
			            <input type="text" id="mbPhone" placeholder="전화번호를 입력해주세요" class="findId2"/><br/>
			            <input id="phoneChk" type="button" class="doubleChk p-btn" value="인증번호 보내기"/><br/>
						<input id="mbPhone2" type="text" name="mbPhone2" placeholder="인증번호 입력" required/>
						<input id="phoneChk2" type="button" class="doubleChk ph-btn" value="본인인증"/><br/>
						<span class="successPhoneChk" style="margin-left: 30px;">휴대폰 번호 입력 후 인증번호 보내기를 해주십시오.</span><br/>
						<input type="hidden" id="phoneDoubleChk"/><br/>
			            <i class="fa-solid fa-arrow-right"></i>&nbsp;&nbsp;
			            <button type="submit" class="btn-theme btn">아이디 찾기</button>
			            <br/><br/>
			            <h5 id="result"></h5>
			            <br/><br/><br/><br/>
			        </fieldset>
			    </form>
            </div>
</section>
<div id="footer_section" class="footer ty3">
				<%@ include file="../footer.jsp" %>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>		
<script>
var phoneDoubleChk=$("#phoneDoubleChk").val('false');
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
            $('#searchForm').submit(function(event) {
                event.preventDefault();
                var mbName = $('#mbName').val();
                var mbPhone = $('#mbPhone').val();
                phoneDoubleChk = $("#phoneDoubleChk").val();
                
                if (phoneDoubleChk == "false") {
    		    	alert('인증을 완료해야 합니다');
    			    return false;
    		    } else {
    		    	$.ajax({
                        url: 'mFindId',
                        type: 'POST',
                        data: {
                            mbName: mbName,
                            mbPhone: mbPhone
                        },
                        dataType : "text",
                        success: function(data) {
                        	if(data!='NO'){
                            $('#result').text('당신의 아이디는 ' + data + '입니다');
                        	}else{
                        		alert("해당하는 아이디가 존재하지 않습니다")
                        	}
                        },
                        error: function() {
                        	alert("서버 통신 실패");
                        }
                    });
    		    }

            });
        });
</script>
</body>
</html>