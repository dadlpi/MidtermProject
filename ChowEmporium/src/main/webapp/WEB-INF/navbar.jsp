<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
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
		<a href="displaySingularMeal.do">Display Singular Meal</a> <a
			href="displayListOfMeals.do">Display List of Meals</a>
			<a href="home.do">Home</a>

		<c:if test="${not empty sessionScope.loggedInUser}">
			<a href="account.do">Account</a>
			<a href="userHome.do">User Home</a>
			<a href="mealCalendar.do">Meal Calendar</a>
			<a href="logout.do">LogOut</a>
			
		</c:if>

		<c:if test="${empty sessionScope.loggedInUser}">
			<form>
				<div class="dropdown">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false"
						data-bs-auto-close="true">Login</button>
			</form>




			<form action="navbar.do" method="POST" class="p-4">
				<div class="mb-3">
					<label for="username" class="form-label">Username</label> <input
						type="text" class="form-control" name="username">
				</div>

				<div class="mb-3">
					<label for="exampleDropdownFormPassword2" class="form-label">Password</label>
					<input type="password" name="password" class="form-control"
						placeholder="Password">
				</div>

				<div class="mb-3">
					<div class="form-check">
						<input type="checkbox" class="form-check-input"
							id="dropdownCheck2"> <label class="form-check-label"
							for="dropdownCheck2"> Remember me </label>
					</div>

				</div>
				<input type="submit" class="btn btn-primary">Sign in</input>
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