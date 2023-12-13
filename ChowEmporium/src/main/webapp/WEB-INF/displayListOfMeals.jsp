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
</head>
<body>
	<div class="container">
		<%@ include file="navbar.jsp"%>

		<h1>Hello List of Meals</h1>


		<div>
			<c:choose>
				<c:when test="${! empty dishes}">
					<ul>
						<c:forEach var="dish" items="${dishes}">
							<h5>${dish.name}</h5>
							
							<br>
							<a href = "${dish.recipeUrl}">${dish.name}</h5></a>
								<hr>
						<br>
						<br>
					</c:forEach>
				</ul>
			</c:when>
		</c:choose>
	</div>



</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>