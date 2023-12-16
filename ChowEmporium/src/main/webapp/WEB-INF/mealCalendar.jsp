<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

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
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<h2>Helping you on your nutritional journey, one week at a time</h2>


		<h2>List of Days of the Week with Meals</h2>

		<table>
			<thead>
				<tr>
					<th>Day</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><strong>Monday</strong>
						<ul>
							<li>Breakfast</li>
							<h5 class="something" id="">${dish.id}</h5>
							<li>Lunch</li>
							<li>Dinner</li>
						</ul></td>
				</tr>
				<tr>
					<td><strong>Tuesday</strong>
						<ul>
							<li>Breakfast</li>
							<li>Lunch</li>
							<li>Dinner</li>
						</ul></td>
				</tr>
				<tr>
					<td><strong>Wednesday</strong>
						<ul>
							<li>Breakfast</li>
							<li>Lunch</li>
							<li>Dinner</li>
						</ul></td>
				</tr>
				<tr>
					<td><strong>Thursday</strong>
						<ul>
							<li>Breakfast</li>
							<li>Lunch</li>
							<li>Dinner</li>
						</ul></td>
				</tr>
				<tr>
					<td><strong>Friday</strong>
						<ul>
							<li>Breakfast</li>
							<li>Lunch</li>
							<li>Dinner</li>
						</ul></td>
				</tr>
				<tr>
					<td><strong>Saturday</strong>
						<ul>
							<li>Breakfast</li>
							<li>Lunch</li>
							<li>Dinner</li>
						</ul></td>
				</tr>
				<tr>
					<td><strong>Sunday</strong>
						<ul>
							<li>Breakfast</li>
							<li>Lunch</li>
							<li>Dinner</li>
						</ul></td>
				</tr>
			</tbody>
		</table>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
			crossorigin="anonymous"></script>

	</div>
</body>
</html>