package order;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//OrderDetail.jsp	//전체취소, +-
@Controller
public class OrderCancleController {
	
	private static final String command = "/ordercancle.od";
	private static final String getPage = "redirect:/order.od";
	
	@Autowired
	OrdDao orderdao;
	
	//OrderDetail.jsp	//수량빼기 더하기
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(
			@RequestParam(value="oid") String oid,
			@RequestParam(value="pnum") String pnum,
			@RequestParam(value="qty") String qty,
			Model model) {
		
				
		Map<String, String> map = new HashMap<String, String>();
		map.put("oid", oid);
		map.put("pnum", pnum);
		
		if(qty.equals("plus")) {	//플러스인경우 하나추가, 마이너스인경우 하나빼기			
			orderdao.UpdateProd(map);	
		}else {	
			
			System.out.println("마이너스");
			OrdBean list = orderdao.selectOrderOne(map);
			System.out.println("getqty:"+list.getQty());
			
			if(list.getQty()==1) {
				orderdao.deleteByProd(map);
			}			
			else {
			orderdao.UpdateQtyMinus(map);
			}
		}		
		
		
		model.addAttribute("oid",oid);
		return getPage;
	}
	
	//OrderDetail.jsp	//전체취소
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doActionPost(
			@RequestParam(value="oid") String oid,
			Model model) {
		
		orderdao.deleteOrder(oid);
		model.addAttribute("oid", oid);
		
		return getPage;
	}
	
	
	

}
