package service;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

import model.Cart;
import model.Product;
import util.DbConnection;

public class ProductDAO {
	private Connection connection;
	private PreparedStatement sqlStatement;
	private Boolean productAdded;
	private Blob blob;
	
	ResultSet resultSet;
	

	
	// connecting to database
	public ProductDAO() {
		connection = DbConnection.getDbConnection(); 
	}
	
	private static final String insertQuery = 
			"INSERT INTO products"
			+ "(productName, productPrice, "
			+ "productDescription, productStock, productImage)"
			+ "VALUES (?,?,?,?,?)";
	

	
	public boolean addProduct(Product product) throws SQLException {
		String selectQuery = "SELECT COUNT(*) FROM products";
		
		sqlStatement = connection.prepareStatement(selectQuery);
		resultSet = sqlStatement.executeQuery();
		
		//checking if product exists
		if(resultSet.next()) {
			if(!checkProductExists(product)) {
				productAdded = (insertProduct(product) > 0) ? true:false;
				
			} else {
				productAdded = false;
			}
		}
		
		
		return productAdded;
	}
	

	public int insertProduct(Product product) throws SQLException {
		sqlStatement = connection.prepareStatement(insertQuery);
		
		blob = connection.createBlob();
		blob.setBytes(1, product.getImageData());
		
		
		sqlStatement.setString(1, product.getProductName());
		sqlStatement.setInt(2, product.getProductPrice());
		sqlStatement.setString(3, product.getProductDescription());
		sqlStatement.setInt(4, product.getProductStock());
		sqlStatement.setBlob(5, blob);
		
		return sqlStatement.executeUpdate();
	}
	

	public boolean checkProductExists(Product product) throws SQLException {
		String checkQuery = "SELECT productId FROM products";
		Boolean productFound = false;
		
		sqlStatement = connection.prepareStatement(checkQuery);	
		resultSet = sqlStatement.executeQuery();
		
		while(resultSet.next()) {
			int productIdDb = resultSet.getInt("productID");
			
			productFound = (product.getProductId() == productIdDb) ? true:false;
		} 
		
		return productFound;	
	}
	
	public List<Product> getAllProducts() throws SQLException {
		sqlStatement = connection.prepareStatement("SELECT * FROM products");
		resultSet = sqlStatement.executeQuery();
		
		List<Product> listOfProducts = new ArrayList<Product>();
		
		while(resultSet.next()) {
			int productId = resultSet.getInt("productId");
			String productName = resultSet.getString("productName");
			int productPrice = resultSet.getInt("productPrice");
			String productDescription = resultSet.getString("productDescription");
			int productStock = resultSet.getInt("productStock");
			
			
			Product product = new Product();
			
			product.setProductId(productId);
			product.setProductName(productName);
			product.setProductPrice(productPrice);
			product.setProductDescription(productDescription);
			product.setProductStock(productStock);
			product.setImageData(resultSet.getBlob("productImage").getBytes(1, (int)resultSet.getBlob("productImage").length()));
			
			listOfProducts.add(product);
				
		}
		
		return listOfProducts;	
	}


	public int editProduct(Product product) throws SQLException {
		
		sqlStatement = connection.prepareStatement("UPDATE products SET productName = ?, productPrice = ?, productDescription = ?, productStock = ? WHERE productId = ?");
		
		sqlStatement.setString(1, product.getProductName());
		sqlStatement.setInt(2, product.getProductPrice());
		sqlStatement.setString(3, product.getProductDescription());
		sqlStatement.setInt(4, product.getProductStock());
		sqlStatement.setInt(5, product.getProductId());
		
		return sqlStatement.executeUpdate();
	}
	
	public int updateImage(Product product) throws SQLException {
		sqlStatement = connection.prepareStatement("UPDATE products SET productImage = ? WHERE productId = ?");
		
		blob = connection.createBlob();
		blob.setBytes(1, product.getImageData());
		
		sqlStatement.setBlob(1, blob);
		sqlStatement.setInt(2, product.getProductId());
		
		return sqlStatement.executeUpdate();
	}


	public int deleteProduct(int productId) throws SQLException {
		sqlStatement = connection.prepareStatement("DELETE FROM products where productId = ?");
		
		sqlStatement.setInt(1, productId);
		
		return sqlStatement.executeUpdate();
	}


	public Product getProduct(int productId) throws SQLException {
		sqlStatement = connection.prepareStatement("SELECT * FROM products WHERE productId = ?");
		sqlStatement.setInt(1, productId);
		resultSet = sqlStatement.executeQuery();
		Product product = new Product();
		
		while(resultSet.next()) {
			String productName = resultSet.getString("productName");
			int productPrice = resultSet.getInt("productPrice");
			String productDescription = resultSet.getString("productDescription");
			int productStock = resultSet.getInt("productStock");
			
			product.setProductId(productId);
			product.setProductName(productName);
			product.setProductPrice(productPrice);
			product.setProductDescription(productDescription);
			product.setProductStock(productStock);
			product.setImageData(resultSet.getBlob("productImage").getBytes(1, (int)resultSet.getBlob("productImage").length()));
			
			
		}
		
		return product;
	}
	
	public boolean decreaseStock(int productId) throws SQLException {
		sqlStatement = connection.prepareStatement(
		        "UPDATE products SET productStock = productStock - 1 WHERE productId = ? AND productStock > 0"
		    );
		sqlStatement.setInt(1, productId);
		
		int rowsAffected = sqlStatement.executeUpdate();
		
		return rowsAffected > 0;

	}
	
	public List<Product> getCartProducts() throws SQLException {
		List<Product> productsInCart = new ArrayList<>();
		sqlStatement = connection.prepareStatement( "SELECT p.*, c.quantity FROM products p INNER JOIN cart c ON p.productId = c.productId");
        resultSet = sqlStatement.executeQuery();
        
        // Iterate through the result set and populate productsInCart list
        while (resultSet.next()) {
            Product product = new Product();
            product.setProductId(resultSet.getInt("productId"));
            product.setImageData(resultSet.getBlob("productImage").getBytes(1, (int)resultSet.getBlob("productImage").length()));
            product.setProductName(resultSet.getString("productName"));
            product.setProductPrice(resultSet.getInt("productPrice"));
            product.setProductDescription(resultSet.getString("productDescription"));
            product.setProductStock(resultSet.getInt("quantity"));
            
            productsInCart.add(product);
        }
        
        return productsInCart;
	}
	
	public int getProductStock(int productId) throws SQLException {
		 int productStock = 0;
		 sqlStatement = connection.prepareStatement("SELECT productStock FROM products WHERE productId = ?");
         sqlStatement.setInt(1, productId);
         
         // Execute the query
         resultSet = sqlStatement.executeQuery();
         
         // Check if a row was returned and retrieve the productStock value
         if (resultSet.next()) {
             productStock = resultSet.getInt("productStock");
         }
         
         return productStock;
	}
	
	public int numberOfProducts() throws SQLException {
		sqlStatement = connection.prepareStatement("SELECT COUNT(*) FROM products");
		resultSet = sqlStatement.executeQuery();
		
		int row =0;
		
		if(resultSet.next()) {
			row = resultSet.getInt(1);
		}
		
		return row;
	}

}
