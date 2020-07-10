package kook;

import java.sql.Timestamp;

public class WarehousingDTO {
	private String productID;
	private String name;
	private String origin;
	private String warehousing_date;
	private String expiration;
	private long ex_during;
	private int price;
	private int amount;
	
	public void setProductID(String productID) {
		this.productID = productID;
	}
	 
	public String getProductID() {
		return productID;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	
	public String getOrigin() {
		return origin;
	}
	
	public void setWarehousing_date(String warehousing_date) {
		this.warehousing_date = warehousing_date;
	}
	
	public String getWarehousing_date() {
		return warehousing_date;
	}
	
	public void setExpiration(String expiration) {
		this.expiration = expiration;
	}
	
	public String getExpiration() {
		return expiration;
	}
	
	public void setEx_during(long ex_during) {
		
		this.ex_during = ex_during;
	}
	
	public long getEx_during() {
		return ex_during;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public int getAmount() {
		return amount;
	}
}
