package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appConstant.ViewPages;
import model.Product;
import service.ProductDAO;

/**
 * Servlet implementation class VarHomepage
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/homepage" })
public class VarHomepage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO dao;
	
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
//		super.init(config);
		dao = new ProductDAO();
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VarHomepage() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			List<Product> listOfProducts = dao.getAllProducts();
			
			for(Product imagedb: listOfProducts) {
				String base64ImageData = Base64.getEncoder().encodeToString(imagedb.getImageData());
				imagedb.setBase64ImageData(base64ImageData);
			}
			
			request.setAttribute("listOfProducts", listOfProducts);
			request.getRequestDispatcher(ViewPages.HOME_PAGE).forward(request, response);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		request.getRequestDispatcher(ViewPages.HOME_PAGE).forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
