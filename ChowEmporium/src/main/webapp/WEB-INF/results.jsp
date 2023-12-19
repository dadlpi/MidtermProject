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


	<h1 class="title">
		<strong>Results Page</strong>
	</h1>

	<h3 class="title">Logged in user = ${loggedInUser.firstName}
		${loggedInUser.lastName}</h3>

	<c:if test="${not empty loggedInUser.userCreatedDishes}">
		<h2 class="title">you changed: ${dish.name}</h2>
	</c:if>

	<c:if test="${empty loggedInUser.userCreatedDishes}">
		<h2 class="title">You have removed: ${dish.name}</h2>
	</c:if>

<%-- 	<div id=“container”>
		<c:if test=“${errorTypeeq 500}“>
			<div class=“error-container” id=“errorContainer”>
				<h1>Error 500 - Internal Server Error</h1>
				<p id=“errorMessage”>Sorry, an internal server error occurred.</p>
				<a href=“deleteForm.do” class=“back-button”>Back</a>
			</div>
		</c:if>
	</div> --%>
</body>
</html>