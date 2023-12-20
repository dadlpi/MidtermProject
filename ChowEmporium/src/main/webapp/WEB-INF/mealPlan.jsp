<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meal Plan Details</title>
<link rel = "icon" type = "image/x-icon" href ="img/download.ico">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<div class="background-container">
		<img class="pizzamoon" src="img/download.png" alt="">
		<div class="stars"></div>
		<div class="twinkling"></div>
		<div class="clouds"></div>
	</div>

	<%@ include file="navbar.jsp"%>
	<div class="container">
		<h2 class ="regularText">${mealPlan.title}</h2>
		<blockquote class ="regularText">${mealPlan.description}</blockquote>

		<form action="addMeal.do" method="post">
			<label for="dayOfWeek">Day of Week:</label> <br> <input
				type="number" min="1" max="7"  name="dayOfWeek"> <br>
				 <input type="hidden"
				name="planId" value="${mealPlan.id }">
				<br> 
				<label
				for="description">Description:</label>
				<br>
			<textarea rows="3" cols="40"></textarea><br>
			<br> <label for="meal.id">Meal:</label> <br><select name="meal.id">
			
				<c:forEach var="meal" items="${meals}">
				
					<option value="${meal.id }">${meal.name}</option>
					<br>
				</c:forEach>
			</select> <br><br>
			
			
			<label for ="dish.id">Available Dishes:</label><br>
			 <select name="dish.id">
			
			
				<c:forEach var="dish" items="${dishes}">
					<option value="${dish.id}">${dish.name}</option>
					<br>
					<br>
				</c:forEach>
			</select> <br><br>

			<button class ="btn btn-success" id="submitButtons">Add Meal</button>
			<br>
		</form>
		<ul>
			<c:forEach var="meal" items="${mealPlan.plannedMeals}">
				<p>Day of the Week: ${ meal.dayOfWeek}</p>

				<li>Type: ${meal.meal.name}</li>

				<li><a target="_blank" href="${meal.dish.recipeUrl}">${meal.dish.name}</a></li>
				<hr class="regularText">



			</c:forEach>
		</ul>


		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
			crossorigin="anonymous"></script>

	</div>
</body>
</html>