<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 좌석</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />
<link rel="stylesheet" href="./resources/css/style.css" />
<style>
.container {
	width: 100%;
	/*  height: 600px; */
}

.container>div {
	display: inline-block;
}

.seat-section {
	width: 70%;
	float: left;
	border: 1px solid white;
	background-color: #f7f6ef;
}

.info-section {
	border: 2px solid black;
	width: 25%;
	float: right;
	margin-left: 20px;
	padding: 15px 15px 15px 15px;
	background-color: #323232;
}

.seat-column {
	height: 40px;
	width: 50px;
	background-color: #392f31;
	outline: solid 1px;
	display: inline-block;
	margin-top: 14px;
	margin-bottom: 9px;
	font-size: 12px;
}

.seat-column:hover {
	cursor: pointer;
}

.seat-area {
	text-align: center;
	padding-bottom: 15px;
	margin-top: 10px;
}
/* 선택 */
.selected {
	background-color: #8d192b;
}
/* 선택 */
.selected-ex {
	background-color: #8d192b;
}
/* 예매완료 */
.reserved {
	background-color: #a0a0a0;
	pointer-events: none;
}
/* 선택가능 */
.remain {
	background-color: #392f31;
}

.seat-column:nth-of-type(3) {
	margin-left: 40px;
}

.seat-column:nth-of-type(9) {
	margin-left: 40px;
}

.people-ul {
	display: flex;
	position: relative;
	color: black;
}

.people-ul>li {
	text-align: center;
	display: inline-block;
	width: 60px;
	height: 30px;
	outline: solid 1px;
	margin-top: 10px;
	border: 2px solid black;
}

.people {
	margin-top: 3%;
	margin-left: 10%;
	position : releav
}

.people-child {
	margin-bottom: 30px;
	padding-bottom: 20px;
}

.normal-count {
	border: white;
	background-color: black;
	color: white;
	float: right;
}

.child-count {
	border: white;
	background-color: black;
	color: white;
	float: right;
}

.screen {
	border: 1px solid white;
	border-collapse: collapse;
	margin-left: 16%;
	width: 70%;
	text-align: center;
	padding-bottom: 30px;
	background-color: gray;
	color: black;
	margin-bottom: 15px;
}

.pn {
	float: left;
	margin-top: 12px;
}

.pn2 {
	float: left;
	margin-top: 14px;
}

