<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Dish</title>
<link rel = "icon" type = "image/x-icon" href ="img/download.ico">
</head>
<body>
<div class="background-container">
		<img class = "pizzamoon"
			src="img/download.png"
			alt=""> 
		<div class="stars"></div>
		<div class="twinkling"></div>
		<div class="clouds"></div>
	</div>

		<%@ include file="navbar.jsp"%>

	<h2>${dish.name}</h2>

	<form action="updateDish.do" method="POST">

		<input type="hidden" name="id" value="${dish.id }"> Name: <input
			type="text" name="name" placeholder="${dish.name} "
			value="${dish.name}" /> <br> Update Description of the Job with
		a new Entry: <br>
		<textarea rows="5" cols="50" name="description" value="${dish.description }" placeholder = "${dish.description }" ></textarea>
		<input type="submit" value="Submit " />
	</form>





</body>
</html>