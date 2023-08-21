<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, td, th {
	border: 1px solid black;
	border-collapse: collapse;
}

td, th {
	padding: 10px;
}

caption {
	margin-bottom: 10px;
	font-size: 20px;
	font-weight: bold;
}

table {
	width: 50%;
}
</style>
</head>
<body>

	<table>
		<caption>영화 상세보기</caption>
		<c:forEach items="${mvView}" var="mvView">
			<tr>
				<th>이름</th>
				<td>${mvView.miName}</td>
			</tr>
			<tr>
				<th>장르</th>
				<td>${mvView.miGenre}</td>
			</tr>
			<tr>
				<th>감독</th>
				<td>${mvView.miDirecter}</td>
			</tr>
			<tr>
				<th>배우</th>
				<td>${mvView.miActor}</td>
			</tr>
			<tr>
				<th>줄거리</th>
				<td>${mvView.miSynopsis}</td>
			</tr>
			<tr>
				<th>등급</th>
				<td>${mvView.miAge}</td>
			</tr>
			<tr>
				<th>시간</th>
				<td>${mvView.miRuntime}</td>
			</tr>
			<tr>
				<th>포스터</th>
				<td>${mvView.miPosterN}</td>
			</tr>

			<tr>
				<th>개봉일</th>
				<td>${mvView.miRelease}</td>
			</tr>
		</c:forEach>
		
		<c:forEach items="${msView}" var="msView">
			<tr>
				<th>이름</th>
				<td>${msView.mcName}</td>
			</tr>
			<tr>
				<th>예고편</th>
				<td>${msView.mcTeaser}</td>
			</tr>
			<tr>
				<th>스틸컷1</th>
				<td><img src="./resources/fileUpload/${msView.mcStillcutN1}" /></td>
			</tr>
			<tr>
				<th>스틸컷2</th>
				<td><img src="./resources/fileUpload/${msView.mcStillcutN2}" /></td>
			</tr>
			<tr>
				<th>스틸컷3</th>
				<td><img src="./resources/fileUpload/${msView.mcStillcutN3}" /></td>
			</tr>
			<tr>
				<th>스틸컷4</th>
				<td><img src="./resources/fileUpload/${msView.mcStillcutN4}" /></td>
			</tr>
			<tr>
				<th>스틸컷5</th>
				<td><img src="./resources/fileUpload/${msView.mcStillcutN5}" /></td>
			</tr>
			<tr>
				<th>스틸컷6</th>
				<td><img src="./resources/fileUpload/${msView.mcStillcutN6}" /></td>
			</tr>
		</c:forEach>
		
	</table>

</body>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script>

</script>
</html>