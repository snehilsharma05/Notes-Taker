package com.servlets;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.Date;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet{
	protected void doPost(HttpServletRequest request,HttpServletResponse response)
	{
		try{
		String new_title = request.getParameter("title");
		String new_content = request.getParameter("content");
		int note_id = Integer.parseInt(request.getParameter("hidden_id").trim());
		
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		Note note = (Note)s.get(Note.class,note_id);
		note.setTitle(new_title);
		note.setContent(new_content);
		note.setAddedDate(new Date());
		tx.commit();
		s.close();
		
		response.sendRedirect("all_notes.jsp");
		}
		catch(Exception e){}
	}
}
