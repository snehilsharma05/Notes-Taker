<%@page import="com.helper.FactoryProvider,org.hibernate.Session,com.entities.Note"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Note</title>
 <%@include file="all_css_js.jsp" %>
</head>
<body>
	<div class="container">
    	<%@include file="navbar.jsp" %>
    	<h1>Update Note Page</h1>
    	<%
    		Session s = FactoryProvider.getFactory().openSession();
    		int note_id = Integer.parseInt(request.getParameter("id").trim());
    		Note note = (Note)s.get(Note.class, note_id);
    	%>
    	<form action="UpdateServlet" method="post">
    	<input value="<%=note.getId()%>" type="hidden"  name="hidden_id" />
		  <div class="form-group">
		    <label for="title">Note title</label>
		    <input type="text" class="form-control" name="title" id="title" value="<%=note.getTitle()%>" />
		  </div>
		  <div class="form-group">
		    <label for="content">Content</label>
		    <textarea class="form-control" name="content" id="content" style="height:300px;" placeholder="Enter description">
		    <%=note.getContent() %>
		    </textarea>
		  </div>
		  <div class="container text-center">
		  <button type="submit" class="btn btn-success">Update Your Note!</button>
		  </div>
		</form>
    	
    </div>
</body>
</html>