package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.xdevapi.SqlStatement;

import model.User;
import util.DbConnection;
import util.PasswordHash;

public class UserDAO {
	private Connection connection;
	private PreparedStatement sqlStatement;
	private ResultSet resultSet;
	private boolean userAdded;
	
	private static final String insertQuery = "INSERT INTO user_info"
			+ "(userName, phoneNumber, email, password)"
			+ "VALUES (?,?,?,?)";
	
	public UserDAO() {
		connection = DbConnection.getDbConnection();
	}
	
	
	public boolean registerUser(User user) throws SQLException {
		int row = 0;
		
		if(!checkUser(user)) {
			sqlStatement = connection.prepareStatement(insertQuery);
			
			sqlStatement.setString(1, user.getUserName());
			sqlStatement.setInt(2, user.getPhoneNumber());
			sqlStatement.setString(3, user.getEmail());
			sqlStatement.setString(4, user.getPassword());
			
			row = sqlStatement.executeUpdate();
			
			userAdded = (row>0)? true:false;
		} else {
			userAdded = false;
		}
		
		return userAdded;
	}
	
	public boolean checkUser(User user) throws SQLException {
		sqlStatement = connection.prepareStatement("SELECT userName, phoneNumber, email FROM user_info");
		resultSet = sqlStatement.executeQuery();
		
		
		while(resultSet.next()) {
			if(user.getUserName().equals(resultSet.getString("userName"))) {
				return true;
				
			}else if(user.getEmail().equals(resultSet.getString("email"))) {
				return true;
				
			}else if(user.getPhoneNumber() == resultSet.getInt("phoneNumber")) {
				return true;
			}
		}
		
		return false;
	}


	public boolean UserLogin(String userName, String password) throws SQLException {
		sqlStatement = connection.prepareStatement("select userName, password from user_info where userName = ?");
		sqlStatement.setString(1, userName);
		
		resultSet = sqlStatement.executeQuery();
		boolean loggedIn = false;
		
		if(resultSet.next()) {
			String passwordDb = resultSet.getString("password");
			loggedIn = (PasswordHash.verifyPassword(password, passwordDb))? true:false;
		}
		
		return loggedIn;
	}
	
	public User getUser(String userName) throws SQLException {
		sqlStatement = connection.prepareStatement("SELECT * FROM user_info WHERE userName = ?");
		sqlStatement.setString(1, userName);
		
		resultSet = sqlStatement.executeQuery();
		
		User user = new User();
		
		while(resultSet.next()) {
			user.setUserName(userName);
			user.setEmail(resultSet.getString("email"));
			user.setPhoneNumber(resultSet.getInt("phoneNumber"));
			user.setUserAddress(resultSet.getString("address"));
		}
		
		return user;
	}


	public void updateAddress(String address, String userName) {
		
		try {
			sqlStatement = connection.prepareStatement("UPDATE user_info SET address = ? WHERE userName = ?");
			sqlStatement.setString(1, address);
			sqlStatement.setString(2, userName);
			
			sqlStatement.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	public boolean updateUser(User user) throws SQLException {
		sqlStatement = connection.prepareStatement("UPDATE user_info SET phoneNumber = ?, email = ?, address = ? WHERE userName = ?");
		
		sqlStatement.setInt(1, user.getPhoneNumber());
		sqlStatement.setString(2, user.getEmail());
		sqlStatement.setString(3, user.getUserAddress());
		sqlStatement.setString(4, user.getUserName());
		
		return sqlStatement.executeUpdate() > 0;
	}


	public int getNumberOfUsers() throws SQLException {
		sqlStatement = connection.prepareStatement("SELECT COUNT(*) FROM user_info");
		resultSet = sqlStatement.executeQuery();
		
		int row =0;
		
		if(resultSet.next()) {
			row = resultSet.getInt(1);
		}
		
		return row;
	}
	
	public List<User> getListOfUsers() throws SQLException {
		sqlStatement = connection.prepareStatement("SELECT * FROM user_info");
		resultSet = sqlStatement.executeQuery();
		
		List<User> listOfUsers = new ArrayList<User>();
		
		while(resultSet.next()) {
			User user = new User();
			
			user.setUserName(resultSet.getString("userName"));
			user.setEmail(resultSet.getString("email"));
			user.setPhoneNumber(resultSet.getInt("phoneNumber"));
			user.setUserAddress(resultSet.getString("address"));
			
			listOfUsers.add(user);
		}
		
		return listOfUsers;
	}

}
