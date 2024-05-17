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
 * Servlet implementation class VarUpdate
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/editProduct" })
public class VarUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VarUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    ProductDAO dao;
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
//    	super.init();
    	dao = new ProductDAO();
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
		int productId = Integer.parseInt(request.getParameter("productId"));
		
		try {
			Product product = dao.getProduct(productId);
			request.setAttribute("product", product);
			request.getRequestDispatcher(ViewPages.EDIT_PRODUCT_PAGE).forward(request, response);
			//response.sendRedirect(request.getContextPath()+ViewPages.EDIT_PRODUCT_PAGE);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(productId);
		
	}

}
