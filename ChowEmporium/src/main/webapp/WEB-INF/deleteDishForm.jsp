<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%@ include file="navbar.jsp"%>

	<h2>${dish.name}</h2>

	<form action="deleteDish.do" method="POST">

		<input type="hidden" name="id" value="${dish.id }"> 
		Are You Sure You Want To Delete?!
		<input type="submit" value="Submit " />
	</form>


</body>
</html>