package model;

public class Cart extends Product {
	private int quantity;
	private int productId;
	private int productStock;

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	@Override
	public int getProductId() {
		return this.productId;
	}
	
	@Override
	public void setProductId(int productId) {
		this.productId = productId;
	}
	
	@Override
	public int getProductStock() {
		return this.productStock;
	}
	
	@Override
	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}
	
}
