<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Results Page</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>


	<h1>
		<strong>Results Page</strong>
	</h1>

	<h3>Logged in user = ${loggedInUser.firstName}
		${loggedInUser.lastName}</h3>

	<c:if test="${not empty loggedInUser.userCreatedDishes}">
		<h2>you changed: ${dish.name}</h2>
	</c:if>

	<c:if test="${empty loggedInUser.userCreatedDishes}">
		<h2>You have removed: ${dish.name}</h2>
	</c:if>

<%-- 	<div id=“container”>
		<c:if test=“${errorTypeeq 500}“>
			<div class=“error-container” id=“errorContainer”>
				<h1>Error 500 - Internal Server Error</h1>
				<p id=“errorMessage”>Sorry, an internal server error occurred.</p>
				<a href=“deleteForm.do” class=“back-button”>Back</a>
			</div>
		</c:if>
	</div> --%>
</body>
</html>