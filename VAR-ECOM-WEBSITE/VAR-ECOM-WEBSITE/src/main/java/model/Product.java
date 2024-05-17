package model;

import java.io.Serializable;

public class Product implements Serializable {
	private int productId;
	private String productName;
	private int productPrice;
	private String productDescription;
	private int productStock;
	private byte[] imageData;
	private String base64ImageData;
	
	public byte[] getImageData() {
		return imageData;
	}
	public void setImageData(byte[] imageData) {
		this.imageData = imageData;
	}
	public String getBase64ImageData() {
		return base64ImageData;
	}
	public void setBase64ImageData(String base64ImageData) {
		this.base64ImageData = base64ImageData;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public int getProductStock() {
		return productStock;
	}
	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}
	
	
}
