package com.ecommerce.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ecommerce.domain.Products;

public class cartService {
	public List<Products> fetchAll(){
		List<Products> productList = new ArrayList<Products>();
		Products products = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "tejas123");
			PreparedStatement ps = con.prepareStatement("select * from product");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				products = new Products(rs.getInt(1), rs.getString(2), rs.getFloat(3));
				productList.add(products);
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		return productList;
	}
	
	public void addToCart() {
		
	}
}
