<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meal Plan Details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<h2>${mealPlan.title}</h2>
		<blockquote>${mealPlan.description}</blockquote>
		
		<form action="addMeal.do" method="post">
			<label for="dayOfWeek">Day of Week</label> 
			<input type="text" name="dayOfWeek">
				<br>
				<input type="hidden" name ="planId" value="${mealPlan.id }">
			<label for="description">Description</label>
			<textarea rows="3" cols="40"></textarea>
				<br>
				
			<label for="meal.id">Meal</label> 
			<select name="meal.id"> 
			<c:forEach var="meal" items="${meals}">
				<option value="${meal.id }">${meal.name}</option>
			</c:forEach>
			</select>
				<br>
				
			<select name="dish.id"> 
			<c:forEach var="dish" items="${dishes}">
				<option value="${ dish.id}">${dish.name}</option>
			</c:forEach>
			</select>
				<br>
				
			<button>Add Meal</button>
		</form>
		<ul>
			<c:forEach var="meal" items="${mealPlan.plannedMeals}">
				<li><a href="editMeal.do?planId=${meal.id}"> ${meal.dayOfWeek} ${meal.meal.name} ${meal.dish.name}</a>
				</li>

			</c:forEach>
		</ul>


		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
			crossorigin="anonymous"></script>

	</div>
</body>
</html>