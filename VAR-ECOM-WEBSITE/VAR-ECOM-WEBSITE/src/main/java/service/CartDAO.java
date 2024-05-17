package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Cart;
import util.DbConnection;

public class CartDAO {
	private Connection connection;
	private PreparedStatement sqlStatement;
	ResultSet resultSet;
	
	public CartDAO() {
		connection = DbConnection.getDbConnection();
	}
	
	public boolean addToCart(int productId) throws SQLException {
		int quantityInCart = checkProductInCart(productId);
        
        if (quantityInCart > 0) {
            // If the product exists, increase the quantity by one
        	System.out.println("kati choti repeat?");
            int currentQuantity = quantityInCart;
            int newQuantity = currentQuantity + 1;
            System.out.println(newQuantity);
            
            sqlStatement = connection.prepareStatement("UPDATE cart SET quantity = ? WHERE productId = ?");
            sqlStatement.setInt(1, newQuantity);
            sqlStatement.setInt(2, productId);
            sqlStatement.executeUpdate();
            
            return true;
        } else {
            // If the product does not exist, insert a new row into the cart
            sqlStatement = connection.prepareStatement("INSERT INTO cart (productId, quantity) VALUES (?, 1)");
            sqlStatement.setInt(1, productId);
            sqlStatement.executeUpdate();
            System.out.println("add to cart bhayoo");
            
            return true;
        }
        
    }
	
	public int checkProductInCart(int productId) throws SQLException {
		int quantityInCart = 0;
		sqlStatement = connection.prepareStatement("SELECT quantity FROM cart WHERE productId = ?");
		sqlStatement.setInt(1, productId);
		resultSet = sqlStatement.executeQuery();
		
		if(resultSet.next()) {
			quantityInCart = resultSet.getInt("quantity");
		}
		
		return quantityInCart;
	}
	
	public List<Cart> getAllCart() throws SQLException {
		List<Cart> cartItems = new ArrayList<>();
		
		sqlStatement = connection.prepareStatement("SELECT * FROM cart");
        resultSet = sqlStatement.executeQuery();
        
        // Iterate through the result set and populate cartItems list
        while (resultSet.next()) {
            Cart cartItem = new Cart();
            cartItem.setProductId(resultSet.getInt("product_id"));
            cartItem.setQuantity(resultSet.getInt("quantity"));
            cartItems.add(cartItem);
        }
        
        return cartItems;
	}
	
	public void clearCart() throws SQLException {
		sqlStatement = connection.prepareStatement("TRUNCATE TABLE cart");
		sqlStatement.execute();
	}

	public boolean removeItem(int productId) throws SQLException {
		sqlStatement = connection.prepareStatement("DELETE FROM cart WHERE productId = ?");
		sqlStatement.setInt(1, productId);
		
		return sqlStatement.executeUpdate() > 0;
	}

}
