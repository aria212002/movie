<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.expired {
	display: none !important;
}
</style>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />


</head>
<body>

	<!-- header -->
	<div id="header_section" class="header ty3">
		<%@ include file="../header.jsp"%>
	</div>

	<section class="after-head d-flex section-text-white position-relative">
		<div class="d-background" data-parallax="scroll"></div>
		<!-- data-image-src="http://via.placeholder.com/1920x1080" -->
		<div class="d-background bg-black-80"></div>
		<div class="top-block top-inner container">
			<div class="top-block-content">
				<h1 class="section-title">예매하기</h1>
				<div class="page-breadcrumbs">
					<a class="content-link" href="./"></a>
				</div>
			</div>
		</div>
	</section>

	<div class="row justify-content-center">
		<!-- 영화 목록 영역 -->
		<div class="col-lg-4">
			<div class="card shadow mb-4">
				<div class="card-header bg-secondary">
					<h6 class="m-0 text-white">
						<i class="bi bi-camera-reels"></i> 영화 선택
					</h6>
				</div>
				<!-- 영화 출력 -->
				<div style="height: 200px; overflow-y: scroll" id="movieListArea"
					class="list-group list-group-flush small"></div>
			</div>
		</div>
		<!-- 날짜 영역 -->
		<div class="col-lg-3">
			<div class="card shadow mb-4">
				<div class="card-header bg-success">
					<h6 class="m-0 text-white">
						<i class="bi bi-calendar"></i> 날짜 선택
					</h6>
				</div>
				<!-- 날짜 출력 -->
				<div style="height: 200px; overflow-y: scroll" id="dayListArea"
					class="list-group list-group-flush small"></div>
			</div>
		</div>
		<!-- 시간표 영역 -->
		<div class="col-lg-3">
			<div class="card shadow mb-4">
				<div class="card-header bg-warning">
					<h6 class="m-0 text-white">
						<i class="bi bi-clock"></i> 시간표 선택
					</h6>
				</div>
				<!-- 시간표 출력 -->
				<div style="height: 200px; overflow-y: scroll" id="timeTableArea"
					class="list-group list-group-flush small"></div>
			</div>
		</div>
	</div>
	<table style="width:80%; margin: auto; vertical-align: middle" class="table table-success table-striped justify-content-center">
		<thead>
			<tr class="justify-content-center">
				<!-- 선택한 영화 출력 -->
				<th scope="col" style="width:50%" name="msName" id="msName"></th>
				<!-- 선택한 날짜 출력 -->
				<th scope="col" style="width:20%" name="msDate" id="msDate"></th>
				<!-- 선택한 날짜 출력 -->
				<th scope="col" style="width:30%" name="msStartTime" id="msStartTime"></th>



			</tr>
		</thead>
	</table>


	<!-- footer -->
	<div id="footer_section" class="footer ty3">
		<%@ include file="../footer.jsp"%>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
	// 영화 출력 영역 jQuery
	let movieName = $("#movieListArea");
	// 날짜 출력 영역 jQuery
	let movieDate = $("#dayListArea");
	// 시간표 출력 영역 jQuery
	let timeTable = $("#timeTableArea");

	// 영화 목록 가져오기
	$.ajax({
				type : "GET",
				url : "msList",
				dataType : "json",
				success : function(result) {

					if (result.length > 0) {
						for (let i = 0; i < result.length; i++) {
							if ('${miName}' != result[i].miName) {
								movieName.append("<div class='list-group-item list-group-item-action' onclick='movieClick(this)'>"
												+ result[i].miName + "</div>");
							} else {
								movieName.append("<div class='list-group-item list-group-item-action active' onclick='movieClick(this)'>"
												+ result[i].miName + "</div>");
								$("#msName").html('${miName}');
							}
						}
					}
				},
				error : function() {
					alert('영화목록 가져오기 실패!');
				}
			});

	// 날짜 목록 가져오기
	function day(n) {
		let today = new Date();
		let returnDay = new Date(today.setDate(today.getDate() + n));
		let day = [ "일", "월", "화", "수", "목", "금", "토" ];
		let dayOfWeek = day[returnDay.getDay()];
		return (returnDay.getMonth() + 1 + "/" + returnDay.getDate() + "("
				+ dayOfWeek + ")");
	}
	// 오늘부터 7일치 목록 가져오기
	for (let i = 0; i < 7; i++) {

		movieDate
				.append("<div class='list-group-item list-group-item-action' onclick='dayClick(this)'>"
						+ day(i) + "</div>");

	}

	// 목록에서 영화 선택시
	function movieClick(t) {
		// 시간표 영역 삭제
		timeTable.html("");
		// 시간표 선택 영역 삭제
		$("#msStartTime").html("");
		// 예매 버튼 삭제
		$("#seat").remove();
		// 영화 목록 선택 제거
		movieName.children().removeClass("active");
		// 클릭한 영화 선택
		t.classList.add("active");
		// 영화 출력 영역에 영화명 출력
		$("#msName").html($(t).html());

		// 영화 및 날짜 선택시 시간표 테이블 가져오기
		if ($("#msName").html() != "" && $("#msDate").html() != "") {
			let msName = $("#msName").html();
			// (요일) 부분 삭제하고 0000-00-00 형태로 변환
			let datePlus = '2023-0'
			let msDate = datePlus + $("#msDate").html().slice(0, -3).replace('/','-');
			// 선택한 영화제목과 날짜로 시간표 구하기
			$.ajax({
						type : "GET",
						url : "msTime",
						data : {
							"msName" : msName,
							"msDate" : msDate

						},
						dataType : "json",
						success : function(result) {

							if (result.length > 0) {
								for (let i = 0; i < result.length; i++) {
									// 해당 스케쥴 번호로 예약된 좌석수 가져오기
									let reservedSeat = seatCheck(result[i].msNumber);

									timeTable
											.append("<div class='list-group-item list-group-item-action' id='"
													+ result[i].msNumber
													+ "' onclick='timeClick(this)'>"
													+ result[i].msTheater
													+ " / "
													+ result[i].msStartTime
													+ " / ("
													+ (result[i].mtSeats - reservedSeat)
													+ "/"
													+ result[i].mtSeats
													+ ")</div>");

									// 오늘 스케쥴 중 현재 시간보다 이전이라면 목록 출력 안 함
									// 스케쥴 정보에서 날짜, 시간, 분 변수 생성
									let msDate = result[i].msDate;									
									let msDateDate = msDate.slice(8);									
									let msStartTime = result[i].msStartTime;									
									let msStartTimeHour = msStartTime.slice(0,
											-3);									
									let msStartTimeMinute = msStartTime
											.slice(3);									

									// 현재 시간으로 날짜, 시간, 분 변수 생성
									let now = new Date();
									let nowDate = now.getDate();									
									let nowHour = now.getHours();									
									let nowMinute = now.getMinutes();									

									// 시간 비교용 변수 생성
									let check = false;

									// 시간 비교 후 스케쥴이 현재 시간보다 이전이면 true
									if (msDateDate == nowDate) {
										if (msStartTimeHour < nowHour) {
											check = true;
										} else if (msStartTimeHour == nowHour) {
											if (msStartTimeMinute <= nowMinute) {
												check = true;
											}
										}
									}

									// true 일시 expored 클래스 추가, .expired에 display:none 스타일 적용으로 목록 숨기기
									// 목록 출력하고 클릭 불가(pointer-events : none)와 색깔 부여 등으로 변경 가능
									if (check) {
										let expired = result[i].msNumber;
										$("#" + expired).addClass("expired")
									}
								}
								// 모든 스케쥴이 현재 시간보다 이전인 경우 출력 메세지 생성
								// 시간이 지난 목록을 출력하는 경우 아래 부분 삭제
								let checkExpired = document
										.querySelectorAll(".expired");
								if (result.length == checkExpired.length) {
									timeTable.html("");
									timeTable
											.append("<div class='list-group-item list-group-item-action'>"
													+ "오늘은 더 이상 해당하는 상영테이블이 존재하지 않습니다"
													+ "</div>");
								}
							} else {
								timeTable
										.append("<div class='list-group-item list-group-item-action'>"
												+ "해당하는 상영테이블이 존재하지 않습니다"
												+ "</div>");

							}

						},
						error : function() {
							alert('타임 테이블 가져오기 실패!');
						}
					});

		}
	}
	// 목록에서 날짜 선택시
	function dayClick(t) {
		// 시간표 영역 삭제
		timeTable.html("");
		// 시간표 선택 영역 삭제
		$("#msStartTime").html("");
		// 예매 버튼 삭제
		$("#seat").remove();
		// 날짜 선택 제거
		movieDate.children().removeClass("active");
		// 클릭한 날짜 선택
		t.classList.add("active");
		// 날짜 출력 영역에 날짜 출력
		$("#msDate").html($(t).html());
		// 영화 및 날짜 선택시 시간표 테이블 가져오기
		if ($("#msName").html() != "" && $("#msDate").html() != "") {
			let msName = $("#msName").html();
			// (요일) 부분 삭제하고 00/00 형태로 변환
			let datePlus = '2023-0'
			let msDate = datePlus + $("#msDate").html().slice(0, -3).replace('/','-');
			// 선택한 영화제목과 날짜로 시간표 구하기
			$.ajax({
						type : "GET",
						url : "msTime",
						data : {
							"msName" : msName,
							"msDate" : msDate

						},
						dataType : "json",
						// 동기식 처리를 위해
						async : false,
						success : function(result) {
							if (result.length > 0) {
								for (let i = 0; i < result.length; i++) {
									// 해당 스케쥴 번호로 예약된 좌석수 가져오기
									let reservedSeat = seatCheck(result[i].msNumber);

									timeTable
											.append("<div class='list-group-item list-group-item-action' id='"
													+ result[i].msNumber
													+ "' onclick='timeClick(this)'>"
													+ result[i].msTheater
													+ " / "
													+ result[i].mtKind
													+ " / "
													+ result[i].msStartTime
													+ " / ("
													+ (result[i].mtSeats - reservedSeat)
													+ "/"
													+ result[i].mtSeats
													+ ")</div>");

									// 오늘 스케쥴 중 현재 시간보다 이전이라면 목록 출력 안 함
									// 스케쥴 정보에서 날짜, 시간, 분 변수 생성
									let msDate = result[i].msDate;
									let msDateDate = msDate.slice(8);
									let msStartTime = result[i].msStartTime;
									let msStartTimeHour = msStartTime.slice(0,
											-3);
									let msStartTimeMinute = msStartTime
											.slice(3);

									// 현재 시간으로 날짜, 시간, 분 변수 생성
									let now = new Date();
									let nowDate = now.getDate();
									let nowHour = now.getHours();
									let nowMinute = now.getMinutes();

									// 시간 비교용 변수 생성
									let check = false;

									// 시간 비교 후 스케쥴이 현재 시간보다 이전이면 true
									if (msDateDate == nowDate) {
										if (msStartTimeHour < nowHour) {
											check = true;
										} else if (msStartTimeHour == nowHour) {
											if (msStartTimeMinute <= nowMinute) {
												check = true;
											}
										}
									}

									// true 일시 expired 클래스 추가, .expired에 display:none 스타일 적용으로 목록 숨기기
									// 목록 출력하고 클릭 불가(pointer-events : none)와 색깔 부여 등으로 변경 가능
									if (check) {
										let expired = result[i].msNumber;
										$("#" + expired).addClass("expired")
									}
								}
								// 모든 스케쥴이 현재 시간보다 이전인 경우 출력 메세지 생성
								// 시간이 지난 목록을 출력하는 경우 아래 부분 삭제
								let checkExpired = document
										.querySelectorAll(".expired");
								if (result.length == checkExpired.length) {
									timeTable.html("");
									timeTable
											.append("<div class='list-group-item list-group-item-action'>"
													+ "오늘은 더 이상 해당하는 상영테이블이 존재하지 않습니다"
													+ "</div>");
								}

							} else {
								timeTable
										.append("<div class='list-group-item list-group-item-action'>"
												+ "해당하는 상영테이블이 존재하지 않습니다"
												+ "</div>");
							}

						},
						error : function() {
							alert('상영 테이블 가져오기 실패!');
						}
					});

		}
	}

	// 목록에서 시간표 선택시
	function timeClick(t) {
		// 예매 버튼 삭제
		$("#seat").remove();
		// 시간표 선택 제거
		timeTable.children().removeClass("active");
		// 클릭한 시간표 선택
		t.classList.add("active");
		// 클릭한 시간표의 id 정보로 스케쥴 넘버 가져오기
		let msNumber = t.id;
		// 시간표 출력 영역에 날짜 출력
		$("#msStartTime").html($(t).html());
		// 예매 버튼 추가, 클릭시 스케쥴 넘버를 가지고 좌석 선택 페이지로 이동
		$("#msStartTime")
				.after(
						"<th scope='col'  id='seat' class='col-lg-3'><input type='button' value='예매' onclick=\"location.href='seat?msNumber="
								+ msNumber + "'\"></th>");

	}

	// 예매좌석수 가져오기
	function seatCheck(msNumber) {
		let reservedSeats = null;
		$.ajax({
			type : "GET",
			url : "seatCheck",
			data : {
				"mtsNumber" : msNumber

			},
			dataType : "text",
			// 동기식 처리를 위해
			async : false,
			success : function(result) {
				// service에서 try/catch문 사용으로 에러 발생(예약내역 없는 경우) 0 반환
				reservedSeats = result;

			},
			error : function() {

			}
		});

		return reservedSeats;
	}

	// 오늘 시간 지난 타임 테이블 클릭 불가용
	function timeCheck() {

		let msDateDate = msDate.slice(8);

		let msStartTimeHour = msStartTime.slice(0, -3);
		let msStartTimeMinute = msStartTime.slice(3);

		let now = new Date();
		let nowDate = now.getDate();
		let nowHour = now.getHours();
		let nowMinute = now.getMinutes();

		let check = false;

		if (msDateDate == nowDate) {
			if (msStartTimeHour < nowHour) {
				check = true;
			} else if (msStartTimeHour == nowHour) {
				if (msStartTimeMinute <= nowMinute) {
					check = true;
				}
			}
		}
		return check;

	}
	
	// 로그인 체크
	window.onload = function checkLogin(){
		
		if(${loginId == null}){
			alert('로그인 후 사용하세요');
			location.href="login";
		}
	}
</script>



</html>