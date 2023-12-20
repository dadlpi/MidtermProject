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

		<h1 >List of Meals</h1>


		<div>
			<c:choose>
				<c:when test="${! empty dishes}">
					
						<c:forEach var="dish" items="${dishes}">
							
							
							<br>
							<h3 >${dish.name}</h3>
							<img alt="Dish" src="${dish.imageUrl }" width = "250 " height = "250">
							<ul>
							<li><a href = "${dish.recipeUrl}">Link to Recipe</a></li>
							<li>calories: ${dish.calories }</li>
							<li>Carbs: ${dish.carbsGrams }</li>
							<li>Fat: ${dish.fatGrams }</li>
							<li>Protein: ${dish.proteinGrams }</li>
							
							</ul>
								<hr>
						<br>
						<br>
					</c:forEach>
				
			</c:when>
		</c:choose>
	</div>



</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>