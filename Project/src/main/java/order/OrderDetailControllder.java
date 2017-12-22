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
	
	
	//List.jsp get 호출
	@RequestMapping(command)
	public String doActionGet(
			@RequestParam(value="oid") String oid,
			@RequestParam(value="categoryid", required = false) String categoryid,
			Model model) {
		
		
		List<ShoppingInfo> shoplists = new ArrayList<ShoppingInfo>();	
		
		List<HashMap<String, Object>> lists = this.orderdao.ShopDetailView(oid); //상품+주문관련 리스트

		int totalcount = 0;
		
		for(HashMap<String, Object> map: lists) {	//리스트에서 가져와서 shopinfo에 넣기
			BigDecimal pnum= (BigDecimal)map.get("PNUM");	//BigDecimal 다운캐스팅
			String pname =(String)map.get("PNAME");
			BigDecimal qty = (BigDecimal)map.get("QTY");
			BigDecimal price = (BigDecimal)map.get("PRICE");
			BigDecimal amount = (BigDecimal)map.get("AMOUNT");
						
			ShoppingInfo shopinfo = new ShoppingInfo();
			shopinfo.setPnum(pnum.intValue());
			shopinfo.setPname(pname);
			shopinfo.setQty(qty.intValue());
			shopinfo.setPrice(price.intValue());
			shopinfo.setAmount(amount.intValue());
				
			shoplists.add(shopinfo);	
			
			totalcount += shopinfo.getAmount();				
		}			
		
		
		List<product.ProductBean> prodlists = null;
		
		if(categoryid !=null) {		//OrderDetail.jsp에서 카테고리클릭시 get호출	
			prodlists = orderdao.selectProdList(categoryid);	//카테고리id로 상품정보가져오기
			model.addAttribute("prodlists", prodlists);		
		}	
		
		model.addAttribute("oid", oid);		//주문번호
		model.addAttribute("shoplists", shoplists);		//카테고리상품정보
		model.addAttribute("totalcount", totalcount);	//총금액
		
		
		return getPage;	//OrderDetail.jsp
	}
	
	
	
	
	
	

}
