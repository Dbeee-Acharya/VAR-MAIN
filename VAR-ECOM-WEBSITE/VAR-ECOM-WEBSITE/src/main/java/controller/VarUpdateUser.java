package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import service.UserDAO;
import util.PasswordHash;

/**
 * Servlet implementation class VarUpdateUser
 */
@WebServlet("/updateUser")
public class VarUpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VarUpdateUser() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    UserDAO dao;
     
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	dao = new UserDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		String userName = (String) session.getAttribute("userName");
		int phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));
		String email = request.getParameter("email");
		
		User user = new User();
		
		user.setUserName(userName);
		user.setPhoneNumber(phoneNumber);
		user.setEmail(email);
		System.out.println("VARUPDATEUSER LINE 62 " + userName + email	);
		
		
		try {
			if(dao.updateUser(user)) {
				request.setAttribute("updateStatus", "User Updated Successfully");
				request.getRequestDispatcher("profilePage").forward(request, response);
			} else {
				request.setAttribute("updateStatus", "User not updated");
				request.getRequestDispatcher("profilePage").forward(request, response);				
			}
		} catch (SQLException | ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
				

		}
	

		}
}
