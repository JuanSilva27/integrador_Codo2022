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

@WebServlet("/FindAllTicketsController")
public class FindAllTicketsController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ITicketDAO dao = new TicketDAOImpl();
		
		List<Ticket> tickets = new ArrayList<>();
		
		try {
			tickets = dao.findAll();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		req.setAttribute("tickets", tickets);
		getServletContext().getRequestDispatcher("/allTickets.jsp").forward(req, res);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		doGet(req, resp);
	}
}
