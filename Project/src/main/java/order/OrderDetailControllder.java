package order;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OrderDetailControllder {
	
	private static final String command="/order.od";
	private static final String getPage="OrderDetail";
	
	@Autowired
	OrdDao orderdao;	
	

	@RequestMapping(command)
	public String doActionGet(
			@RequestParam(value="oid") int oid,
			@RequestParam(value="categoryid", required = false) String categoryid,
			Model model) {
		
		System.out.println("OrderDetailControllder");
		List<ShoppingInfo> shoplists = new ArrayList<ShoppingInfo>();
		
		List<HashMap<String, Object>> lists = this.orderdao.ShopDetailView(oid);
		System.out.println("lists.size(): "+lists.size());
		
		for(int i=0; i<lists.size(); i++) {
			HashMap<String, Object> hash = lists.get(i);
			Set<String> set = hash.keySet();
			System.out.println("set: "+set);
			//set:[pname, pnum, price, amount, qty]
			
			for(String s : set) {
				Object obj= hash.get(s);
				System.out.println("obj: "+obj);
			}
			System.out.println("------------------------");
		}
		int totalcount = 0;
		for(HashMap<String, Object> map: lists) {
			BigDecimal pnum= (BigDecimal)map.get("PNUM");	//BigDecimal 다운캐스팅
			String pname =(String)map.get("PNAME");
			BigDecimal qty = (BigDecimal)map.get("QTY");
			BigDecimal price = (BigDecimal)map.get("PRICE");
			BigDecimal amount = (BigDecimal)map.get("AMOUNT");
			System.out.println(pname+"/"+qty+"/"+price+"/"+amount);
			
			ShoppingInfo shopinfo = new ShoppingInfo();
			shopinfo.setPnum(pnum.intValue());
			shopinfo.setPname(pname);
			shopinfo.setQty(qty.intValue());
			shopinfo.setPrice(price.intValue());
			shopinfo.setAmount(amount.intValue());
			
				
			shoplists.add(shopinfo);	
			
			totalcount += shopinfo.getAmount();				
		}	
			
		
		
		List<order.ProdBean> prodlists = null;
		
		if(categoryid !=null) {			
			prodlists = orderdao.selectProdList(categoryid);
			System.out.println("갯수: "+ prodlists.size());
			model.addAttribute("prodlists", prodlists);		
		}	
		
		model.addAttribute("oid", oid);		//송장번호(주문번호)
		model.addAttribute("shoplists", shoplists);		
		model.addAttribute("totalcount", totalcount);
		
		
		return getPage;
	}
	
	
	
	
	
	

}
