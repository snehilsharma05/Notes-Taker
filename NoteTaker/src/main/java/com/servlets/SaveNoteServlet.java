package com.servlets;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;
@WebServlet("/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet{
	protected void doPost(HttpServletRequest request,HttpServletResponse response)
	{
		try{
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Note note = new Note(title,content,new Date());
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			s.save(note);
			tx.commit();
			s.close();
			PrintWriter out = response.getWriter();
			out.println("<h1 style='text-align:center;'>Note added successfully!</h1>");
		}catch(Exception e)
		{
			
		}
	}
}
