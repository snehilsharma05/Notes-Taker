<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Notes!</title>
<%@include file="all_css_js.jsp" %>
</head>
<body>
	<div class="container">
	<%@include file="navbar.jsp" %><br>
	<h1>Please fill your notes Detail</h1>
	
	<!-- adding form -->
			<form action="SaveNoteServlet" method="post">
		  <div class="form-group">
		    <label for="title">Note title</label>
		    <input type="text" class="form-control" name="title" id="title" aria-describedby="emailHelp" placeholder="Enter here" required>
		    
		  </div>
		  <div class="form-group">
		    <label for="content">Content</label>
		    <textarea class="form-control" name="content" id="content" style="height:300px;" placeholder="Enter description" required></textarea>
		  </div>
		  <div class="container text-center">
		  <button type="submit" class="btn btn-primary">Add Note!</button>
		  </div>
		</form>
	
	</div>
</body>
</html>