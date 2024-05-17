package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import appConstant.ViewPages;
import service.UserDAO;

/**
 * Servlet implementation class VarUserLogin
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class VarUserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VarUserLogin() {
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
		request.getRequestDispatcher(ViewPages.LOGIN_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String form = request.getParameter("submit");

		
		if (form != null) {
			String userName = request.getParameter("userName");
			String userPassword = request.getParameter("userPassword");
			
			if(userName.equals("admin") && userPassword.equals("adminadmin")) {
				HttpSession session = request.getSession();
				session.setAttribute("userName", userName);
				session.setAttribute("role", "admin");
				session.setMaxInactiveInterval(5 * 60);
				System.out.println("login bhayo ra aba redirect huncha admin");
				response.sendRedirect(request.getContextPath()+"/adminPanel");
				return;
				
			} else {
				try {
					boolean loggedIn = userDao.UserLogin(userName, userPassword);
					if(loggedIn) {
						HttpSession session = request.getSession();
						session.setAttribute("userName", userName);
						session.setAttribute("role", "user");
						session.setMaxInactiveInterval(30 * 60);
						System.out.println("login bhayo ra aba redirect huncha user");
						response.sendRedirect(request.getContextPath()+"/profilePage");
						return;
						
					} else {
						request.setAttribute("error1", "invalid username or password");
						doGet(request, response);
						System.out.println("login bhayena");
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		} else {
			doGet(request, response);
		}
	}

}