.pay-area {
	float: right;
	color : black;
	margin-top : 10px;
	margin-right : 100px;
}
</style>

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
			
			data-parallax="scroll"></div>
		<div class="d-background bg-theme-blacked"></div>
		<div class="mt-auto container position-relative">
			<div class="top-block-head text-uppercase">
				<h2 class="display-4">
					좌석 <span class="text-theme">선택</span>
				</h2>
			</div>
			<div class="container" style="padding-top: 30px;">
				<!--  좌석 영역 -->
				<div class="seat-section">
					<!--  좌석 수 선택 영역 -->
					<div class="people">
					<div class="pay-area">
							<p class="selected-people"></p>
							<div class="selected-price">
								<p class="price-title">최종결제금액</p>
								<div class="final-price"></div>
							</div>
						</div>
						<div class="people-normal">
							<span class="pn" style="color: black;">일반&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<ul class="people-ul people-ul-normal">
								<li class="people-normal-count">0</li>
								<li class="people-normal-count">1</li>
								<li class="people-normal-count">2</li>
								<li class="people-normal-count">3</li>
								<li class="people-normal-count">4</li>
							</ul>
						</div>
						<div class="people-child">
							<span class="pn2" style="color: black;">청소년&nbsp;&nbsp;</span>
							<ul class="people-ul people-ul-child">
								<li class="people-child-count">0</li>
								<li class="people-child-count">1</li>
								<li class="people-child-count">2</li>
								<li class="people-child-count">3</li>
								<li class="people-child-count">4</li>
							</ul>
							
						</div>
						
					</div>

					<!--  좌석 표시 영역 -->
					<div class="seat-area">
						<table class="screen">
							<tr>
								<th>SCREEN</th>
							</tr>
						</table>
						<br />
					</div>

				</div>
				<!--  정보 영역 -->
				<div class="info-section">
					<!--  영화 정보 영역 -->
					<div class="title-area">
						<div class="movie-poster">
							<img style="width: 150px; height: 200px; margin-bottom: 15px"
								src="${result.miPoster}" alt="" />
						</div>
						<p class="movie-title">영화이름 &nbsp;&nbsp; : &nbsp;
							${result.msName}</p>
						<p class="movie-kind">스크린 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							: &nbsp; ${result.mtKind}</p>
						<p class="movie-age">관람가 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							: &nbsp; ${result.miAge}</p>
					</div>
					<!--  영화 상영 정보 영역 -->
					<div class="info-area">
						<p class="movie-theater">상영관
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : &nbsp; ${result.msTheater}</p>
						<p class="movie-date">상영날짜 &nbsp;&nbsp; : &nbsp;
							${result.msDate}</p>
						<p class="movie-time">상영시간 &nbsp;&nbsp; : &nbsp;
							${result.msStartTime} ~ ${result.msEndTime}</p>
					</div>
					<!--  좌석 정보 영역 -->
					<div class="selected-seat-area">
						<div class="seat-info">
							<ul class="seat-info-list">
								<li>
									<div class="seat-column selected-ex"></div> <em>선택</em>
								</li>
								<li>
									<div class="seat-column reserved"></div> <em>예매완료</em>
								</li>
								<li>
									<div class="seat-column remain"></div> <em>선택가능</em>
								</li>
							</ul>
						</div>
						<!--  선택 좌석 정보 영역 -->
						<p>좌석번호</p>
						<div class="selected-seat"></div>
					</div>
					<!--  결제 정보 영역 -->

					<div class="button-area">
						<input type="button" value="예매" onclick="reserve()"> <input
							type="button" value="취소" onclick="location.href='reservePage'">

					</div>
				</div>
			</div>
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
		</div>
	</section>





</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
//  좌석 생성용 변수 
let seatWrapper = "";
let seat = "";
let seatCount = ${result.mtSeats};
let seatColumn = 10;
let seatRow = seatCount / seatColumn;

// 관람 등급 체크용 변수
let miAge='${result.miAge}'


// 생성된 좌석이 들어갈 태그
let seatArea = document.querySelector(".seat-area");
// 선택인원 표시할 태그
let selectedPeople= document.querySelector(".selected-people");
// 최종금액 표시할 태그
let finalPrice= document.querySelector(".final-price");
// 선택된 좌석 표시할 태그
let seats=document.querySelector(".selected-seat");

// 결제금액 계산용 변수
let commonPrice=${result.mtCommon};
let childPrice=${result.mtChild};
let selectedPeopleValue=0;
let finalPriceValue=0;
let normalCount = 0;
let childCount = 0;

// 선택된 좌석 배열 타입 변수 DB 저장시 JSON.stringify(selectSeats) 로 타입 변환 필요
let selectSeats;
// 선택된 좌석 리셋용 변수
let selected = "";
// 선택된 좌석 배열 표시용 변수
let selectSeatsValue="";

// 인원 선택용 태그 변수
let normal = document.querySelectorAll(".people-normal-count");
let child = document.querySelectorAll(".people-child-count");


