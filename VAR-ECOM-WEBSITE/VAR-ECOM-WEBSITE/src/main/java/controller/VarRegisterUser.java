package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appConstant.ViewPages;
import model.User;
import service.UserDAO;
import util.PasswordHash;

/**
 * Servlet implementation class VarRegisterUser
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
public class VarRegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VarRegisterUser() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private UserDAO userDao;
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	userDao = new UserDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher(ViewPages.REGISTER_USER_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName = request.getParameter("userName");
		int phoneNumber = 0;
		String SphoneNumber = request.getParameter("phoneNumber");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if(SphoneNumber.isEmpty()) {
			request.setAttribute("fError", "Invalid Credentials");
			request.getRequestDispatcher(ViewPages.REGISTER_USER_PAGE).forward(request, response);
		} else {
			phoneNumber = Integer.parseInt(SphoneNumber);
		}
		
		User user = new User();
		
		user.setUserName(userName);
		user.setPhoneNumber(phoneNumber);
		user.setEmail(email);
		user.setPassword(PasswordHash.getPasswordHash(password));
		
		try {
			boolean userAdded = userDao.registerUser(user);
			
			if(userAdded) {
				request.setAttribute("register", "Successfully Registered");
				request.getRequestDispatcher("login").forward(request, response);
				//response.sendRedirect(request.getContextPath()+"/login");
			} else {
				request.setAttribute("error", "User Already Exists");
				request.getRequestDispatcher(ViewPages.REGISTER_USER_PAGE).forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
