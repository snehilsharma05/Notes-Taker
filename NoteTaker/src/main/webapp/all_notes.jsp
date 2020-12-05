<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.entities.*" %>
	<%@page import="com.helper.FactoryProvider" %>
	<%@page import="org.hibernate.Session" %>
	<%@page import="org.hibernate.Query" %>
	<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Notes</title>
<%@include file="all_css_js.jsp" %>
</head>
<body>
	<div class="container">
	<%@include file="navbar.jsp" %>
	<h1>All Notes Page</h1>
	<div class="row">
		<div class="col-md-12">
				<%
					Session s = FactoryProvider.getFactory().openSession();
					Query q = s.createQuery("from Note");
					List<Note>list = q.list();
					for(Note n:list)
					{
				%>
					<div class="card mt-3">
					  <img class="card-img-top m-4 mx-auto" src="img/notes.png" style="max-width:100px;" alt="Card image cap">
					  <div class="card-body">
					    <h5 class="card-title"><%=n.getTitle()%></h5>
					    <p class="card-text"><%=n.getContent()%></p>
					    <div class="container text-center mt-2">
					    <a href="#" class="btn btn-danger">Delete Note</a>
					    <a href="#" class="btn btn-primary">Update Note</a>
					    </div>
					  </div>
					</div>
				
				<% 
					}
					s.close();%>
				
		</div>
	</div>
	
	</div>
</body>
</html>