package com.Dhavisoft.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Dhavisoft.Model.LoginBean;
import com.Dhavisoft.Model.User;
import com.Dhavisoft.Utils.JDBCUtils;

public class LoginDao {

	public static boolean validate(LoginBean lb) throws ClassNotFoundException {
		boolean status = false;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = JDBCUtils.getConnection();
				
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from users where username = ? and password = ? ")) {
			preparedStatement.setString(1, lb.getUsername());
			preparedStatement.setString(2, lb.getPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();
			if(rs.next())
			{
				lb.setId(rs.getInt(1));
			}
			System.out.println(lb.getId());

			preparedStatement.close();
			connection.close();
		} catch (SQLException e) {
			
			JDBCUtils.printSQLException(e);
		}
		return status;
	}
	public static User UserById(int id)
	{
		User us=new User();


		try (Connection connection = JDBCUtils.getConnection();
				
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from users where id=?")) {
			preparedStatement.setInt(1, id);
	

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next())
				{
			us.setId(rs.getInt(1));
			us.setFirstName(rs.getString(2));
			System.out.println(us.getId());
			us.setLastName(rs.getString(3));
			us.setUsername(rs.getString(4));
			us.setPassword(rs.getString(5));
			System.out.println(us.getId());
			preparedStatement.close();
			connection.close();
				}

		} catch (SQLException e) {
			
			JDBCUtils.printSQLException(e);
		}
		
		
		return us;
		
	}
	
}
