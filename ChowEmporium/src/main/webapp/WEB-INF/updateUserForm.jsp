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
<div class="background-container">
		<img class = "pizzamoon"
			src="img/download.png"
			alt=""> 
		<div class="stars"></div>
		<div class="twinkling"></div>
		<div class="clouds"></div>
	</div>


<h1>Update User form for ${loggedInUser.firstName} ${loggedInUser.lastName}</h1>


<form class="userUpdate" action="updateUserAtDb.do" method="post">
<table>
  <tbody>
    <tr>
      <th><label>Update User Email</label></th>
      <td><input type="text" name="email" value="${loggedInUser.email}"></td>
    </tr>

    <tr>
      <th><label>Update User Password</label></th>
      <td><input type="password" name="password" value="${loggedInUser.password}"></td>
    </tr>


    <tr>
      <th><label>Update Profile Image</label></th>
      <td><input type="text" name="profileImage" value="${loggedInUser.profileImage}"></td>
    </tr>

    <tr>
      <th><label>Update First Name</label></th>
      <td><input type="text" name="firstName" value="${loggedInUser.firstName}"></td>
    </tr>

    <tr>
      <th><label>Update Last Name</label></th>
      <td><input type="text" name="lastName" value="${loggedInUser.lastName}"></td>
    </tr>

<%--     <tr>
      <th><label>Update Last update</label></th>
      <td><input type="text" name="lastUpdate" value="${loggedInUser.getLastUpdate}"></td>
    </tr> --%>

    <tr>
      <th></th>
      <td><input type="submit" value = "Update User"></input> </td>
    </tr>
  </tbody>
</table>
		
	</form>
	

</body>
</html>