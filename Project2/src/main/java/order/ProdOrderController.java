package order;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ProdOrderController {

	private static final String command = "/prod.od";
	private static final String getPage = "redirect:/order.od";
	
	
	@Autowired
	OrdDao orderdao;
	
	//OrderDetail.jsp 호출	//상품클릭시 추가
	@RequestMapping(command)
	public String doActionGet(
			@RequestParam(value="oid") String oid,
			@RequestParam(value="num") String pnum,
			@RequestParam(value="categoryid") String categoryid,
			Model model){
			
				
		Map<String, String> map = new HashMap<String, String>();
		map.put("oid", oid);
		map.put("pnum", pnum);		
		
		int cnt = -1;
		cnt = orderdao.UpdateProd(map);	//상품이 있을경우 update
		
		if(cnt==0) {				//상품이 없을경우 insert			
			orderdao.InsertProd(map);
		}	
		
		model.addAttribute("oid", oid);
		model.addAttribute("categoryid", categoryid);
		
		
		return getPage;	//OrderDetailController
		
	}	
	
}
