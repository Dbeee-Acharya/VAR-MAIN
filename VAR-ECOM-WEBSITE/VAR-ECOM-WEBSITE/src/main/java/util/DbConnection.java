
package util;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class DbConnection {
	private static BasicDataSource dataSource;
	private static Connection connection;
	
	static {
		dataSource = new BasicDataSource();
		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/var-database");
		dataSource.setUsername("root");
		dataSource.setPassword("");
	}
	
	public static Connection getDbConnection() {
		try {
			connection = dataSource.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return connection; //returns the database connection
	}

}