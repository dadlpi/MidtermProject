<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Dish</title>
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

		<%@ include file="navbar.jsp"%>

	<h2 class = "regularText" id= "updateFormHeader">${dish.name}</h2>

	<form action="updateDish.do" method="POST" class ="updateForm">

		<input type="hidden" class="regularText" name="id" value="${dish.id }"><h4 class = "regularText">Name</h4>  <input
			type="text" name="name" placeholder="${dish.name} "
			
			value="${dish.name}" /> <br><br> 
			<h4 class = "regularText">Description</h4>
			 <br>
		<textarea   placeholder = "${dish.description}" rows="5" cols="50" name="description" >${dish.description } </textarea>
		<br><input type="submit" value="Submit"  class ="btn btn-success" id="submitButtons" />
	</form>





</body>
</html>