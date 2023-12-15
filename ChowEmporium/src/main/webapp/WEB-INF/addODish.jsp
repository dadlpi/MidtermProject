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
	<div class="container">


		<form action="addDishAtDb.do" method="post">
			<div class="row mb-3">
				<label for="inputName3" class="col-sm-2 col-form-label">Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputName3" name="name">
				</div>
			</div>

			<div class="row mb-3">
				<label for="inputdescription3" class="col-sm-2 col-form-label">Description</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputDescription3"
						name="description">
				</div>
			</div>

			<div class="row mb-3">
				<label for="inputdescription3" class="col-sm-2 col-form-label">Calories</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" id="inputDescription3"
						name="calories">
				</div>
			</div>

			<div class="row mb-3">
				<label for="inputdescription3" class="col-sm-2 col-form-label">Protein
					in grams</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" id="inputDescription3"
						name="proteinGrams">
				</div>
			</div>

			<div class="row mb-3">
				<label for="inputdescription3" class="col-sm-2 col-form-label">Carbs
					in grams</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" id="inputDescription3"
						name="carbsGrams">
				</div>
			</div>

			<div class="row mb-3">
				<label for="inputdescription3" class="col-sm-2 col-form-label">Fat
					in grams</label>
				<div class="col-sm-10">
					<input type="number" class="form-control" id="inputDescription3"
						name="fatGrams">
				</div>
			</div>

			<div class="row mb-3">
				<label for="inputdescription3" class="col-sm-2 col-form-label">URL</label>
				<div class="col-sm-10">
					<input type="text" name="recipeUrl" class="form-control" id="inputDescription3">
				</div>
			</div>


			<fieldset class="row mb-3">
				<legend class="col-form-label col-sm-2 pt-0">Meal Type</legend>
				<div class="col-sm-10">

					<div class="form-check">
						<input class="form-check-input" type="radio" name="mealType.id"
							id="gridRadios1" value="1" checked> <label
							class="form-check-label" for="gridRadios1"> Breakfast </label>
					</div>

					<div class="form-check">
						<input class="form-check-input" type="radio" name="mealType.id"
							id="gridRadios2" value="2"> <label
							class="form-check-label" for="gridRadios2"> Lunch </label>
					</div>

					<div class="form-check">
						<input class="form-check-input" type="radio" name="mealType.id"
							id="gridRadios3" value="3"> <label
							class="form-check-label" for="gridRadios3"> Dinner </label>
					</div>

				</div>
			</fieldset>

			<fieldset class="row mb-3">
				<legend class="col-form-label col-sm-2 pt-0">Cuisine</legend>

				<div class="row mb-3">
					<div class="col-sm-10 offset-sm-2">


						<c:forEach items="${cuisines}" var="cuisine">
							<div class="form-check">
								<input class="form-check-input" type="checkbox"
									name="selectedCuisines" value="${cuisine.id}"> <label
									class="form-check-label" for="cuisine1">${cuisine.name}
								</label>
							</div>
						</c:forEach>

					</div>
				</div>

			</fieldset>

			<fieldset class="row mb-3">
				<legend class="col-form-label col-sm-2 pt-0">Diet Category</legend>

				<div class="row mb-3">
					<div class="col-sm-10 offset-sm-2">


						<c:forEach items="${dietCategories}" var="dietCategory">
							<div class="form-check">
								<input class="form-check-input" type="checkbox"
									name="selectedCategories" value="${dietCategory.id}"> <label
									class="form-check-label" for="cuisine1">${dietCategory.name}
								</label>
							</div>
						</c:forEach>

					</div>
				</div>
			</fieldset>

			<fieldset class="row mb-3">
				<legend class="col-form-label col-sm-2 pt-0">Diet
					Restrictions</legend>

				<div class="row mb-3">
					<div class="col-sm-10 offset-sm-2">

						<c:forEach items="${restrictions}" var="dietaryRestriction">
							<div class="form-check">
								<input class="form-check-input" type="checkbox"
									name="selectedRestrictions" value="${dietaryRestriction.id}"> <label
									class="form-check-label" for="cuisine1">${dietaryRestriction.name}
								</label>
							</div>
						</c:forEach>

					</div>
				</div>
			</fieldset>
			<button type="submit" class="btn btn-primary">Add Meal</button>
		</form>



		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
			crossorigin="anonymous"></script>


	</div>
</body>
</html>