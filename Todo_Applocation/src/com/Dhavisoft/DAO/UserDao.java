package com.Dhavisoft.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Dhavisoft.Model.User;
import com.Dhavisoft.Utils.JDBCUtils;

public class UserDao {

	public static int registerEmployee(User employee) throws ClassNotFoundException {
		String INSERT_USERS_SQL = "INSERT INTO users"
				+ "  (first_name, last_name, username, password) VALUES "
				+ " (?, ?, ?, ?);";

		int result = 0;
		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, employee.getFirstName());
			preparedStatement.setString(2, employee.getLastName());
			preparedStatement.setString(3, employee.getUsername());
			preparedStatement.setString(4, employee.getPassword());

			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			result = preparedStatement.executeUpdate();
			preparedStatement.close();
			connection.close();
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return result;
	}
	public static boolean CheckUsername(String username)
	{	boolean st=false;
	try (Connection connection = JDBCUtils.getConnection();
			// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("select * from users where username=?")){
		preparedStatement.setString(1, username);
		System.out.println(preparedStatement);
		// Step 3: Execute the query or update query
		ResultSet rs=preparedStatement.executeQuery();
	st = rs.next();
	preparedStatement.close();
	connection.close();
	} catch (SQLException e) {
		// process sql exception
		JDBCUtils.printSQLException(e);
	}
		return st;
		
	}
	public static boolean EditProfile(User ub)
	{boolean st=false;
	try (Connection connection = JDBCUtils.getConnection();
			
			PreparedStatement preparedStatement = connection.prepareStatement("Update users set first_name=?,last_name=?,username=?,password=? where id=?")){
		preparedStatement.setString(1, ub.getFirstName());
		preparedStatement.setString(2, ub.getLastName());
		preparedStatement.setString(3, ub.getUsername());
		preparedStatement.setString(4, ub.getPassword());
		preparedStatement.setInt(5,ub.getId());
		System.out.println(preparedStatement);
		// Step 3: Execute the query or update query
		ResultSet rs=preparedStatement.executeQuery();
	st = rs.next();
	preparedStatement.close();
	connection.close();

	} catch (SQLException e) {
		// process sql exception
		JDBCUtils.printSQLException(e);
	}
	
	return st;
		
	}

}
