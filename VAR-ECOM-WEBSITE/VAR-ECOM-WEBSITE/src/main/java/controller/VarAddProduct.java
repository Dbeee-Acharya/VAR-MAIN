package controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import appConstant.ViewPages;
import model.Product;
import service.ProductDAO;

/**
 * Servlet implementation class VarAddProduct
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/addProduct" })
@MultipartConfig (fileSizeThreshold = 1024 * 1024 * 2, // 2MB
					maxFileSize = 1024 * 1024 * 10,      // 10MB
					maxRequestSize = 1024 * 1024 * 50)  // 50MB
public class VarAddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VarAddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    //Initialise productDao Object
    private ProductDAO dao;
    
    @Override
    public void init() {
    	dao = new ProductDAO();
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
		//doGet(request, response);
		
		//ya bata
		
		String productName = request.getParameter("productName");
		String SproductPrice = request.getParameter("productPrice");
		int productPrice = 0;
		String productDescription = request.getParameter("productDescription");
		String SproductStock = request.getParameter("productStock");
		int productStock = 0;
		Part filePart = request.getPart("image");
		
		if(productName.isEmpty() || SproductPrice.isEmpty() || productDescription.isEmpty() || SproductStock.isEmpty() || filePart == null) {
			request.setAttribute("productAddError", "Product Values Invalid");
			request.getRequestDispatcher("adminPanel").forward(request, response);
			System.out.println("product items not valid");
			
		} else {
			productPrice = Integer.parseInt(SproductPrice);
			productStock = Integer.parseInt(SproductStock);
			
			InputStream imageStream = filePart.getInputStream();
			ByteArrayOutputStream buffer = new ByteArrayOutputStream();
			
			int bytesRead;
			int sizeInBytes = 1024 * 1024 * 2;
			byte[] data = new byte[sizeInBytes];
			
			while ((bytesRead = imageStream.read(data, 0, data.length)) != -1 ) {
				buffer.write(data, 0, bytesRead);
			}
			
			byte[] imageData = buffer.toByteArray();
			
			
			// Creating a new product object with the given info
			Product product = new Product();
			product.setProductName(productName);
			product.setProductPrice(productPrice);
			product.setProductDescription(productDescription);
			product.setProductStock(productStock);
			product.setImageData(imageData);
			
			try {
				boolean productAdded = dao.addProduct(product);
				
				if(productAdded) {
					response.sendRedirect(request.getContextPath() + "/adminPanel");
				} else {
					response.sendRedirect(request.getContextPath() + "/adminPanel");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}	
	}

}
