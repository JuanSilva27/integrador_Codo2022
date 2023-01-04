package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import OradorDAOImplement.OradorDAOImpl;
import dao.IOradorDAO;

@WebServlet("/DeleteOradoresControlller")
public class DeleteOradoresControlller extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		IOradorDAO dao = new OradorDAOImpl();
		
		try {
			dao.delete(Long.parseLong(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		getServletContext().getRequestDispatcher("/FindAllOradoresController").forward(req, res);
	}
}
