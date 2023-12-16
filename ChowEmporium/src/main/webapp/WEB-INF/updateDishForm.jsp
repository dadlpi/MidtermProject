<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Dish</title>
</head>
<body>
		<%@ include file="navbar.jsp"%>

	<h2>${dish.name}</h2>

	<form action="updateDish.do" method="POST">

		<input type="hidden" name="id" value="${dish.id }"> Name: <input
			type="text" name="name" placeholder="${dish.name} "
			value="${dish.name}" /> <br> Update Description of the Job with
		a new Entry: <br>
		<textarea rows="5" cols="50" name="description" value="${dish.description }" placeholder = "${dish.description }" ></textarea>
		<input type="submit" value="Submit " />
	</form>





</body>
</html>