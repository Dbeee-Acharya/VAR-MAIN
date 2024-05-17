package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appConstant.ViewPages;
import model.User;
import service.UserDAO;

/**
 * Servlet implementation class VarListOfUsers
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/listOfUsers" })
public class VarListOfUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VarListOfUsers() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    UserDAO udao;
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	udao = new UserDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("dopost ma ayo");
		
		try {
			List<User> listOfUsers = udao.getListOfUsers();
			
			request.setAttribute("listOfUsers", listOfUsers);
			request.getRequestDispatcher(ViewPages.USER_LIST_PAGE).forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doget ma ayo");
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
