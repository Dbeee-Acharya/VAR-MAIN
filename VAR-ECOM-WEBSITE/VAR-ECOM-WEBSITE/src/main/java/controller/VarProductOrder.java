package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Order;
import model.Product;
import service.CartDAO;
import service.OrderDAO;
import service.ProductDAO;
import service.UserDAO;

/**
 * Servlet implementation class VarProductOrder
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/productOrder" })
public class VarProductOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VarProductOrder() {
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
		String userName = (String) session.getAttribute("userName");
		int orderTotal = Integer.parseInt(request.getParameter("totalPrice"));
		
		String address = request.getParameter("address");
		
		UserDAO udao = new UserDAO();
		udao.updateAddress(address, userName);
		
		udao = null;
		
		Order order = new Order();
		
		order.setOrderTotal(orderTotal);
		order.setOrderStatus("Processing");
		order.setUserName(userName);
		
		OrderDAO odao = new OrderDAO();
		
		try {
			if(odao.confirmOrder(order)) {
				request.setAttribute("orderStatus", "Your order is complete");
				odao = null;
				request.getRequestDispatcher("profile").forward(request, response);
				
				
			} else {
				request.setAttribute("orderStatus", "Your order could not be placed");
				request.getRequestDispatcher("profile").forward(request, response);
			}
		} catch (SQLException | ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
