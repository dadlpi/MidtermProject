<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
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
		<a href="displaySingularMeal.do" class="title">Display Singular Meal</a> <a
			href="displayListOfMeals.do" class="title">Display List of Meals</a>
			<a href="home.do" class="title">Home</a>

		<c:if test="${not empty sessionScope.loggedInUser}">
			<a href="account.do">Account</a>
			<a href="userHome.do">User Home</a>
			<a href="mealCalendar.do">Meal Calendar</a>
			<a href="logout.do">LogOut</a>
			<a href="addDishForm.do"> add dish</a>
		</c:if>

		<c:if test="${empty sessionScope.loggedInUser}">
		
				<div class="dropdown">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false"
						data-bs-auto-close="true">Login</button>
			




			<form action="navbar.do" method="POST" class="p-4">
				<div class="mb-3">
					<label for="username" class="form-label">Username</label> <input
						type="text" class="form-control" name="username" placeholder="Username">
						
				</div>

				<div class="mb-3">
					<label for="exampleDropdownFormPassword2" class="form-label">Password</label>
					<input type="password" name="password" class="form-control"
						placeholder="Password">

				</div>
				<input type="submit" class="btn btn-primary" value = "Sign in"></input> 
			</form>
			


			<a href="register.do">Register</a>
			
			</div>
		</c:if>

	</nav>


	<h1>Login PAge</h1>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>