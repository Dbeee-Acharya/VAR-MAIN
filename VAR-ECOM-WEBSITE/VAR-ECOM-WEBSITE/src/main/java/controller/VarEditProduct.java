package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appConstant.ViewPages;
import model.Product;
import service.ProductDAO;

/**
 * Servlet implementation class VarEditProduct
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/update" })
public class VarEditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

    
    private ProductDAO dao;
    
    @Override
    public void init() {
    	dao = new ProductDAO();
    }
    
    public VarEditProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher(ViewPages.EDIT_PRODUCT_PAGE).forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		String productName = request.getParameter("productName");
		int productPrice = Integer.parseInt(request.getParameter("productPrice"));
		String productDescription = request.getParameter("productDescription");
		int productStock = Integer.parseInt(request.getParameter("productStock"));
		
		Product product = new Product();
		
		product.setProductId(productId);
		product.setProductName(productName);
		product.setProductPrice(productPrice);
		product.setProductDescription(productDescription);
		product.setProductStock(productStock);
		
		try {
			int editProduct = dao.editProduct(product);
			
			
			if(editProduct > 0) {
				response.sendRedirect(request.getContextPath() +"/adminPanel");
//				request.getRequestDispatcher("adminPanel").forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath() +"/adminPanel");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
