package order;

//상품+주문관련
public class ShoppingInfo {

	
	private int pnum;
	private String pname;
	private int qty;
	private int price;
	private int amount;	
	
	
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
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
	@Override
	public String toString() {
		return "ShoppingInfo [pnum=" + pnum + ", pname=" + pname + ", qty=" + qty + ", price=" + price + ", amount="
				+ amount + "]";
	}
	
	
}

