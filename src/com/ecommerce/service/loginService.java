package com.ecommerce.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class loginService {
	public boolean authenticate(String username, String password) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "tejas123");
			PreparedStatement ps = con.prepareStatement("select * from customer where name = ? and password = ?");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.first()) {
				return true;
			} else {
				return false;
			}
		} catch(Exception e) {
			System.out.println(e);
			return false;
		}
	}
}
