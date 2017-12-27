package payment;

public class PaymentBean {
	
	String pname;
	int qty;
	int price;
	int amount;
	String paydate;
	
	
	public PaymentBean(String pname, int qty, int price, int amount, String paydate) {
		super();
		this.pname = pname;
		this.qty = qty;
		this.price = price;
		this.amount = amount;
		this.paydate = paydate;
	}


	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public int getQty() {
		return qty;
	}


	public void setQty(int qty) {
		this.qty = qty;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}


	public String getPaydate() {
		return paydate;
	}


	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}


	public PaymentBean() {}	

}
