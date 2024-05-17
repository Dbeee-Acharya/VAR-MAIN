package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appConstant.ViewPages;
import model.Cart;
import model.Product;
import service.CartDAO;
import service.ProductDAO;

/**
 * Servlet implementation class VarAddToCart
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/cart" })
public class VarAddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Integer[] cartItems;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VarAddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    CartDAO dao;
    ProductDAO pDao;
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	dao = new CartDAO();
    	pDao = new ProductDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int totalPrice = 0;
		
		try {
			List<Product> productsInCart = pDao.getCartProducts();
			
			
			for(Product imagedb: productsInCart) {
				String base64ImageData = Base64.getEncoder().encodeToString(imagedb.getImageData());
				imagedb.setBase64ImageData(base64ImageData);
			}
			
			for(Product product: productsInCart) {
				int price = product.getProductPrice();
				int quantity = product.getProductStock();
				price = price * quantity;
				totalPrice += price;
			}
			
			request.setAttribute("listOfProducts", productsInCart);
			request.setAttribute("totalPrice", totalPrice);
			System.out.println(totalPrice);
			request.getRequestDispatcher(ViewPages.CART_PAGE).forward(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("productId"));
		
		try {
			int stock = pDao.getProductStock(productId);
			if(stock > 0) {
				if(dao.addToCart(productId)) {
					pDao.decreaseStock(productId);
					response.sendRedirect(request.getContextPath() + "/cart");
				} else {
					System.out.println("Stock chaina");
					request.getRequestDispatcher("homepage").forward(request, response);
				}
			} else {
				System.out.println("Stock chaina");
				request.setAttribute("insufficientStock", "Insufficient Stock");
				response.sendRedirect(request.getContextPath() + "/homepage");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

}