// 일반 인원 선택용 li에 이벤트 생성
for (let i = 0; i < normal.length; i++) {
    normal[i].addEventListener("click", function (e) {
    	// 클릭시 나머지 li 태그에 클래스 삭제하고 해당 태그에만 클래스 추가
        if (!this.classList.contains("normal-count")) {
            normal.forEach((li) => {
                li.classList.remove("normal-count");
            });
            this.classList.add("normal-count");
            // 선택 좌석 초기화
            // 선택 좌석 정보 삭제
            seats.innerHTML="";
            // 선택된 좌석들 선택 초기화
            selected = document.querySelectorAll(".selected");
            for(j=0;j<selected.length;j++){
            	selected[j].classList.remove("selected");
            }
        }
        // 선택 인원에 따른 가격정보
        normalCount = document.querySelector(".normal-count").innerHTML;
        selectedPeopleValue = Number(normalCount) + Number(childCount);
        finalPriceValue=Number(normalCount)*commonPrice+Number(childCount)*childPrice
        selectedPeople.innerHTML="일반 : "+normalCount+" 명, 청소년 : " + childCount+"명";
        finalPrice.innerHTML=finalPriceValue+"원";
    });
}
// 청소년 인원 선택용 li에 이벤트 생성
if(miAge!='청소년 관람불가'){
	for (let i = 0; i < child.length; i++) {
    child[i].addEventListener("click", function (e) {
    	// 클릭시 나머지 li 태그에 클래스 삭제하고 해당 태그에만 클래스 추가
        if (!this.classList.contains("child-count")) {
            child.forEach((li) => {
                li.classList.remove("child-count");
            });
            this.classList.add("child-count");
       		// 선택 좌석 초기화
            // 선택 좌석 정보 삭제
            seats.innerHTML="";
            // 선택된 좌석들 선택 초기화
            selected = document.querySelectorAll(".selected");
            for(j=0;j<selected.length;j++){
            	selected[j].classList.remove("selected");
            }
        }
        // 선택 인원에 따른 가격정보
        childCount = document.querySelector(".child-count").innerHTML;
        selectedPeopleValue = Number(normalCount) + Number(childCount);
        finalPriceValue=Number(normalCount)*commonPrice+Number(childCount)*childPrice
        selectedPeople.innerHTML="어른 : "+normalCount+" 명, 청소년 : " + childCount+"명";
        finalPrice.innerHTML=finalPriceValue+"원";
    });
	}
}else{
	// 청소년 관람불가일 경우 청소년 인원 선택창 숨김
	document.querySelector(".people-child").style.display ='none';
}

// 좌석 생성
for (let i = 0; i < seatRow; i++) {
    seatWrapper = document.createElement("div");
    seatWrapper.classList = "seat-row";
    seatArea.append(seatWrapper);
    for (let j = 0; j < seatColumn; j++) {
        seat = document.createElement("div");
        seat.classList = "seat-column";
        // 좌석번호용 알파벳 대문자 생성변수
        let rowNumber = String.fromCharCode(i + 65);
        // 알파벳과 숫자 조합으로 좌석번호 생성
        let seatNumber = rowNumber + ("00" + (j + 1)).slice(-2);
        // 생성된 좌석에 좌석번호 부여
        seat.innerHTML = seatNumber;
        seatWrapper.append(seat);
        // 생성된 좌석에 이벤트 생성
        seat.addEventListener("click", function (e) {
        	// 이미 선택된 좌석 선택시
            if (this.classList.contains("selected")) {
                this.classList.remove("selected");
                // 선택됐던 좌석정보 표기 삭제
                selectSeatsValue="";
                // 선택 좌석용 새로운 배열 생성
                selectSeats=new Array();
                selected = document.querySelectorAll(".selected");
                // 선택된 좌석수만큼 for문 수행해서 배열에 값 입력
                for(let k=0;k<selected.length;k++){
                	selectSeats[k]=selected[k].innerHTML;
                	// 선택된 좌석 정보 표기용 if문
                	if(k!=selected.length-1){
                		selectSeatsValue+=selectSeats[k];
                		selectSeatsValue+=",";
                	}
                	else{
                		selectSeatsValue+=selectSeats[k];
                	}  
                }
                // 선택된 좌석 정보 표기
                seats.innerHTML=selectSeatsValue;
                
            }
        	// 선택되지 않은 좌석 선택시
            else {
                selected = document.querySelectorAll(".selected");
                // 현재 선택된 좌석수가 선택한 인원보다 작거나 같을때만 이벤트 실행
                if (selected.length < selectedPeopleValue){
                    this.classList.add("selected");
                    // 선택됐던 좌석정보 표기 삭제
                    selectSeatsValue="";
                    // 선택 좌석용 새로운 배열 생성
                    selectSeats=new Array();
                    selected = document.querySelectorAll(".selected");
                    // 선택된 좌석수만큼 for문 수행해서 배열에 값 입력
					for(let k=0;k<selected.length;k++){
                    	selectSeats[k]=selected[k].innerHTML;
                    	// 선택된 좌석 정보 표기용 if문
                    	if(k!=selected.length-1){
                    		selectSeatsValue+=selectSeats[k];
                    		selectSeatsValue+=",";
                    	}
                    	else{
                    		selectSeatsValue+=selectSeats[k];
                    	}  
                    }    
					// 선택된 좌석 정보 표기
                    seats.innerHTML=selectSeatsValue;
                    
                }else{
                	alert ("인원을 확인해주세요");
                }
                
            }
        });
    }
}
//예약좌석 가져오기
// 스테쥴변호를 이용해서 예약 정보 가져오기
let mtsNumber='${result.msNumber}';
	$.ajax({
				type : "GET",
				url : "reservedSeat",
				data : {
					"mtsNumber" : mtsNumber,

				},
				dataType : "json",
				success : function(result) {

					if (result.length > 0) {
						for (let i = 0; i < result.length; i++) {
							// 가져온 결과값 배열로 변환
							let data=JSON.parse(result[i]);
							console.log(data);
							for(let j=0;j<data.length;j++){
								allSeat = document.querySelectorAll(".seat-column");
								for(let k=0;k<allSeat.length;k++){
									if(data[j]==allSeat[k].innerHTML){
										allSeat[k].classList.add("reserved")
									}
								}
								
							}
						}
					}
				},
				error : function() {
					
				}
			});

