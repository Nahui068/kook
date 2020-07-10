package kook;

import java.sql.Timestamp;

public class PurchaseDTO {
	private int purchaseID;
	private String id;
	private String userName;
	private String phone;
	private String address;
	private String email;
	private String comments;
	private String productID;
	private String productName;
	private int amount;
	private int price;
	private String card;
	private String cardNumber;
	private String cardNumber1;
	private String cardNumber2;
	private String cardNumber3;
	private String cardNumber4;
	private String installment;
	private String deliveryCheck;
	private String status;
	private Timestamp purchase_date;
	private String image;
	private String orderCancel;
	
	
	public int getPurchaseID() {
		return purchaseID;
	}
	public void setPurchaseID(int purchaseID) {
		this.purchaseID = purchaseID;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getCardNumber1() {
		return cardNumber1;
	}
	public void setCardNumber1(String cardNumber1) {
		this.cardNumber1 = cardNumber1;
	}
	public String getCardNumber2() {
		return cardNumber2;
	}
	public void setCardNumber2(String cardNumber2) {
		this.cardNumber2 = cardNumber2;
	}
	public String getCardNumber3() {
		return cardNumber3;
	}
	public void setCardNumber3(String cardNumber3) {
		this.cardNumber3 = cardNumber3;
	}
	public String getInstallment() {
		return installment;
	}
	public void setInstallment(String installment) {
		this.installment = installment;
	}
	public String getDeliveryCheck() {
		return deliveryCheck;
	}
	public void setDeliveryCheck(String deliveryCheck) {
		this.deliveryCheck = deliveryCheck;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(Timestamp purchase_date) {
		this.purchase_date = purchase_date;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getCardNumber4() {
		return cardNumber4;
	}
	public void setCardNumber4(String cardNumber4) {
		this.cardNumber4 = cardNumber4;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getOrderCancel() {
		return orderCancel;
	}
	public void setOrderCancel(String orderCancel) {
		this.orderCancel = orderCancel;
	}
	
}
