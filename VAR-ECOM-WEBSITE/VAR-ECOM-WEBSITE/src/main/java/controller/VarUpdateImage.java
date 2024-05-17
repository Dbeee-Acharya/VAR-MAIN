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

import model.Product;
import service.ProductDAO;

/**
 * Servlet implementation class VarUpdateImage
 */
@MultipartConfig (fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10,      // 10MB
maxRequestSize = 1024 * 1024 * 50)  // 50MB
@WebServlet(asyncSupported = true, urlPatterns = { "/imageUpdate" })
public class VarUpdateImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VarUpdateImage() {
        super();
        // TODO Auto-generated constructor stub
    }
    
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
		int productId = Integer.parseInt(request.getParameter("productId"));
		
		Part filePart = request.getPart("image");
		InputStream imageStream = filePart.getInputStream();
		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		
		int bytesRead;
		int sizeInBytes = 1024 * 1024 * 2;
		byte[] data = new byte[sizeInBytes];
		
		while ((bytesRead = imageStream.read(data, 0, data.length)) != -1 ) {
			buffer.write(data, 0, bytesRead);
		}
		
		byte[] imageData = buffer.toByteArray();
		
		Product product = new Product();
		
		product.setProductId(productId);
		product.setImageData(imageData);
		
		try {
			int result = dao.updateImage(product);
			request.getRequestDispatcher("adminPanel").forward(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
