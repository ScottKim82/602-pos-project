package order;



import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


//�����ϱ� Ŭ����	//OrderDetail.jsp
@Controller
public class OrderController {
	
	private static final String command = "/orderend.od";
	
	@Autowired
	OrdDao orderdao;
	
	@RequestMapping(command)
	public String doActionPost(
			@RequestParam("oid") String oid,
			@RequestParam(value="cal", required=false) String cal,
			@RequestParam(value="num", required=false) String num,
			@RequestParam(value="payment", required=false) String pay,
			@RequestParam(value="totalcount", required=false) String total,
			Model model,
			HttpServletResponse response) throws IOException {
		
		System.out.println("OrderController");
		List<ShoppingInfo> shoplists = new ArrayList<ShoppingInfo>();	
		
		List<HashMap<String, Object>> lists = this.orderdao.ShopDetailView(oid); //��ǰ+�ֹ����� ����Ʈ

		int totalcount = 0;
		
		for(HashMap<String, Object> map: lists) {	//����Ʈ���� �����ͼ� shopinfo�� �ֱ�
			BigDecimal pnum= (BigDecimal)map.get("PNUM");	//BigDecimal �ٿ�ĳ����
			String pname =(String)map.get("PNAME");
			BigDecimal qty = (BigDecimal)map.get("QTY");
			BigDecimal price = (BigDecimal)map.get("PRICE");
			BigDecimal amount = (BigDecimal)map.get("AMOUNT");
			//System.out.println(pname+"/"+qty+"/"+price+"/"+amount);
			
			ShoppingInfo shopinfo = new ShoppingInfo();
			shopinfo.setPnum(pnum.intValue());
			shopinfo.setPname(pname);
			shopinfo.setQty(qty.intValue());
			shopinfo.setPrice(price.intValue());
			shopinfo.setAmount(amount.intValue());	
			
			shoplists.add(shopinfo);
			
			totalcount += shopinfo.getAmount();				
		}		
				
		int payment=0;	//�Ѿ�� �����ݾ��� ������� ����,������� ��Ż�ݾ�
		if(pay == null) {
			payment = totalcount;
		}else {
			payment = Integer.parseInt(pay);
		}

		System.out.println("pay: "+pay+" cal: "+cal);
		
		
		String calculator = null;
		
		/*PrintWriter writer;
		response.setContentType("text/html;charset=UTF-8");				
		writer =response.getWriter();		
		
		/*if(total !=null){		//�κа�����
			System.out.println("�κа���");
			payment= Integer.parseInt(pay)-Integer.parseInt(cal);
			System.out.println("payment:"+payment);			
			calculator = null;
			
			if(payment<0) {	//�����ݾ��� �� ũ�� �Է�������
				writer.println("<script type='text/javascript'>");
				writer.println("alert('�����Ͻ� �ݾ��� Ȯ�����ּ���')");
				writer.println("history.back()");
				writer.println("</script>");				
				writer.flush();
				
				calculator = null;
				return "Payment";
				
			}					
			
		}*/
		
		if(num !=null) {	//����Ŭ���� num�� �Ѿ�´�			
			if(cal == null) {	//����
				System.out.println("null");
				calculator += num;			
			}else {
				System.out.println("else");
				calculator = cal + num;
			}
			
			if(num.equals("999")) {	//�ʱ�ȭ��ưŬ����
				calculator=null;
			}				
		}
			
		
		
		
			
		model.addAttribute("calculator", calculator);
		model.addAttribute("oid", oid);		//�ֹ���ȣ
		model.addAttribute("shoplists", shoplists);		//ī�װ���ǰ����
		model.addAttribute("totalcount", totalcount);
		model.addAttribute("payment", payment);
		
		return "Payment";		
	}

}
