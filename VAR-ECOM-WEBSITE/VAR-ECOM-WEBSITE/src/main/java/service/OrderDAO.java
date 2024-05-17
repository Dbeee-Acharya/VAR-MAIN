package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import model.Order;
import model.Product;
import util.DbConnection;

public class OrderDAO {
	private Connection connection;
	private PreparedStatement sqlStatement;
	private ResultSet resultSet;
	private boolean userAdded;
	
	public OrderDAO() {
		connection = DbConnection.getDbConnection();
	}
	
	
	
	public boolean confirmOrder(Order order) throws SQLException {
		int row = 0;
		
		sqlStatement = connection.prepareStatement("INSERT INTO orders (username, orderStatus, orderTotal) VALUES (?,?,?)");
		sqlStatement.setString(1, order.getUserName());
		sqlStatement.setString(2, order.getOrderStatus());
		sqlStatement.setInt(3, order.getOrderTotal());
		
		row = sqlStatement.executeUpdate();
		
		
		return row > 0;
	}
	
	public List<Order> getAllOrders() throws SQLException {
		sqlStatement = connection.prepareStatement("SELECT * FROM orders");
		resultSet = sqlStatement.executeQuery();
		
		List<Order> listOfProducts = new ArrayList<Order>();
		
		
		
		while(resultSet.next()) {
			Order order = new Order();
			
			order.setOrderId(resultSet.getInt("orderId"));
			order.setOrderStatus(resultSet.getString("orderStatus"));
			order.setOrderTotal(resultSet.getInt("orderTotal"));
			order.setUserName(resultSet.getString("userName"));
			
			listOfProducts.add(order);
				
		}
		
		return listOfProducts;	
	}

}
