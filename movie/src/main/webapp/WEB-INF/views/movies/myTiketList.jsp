<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 내역</title>
<style>
	.ticketTable {
			font-size: 18px;
			padding-bottom: 200px;
			border: none;
			border-collapse: collapse;
			width: 100%;
		}
	tr {
			text-align: center;
		}
	th,	td {
			padding: 10px;
			border-bottom: 1px solid white;
		}





.myModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content1 {
	background-color: #fefefe;
	margin: 10% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 400px; /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.line {
	border-top: dashed 2px gray;
	padding-top: 5px;
}

@media print {

}


</style>

</head>
<body>

			<div id="header_section" class="header ty3">
				<%@ include file="../header.jsp" %>
			</div>


			<c:choose>
				<c:when test="${loginId != null}">
					<!-- sidebar -->
					<div id="header_section" class="sidebar">
						<%@ include file="../sidebar.jsp" %>
					</div>
				</c:when>
			</c:choose>


			<section class="section-text-white position-relative">
				<div class="d-background"  data-parallax="scroll">
				</div>
				<div class="d-background bg-theme-blacked"></div>
				<div class="mt-auto container position-relative">
					<div class="top-block-head text-uppercase">
						<h2 class="display-4">
							예매 <span class="text-theme">내역</span>
						</h2>
					</div>
					<table class="ticketTable">

						<tr>
							<th colspan="10">'${loginId}' 님의 예매 <span class="text-theme">내역</span></th>
						</tr>

						<tr>
							<th nowrap>예매 번호</th>
							<th nowrap>영화 제목</th>
							<th nowrap>상영관</th>
							<th nowrap>상영일</th>
							<th nowrap>상영 시간</th>
							<th nowrap>예매 인원</th>
							<th nowrap>가격</th>
							<th nowrap>결제 여부</th>
							<th nowrap>예매 취소</th>
							<th nowrap>티켓 출력</th>
						</tr>
						<c:forEach var="ticket" items="${myTicket}">
							<tr>
								<td>${ticket.mtNumber}</td>
								<td class="mname">${ticket.mtName}</td>
								<td>${ticket.msTheater}</td>
								<td nowrap>${ticket.msDate}</td>
								<td>${ticket.msStartTime}</td>
								<td>${ticket.mtCount}</td>
								<td>${ticket.mtPrice}</td>
								<c:if test="${ticket.mtPayment == '0'}">
									<td><button type="button" class="btn-theme btn"
											onclick="confirmPayment('${ticket.mtNumber}','${loginId}','${ticket.mtName}','${ticket.mtCount}','${ticket.mtPrice}')">결제</button>
									</td>
								</c:if>
								<c:if test="${ticket.mtPayment == '1'}">
									<td>O</td>
								</c:if>
								<td>
									<button type="button" class="btn-theme btn" onclick="deleteReserve('${ticket.mtNumber}')">취소</button>
								</td>
								<td>
									<!-- The Modal -->
									<c:choose>
										<c:when test="${ticket.mtPayment == '0'}">
														x
										</c:when>
										<c:otherwise>
											<button class="myBtn">출력</button>
										
									<div class="myModal" >

										<!-- Modal content -->
										<div class="modal-content1">
											<span class="close">&times;</span>
											<table>
												<tr>
													<th>
														<h3 style="color: black;">영화 입장권</h3>
													</th>
												</tr>
												<tr>
													<td>
														<p style="color: black; text-align: left; margin-top: 20px; padding-bottom: -20px; font-size : 15px;"
															class="nowDate"></p>
													</td>
												</tr>
												<tr>
													<td class="line" style="text-align: left; padding-bottom : 5px;">
														<span
															style="color: black; text-align: left; font-size: 15px;">${ticket.miAge}</span>
														<h3 style="color: black;">${ticket.mtName}</h3>
													</td>
												</tr>
												<tr>
													<td class="line" style="text-align: left;">
														<p style="color: black; backgrount-color: black;">${ticket.msDate} ${ticket.msStartTime}~${ticket.msEndTime}</p>
														<span style="color: black; text-align: left;">${ticket.msTheater} ==> ${ticket.mtSeat} </span>
														<span style="color: black; text-align: left; font-size: 15px;">(총인원 : ${ticket.mtCount}명)</span>
														
													</td>
												</tr>
												<tr>
												 	<td class="line" style="text-align: left; color: black; font-size: 15px;" >
												 		<h4>[ 주차 안내 ]</h4>
												 		<li>주차장 무료 이용 시간은 최대 1시간 입니다.</li>
												 		<li>영화 입장권 지참시 추차장 무료 이용시간 최대 3시간 입니다.</li>
												 		<li>주차장 운영 시간은 09:00~ 익일 01:00 입니다.</li>
												 		<li>문의전화 : 1588-1577</li>
												 		<br>
												 	</td>
												 </tr>
												<tr>
													<th class="line">
														<img class="img11" alt="" src=".//resources/css/barcode.png">
													</th>
												</tr>

												<tr>
													<td>
														<button class="print"><i style="cursor: pointer;" class="fa fa-print print-button"></i></button>
													</td>
												</tr>


											</table>


										</div>

									</div>
									</c:otherwise>
									</c:choose>
								</td>
							</tr>
						
						</c:forEach>
					</table>
					<br /><br /><br /><br /><br /><br />
				</div>
			</section>



			<!-- footer -->
			<div id="footer_section" class="footer ty3">
				<%@ include file="../footer.jsp" %>
			</div>


		</body>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script>
			function confirmPayment(mtNumber, loginId, mtName, mtCount, mtPrice) {
				console.log(mtNumber);
				console.log(loginId);
				console.log(mtName);
				console.log(mtCount);
				console.log(mtPrice);
				if (confirm("결제하시겠습니까? 취소시 내역이 삭제됩니다.")) {
					kakaoPay(mtPrice, mtNumber, mtCount, mtName, loginId);
				} else {
					reserveDelete(mtNumber);
				}
			}

			function kakaoPay(mtPrice, mtNumber, mtCount, mtName, mtId) {
				$.ajax({
					type: "POST",
					url: "kakaoPay",
					data: {
						"mtPrice": mtPrice,
						"mtNumber": mtNumber,
						"mtCount": mtCount,
						"mtName": mtName,
						"mtId": mtId
					},
					dataType: 'json',
					success: function (data) {
						let pay = data.next_redirect_pc_url;
						location.href = pay;
					},
					error: function (error) {
						alert(error);
					}
				});
			}

			function reserveDelete(mtNumber) {
				location.href = "reserveDel2?mtNumber=" + mtNumber;
			}
			
/* 	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var btn = document.getElementByid("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on the button, open the modal 
	btn.onclick = function() {
		modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
		modal.style.display = "none";
	} */
	
	
	// Modal을 가져옵니다.
	var modals = document.getElementsByClassName("myModal");
	// Modal을 띄우는 클래스 이름을 가져옵니다.
	var btns = document.getElementsByClassName("myBtn");
	// Modal을 닫는 close 클래스를 가져옵니다.
	var spanes = document.getElementsByClassName("close");
	var funcs = [];
	 
	// Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
	function Modal(num) {
	  return function() {
	    // 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
	    btns[num].onclick =  function() {
	        modals[num].style.display = "block";
	        console.log(num);
	    };
	 
	    // <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
	    spanes[num].onclick = function() {
	        modals[num].style.display = "none";
	    };
	  };
	} 

	// 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
	for(var i = 0; i < btns.length; i++) {
	  funcs[i] = Modal(i);
	}
	 
	// 원하는 Modal 수만큼 funcs 함수를 호출합니다.
	for(var j = 0; j < btns.length; j++) {
	  funcs[j]();
	}
	
	
	
	window.onclick = function(event) {
		  if (event.target.className == "myModal") {
		      event.target.style.display = "none";
		  }
		};

	date = new Date();
	year = date.getFullYear();
	month = date.getMonth() + 1;
	day = date.getDate();
	hours = date.getHours();
	min = '0' + date.getMinutes();
	let node=document.querySelectorAll(".nowDate");
	for (let i = 0; i < node.length; i++) {
		  node[i].innerHTML = year + "-" + month + "-" + day + " " + hours + ":" + min.slice(-2);
		}
	
	//프린트 버튼
	$('.print').on('click', function(){
		 $(this).css("display", 'none');
		 window.print();// 클릭액션 : 버튼클릭시 인쇄창팝업
		 $(this).css("display", '');
		

	  });



	  $('.print').mouseover(function(){

		  $(this).css("color",'blue');  // 마우스오버액션 : 커서가 올라갈 경우 다른색상으로 변경 

	  });



	  $('.print').mouseleave(function(){

		  $(this).css("color",'black');  // 마우스릴리즈액션 : 커서가 밖에 위치할 경우 기존색상으로 변경 

	  });
	  
	  function deleteReserve(mtNumber) {
		    var confirmed = confirm("정말 삭제하시겠습니까?");
		    
		    if (confirmed) {
		        location.href = "reserveDel2?mtNumber=" + mtNumber;
		        alert('예매내역을 삭제했습니다.')
		    } else{
		    	alert('예매내역 삭제를 취소했습니다.');
		    }
		}
	

</script>
</html>