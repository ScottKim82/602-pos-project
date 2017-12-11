package product;

public class ProdBean {
	
	private int num;
	private int categoryid;
	private String productname;
	private int price;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public ProdBean(int num, int categoryid, String productname, int price) {
		super();
		this.num = num;
		this.categoryid = categoryid;
		this.productname = productname;
		this.price = price;
	}


}
