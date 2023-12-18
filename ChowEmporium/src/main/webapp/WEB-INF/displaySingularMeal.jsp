<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<link rel = "icon" type = "image/x-icon" href ="img/download.ico">
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

	<div class="container">
		<%@ include file="navbar.jsp"%>


		<h1>Singular Meal</h1>

		<div>
			<c:choose>
				<c:when test="${! empty singularDish}">


					<h3>${singularDish.name}</h3>
					<img alt="Dish" src="${singularDish.imageUrl }" width="350"
						height="350">
					<ul>
						<li><a href="${singularDish.recipeUrl}">Link to Recipe</a></li>
						<li>Calories: ${singularDish.calories }</li>
						<li>Carbs: ${singularDish.carbsGrams }</li>
						<li>Fat: ${singularDish.fatGrams }</li>
						<li>Protein: ${singularDish.proteinGrams }</li>
						


					</ul>





				</c:when>
			</c:choose>
		</div>



		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
			crossorigin="anonymous"></script>

	</div>
</body>
</html>