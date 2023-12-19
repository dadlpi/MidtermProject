<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<title>LOGIN PAGE</title>
</head>
<body>


	<nav class="navbar">
		<h1 class="title">Chow Emporium</h1>
		<img src="img/download.png" alt="" width="45" height="45">
		<a href="home.do" class="title">Home</a>
		<c:if test="${not empty sessionScope.loggedInUser}">
			<a href="userHome.do" class="title">Account Home</a>
			
			<a href="logout.do" class="title">Log out</a>
			
		</c:if>
		
		 <a href="displaySingularMeal.do" class="title">Display Singular Meal</a>
		 
		<a href="displayListOfMeals.do" class="title">Display List of Meals</a>
			
			


		
	</nav>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>