package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Contact;
import service.ContactDAO;

/**
 * Servlet implementation class VarContactForm
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/contact" })
public class VarContactForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VarContactForm() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private ContactDAO dao;
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	dao = new ContactDAO();
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
		
		String email = request.getParameter("email");
		Long phoneNumber = Long.parseLong(request.getParameter("phoneNumber"));
		String text = request.getParameter("text");
		
		Contact contact = new Contact();
		
		contact.setEmail(email);
		contact.setPhoneNumber(phoneNumber);
		contact.setText(text);
		
		try {
			if(dao.addContact(contact)) {
				request.setAttribute("event", "Thankyou for your feedback!");
				request.getRequestDispatcher("about").forward(request, response);
			} else {
				request.setAttribute("event", "Error Encountered");
				request.getRequestDispatcher("about").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
