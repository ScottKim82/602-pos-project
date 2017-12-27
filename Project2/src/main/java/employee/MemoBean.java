package employee;


public class MemoBean {
	
	private int num;
	private String context;	
	
	
	public int getNum() {
		return num;
	}



	public void setNum(int num) {
		this.num = num;
	}



	public String getContext() {
		return context;
	}



	public void setContext(String context) {
		this.context = context;
	}



	public MemoBean(int num, String context) {
		super();
		this.num = num;
		this.context = context;
	}



	public MemoBean() {}	
}
