package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import TicketDAOImplement.TicketDAOImpl;
import dao.ITicketDAO;
import domain.Ticket;

@WebServlet("/CreateTicketsController")
public class CreateTicketsController extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String nombre = req.getParameter("nombre");
		String apellido = req.getParameter("apellido");
		Long cantidad = Long.parseLong( req.getParameter("cantidad"));
		Long categoria = Long.parseLong( req.getParameter("categoria"));
		Long total = Long.parseLong( req.getParameter("inputTotal"));
		String mail = req.getParameter("mail");

		
		var ticket = new Ticket (nombre, apellido, cantidad,categoria,total,mail);
		
		ITicketDAO dao = new TicketDAOImpl();
		
		try {
			dao.create(ticket);
		}catch (Exception e) {
			e.printStackTrace();
		}
		getServletContext().getRequestDispatcher("/FindAllTicketsController").forward(req, res);
	}
}
