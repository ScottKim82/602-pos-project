package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.Product;
import product.model.ProductDao;

@Controller
public class ProductDetailController {
	
	private static final String command = "/detail.prd";
	private static final String getPage = "ProductDetail";
	
	@Autowired
	ProductDao productdao;
	
	@RequestMapping(command)
	public String doActionGet(
			@RequestParam(value="num", required=true) int num, Model model) {
		
		System.out.println(" ProductDetailController");
		
		Product lists = productdao.GetProduct(num);
		model.addAttribute("lists", lists);
		
		return getPage;	//ProductDetail.jsp
	}

}
