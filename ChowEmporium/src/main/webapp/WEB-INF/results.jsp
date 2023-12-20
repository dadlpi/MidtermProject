<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Results Page</title>
<link rel = "icon" type = "image/x-icon" href ="img/download.ico">
<link rel="stylesheet" href="css/main.css">
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


	<h1 class="regularText">
		<strong>Results Page</strong>
	</h1>

	<h3 class="regularText">Logged in user = ${loggedInUser.firstName}
		${loggedInUser.lastName}</h3>

	<c:if test="${not empty loggedInUser.userCreatedDishes}">
		<h2 class="regularText">you changed: ${dish.name}</h2>
	</c:if>

	<c:if test="${empty loggedInUser.userCreatedDishes}">
		<h2 class="regularText">You have performed an update</h2>
	</c:if>
	<c:if test="${empty loggedInUser}">
		<h2 class="regularText">You have performed an update</h2>
	</c:if>


</body>
</html>