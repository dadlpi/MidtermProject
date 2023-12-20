<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/main.css">
<meta charset="UTF-8">
<title>Update User Form</title>
<link rel = "icon" type = "image/x-icon" href ="img/download.ico">
</head>
<body>
<%@ include file="navbar.jsp"%>
<div class="background-container">
		<img class = "pizzamoon"
			src="img/download.png"
			alt=""> 
		<div class="stars"></div>
		<div class="twinkling"></div>
		<div class="clouds"></div>
	</div>


<h1 class ="regularText" >Update User form for ${loggedInUser.firstName} ${loggedInUser.lastName}</h1>


<form class="userUpdate" action="updateUserAtDb.do" method="post">
<table>
  <tbody>
    <tr>
      <th><label class ="regularText">Update Email:</label></th>
      <td><input type="text" name="email" value="${loggedInUser.email}"></td>
    </tr>
    <tr>
      <th><label class ="regularText"> Update Username:</label></th>
      <td><input type="text" name="username" value="${loggedInUser.username}"></td>
    </tr> 

    <tr>
      <th><label class ="regularText">Update Password:</label></th>
      <td><input type="password" name="password" value="${loggedInUser.password}"></td>
    </tr>


    <tr>
      <th><label class ="regularText">Update Profile Image</label></th>
      <td><input type="text" name="profileImage" value="${loggedInUser.profileImage}"></td>
    </tr>

    <tr>
      <th><label class ="regularText">Update First Name:</label></th>
      <td><input type="text" name="firstName" value="${loggedInUser.firstName}"></td>
    </tr>

    <tr>
      <th><label class ="regularText">Update Last Name:</label></th>
      <td><input type="text" name="lastName" value="${loggedInUser.lastName}"></td>
    </tr>
    <tr>
      <th><label class ="regularText">Update About Me:</label></th>
      <td><input type="text" name="aboutMe" value="${loggedInUser.aboutMe}"></td>
    </tr>


    <tr>
      <th></th>
      <td><input type="submit" value = "Update User" class ="btn btn-success" id="submitButtons"></input> </td>
    </tr>
  </tbody>
</table>
		
	</form>
	

</body>
</html>