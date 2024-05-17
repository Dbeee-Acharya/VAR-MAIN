package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appConstant.ViewPages;
import model.Contact;
import service.ContactDAO;
import service.ProductDAO;
import service.UserDAO;

/**
 * Servlet implementation class VarDashboard
 */
@WebServlet("/dashboard")
public class VarDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VarDashboard() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    ContactDAO dao;
    ProductDAO pdao;
    UserDAO udao;
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
//    	super.init();
    	dao = new ContactDAO();
    	pdao = new ProductDAO();
    	udao = new UserDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			List<Contact> allMessages = dao.getAllMessages();
			int row = pdao.numberOfProducts();
			int numberOfUsers = udao.getNumberOfUsers();
			
			request.setAttribute("numberOfUsers", numberOfUsers);		
			request.setAttribute("messages", allMessages);
			request.setAttribute("numberOfProducts", row);
			request.getRequestDispatcher(ViewPages.ADMIN_DASHBOARD).forward(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
