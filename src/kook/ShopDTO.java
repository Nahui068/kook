package kook;

public class ShopDTO {
	private String productID;
	private String name;
	private String image;
	private String content;
	private String origin;
	private String expiration;
	private String storage;
	private int amount;
	private int price;
	
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
	
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getImage() {
		return image;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	
	public String getOrigin() {
		return origin;
	}
	
	public void setExpiration(String expiration) {
		this.expiration = expiration;
	}
	
	public String getExpiration() {
		return expiration;
	}
	
	public void setStorage(String storage) {
		this.storage = storage;
	}
	
	public String getStorage() {
		return storage;
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
