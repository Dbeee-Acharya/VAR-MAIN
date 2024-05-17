package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CartDAO;

/**
 * Servlet implementation class VarLogout
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/logout" })
public class VarLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

    
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
//    	super.init();
    }

    public VarLogout() {
        super();
        // TODO Auto-generated constructor stub
    }    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		CartDAO cDao = new CartDAO();
		
		if(session != null ) {
			try {
				cDao.clearCart();
				session.invalidate();
				response.sendRedirect(request.getContextPath()+"/homepage");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} else { 
			response.sendRedirect(request.getContextPath()+"/login");
		}
		
		
	}

}
