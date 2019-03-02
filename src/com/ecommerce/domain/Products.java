package com.ecommerce.domain;

public class Products {
	private int id;
	private String name;
	private float price;
	
	public Products(int id, String name, float price) {
		this.id = id;
		this.name = name;
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public float getPrice() {
		return price;
	}

	public int getId() {
		return id;
	}
}
