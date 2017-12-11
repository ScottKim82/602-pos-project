package order;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProdController {

	private static final String command = "/prod.od";
	
	
	@Autowired
	OrdDao orderdao;
	
	@RequestMapping(command)
	public String doActionGet(
			@RequestParam(value="oid") String oid,
			@RequestParam(value="num") String pnum,
			@RequestParam(value="categoryid") String categoryid) {
		
		System.out.println("ProdController");
		
		//pnum�� ������ update, ������ insert�ؾ���
		
		
				
		Map<String, String> map = new HashMap<String, String>();
		map.put("oid", oid);
		map.put("pnum", pnum);
		
		orderdao.addProd(map);		
		
		return "redirect:/order.od?oid="+oid;
		
	}	
	
}
