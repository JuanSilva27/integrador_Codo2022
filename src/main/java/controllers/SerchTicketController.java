package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import TicketDAOImplement.TicketDAOImpl;
import dao.ITicketDAO;
import domain.Ticket;
@WebServlet("/SerchTicketController")
public class SerchTicketController extends HttpServlet {
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{
		String claveBusqueda = req.getParameter("claveBusqueda");
		
		ITicketDAO dao = new TicketDAOImpl();
		List<Ticket> ticketsBuscados = new ArrayList<>();
		try {
			ticketsBuscados = dao.search(claveBusqueda);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		req.setAttribute("tickets", ticketsBuscados);
		
		getServletContext().getRequestDispatcher("/allTickets.jsp").forward(req, res);
		
	}
}