function reserve(){
	let mtCount=selectedPeopleValue;
	let mtPrice=finalPriceValue;
	// 배열타입 문자열 변환 다시 가져올 시 JSON.parse(mtSeat) 이용해서 배열로 변환
	let mtSeat=JSON.stringify(selectSeats);
	// 추후에 세션 아이디 사용으로 변환
	let mtId='${loginId}'; 
	let mtName='${result.msName}';
	// 선택한 좌석이 선택한 인원수와 같은지 체크 
	if(selected.length==mtCount){
	$.ajax({
		type : "POST",
		url : "reserve",
		data : {
			"mtCount" : mtCount,
			"mtPrice" : mtPrice,
			"mtSeat" : mtSeat,
			"mtsNumber" : mtsNumber,
			"mtName" : mtName,
			"mtId" : mtId

		},
		dataType : "text",
		// result 값으로 예약번호를 가져와서 결제에 사용
		success : function(result) {
			console.log(result)
			if(confirm("결제하시겠습니까?")){
				// 카카오페이 api를 이용한 결제
				$
				.ajax({
					type : "POST",
					url : "kakaoPay",
					data : {
						"mtCount" : mtCount,
						"mtPrice" : mtPrice,						
						"mtName" : mtName,
						"mtId" : mtId,
						"mtNumber" : result,
						"msNumber" : mtsNumber
					},
					dataType:'json',
					success:function(data){		
						// 결제 페이지 이동, 아래 주소로 이동시 전체 페이지로 결제창 출력
						// 결제 페이지 따로 생성해서 헤더, 푸터 삽입해서 진행해도 무방
						let pay = data.next_redirect_pc_url;
						location.href=pay;
						
					},
					error:function(error){
						alert(error);
					}
				});
			}else{
				// 예약번호를 가지고 삭제 실행
				location.href="reserveDel?mtNumber="+result;
			}
		}
		});
	}
	else{
		alert("좌석을 모두 선택해 주세요");
	}
	
}

//로그인 체크
window.onload = function checkLogin(){
	
	if(${loginId == null}){
		alert('로그인 후 사용하세요');
		location.href="login";
	}
}
	
</script>
</html>