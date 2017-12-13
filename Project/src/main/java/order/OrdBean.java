package order;

//안쓰고있음
public class OrdBean {
	
	private int oid;
	private String date;
	private int pnum;
	private int qty;	
	private int amount;		
	
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public OrdBean(int oid, String date, int pnum, int qty) {
		super();
		this.oid = oid;
		this.date = date;
		this.pnum = pnum;
		this.qty = qty;
		
	}
	
	public OrdBean() {}


}
