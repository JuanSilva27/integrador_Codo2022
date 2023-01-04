package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import OradorDAOImplement.OradorDAOImpl;
import dao.IOradorDAO;
import domain.Orador;

@WebServlet("/FindAllOradoresController")
public class FindAllOradoresController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		IOradorDAO dao = new OradorDAOImpl();
		
		List<Orador> oradores = new ArrayList<>();
		
		try {
			oradores = dao.findAll();
			System.out.println(oradores);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		req.setAttribute("oradores", oradores);
		getServletContext().getRequestDispatcher("/oradores.jsp").forward(req, res);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		doGet(req, resp);
	}
}
