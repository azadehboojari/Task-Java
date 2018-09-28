<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>home page</title>
	 
	</head>
<body>
	<h1>Welcome, ${user.first} ${user.last}</h1>
	
		<table>
  <thead>
        <tr>
            <th>Task</th>
            <th>Creator</th>
            <th>Assignee</th>
            <th>Priority</th>
            
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

<a href="/users/${user.id}/task/new"> Create Task</a>

	
</body>
</html> 