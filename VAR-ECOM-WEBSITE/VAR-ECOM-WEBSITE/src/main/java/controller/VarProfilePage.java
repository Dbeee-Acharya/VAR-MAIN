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
import model.User;
import service.UserDAO;

/**
 * Servlet implementation class VarProfilePage
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/profilePage" })
public class VarProfilePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VarProfilePage() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private UserDAO user;
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	user = new UserDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession(false);
		
		if (session != null) {
			String userName = (String) session.getAttribute("userName");
			try {
				User getUser = user.getUser(userName);
				request.setAttribute("user", getUser);
				request.getRequestDispatcher(ViewPages.USER_PROFILE_PAGE).forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			response.sendRedirect(request.getContextPath()+"/login");
		}
		
		
		
//		request.getRequestDispatcher(ViewPages.USER_PROFILE_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
