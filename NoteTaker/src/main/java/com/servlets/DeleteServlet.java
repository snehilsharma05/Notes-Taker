package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		try{
			//System.out.println("Reaching here");
			int note_id = Integer.parseInt(request.getParameter("id").trim());
			System.out.println(note_id);
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			Note note = (Note)s.get(Note.class, note_id); //firstly find object from DB using ID we passed when user clicked on delete btn
			s.delete(note); //delete method wants object to be deleted as argument
			tx.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");
		}catch(Exception e)
		{}
	}

	

}
