package employee;

//직원관련
public class EmpBean {
	  private int num;
	  private String name;
	  private String id;
	  private String password;
	  private String grande;
	  
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGrande() {
		return grande;
	}
	public void setGrande(String grande) {
		this.grande = grande;
	}
	public EmpBean(int num, String name, String id, String password, String grande) {
		super();
		this.num = num;
		this.name = name;
		this.id = id;
		this.password = password;
		this.grande = grande;
	}
	
	public EmpBean() {}
	
	  
	  
}
