package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import TicketDAOImplement.TicketDAOImpl;
import dao.ITicketDAO;

@WebServlet("/DeleteTicketsControlller")
public class DeleteTicketsControlller extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		ITicketDAO dao = new TicketDAOImpl();
		
		try {
			dao.delete(Long.parseLong(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		getServletContext().getRequestDispatcher("/FindAllTicketsController").forward(req, res);
	}
}
