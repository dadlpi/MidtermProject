<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chow Emporium</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">

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

	<header class="header">


		<jsp:include page="navbar.jsp" />
	</header>


	<h2 class ="welcomesign">Welcome to the Chow Emporium</h2>

	<c:if test="${empty sessionScope.user}">
		<blockquote class = "welcomesign">Adding meals to your meal plan is only
			accessible to logged in users</blockquote>
		<!-- Add links for login or other actions when user is not logged in -->
	</c:if>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

</div>
</body>
</html>