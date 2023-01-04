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

@WebServlet("/FindAllTicketsOrder")
public class FindAllTicketsOrder extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{

		ITicketDAO dao = new TicketDAOImpl();
		
		List<Ticket> tickets = new ArrayList<>();
		
		try {
			tickets = dao.findAllOrderBy(req.getParameter("order"));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		req.setAttribute("tickets", tickets);
		getServletContext().getRequestDispatcher("/allTickets.jsp").forward(req, res);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		doGet(req, resp);
	}
}
