<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chow Emporium</title>
<link rel="icon" type="image/x-icon" href="img/download.ico">
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

	<div class="container">

		<header class="header">


			<jsp:include page="navbar.jsp" />
		</header>


		<h2 class="welcomesign">Welcome to the Chow Emporium</h2>


		<c:if test="${empty sessionScope.loggedInUser}">
			<div class="dropdown">
				<blockquote class="welcomesign">Where your culinary
					journey begins and the only limit is your appetite!</blockquote>

				<form action="navbar.do" method="POST" class="p-4">
					<div class="mb-3">
						<label for="username" class="form-label">Username</label> <input
							type="text" class="form-control" name="username"
							placeholder="Username">

					</div>

					<div class="mb-3">
						<label for="exampleDropdownFormPassword2" class="form-label">Password</label>
						<input type="password" name="password" class="form-control"
							placeholder="Password">

					</div>
					<input type="submit" class="btn btn-primary" value="Sign in"></input>
					<br> <a href="register.do">Register</a>
				</form>




			</div>
			<p class="homeparagraph">we're your passport to the gastronomic
				wonderland. If your taste buds had social media accounts, they'd
				follow us, no doubt Now, brace yourself for a flavor explosion that
				will make your grandma's secret recipes look like beginner-level
				potions.</p>
			<br>
			<p class="homeparagraph">Creating an account on Chow Emporium is
				like joining an exclusive club where the only dues are your amazing
				recipes and a sprinkle of good vibes. To get started, sign up faster
				than a pizza delivery on a rainy Friday night. We promise our signup
				process is quicker than microwaving popcorn. Plus, we've made it so
				easy, even your great granny can do it. Once you're in, it's time to
				strut your stuff in the culinary catwalk. Upload your recipes,
				showcase your kitchen prowess, and let the world witness your
				culinary masterpieces.</p>
			<br>
			<p class="homeparagraph">Got a dish that makes people question
				their life choices because it's just too darn good? Share it with
				us! We want your recipes like a cookie monster wants cookies – with
				unbridled enthusiasm and maybe a few crumbs on our faces. Your
				kitchen adventure is about to take off, and we're the co-pilots you
				never knew you needed. Join Chow Emporium, because life's too short
				for bland food and boring websites. Let the culinary carnival begin!</p>
		</c:if>
		<c:if test="${not empty sessionScope.loggedInUser}">


			<div id="carouselExample" class="carousel slide">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
							class="d-block w-100" alt="..." width="350" height="350">
					</div>
					<c:if test="${! empty loggedInUser.favoriteDishList}">

						<c:forEach var="dish" items="${loggedInUser.favoriteDishList}">
							<div class="carousel-item ">
								<a href="${dish.recipeUrl}"><img src="${dish.imageUrl}"
									class="d-block w-100" alt="..." width="350" height="350"></a>
							</div>
						</c:forEach>
					</c:if>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExample" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExample" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
		</c:if>
		<br>

		<p>Click on any meal to start your mouth watering journey</p>







		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
			crossorigin="anonymous"></script>

	</div>
</body>
</html>