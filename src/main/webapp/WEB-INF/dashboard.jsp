<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Dashboard</title>
	     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	     <link rel="stylesheet" type="text/css" href="/css/dash.css">
	</head>
<body>
<div class="header">
	<a href="/users">Log Out</a>
	</div>
	<h1>Welcome, ${user.first} ${user.last}</h1>
	
	<div class='container d-flex justify-content-center'>
		
		<table class='table'>
	  		<thead>
	        <tr>
	            <th scope="col">Task</th>
	            <th scope="col">Creator</th>
	            <th scope="col">Assignee</th>
	            <th scope="col">Priority</th>  
	        </tr>
	    	</thead>
		    <tbody>
		        <c:forEach items="${task}" var="task" >
		        <tr>
		            <td> <a href="/users/task/${task.id}"> ${task.taskName} </a> </td>
		            <td> ${task.creator.first} ${task.creator.last}</td>
		       		<td> ${task.assignee.first} ${task.assignee.last}</td>
		            <td> ${task.priority} </td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
		</div>
	<div class='container d-flex justify-content-center'>
	<a href="/users/${user.id}/task/new" class="btn btn-warning"> Create Task</a>
	
	</div>
</body>
</html> 