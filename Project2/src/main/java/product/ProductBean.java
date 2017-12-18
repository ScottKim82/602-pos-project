package product;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;

//상품관련
public class ProductBean {
	
	private int num;	
	private int categoryid;
	
	@NotEmpty(message="상품금액을 입력하세요")
	private String productname;
	
	@NumberFormat
	private int price;
	
	private String categoryname;	
		
	public ProductBean() {}

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

	public ProductBean(int num, int categoryid, String productname, int price, String categoryname) {
		super();
		this.num = num;
		this.categoryid = categoryid;
		this.productname = productname;
		this.price = price;
		this.categoryname = categoryname;
	}
	


	
}
