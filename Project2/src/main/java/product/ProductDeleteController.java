package product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductDeleteController {

	private static final String command = "/proddelete.pd";
	
	@Autowired
	ProductDao proddao;
	
	//ProductUpdate.jsp	//삭제클릭
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(
			@RequestParam(value="num") int num) {
		
		proddao.deleteProduct(num);
		
		return "redirect:/productlist.pd";
	}
	
}
