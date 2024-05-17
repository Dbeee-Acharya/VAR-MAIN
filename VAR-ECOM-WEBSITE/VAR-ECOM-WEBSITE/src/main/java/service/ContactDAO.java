package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Contact;
import util.DbConnection;

public class ContactDAO {
	private Connection connection;
	private PreparedStatement sqlStatement;
	private Boolean messageSent;
	
	ResultSet resultSet;
	
	public ContactDAO() {
		connection = DbConnection.getDbConnection();
	}
	
	public boolean addContact(Contact contact) throws SQLException {
		sqlStatement = connection.prepareStatement("INSERT INTO contact (email, phoneNumber, text) VALUES (?,?,?)");
		
		sqlStatement.setString(1, contact.getEmail());
		sqlStatement.setLong(2, contact.getPhoneNumber());
		sqlStatement.setString(3, contact.getText());
		
		if(sqlStatement.executeUpdate()>0) {
			return true;
		} else {
			return false;
		}
	}
	
	public List<Contact> getAllMessages() throws SQLException {
		sqlStatement = connection.prepareStatement("SELECT * FROM contact");
		resultSet = sqlStatement.executeQuery();
		
		List<Contact> allContacts = new ArrayList<Contact>();
		
		while(resultSet.next()) {
			Contact contact = new Contact();
			
			contact.setEmail(resultSet.getString("email"));
			contact.setPhoneNumber(resultSet.getLong("phoneNumber"));
			contact.setText(resultSet.getString("text"));
			
			allContacts.add(contact);
		}
		
		return allContacts;
	}

}
