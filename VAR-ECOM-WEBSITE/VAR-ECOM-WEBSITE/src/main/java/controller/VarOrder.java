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

import service.OrderDAO;
import service.ProductDAO;
import service.UserDAO;

/**
 * Servlet implementation class VarOrder
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/order" })
public class VarOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VarOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect(request.getContextPath() + "/order");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserDAO udao = new UserDAO();
		ProductDAO pdao = new ProductDAO();
		OrderDAO odao = new OrderDAO();
		
		
		System.out.println("VARORDER line 67");
		String address = request.getParameter("address");
		HttpSession session = request.getSession(false);
		String userName = (String) session.getAttribute("userName");
		System.out.println(userName);
		
		udao.updateAddress(address, userName);
		int orderTotal = 0;
		
		try {
			List<Product> cart = pdao.getCartProducts();
			Order order = new Order();
			
			for(Product product: cart) {
				int price = product.getProductPrice();
				int quantity = product.getProductStock();
				price = price * quantity;
				orderTotal += price;

			}
			
			order.setOrderTotal(orderTotal);
			order.setOrderStatus("Processing");
			order.setUserName(userName);
			
			if(odao.confirmOrder(order)) {
				request.setAttribute("orderStatus", "Your order is complete");
				request.getRequestDispatcher("profile").forward(request, response);
				
			} else {
				request.setAttribute("orderStatus", "Your order could not be placed");
				request.getRequestDispatcher("profile").forward(request, response);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
