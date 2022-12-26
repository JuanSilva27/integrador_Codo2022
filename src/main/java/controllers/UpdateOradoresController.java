package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import OradorDAOImplement.OradorDAOImpl;
import dao.IOradorDAO;

@WebServlet("/UpdateOradoresController")
public class UpdateOradoresController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		IOradorDAO dao = new OradorDAOImpl();
		
		try {
			var orador = dao.getElementById(Long.parseLong(id));
			req.setAttribute("orador", orador);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		getServletContext().getRequestDispatcher("/editar.jsp").forward(req, res);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String nombre = req.getParameter("nombre");
		String apellido= req.getParameter("apellido");
		String tema = req.getParameter("tema");
		Long id = Long.parseLong(req.getParameter("id"));
		
		IOradorDAO dao = new OradorDAOImpl();
		
		try {
			var orador = dao.getElementById(id);
			
			orador.setNombre(nombre);
			orador.setApellido(apellido);
			orador.setTema(tema);
			dao.update(orador);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		getServletContext().getRequestDispatcher("/FindAllOradoresController").forward(req, res);
	}

}
