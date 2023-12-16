<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here....or else</title>
</head>
<body>
		<%@ include file="navbar.jsp"%>

	<h5>${loggedInUser.firstName}${loggedInUser.lastName}</h5>
	

	<div>
		<c:choose>
			<c:when test="${! empty loggedInUser.userCreatedDishes}">

				<c:forEach var="dish" items="${loggedInUser.userCreatedDishes}">
					<h5>
						<a href="deleteDishForm.do?dishId=${dish.id}">${dish.name}</a>
					</h5>

					<hr>
					<br>
					<br>
				</c:forEach>

			</c:when>
		</c:choose>
	</div>

</body>
</html>