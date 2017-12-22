package payment;

public class PaymentdayBean {
	
	int totalprice;
	int paymenttype;
	String paydate;
	
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public int getPaymenttype() {
		return paymenttype;
	}
	public void setPaymenttype(int paymenttype) {
		this.paymenttype = paymenttype;
	}
	public String getPaydate() {
		return paydate;
	}
	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}
	public PaymentdayBean(int totalprice, int paymenttype, String paydate) {
		super();
		this.totalprice = totalprice;
		this.paymenttype = paymenttype;
		this.paydate = paydate;
	}
	
	public PaymentdayBean() {}	

}
