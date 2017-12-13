package order;

//상품관련
public class ProdBean {
	
	private int num;
	private int categoryid;
	private String productname;
	private int price;
	private String categoryname;
	
	public ProdBean() {}

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

	public String getCategoryname() {
		return categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}

	public ProdBean(int num, int categoryid, String productname, int price, String categoryname) {
		super();
		this.num = num;
		this.categoryid = categoryid;
		this.productname = productname;
		this.price = price;
		this.categoryname = categoryname;
	}	
	
}
