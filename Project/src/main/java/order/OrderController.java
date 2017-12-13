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


//결제하기 클릭시	//OrderDetail.jsp
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
		
		List<HashMap<String, Object>> lists = this.orderdao.ShopDetailView(oid); //상품+주문관련 리스트

		int totalcount = 0;
		
		for(HashMap<String, Object> map: lists) {	//리스트에서 가져와서 shopinfo에 넣기
			BigDecimal pnum= (BigDecimal)map.get("PNUM");	//BigDecimal 다운캐스팅
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
				
		int payment=0;	//넘어온 결제금액이 있을경우 삽입,없을경우 토탈금액
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
		
		/*if(total !=null){		//부분결제시
			System.out.println("부분결제");
			payment= Integer.parseInt(pay)-Integer.parseInt(cal);
			System.out.println("payment:"+payment);			
			calculator = null;
			
			if(payment<0) {	//결제금액을 더 크게 입력했을때
				writer.println("<script type='text/javascript'>");
				writer.println("alert('결제하실 금액을 확인해주세요')");
				writer.println("history.back()");
				writer.println("</script>");				
				writer.flush();
				
				calculator = null;
				return "Payment";
				
			}					
			
		}*/
		
		if(num !=null) {	//계산기클릭시 num값 넘어온다			
			if(cal == null) {	//계산기
				System.out.println("null");
				calculator += num;			
			}else {
				System.out.println("else");
				calculator = cal + num;
			}
			
			if(num.equals("999")) {	//초기화버튼클릭시
				calculator=null;
			}				
		}
			
		
		
		
			
		model.addAttribute("calculator", calculator);
		model.addAttribute("oid", oid);		//주문번호
		model.addAttribute("shoplists", shoplists);		//카테고리상품정보
		model.addAttribute("totalcount", totalcount);
		model.addAttribute("payment", payment);
		
		return "Payment";		
	}

}
