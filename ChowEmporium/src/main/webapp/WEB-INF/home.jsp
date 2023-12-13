<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chow Emporium</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
       
</head>

<body>
<div class="container">

    <header class = "header">
        
             <h1 class="title">Chow Emporium</h1>
        
        <nav class="navbar">
            <a href="displaySingularMeal.do">Display Singular Meal</a>
            <a href="displayListOfMeals.do">Display List of Meals</a>
            
            <c:if test="${not empty sessionScope.user}">
        		<a href="account.do">Account</a>
	            <a href="userHome.do">User Home</a>
	            <a href="mealCalendar.do">Meal Calendar</a>
		    	<a href="logOut.do">LogOut</a>
    		</c:if>
    		
    		<c:if test="${empty sessionScope.user}">
            	<a href="register.do">Register</a>
            	<a href="login.do">Login</a>
        			<!-- Add links for login or other actions when user is not logged in -->
    		</c:if>
    		
        </nav>
    </header>


<h2>Welcome to the Chow Emporium</h2>

<c:if test="${empty sessionScope.user}">
            	<blockquote>Adding meals to your meal plan is only accessible to logged in users</blockquote>
        			<!-- Add links for login or other actions when user is not logged in -->
    		</c:if>
    		
${SMOKETEST}



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</div>
</body>
</html>