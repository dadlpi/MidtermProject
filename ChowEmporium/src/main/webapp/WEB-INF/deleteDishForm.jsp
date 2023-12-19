<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Are You Sure</title>
<link rel = "icon" type = "image/x-icon" href ="img/download.ico">
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

		<%@ include file="navbar.jsp"%>

	<h2 class="title">${dish.name}</h2>

	<form action="deleteDish.do" method="POST">

		<input type="hidden" name="id" value="${dish.id }"> 
		<h2 class="title">Are You Sure You Want To Delete?!</h2>
		<input type="submit" value="Submit " />
	</form>


</body>
</html>