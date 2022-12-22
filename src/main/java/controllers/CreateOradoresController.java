package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import OradorDAOImplement.OradorDAOImpl;
import dao.IOradorDAO;
import domain.Orador;

@WebServlet("/CreateOradoresController")
public class CreateOradoresController extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String nombre = req.getParameter("nombre");
		String apellido = req.getParameter("apellido");
		String tema = req.getParameter("tema");
		
		var orador = new Orador (nombre, apellido, tema);
		
		IOradorDAO dao = new OradorDAOImpl();
		
		try {
			dao.create(orador);
		}catch (Exception e) {
			e.printStackTrace();
		}
		getServletContext().getRequestDispatcher("/FindAllOradoresController").forward(req, res);
	}
}
