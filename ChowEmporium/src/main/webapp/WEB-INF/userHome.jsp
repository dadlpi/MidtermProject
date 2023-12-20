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
<link rel="icon" type="image/x-icon" href="img/download.ico">
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
		<img alt="profileImage" src="${loggedInUser.profileImage}"
			width="150 " height="150">
		
		<h2>${loggedInUser.firstName} ${loggedInUser.lastName}</h2>
		<a href="addDishForm.do" class="title"> Add Dish</a> <br> <a
			href="dishesToUpdate.do" class="title"> Update Dish</a> <br> <a
			href="dishesToDelete.do" class="title"> Delete Dish</a> <br> <a
			href="updateUserForm.do" class="title">Update User Account</a>
		<hr>
		<h4>About Me</h4>
		<br>
		<p>${loggedInUser.aboutMe}</p>
		<hr>


		<h3>Meal Plans</h3>
		<form action="addMealPlan.do" method="post">
			<label for="title">Title</label> <br> <input type="text"
				name="title" placeholder="Title your Meal Plan"> <br> <br>
			<label for="description">Description</label> <br>
			<textarea rows="3" cols="40" placeholder="Write a brief description"></textarea>
			<br> <label for="shared">Shared</label> <input type="checkbox"
				name="shared"> <br>

			<button class ="btn btn-success" id="submitButtons">Add Plan</button>
		</form>
		<ul>
			<c:forEach var="plan" items="${mealPlans}">
				<li><a href="showPlan.do?planId=${plan.id}" class="title">
						${plan.title}</a></li>


			</c:forEach>
		</ul>








		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
			crossorigin="anonymous"></script>

	</div>
</body>
</html>