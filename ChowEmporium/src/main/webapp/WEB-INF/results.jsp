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


<h1>Results Page</h1>

<h3>Logged in user =  ${loggedInUser.firstName} ${loggedInUser.lastName}</h3>

<c:if test="${not empty loggedInUser.userCreatedDishes}">
		<h2>you changed: ${dish.name}</h2>
		</c:if>


</body>
</html>