<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
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
		<h2>${loggedInUser.firstName} ${loggedInUser.lastName}</h2>
			<a href="addDishForm.do"> Add Dish</a>
			<br>
			<a href="dishesToUpdate.do"> Update Dish</a>
			<br>
			<a href="dishesToDelete.do"> Delete Dish</a>
		<hr>
		
		
		<h3>Meal Plans</h3>
		<form action="addMealPlan.do" method="post">
			<label for="title">Title</label> 
			<input type="text" name="title">
			<br>
			<label for="description">Description</label>
			<textarea rows="3" cols="40"></textarea>
				<br>
			<label for="shared">Shared</label> 
			<input type="checkbox" name="shared">
				<br>

			<button>Add Plan</button>
		</form>
		<ul>
			<c:forEach var="plan" items="${mealPlans}">
				<li><a href="showPlan.do?planId=${plan.id}"> ${plan.title}</a>
				</li>


			</c:forEach>
		</ul>


		<a href="updateUserForm.do"><h4>Update User Account</h4></a>

		<p>-Add a dish -update a dish -delete a dish -add to calendar</p>



		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
			crossorigin="anonymous"></script>

	</div>
</body>
</html>