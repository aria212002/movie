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
		<tr>
			<th>포스터</th>
			<td><img src="${mvView.miPoster}" width="200px" height="200px"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td id="miName">${mvView.miName}</td>
		</tr>
		<c:if
			test="${mvView.miGenre3 == null && mvView.miGenre2 == null && mvView.miGenre1 != null}">
			<tr>
				<th>장르</th>
				<td>${mvView.miGenre1}</td>
			</tr>
		</c:if>
		<c:if
			test="${mvView.miGenre3 == null && mvView.miGenre2 != null && mvView.miGenre1 != null}">
			<tr>
				<th>장르</th>
				<td>${mvView.miGenre1},${mvView.miGenre2}</td>
			</tr>
		</c:if>
		<c:if
			test="${mvView.miGenre3 != null && mvView.miGenre2 != null && mvView.miGenre1 != null}">
			<tr>
				<th>장르</th>
				<td>${mvView.miGenre1},${mvView.miGenre2} , ${mvView.miGenre3}</td>
			</tr>
		</c:if>
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
			<th>개봉일</th>
			<td>${mvView.miRelease}</td>
		</tr>
		<tr>
			<th>예고편</th>
			<td><iframe width="300" height="180"
					src="${mvView.miTeaser}" frameborder="0"
					allow="accelerometer; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe></td>
		</tr>
		<tr>
			<th>스틸컷1</th>
			<td><img
				src="${mvView.miStillcut1}"
				width="300px" height="180"></td>
		</tr>
		<tr>
			<th>스틸컷2</th>
			<td><img
				src="${mvView.miStillcut2}"
				width="300px" height="180"></td>
		</tr>
		<tr>
			<th>스틸컷3</th>
			<td><img
				src="${mvView.miStillcut3}"
				width="300px" height="180"></td>
		</tr>
		<tr>
			<th>스틸컷4</th>
			<td><img
				src="${mvView.miStillcut4}"
				width="300px" height="180"></td>
		</tr>
		<tr>
			<th>스틸컷5</th>
			<td><img
				src="${mvView.miStillcut5}"
				width="300px" height="180px"></td>
		</tr>
		<tr>
			<th>스틸컷6</th>
			<td><img
				src="${mvView.miStillcut6}"
				width="300px" height="180px"></td>
		</tr>

	</table>

</body>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script>
	$('#mvModify').click(function() {
		location.href = "mvModiForm?miName=${mvView.miName}";
	});
	$('#mvDelete').click(function() {
		location.href = "mvDelete?miName=${mvView.miName}";
	});
	$('#msWrite').click(function(){
		location.href = "msWriteForm";
	});
	$('#stillcut').click(function() {
		location.href = "stillcut?miName=${mvView.miName}";
	});
	$('#list').click(function() {
		location.href = "mvList"
	});
	$('#main').click(function() {
		location.href = "index"
	});
</script>
</html>