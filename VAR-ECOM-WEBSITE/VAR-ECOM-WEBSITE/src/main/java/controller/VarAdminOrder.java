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
import model.Contact;
import model.Order;
import service.OrderDAO;

/**
 * Servlet implementation class VarAdminOrder
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/adminOrder" })
public class VarAdminOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VarAdminOrder() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    OrderDAO odao;
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
//    	super.init();
    	odao = new OrderDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			List<Order> allOrders = odao.getAllOrders();	
			
			request.setAttribute("orders", allOrders);
			request.getRequestDispatcher(ViewPages.ADMIN_ORDER_PAGE).forward(request, response);
			
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
