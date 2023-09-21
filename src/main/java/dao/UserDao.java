package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.User;

public class UserDao {
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
		    // CARREGA O DRIVER JDBC
		    Class.forName("com.mysql.cj.jdbc.Driver");

		    // ESTABELECE A CONEXÃO
		    String url = "jdbc:mysql://localhost:3306/banco_de_dados";
		    String username = "seu_usuario";
		    String password = "sua_senha";
		    
		    conn = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
		    e.printStackTrace();
		}
		
		return conn;
	}

	public static void insertUser(User user) {
		
		try {
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement("INSERT INTO user (name, email) VALUES (?, ?)");
			
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			
			ps.execute();
		}catch(Exception e) {
			System.out.println(e);
		}
		
	}
	
	public static User getUserById(int id) {
		User user = null;
		
		try {
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM user WHERE id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				user = new User();
				
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return user;
	}
	
	public static List<User> getAllUser(){

		List<User> list = new ArrayList<>();
		
		try {
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM user");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				list.add(user);
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return list;
	}
	
	public static int updateUser(User user) {
		int status = 0;
		
		try {
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement("UPDATE user SET name=?, email=? WHERE id=?");
			
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setInt(3, user.getId());
			
			status = ps.executeUpdate();
		}catch(Exception e){
			System.out.println(e);
		}
		
		return status;
	}
	
	public static int removeUser(User user) {
	int status = 0;
		
		try {
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement("DELETE FROM user WHERE id=?");
			
			ps.setInt(1, user.getId());
			
			status = ps.executeUpdate();
		}catch(Exception e){
			System.out.println(e);
		}
		
		return status;
	}

}
