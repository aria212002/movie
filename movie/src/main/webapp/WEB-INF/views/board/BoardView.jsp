<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<link href="<c:url value='/resources/L2.ico'/>" rel="icon" type="image/x-icon">
<style type="text/css">	
td, th{
	padding : 10px;
	font-size : 20px;
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
	<div id="sidebar_section" class="header ty3">
		<%@ include file="../sidebar.jsp"%>
	</div>
	</c:when>
	</c:choose>

<section class="section-text-white position-relative">
            <div class="d-background"  data-parallax="scroll"></div>
            <div class="d-background bg-theme-blacked"></div>
            <div class="mt-auto container position-relative">
                <div class="top-block-head text-uppercase">
                    <h3 class="display-4">게시글
                        <span class="text-theme">상세보기</span>
                    </h3>
    </div>
    <div>
 	<table>
 	<h4>&nbsp;<i class="fa-solid fa-pen-nib"></i></i>&nbsp;${view.bdWriter} 고객님의 게시글</h4><br/>
		<tr>
			<th style="width : 200px;">
				<i class="fa-solid fa-arrow-down-9-1"></i>&nbsp;
				게시글 번호
			</th>
			<td>
				${view.bdNum}
			</td>
		</tr>
		<tr>
			<th>
				<i class="fa-solid fa-user"></i>&nbsp;
				게시글 작성자
			</th>
			<td>
				${view.bdWriter}
			</td>
		</tr>
		<tr>
			<th>
				<i class="fa-solid fa-t"></i>&nbsp;
				게시글 제목
			</th>
			<td>
				${view.bdTitle}
			</td>
		</tr>

		<tr>
			<th>
				<i class="fa-solid fa-file-signature"></i>
				게시글 내용
			</th>
			<td>
				${view.bdContent}
			</td>
		</tr>
		
		<tr>
			<th>
				<i class="fa-solid fa-pen-to-square"></i>&nbsp;
				게시글 작성일
			</th>
			<td>
				${view.bdDate}
			</td>
		</tr>		
	
		<c:if test="${loginId == view.bdWriter || loginId == 'admin'}">
		<tr>
			<th colspan="2">
				<button type="submit" class="btn-theme btn" id="modify">게시글 수정</button>
				<button type="submit" class="btn-theme btn" id="delete">게시글 삭제</button>
			</th>
		</tr>
		</c:if>
	</table>
	</div>
	<br/>
	<br/>
	<br/>
	<div class="section-line">
		<div class="section-head">
			<h2 class="section-title text-uppercase">댓글 작성하기</h2>
		</div>
		<div>
			<div id="cmtWrite">
			<div class='col-12'>
			<div>
			<!-- 댓글 작성 영역 -->
			<input type="hidden" value="${view.bdNum}" id="cmbNum"/>
			<h5>
				<i class="fa-regular fa-comment"></i>
				작성자 : ${loginId}
				<input type="hidden" value="${loginId}" id="cmWriter"/>
			</h5>
			<textarea rows="3" cols="30" id="cmContent" onfocus="checkLogin()" placeholder="내용을 입력해주세요" style="width : 100%; height : 50px; border-radius : 7px;"></textarea><br/>
			</div>
			</div>
			<div class="col-12">
			<c:if test="${loginId != null}">
				<button type="submit" id="writeBtn" class="btn-theme btn">댓글 입력</button>
			</c:if>
			</div>
			</div>
		</div>
	</div>	
	<br/>
	<br/>
	<br/>
	<div class="section-line">
		<div class="section-head">
			<h2 class="section-title text-uppercase">댓글</h2>
		</div>
		<div id="cmtArea">
			<!-- 댓글 목록 가져올 영역 -->
		</div>
	</div>
   </div>
   <br/><br/><br/><br/><br/>
 </section>
<div id="footer_section" class="footer ty3">
				<%@ include file="../footer.jsp" %>
</div>

</body>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script>
	$('#modify').click(function() {
		location.href = "bmForm?bdNum=${view.bdNum}";
	});
	
	
	$('#delete').click(function(){
		let conf = confirm('정말 삭제 하시겠습니까?');
		
		if(conf){
			console.log('${view.bdNum}');
			location.href="bdDelete?bdNum=${view.bdNum}";
			alert('삭제했습니다.')
		} else {
			alert('취소했습니다.')
		}
	});
	
	function checkLogin(){
		
		if(${loginId == null}){
			$('#cmContent').blur();
			alert('로그인 후 사용하세요');
			location.href="login";
		}
	}
	
	// ajax로 댓글 불러오기
	$.ajax({
		type : "POST",
		url : "cmList",
		data : {
			"cmbNum" : ${view.bdNum}
		},
		dataType : "json",
		success : function(list){
			console.log(list);
			cmtList(list);
		},
		error :  function(){
			alert("댓글 불러오기 통신 실패");
		}
		
	});
	
	// 댓글 입력(writeBtn) 버튼을 클릭했을 경우
	$('#writeBtn').click(function(){
		let cmWriter = $('#cmWriter').val();	// 작성자
		let cmContent = $('#cmContent').val();	// 내용
		let cmbNum = $('#cmbNum').val();		// 게시글 번호(댓글 번호 아님)
				
		$.ajax({
			type : "POST",
			url : "cmWrite",
			data : {
				"cmbNum" : cmbNum,
				"cmContent" : cmContent,
				"cmWriter" : cmWriter
			},
			dataType : "json",
			success : function(list){
				cmtList(list);
				$('#cmContent').val("");
			},
			error : function(){
				alert('댓글 작성 통신 실패!');
			}
		});
	});
	
	// 댓글 목록
	function cmtList(list){
		console.log("cmtList(list) 실행!");
		console.log("list : " + list);
		
		if(list.length>0){
		let output = "";
		
		output += "<table>";
		output += "<tr>";
		output += "<th style='width : 650px;'><i class='fa-solid fa-comment'></i>&nbsp;내용</th>";
		output += "<th><i class='fa-solid fa-pen'></i>&nbsp;작성자</th>";
		output += "<th><i class='fa-solid fa-calendar-days'></i>&nbsp;작성일</th>";
		output += "<th><i class='fa-solid fa-eraser'></i>&nbsp;수정/삭제</th>";
		output += "</tr>";
		
		for(let i in list){
			let cNum = list[i].cmNum;
			
			output += "<tr id='cmId" + cNum +"'>";
			output += "<td>" + list[i].cmContent+ "</td>";
			output += "<td>" + list[i].cmWriter + "</td>";
			output += "<td>" + list[i].cmDate + "</td>";
			
			if('${loginId}' == list[i].cmWriter || '${loginId}' == 'admin'){
				output += "<td><button onclick=\"cModiForm('"+ list[i].cmNum + "','" + list[i].cmContent + "')\" class='btn-theme btn'>수정</button><button onclick='cmDelete("+ list[i].cmNum+")' class='btn-theme btn'>삭제</button></td>";
			} else {
				output += "<td></td>";
			}			
			output += "</tr>";
		}
		output += "</table>";
		
		console.log(output);
		$('#cmtArea').html(output);
		}
	}
	
	// 댓글 수정
	function cModiForm(cmNum, cmContent) {

		console.log(cmNum);
		console.log(cmContent);
	
		let output = "";
		
		output += "<div class='row form-grid'>";
		output += "<div class='col-12'>";
		output += "<div class='input-view-flat input-group'>";
		
		output += "<div style='width : 100%;'>";
		output += "<input type='hidden' value='" + cmNum + "' id='cmNum'/>";
		output += "<input type='hidden' value='${view.bdNum}' id='cmbNum'/>";
		output += "<input type='hidden' value='${loginId}' id='cmWriter'/>";
		output += "<textarea class='form-control' id='mdContent' style='border-radius: 7px;'>"
				  + cmContent + "</textarea>";
		output += "</div>";
		
		output += "<div><br/>";
		output += "<button class='btn btn-theme' onclick='cmModify()'>수정</button>";
		output += "</div>";
		
		output += "</div>";
		output += "</div>";
		output += "</div>";
		
		$('#cmId' + cmNum).replaceWith(output);
		$('#mdContent').focus();
	};
	
	function cmModify(){
		
		let cmNum = $('#cmNum').val();
		let cmContent = $('#mdContent').val();
		let cmbNum = $('#cmbNum').val();
		
		$.ajax({
			type : "POST",
			url : "cmModify",
			data : {
				"cmNum" : cmNum,
				"cmContent" : cmContent
			},
			dataType : "json",
			success : function(list){
				location.href = "bdView?bdNum=" + cmbNum;
				cmtList(list);
			},
			error : function(){
				alert('댓글 수정 통신 실패!');
			}
		});
	}
	
	// 댓글 삭제
	function cmDelete(cmNum){
		// alert('삭제 댓글 번호 : ' + cNum);
		let conf = confirm('삭제하시겠습니까?');
		let cmbNum = ${view.bdNum}
		
		if(conf){
			$.ajax({
				type : "POST",
				url : "cmDelete",
				data : {
					"cmNum" : cmNum,
					"cmbNum" : cmbNum
				},
				dataType : "json",
				success : function(list){
					cmtList(list);;
					alert('댓글을 삭제했습니다.');
				},
				error : function(){
					alert('댓글 삭제 통신 실패!');
				}
			});
		} else {
			alert('취소했습니다.');
		}
	}
</script>
</html>