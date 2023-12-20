<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<link rel="icon" type="image/x-icon" href="img/download.ico">
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
    <div class="container text-center">
        <div>
            <h1>User Registration - Sign Up</h1>
        </div>
        <form action="registerUserAtDb.do"
            method="POST" style="max-width: 600px; margin: 0 auto;">
        <div class="m-3">
            <div class="form-group row">
                <label class="col-4 col-form-label">E-mail: </label>
                <div class="col-8">
                    <input type="email" name="email" class="form-control" required />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-4 col-form-label">Username: </label>
                <div class="col-8">
                    <input type="username" name="username" class="form-control" required />
                </div>
            </div>
             
      <div class="form-group row">
                <label class="col-4 col-form-label">Password: </label>
                <div class="col-8">
                    <input type="password" name="password" th:field="*{password}" class="form-control"
                            required minlength="6" maxlength="100"/>
                </div>
            </div>
             
               <div class="form-group row">
                <label class="col-4 col-form-label">First Name: </label>
                <div class="col-8">
                    <input type="text" name="firstName" class="form-control"
                            required minlength="2" maxlength="20"/>
                </div>
            </div>
             
            <div class="form-group row">
                <label class="col-4 col-form-label">Last Name: </label>
                <div class="col-8">
                    <input type="text" name="lastName" class="form-control"
                            required minlength="2" maxlength="20" />
                </div>
            </div> 
             
            <div>
                <button type="submit" class="btn btn-primary" id="submitButtons">Sign Up</button>
            </div>
        </div>
        </form>
    


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</div>
</body>
</html>